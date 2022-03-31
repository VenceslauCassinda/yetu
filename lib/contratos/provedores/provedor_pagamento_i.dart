
import '../../dominio/entidades/pagamento.dart';

abstract class ProvedorPagamentoI {
  Future<int> registarPagamento(Pagamento pagamento);
  Future<List<Pagamento>> pegarLista();
}
