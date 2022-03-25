import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:yetu_gestor/dominio/entidades/funcionario.dart';
import 'package:yetu_gestor/fonte_dados/padrao_dao/tabelas/tabela_item_venda.dart';
import 'package:yetu_gestor/fonte_dados/padrao_dao/tabelas/tabela_produto.dart';
import 'package:yetu_gestor/fonte_dados/padrao_dao/tabelas/tabela_usuario.dart';
import 'package:yetu_gestor/fonte_dados/padrao_dao/tabelas/tabela_venda.dart';

import '../serializadores/serializador_funcionario.dart';
import 'tabelas/tabela_entrada.dart';
import 'tabelas/tabela_funcionario.dart';
import 'tabelas/tabela_preco.dart';
import 'tabelas/tabela_saida.dart';
part 'base_dados.g.dart';
part 'daos/usuario_dao.dart';
part 'daos/produto_dao.dart';
part 'daos/funcionario_dao.dart';

LazyDatabase defaultConnection() {
  return LazyDatabase(() async {
    // final dbFolder = await getApplicationDocumentsDirectory();
    final file = File('C://generated_databases/yetu_gestor.db');
    return NativeDatabase(
      file,
    );
  });
}

@DriftDatabase(tables: [TabelaUsuario, TabelaFuncionario, TabelaProduto, TabelaPreco, TabelaVenda, TabelaItemVenda, TabelaEntrada, TabelaSaida])
class BancoDados extends _$BancoDados {
  BancoDados() : super(defaultConnection());
  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();
      },
    );
  }
}

// late UsuarioDao usuarioDao = UsuarioDao(this);