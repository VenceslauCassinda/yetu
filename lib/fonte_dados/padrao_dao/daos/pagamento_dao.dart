part of '../base_dados.dart';

@DriftAccessor(tables: [TabelaPagamento])
class PagamentoDao extends DatabaseAccessor<BancoDados>
    with _$PagamentoDaoMixin {
  PagamentoDao(BancoDados attachedDatabase) : super(attachedDatabase);

  Future<int> adicionarPagamento(Pagamento dado) async {
    var res = await (into(tabelaPagamento).insert(dado.toCompanion(true)));
    return res;
  }

  Future<int> removerPagamento(int id) async {
    var res =
        await (delete(tabelaPagamento)..where((tbl) => tbl.id.equals(id))).go();
    return res;
  }

  Future<bool> actualizarPagamento(Pagamento dado) async {
    var res = await (update(tabelaPagamento)).replace(dado.toCompanion(true));
    return res;
  }
}
