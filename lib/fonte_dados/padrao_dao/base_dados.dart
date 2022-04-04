import 'dart:developer';
import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:yetu_gestor/dominio/entidades/cliente.dart';
import 'package:yetu_gestor/dominio/entidades/entrada.dart';
import 'package:yetu_gestor/dominio/entidades/forma_pagamento.dart';
import 'package:yetu_gestor/dominio/entidades/funcionario.dart';
import 'package:yetu_gestor/fonte_dados/padrao_dao/tabelas/tabela_item_venda.dart';
import 'package:yetu_gestor/fonte_dados/padrao_dao/tabelas/tabela_produto.dart';
import 'package:yetu_gestor/fonte_dados/padrao_dao/tabelas/tabela_usuario.dart';
import 'package:yetu_gestor/fonte_dados/padrao_dao/tabelas/tabela_venda.dart';

import '../../dominio/entidades/dinheiro_sobra.dart';
import '../../dominio/entidades/estado.dart';
import '../../dominio/entidades/item_venda.dart';
import '../../dominio/entidades/nivel_acesso.dart';
import '../../dominio/entidades/pagamento.dart';
import '../../dominio/entidades/preco.dart';
import '../../dominio/entidades/produto.dart';
import '../../dominio/entidades/receccao.dart';
import '../../dominio/entidades/saida.dart';
import '../../dominio/entidades/stock.dart';
import '../../dominio/entidades/usuario.dart';
import '../../dominio/entidades/venda.dart';
import '../serializadores/serializador_funcionario.dart';
import '../serializadores/serializador_usuario.dart';
import 'tabelas/tabela_cliente.dart';
import 'tabelas/tabela_dinheiro_sobra.dart';
import 'tabelas/tabela_entrada.dart';
import 'tabelas/tabela_forma_pagamento.dart';
import 'tabelas/tabela_funcionario.dart';
import 'tabelas/tabela_pagamento.dart';
import 'tabelas/tabela_preco.dart';
import 'tabelas/tabela_receccao.dart';
import 'tabelas/tabela_saida.dart';
import 'tabelas/tabela_stock.dart';
part 'base_dados.g.dart';
part 'daos/usuario_dao.dart';
part 'daos/stock_dao.dart';
part 'daos/receccao_dao.dart';
part 'daos/entrada_dao.dart';
part 'daos/cliente_dao.dart';
part 'daos/preco_dao.dart';
part 'daos/saida_dao.dart';
part 'daos/produto_dao.dart';
part 'daos/funcionario_dao.dart';
part 'daos/item_venda_dao.dart';
part 'daos/forma_pagamento_dao.dart';
part 'daos/pagamento_dao.dart';
part 'daos/dinheiro_sobra_dao.dart';
part 'daos/venda_dao.dart';

LazyDatabase defaultConnection() {
  return LazyDatabase(() async {
    // final dbFolder = await getApplicationDocumentsDirectory();
    final file = File('C://generated_databases/yetu_gestor.db');
    return NativeDatabase(
      file,
    );
  });
}

@DriftDatabase(tables: [TabelaUsuario, TabelaFuncionario, TabelaProduto, TabelaPreco, TabelaVenda, TabelaItemVenda, TabelaEntrada, TabelaSaida, TabelaStock, TabelaRececcao, TabelaCliente, TabelaItemVenda, TabelaFormaPagamento, TabelaPagamento, TabelaDinheiroSobra])
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
      onUpgrade: (m, a,n)async{
        // m.addColumn(tabelaEntrada, tabelaEntrada.motivo);
      }
    );
  }
}