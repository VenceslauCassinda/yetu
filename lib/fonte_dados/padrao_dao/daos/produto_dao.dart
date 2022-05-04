part of '../base_dados.dart';

@DriftAccessor(tables: [TabelaProduto, TabelaStock, TabelaPreco])
class ProdutoDao extends DatabaseAccessor<BancoDados> with _$ProdutoDaoMixin {
  ProdutoDao(BancoDados bancoDados) : super(bancoDados);

  Future<List<Produto>> todos() async {
    var res = await ((select(tabelaProduto)).join([
      leftOuterJoin(
          tabelaStock, tabelaProduto.id.equalsExp(tabelaStock.idProduto)),
      leftOuterJoin(
          tabelaPreco, tabelaProduto.id.equalsExp(tabelaPreco.idProduto))
    ])..orderBy([OrderingTerm.asc(tabelaProduto.nome)])).get();
    var lista = res.map((linha) {
      var stock = linha.readTable(tabelaStock);
      var produto = linha.readTable(tabelaProduto);
      var preco = linha.readTableOrNull(tabelaPreco);
      return Produto(
        idPreco: preco?.id,
        preco: preco == null
            ? null
            : Preco(
                estado: preco.estado,
                idProduto: preco.idProduto,
                preco: preco.preco),
        stock: Stock(
            id: stock.id,
            estado: stock.estado,
            idProduto: stock.idProduto,
            quantidade: stock.quantidade),
        id: produto.id,
        estado: produto.estado,
        nome: produto.nome,
        precoCompra: produto.precoCompra,
        recebivel: produto.recebivel,
      );
    }).toList();

    for (var i = 0; i < lista.length; i++) {
      var cada = lista[i];
      var res = await (select(tabelaPreco)
            ..where((tbl) => tbl.idProduto.equals(cada.id)))
          .get();
      var listinha = res
          .map((e) => Preco(
              estado: e.estado,
              idProduto: e.idProduto,
              preco: e.preco,
              id: e.id))
          .toList();
      lista[i].preco = listinha.isEmpty ? null : listinha[0];
      var listaPreco = res.map((e) => e.preco).toList();
      lista[i].listaPreco = listaPreco;
    }
    return lista;
  }

  Future<TabelaProdutoData?> existeProdutoDeNome(String nomeProduto) async {
    var res = (await (select(tabelaProduto)
          ..where((tbl) => tbl.nome.equals(nomeProduto)))
        .getSingleOrNull());
    return res;
  }

  Future<TabelaProdutoData?> existeProdutoDiferenteDeNome(
      int id, String nomeProduto) async {
    var res = (await (select(tabelaProduto)
          ..where((tbl) =>
              (tbl.id.equals(id)).not() & tbl.nome.equals(nomeProduto)))
        .getSingleOrNull());
    return res;
  }

  Future<int> adicionarProduto(TabelaProdutoCompanion tabela) async {
    var res = await into(tabelaProduto).insert(TabelaProdutoCompanion.insert(
        estado: tabela.estado.value,
        nome: tabela.nome.value,
        precoCompra: tabela.precoCompra.value,
        recebivel: tabela.recebivel.value));
    return res;
  }

  Future<void> actualizarProduto(TabelaProdutoCompanion tabela) async {
    await update(tabelaProduto).replace(tabela);
  }

  Future<void> removerProduto(int id) async {
    await (delete(tabelaProduto)..where((tbl) => tbl.id.equals(id))).go();
  }

  Future<TabelaProdutoData?> pagarProdutoDeId(int id) async {
    return await (select(tabelaProduto)..where((tbl) => tbl.id.equals(id)))
        .getSingleOrNull();
  }
}
