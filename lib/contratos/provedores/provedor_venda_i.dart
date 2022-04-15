import 'package:yetu_gestor/dominio/entidades/funcionario.dart';

import '../../dominio/entidades/venda.dart';

abstract class ProvedorVendaI {
  Future<List<Venda>> pegarLista(Funcionario funcionario, DateTime data);
  Future<int> adicionarVenda(Venda venda);
  Future<int> removerVendaDeId(int id);
  Future<Venda?> pegarVendaDeId(int id);
  Future<bool> actualizarVenda(Venda venda);
}
