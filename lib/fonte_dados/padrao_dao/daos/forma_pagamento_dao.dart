part of '../base_dados.dart';

@DriftAccessor(tables: [TabelaFormaPagamento])
class FormaPagamentoDao extends DatabaseAccessor<BancoDados>
    with _$FormaPagamentoDaoMixin {
  FormaPagamentoDao(BancoDados attachedDatabase) : super(attachedDatabase);

  Future<int> adicionarFormaPagamento(FormaPagamento dado) async {
    var res = await (into(tabelaFormaPagamento).insert(dado.toCompanion(true)));
    return res;
  }

  Future<int> removerFormaPagamento(int id) async {
    var res =
        (delete(tabelaFormaPagamento)..where((tbl) => tbl.id.equals(id))).go();
    return res;
  }

  Future<bool> actualizarFormaPagamento(FormaPagamento dado) async {
    var res = await (update(tabelaFormaPagamento)).replace(dado.toCompanion(true));
    return res;
  }
}
