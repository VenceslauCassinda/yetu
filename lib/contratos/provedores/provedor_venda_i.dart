import '../../dominio/entidades/venda.dart';

abstract class ProvedorVendaI {
  Future<List<Venda>> pegarLista();
  Future<int> adicionarVenda(Venda venda);
  Future<int> removerVendaDeId(int id);
  Future<bool> actualizarVenda(Venda venda);
}
