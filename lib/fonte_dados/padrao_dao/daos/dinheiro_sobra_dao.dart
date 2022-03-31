part of '../base_dados.dart';

@DriftAccessor(tables: [TabelaDinheiroSobra, TabelaFuncionario])
class DinheiroSobraDao extends DatabaseAccessor<BancoDados>
    with _$DinheiroSobraDaoMixin {
  DinheiroSobraDao(BancoDados attachedDatabase) : super(attachedDatabase);

  Future<List<DinheiroSobra>> todos() async {
    var res = await (select(tabelaDinheiroSobra).join([
      leftOuterJoin(tabelaFuncionario,
          tabelaDinheiroSobra.idFuncionario.equalsExp(tabelaFuncionario.id))
    ])).get();
    var lista = res.map((linha) {
      var funcionario = linha.readTable(tabelaFuncionario);
      var dinheiroSobra = linha.readTable(tabelaDinheiroSobra);
      return DinheiroSobra(
          id: dinheiroSobra.id,
          funcionario: SerializadorFuncionario().fromTabela(funcionario),
          estado: dinheiroSobra.estado,
          idFuncionario: dinheiroSobra.idFuncionario,
          valor: dinheiroSobra.valor);
    }).toList();
    return lista;
  }

  Future<int> adcionarDinheiro(DinheiroSobra dinheiroSobra) async {
    var res =
        await into(tabelaDinheiroSobra).insert(dinheiroSobra.toCompanion(true));
    return res;
  }

  Future<int> removerDinheiroDeId(int id) async {
    var res = await ((delete(tabelaDinheiroSobra))
        ..where((tbl) => tbl.id.equals(id))).go();
    return res;
  }
  
  Future<bool> actualizarDinheiro(DinheiroSobra dinheiroSobra) async {
    var res = await (update(tabelaDinheiroSobra).replace(dinheiroSobra.toCompanion(true)));
    return res;
  }
}
