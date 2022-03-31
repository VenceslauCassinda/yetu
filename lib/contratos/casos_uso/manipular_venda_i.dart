import 'package:yetu_gestor/dominio/entidades/cliente.dart';
import 'package:yetu_gestor/dominio/entidades/pagamento.dart';
import 'package:yetu_gestor/dominio/entidades/venda.dart';

import '../../dominio/entidades/funcionario.dart';
import '../../dominio/entidades/item_venda.dart';

abstract class ManipularVendaI {
  Future<int> registarVenda(
      double total,
      double parcela,
      Funcionario funcionario,
      Cliente cliente,
      DateTime dataLevantamentoCompra);
  Future<void> vender(
      List<ItemVenda> itensVenda,
      List<Pagamento> pagamentos,
      double total,
      Funcionario funcionario,
      Cliente cliente,
      DateTime dataLevantamentoCompra);
  double calcularTotalVenda(List<ItemVenda> itensVenda);
  List<Pagamento> associarPagamentosAvenda(
      List<Pagamento> pagamentos, int idVenda);
  double calcularParcelaApagar(double totalApagar, double parcelaJaPaga);
  double calcularParcelaPaga(List<Pagamento> pagamentos);
  double aplicarDescontoVenda(double totalApagar, int porcentagem);
  Future<List<Venda>> pegarLista();
  bool vendaEstaPaga(Venda venda);
  bool vendaOuEncomenda(Venda venda);
  bool vendaOuDivida(Venda venda);
  Future<ItemVenda?> pegarItemComStockInsuficiente(List<ItemVenda> lista);
}
