import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:yetu_gestor/dominio/entidades/entrada.dart';
import 'package:yetu_gestor/dominio/entidades/funcionario.dart';
import 'package:yetu_gestor/fonte_dados/padrao_dao/tabelas/tabela_item_venda.dart';
import 'package:yetu_gestor/fonte_dados/padrao_dao/tabelas/tabela_produto.dart';
import 'package:yetu_gestor/fonte_dados/padrao_dao/tabelas/tabela_usuario.dart';
import 'package:yetu_gestor/fonte_dados/padrao_dao/tabelas/tabela_venda.dart';

import '../../dominio/entidades/estado.dart';
import '../../dominio/entidades/produto.dart';
import '../../dominio/entidades/receccao.dart';
import '../../dominio/entidades/saida.dart';
import '../serializadores/serializador_funcionario.dart';
import 'tabelas/tabela_entrada.dart';
import 'tabelas/tabela_funcionario.dart';
import 'tabelas/tabela_preco.dart';
import 'tabelas/tabela_receccao.dart';
import 'tabelas/tabela_saida.dart';
import 'tabelas/tabela_stock.dart';
part 'base_dados.g.dart';
part 'daos/usuario_dao.dart';
part 'daos/stock_dao.dart';
part 'daos/receccao_dao.dart';
part 'daos/entrada_dao.dart';
part 'daos/saida_dao.dart';
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

@DriftDatabase(tables: [TabelaUsuario, TabelaFuncionario, TabelaProduto, TabelaPreco, TabelaVenda, TabelaItemVenda, TabelaEntrada, TabelaSaida, TabelaStock, TabelaRececcao])
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