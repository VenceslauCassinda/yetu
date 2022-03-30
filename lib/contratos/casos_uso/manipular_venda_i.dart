import 'package:yetu_gestor/dominio/entidades/cliente.dart';
import 'package:yetu_gestor/dominio/entidades/pagamento.dart';
import 'package:yetu_gestor/dominio/entidades/venda.dart';

import '../../dominio/entidades/funcionario.dart';
import '../../dominio/entidades/item_venda.dart';

abstract class ManipularVendaI {
  Future<int> registarVenda(
    List<ItemVenda> itensVenda,
    List<Pagamento> pagamentos,
    double total,
    double parcela,
    Funcionario funcionario,
    Cliente cliente,
  );
  double calcularTotalVenda(List<ItemVenda> itensVenda);
  double calcularParcelaApagar(double totalApagar, double parcelaJaPaga);
  double aplicarDescontoVenda(double totalApagar, int porcentagem);
  Future<List<Venda>> pegarLista();
}
