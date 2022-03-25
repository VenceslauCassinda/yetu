part of '../base_dados.dart';

@DriftAccessor(tables: [TabelaStock])
class StockDao extends DatabaseAccessor<BancoDados> with _$StockDaoMixin {
  StockDao(BancoDados attachedDatabase) : super(attachedDatabase);
  Future<void> inicializarStockProduto(int idProduto) async {
    await into(tabelaStock).insert(TabelaStockCompanion.insert(
        estado: Estado.ATIVADO, idProduto: idProduto, quantidade: 0));
  }

  Future<void> alterarQuantidadeStock(int idProduto, int quantidade) async {
    var res = update(tabelaStock)
      ..where((tbl) => tbl.idProduto.equals(idProduto));
    res.write(TabelaStockCompanion(quantidade: Value(quantidade)));
  }

  Future<TabelaStockData?> pegarStockDeId(int id) async {
    var res = (select(tabelaStock)..where((tbl) => tbl.id.equals(id)));
    return (await res.getSingleOrNull());
  }
}
