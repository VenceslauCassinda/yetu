part of '../base_dados.dart';

@DriftAccessor(tables: [TabelaProduto])
class ProdutoDao extends DatabaseAccessor<BancoDados> with _$ProdutoDaoMixin {
  ProdutoDao(BancoDados bancoDados) : super(bancoDados);

  Future<List<TabelaProdutoData>> todos() async {
    var res = (await (select(tabelaProduto)).get());
    return res;
  }

  Future<TabelaProdutoData?> existeProdutoDeNome(String nomeProduto) async {
    var res = (await (select(tabelaProduto)
          ..where((tbl) => tbl.nome.equals(nomeProduto)))
        .getSingleOrNull());
    return res;
  }
  
  Future<TabelaProdutoData?> existeProdutoDiferenteDeNome(int id, String nomeProduto) async {
    var res = (await (select(tabelaProduto)
          ..where((tbl) => (tbl.id.equals(id)).not() & tbl.nome.equals(nomeProduto)) )
        .getSingleOrNull());
    return res;
  }

  Future<void> adicionarProduto(TabelaProdutoCompanion tabela) async {
    await into(tabelaProduto).insert(TabelaProdutoCompanion.insert(
        estado: tabela.estado.value,
        nome: tabela.nome.value,
        precoCompra: tabela.precoCompra.value,
        recebivel: tabela.recebivel.value));
  }

  Future<void> actualizarProduto(TabelaProdutoCompanion tabela) async {
    await update(tabelaProduto).replace(tabela);
  }

  Future<void> removerProduto(int id) async {
    await (delete(tabelaProduto)..where((tbl) => tbl.id.equals(id))).go();
  }
}
