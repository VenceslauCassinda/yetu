import 'package:yetu_gestor/dominio/entidades/pagamento.dart';

abstract class ManipularPagamentoI {
  Future<int> registarPagamento(Pagamento pagamento);
  Future<void> registarListaPagamentos(List<Pagamento> lista, int idVenda);
  Future<List<Pagamento>> pegarLista();
}
