part of '../base_dados.dart';

@DriftAccessor(tables: [TabelaEntrada, TabelaProduto])
class EntradaDao extends DatabaseAccessor<BancoDados> with _$EntradaDaoMixin {
  EntradaDao(BancoDados attachedDatabase) : super(attachedDatabase);

  Future<List<Entrada>> todas() async {
    var res = await select(tabelaEntrada).join([
      leftOuterJoin(tabelaProduto, tabelaEntrada.id.equalsExp(tabelaProduto.id))
    ]).get();
    var lista = res.map((linha) {
      var produto = linha.readTable(tabelaProduto);
      var entrada = linha.readTable(tabelaEntrada);
      return Entrada(
          produto: Produto(
            id: produto.id,
            estado: produto.estado,
            nome: produto.nome,
            precoCompra: produto.precoCompra,
            recebivel: produto.recebivel,
          ),
          estado: entrada.estado,
          idProduto: entrada.idProduto,
          idRececcao: entrada.idRececcao,
          quantidade: entrada.quantidade,
          data: entrada.data);
    }).toList();
    return lista;
  }

  Future<int> adicionarEntrada(Entrada entrada) async {
    var res = into(tabelaEntrada).insert(TabelaEntradaCompanion.insert(
        estado: Estado.ATIVADO,
        idProduto: entrada.idProduto!,
        idRececcao: entrada.idRececcao!,
        quantidade: entrada.quantidade!,
        data: entrada.data!));
    return res;
  }

  Future<TabelaEntradaData?> pegarEntradaDeId(int id) async {
    var res = (select(tabelaEntrada)..where((tbl) => tbl.id.equals(id)))
        .getSingleOrNull();
    return res;
  }

  Future<void> actualizar(Entrada entrada) async {
    await update(tabelaEntrada).replace(TabelaEntradaCompanion.insert(
        estado: entrada.estado!,
        idProduto: entrada.idProduto!,
        idRececcao: entrada.idRececcao!,
        quantidade: entrada.quantidade!,
        data: entrada.data!));
  }

  Future<void> removerEntrada(int id) async {
    await (delete(tabelaEntrada)..where((tbl) => tbl.id.equals(id))).go();
  }
}
