part of '../base_dados.dart';

@DriftAccessor(tables: [
  TabelaVenda,
  TabelaFuncionario,
  TabelaCliente,
  TabelaPagamento,
  TabelaFormaPagamento,
  TabelaItemVenda,
  TabelaProduto,
  TabelaPagamentoFinal
])
class VendaDao extends DatabaseAccessor<BancoDados> with _$VendaDaoMixin {
  VendaDao(BancoDados attachedDatabase) : super(attachedDatabase);
  Future<int> adicionarVenda(Venda dado) async {
    var res = await into(tabelaVenda).insert(dado.toCompanion(true));
    return res;
  }

  Future<int> removerVendaDeId(int id) async {
    var res =
        await (delete(tabelaVenda)..where((tbl) => tbl.id.equals(id))).go();
    return res;
  }

  Future<TabelaVendaData?> pegarVendaDeId(int id) async {
    var res = await (select(tabelaVenda)..where((tbl) => tbl.id.equals(id)))
        .getSingleOrNull();
    return res;
  }

  Future<bool> actualizarVenda(Venda dado) async {
    mostrar("1===========> ${dado.data}");
    mostrar("2===========> ${dado.dataLevantamentoCompra}");
    var res = await update(tabelaVenda).replace(dado.toCompanion(true));
    var nova = await pegarVendaDeId(dado.id!);
    return res;
  }

  Future<List<Venda>> todas() async {
    var vendas = <Venda>[];
    var resVendasFuncionariosClientes1 = select(tabelaVenda).join([
      leftOuterJoin(tabelaFuncionario,
          tabelaVenda.idFuncionario.equalsExp(tabelaFuncionario.id)),
      leftOuterJoin(
          tabelaCliente, tabelaVenda.idCliente.equalsExp(tabelaCliente.id)),
    ]);

    var resVendasFuncionariosClientes2 =
        await resVendasFuncionariosClientes1.get();
    for (var cadaLinha in resVendasFuncionariosClientes2) {
      var venda = cadaLinha.readTable(tabelaVenda);
      var cliente = cadaLinha.readTable(tabelaCliente);
      var resVendasPagamentos = await ((select(tabelaVenda).join([
        leftOuterJoin(
            tabelaPagamento, tabelaPagamento.idVenda.equalsExp(tabelaVenda.id)),
      ]))
            ..where(tabelaPagamento.idVenda.equals(venda.id)))
          .get();
      var resVendasItemVenda = await ((select(tabelaItemVenda).join([
        leftOuterJoin(tabelaProduto,
            tabelaItemVenda.idProduto.equalsExp(tabelaProduto.id)),
      ]))
            ..where(tabelaItemVenda.idVenda.equals(venda.id)))
          .get();

      var listaItensVenda = <ItemVenda>[];
      for (var e in resVendasItemVenda) {
        var item = e.readTable(tabelaItemVenda);
        var produto = e.readTable(tabelaProduto);
        var preoDao = PrecoDao(gett.Get.find());
        Preco preco = await preoDao.pegarPrecoDeIdDeProduto(produto.id);
        var cada = ItemVenda(
            estado: item.estado,
            idProduto: item.idProduto,
            quantidade: item.quantidade,
            desconto: item.desconto,
            idVenda: item.idVenda,
            produto: Produto(
              id: produto.id,
              estado: produto.estado,
              precoCompra: produto.precoCompra,
              recebivel: produto.recebivel,
              nome: produto.nome,
              idPreco: preco.id,
              preco: preco,
              listaPreco: [preco.preco!],
            ));
        listaItensVenda.add(cada);
      }
      var cadaCliente = Cliente(
          estado: cliente.estado, nome: cliente.nome, numero: cliente.numero);

      var cadaVenda = Venda(
          cliente: cadaCliente,
          itensVenda: listaItensVenda,
          estado: venda.estado,
          idFuncionario: venda.idFuncionario,
          idCliente: venda.idCliente,
          data: venda.data,
          total: venda.total,
          parcela: venda.parcela);

      for (var linhaVendasPagamentos in resVendasPagamentos) {
        var pagamento = linhaVendasPagamentos.readTable(tabelaPagamento);
        var resPagamentosEformas = await ((select(tabelaPagamento).join([
          leftOuterJoin(
              tabelaFormaPagamento,
              tabelaFormaPagamento.id
                  .equalsExp(tabelaPagamento.idFormaPagamento)),
        ]))
              ..where(tabelaPagamento.id.equals(pagamento.id)))
            .getSingle();
        // print("============> $resPagamentosEformas");
        var forma = resPagamentosEformas.readTable(tabelaFormaPagamento);
        var cadaPagamento = Pagamento(
            formaPagamento: FormaPagamento(
                estado: forma.estado,
                tipo: forma.tipo,
                descricao: forma.descricao),
            idFormaPagamento: forma.id,
            estado: pagamento.estado,
            idVenda: pagamento.idVenda,
            valor: pagamento.valor);
        if (cadaVenda.pagamentos == null) {
          cadaVenda.pagamentos = [];
        }
        cadaVenda.pagamentos!.add(cadaPagamento);
      }

      vendas.add(cadaVenda);
    }

    return vendas;
  }

  Future<List<Venda>> pegarVendasDeFuncionarioNaData(
      Funcionario funcionario, DateTime data) async {
    var vendas = <Venda>[];
    var resVendasFuncionariosClientes1 = select(tabelaVenda).join([
      leftOuterJoin(tabelaFuncionario,
          tabelaVenda.idFuncionario.equalsExp(tabelaFuncionario.id)),
      leftOuterJoin(
          tabelaCliente, tabelaVenda.idCliente.equalsExp(tabelaCliente.id)),
    ])
      ..where((tabelaVenda.data.year.equals(data.year) &
          tabelaVenda.data.month.equals(data.month) &
          (tabelaVenda.data.day.equals(data.day)) &
          tabelaFuncionario.id.equals(funcionario.id)));

    var resVendasFuncionariosClientes2 =
        await resVendasFuncionariosClientes1.get();
    for (var cadaLinha in resVendasFuncionariosClientes2) {
      var venda = cadaLinha.readTable(tabelaVenda);
      var cliente = cadaLinha.readTable(tabelaCliente);
      var resVendasPagamentos = await ((select(tabelaVenda).join([
        leftOuterJoin(
            tabelaPagamento, tabelaPagamento.idVenda.equalsExp(tabelaVenda.id)),
      ]))
            ..where(tabelaPagamento.idVenda.equals(venda.id)))
          .get();
      var resVendasItemVenda = await ((select(tabelaItemVenda).join([
        leftOuterJoin(tabelaProduto,
            tabelaItemVenda.idProduto.equalsExp(tabelaProduto.id)),
      ]))
            ..where(tabelaItemVenda.idVenda.equals(venda.id)))
          .get();

      var listaItensVenda = <ItemVenda>[];
      for (var e in resVendasItemVenda) {
        var item = e.readTable(tabelaItemVenda);
        var produto = e.readTable(tabelaProduto);
        var preoDao = PrecoDao(gett.Get.find());
        Preco preco = await preoDao.pegarPrecoDeIdDeProduto(produto.id);
        var cada = ItemVenda(
            estado: item.estado,
            idProduto: item.idProduto,
            quantidade: item.quantidade,
            desconto: item.desconto,
            idVenda: item.idVenda,
            produto: Produto(
              id: produto.id,
              estado: produto.estado,
              precoCompra: produto.precoCompra,
              recebivel: produto.recebivel,
              nome: produto.nome,
              idPreco: preco.id,
              preco: preco,
              listaPreco: [preco.preco!],
            ));
        listaItensVenda.add(cada);
      }
      var cadaCliente = Cliente(
          estado: cliente.estado, nome: cliente.nome, numero: cliente.numero);

      var cadaVenda = Venda(
          id: venda.id,
          cliente: cadaCliente,
          itensVenda: listaItensVenda,
          estado: venda.estado,
          idFuncionario: venda.idFuncionario,
          idCliente: venda.idCliente,
          data: venda.data,
          dataLevantamentoCompra: venda.dataLevantamentoCompra,
          total: venda.total,
          parcela: venda.parcela);

      for (var linhaVendasPagamentos in resVendasPagamentos) {
        var pagamento = linhaVendasPagamentos.readTable(tabelaPagamento);

        var pagamentoFInal = await (select(tabelaPagamentoFinal)
              ..where((tbl) => tbl.id.equals(pagamento.id)))
            .getSingleOrNull();

        var resPagamentosEformas = await ((select(tabelaPagamento).join([
          leftOuterJoin(
              tabelaFormaPagamento,
              tabelaFormaPagamento.id
                  .equalsExp(tabelaPagamento.idFormaPagamento)),
        ]))
              ..where(tabelaPagamento.id.equals(pagamento.id)))
            .getSingle();
        // print("============> $resPagamentosEformas");
        var forma = resPagamentosEformas.readTable(tabelaFormaPagamento);
        var cadaPagamento = Pagamento(
            pagamentoFinal: pagamentoFInal == null
                ? null
                : PagamentoFinal(
                    id: pagamentoFInal.id,
                    estado: pagamentoFInal.estado,
                    idPagamento: pagamentoFInal.idPagamento,
                    data: pagamentoFInal.data),
            formaPagamento: FormaPagamento(
                estado: forma.estado,
                tipo: forma.tipo,
                descricao: forma.descricao),
            idFormaPagamento: forma.id,
            estado: pagamento.estado,
            idVenda: pagamento.idVenda,
            valor: pagamento.valor);
        if (cadaVenda.pagamentos == null) {
          cadaVenda.pagamentos = [];
        }
        cadaVenda.pagamentos!.add(cadaPagamento);
      }

      vendas.add(cadaVenda);
    }

    return vendas;
  }
}
