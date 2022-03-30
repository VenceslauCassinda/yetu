part of '../base_dados.dart';

@DriftAccessor(tables: [TabelaPreco, TabelaProduto])
class PrecoDao extends DatabaseAccessor<BancoDados> with _$PrecoDaoMixin {
  PrecoDao(BancoDados attachedDatabase) : super(attachedDatabase);

  Future<int> adicionarPrecoDeProduto(Preco preco) async {
    var res = await into(tabelaPreco).insert(TabelaPrecoCompanion.insert(
        idProduto: preco.idProduto!,
        preco: preco.preco!,
        estado: preco.estado!));

    return res;
  }

  Future<int> removerPrecoDoProduto(double preco, int idProduto) async {
    var res = await (delete(tabelaPreco)
          ..where((tbl) => tbl.idProduto.equals(idProduto) & tbl.preco.equals(preco)))
        .go();
    return res;
  }

  Future<TabelaPrecoData?> existeProdutoComPreco(
      int idProduto, double preco) async {
    var res = await (select(tabelaPreco)
          ..where((tbl) =>
              tbl.preco.equals(preco) & tbl.idProduto.equals(idProduto)))
        .getSingleOrNull();
    return res;
  }
}
