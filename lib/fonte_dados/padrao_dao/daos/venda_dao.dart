part of '../base_dados.dart';

@DriftAccessor(tables: [
  TabelaVenda,
  TabelaFuncionario,
  TabelaCliente,
  TabelaPagamento,
  TabelaFormaPagamento,
  TabelaItemVenda
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
    var res =
        await (select(tabelaVenda)..where((tbl) => tbl.id.equals(id))).getSingleOrNull();
    return res;
  }

  Future<bool> actualizarVenda(Venda dado) async {
    var res = await update(tabelaVenda).replace(dado.toCompanion(true));
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
      var resVendasPagamentos = await ((select(tabelaVenda).join([
        leftOuterJoin(
            tabelaPagamento, tabelaPagamento.idVenda.equalsExp(tabelaVenda.id)),
      ]))
            ..where(tabelaPagamento.idVenda.equals(venda.id)))
          .get();

      var cadaVenda = Venda(
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
              ..where(tabelaPagamento.idVenda.equals(pagamento.id)))
            .getSingle();
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
        cadaVenda.pagamentos.add(cadaPagamento);
      }

      vendas.add(cadaVenda);
    }

    return vendas;
  }
}
