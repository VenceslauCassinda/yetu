part of '../base_dados.dart';

@DriftAccessor(tables: [TabelaFuncionario, TabelaUsuario])
class FuncionarioDao extends DatabaseAccessor<BancoDados>
    with _$FuncionarioDaoMixin {
  FuncionarioDao(BancoDados bancoDados) : super(bancoDados);
  Future<List<Funcionario>> todos() async {
    var consulta = select(tabelaFuncionario).join([
      leftOuterJoin(
          tabelaUsuario, tabelaFuncionario.id.equalsExp(tabelaUsuario.id))
    ])
      ..where(tabelaFuncionario.estado.isBiggerOrEqualValue(0));

    var res = (await consulta.get()).map((linhas) {
      var tabela1 = linhas.readTable(tabelaFuncionario);
      var tabela2 = linhas.readTable(tabelaUsuario);
      var funcionario = SerializadorFuncionario().fromTabela(tabela1);
      funcionario.idUsuario = tabela2.id;
      funcionario.nomeUsuario = tabela2.nomeUsuario;
      return funcionario;
    }).toList();

    return res;
  }

  Future<List<TabelaFuncionarioData>> todosSemFiltro() async {
    var consulta = await (select(tabelaFuncionario)).get();

    return consulta;
  }

  Future<List<Funcionario>> eliminados() async {
    var consulta = select(tabelaFuncionario).join([
      leftOuterJoin(
          tabelaUsuario, tabelaFuncionario.id.equalsExp(tabelaUsuario.id))
    ])
      ..where(tabelaFuncionario.estado.isSmallerThanValue(0));
    var res = (await consulta.get()).map((linhas) {
      var tabela1 = linhas.readTable(tabelaFuncionario);
      var tabela2 = linhas.readTable(tabelaUsuario);
      var funcionario = SerializadorFuncionario().fromTabela(tabela1);
      funcionario.idUsuario = tabela2.id;
      funcionario.nomeUsuario = tabela2.nomeUsuario;
      return funcionario;
    }).toList();
    return res;
  }

  Future<void> adicionar(TabelaFuncionarioCompanion usuarioData) async {
    await (into(tabelaFuncionario)).insert(usuarioData);
  }

  Future<TabelaFuncionarioData?> existeFuncionario(String nomeUsuario) async {
    var teste = await ((select(tabelaFuncionario)..limit(1))
          ..where((tbl) => tbl.nomeCompleto.equals(nomeUsuario)))
        .getSingleOrNull();
    return teste;
  }

  Future<void> remover(TabelaFuncionarioData usuarioData) async {
    await (delete(tabelaFuncionario)
          ..where((tbl) => tbl.id.equals(usuarioData.id)))
        .go();
  }

  Future<void> actualizar(TabelaFuncionarioData usuarioData) async {
    await (update(tabelaFuncionario).replace(usuarioData));
  }
}
