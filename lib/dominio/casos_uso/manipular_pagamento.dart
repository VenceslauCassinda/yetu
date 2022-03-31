import 'package:yetu_gestor/contratos/casos_uso/manipular_pagamento_i.dart';
import 'package:yetu_gestor/contratos/provedores/provedor_pagamento_i.dart';
import 'package:yetu_gestor/dominio/entidades/pagamento.dart';

class ManipularPagamento implements ManipularPagamentoI {
  final ProvedorPagamentoI _provedorPagamentoI;

  ManipularPagamento(this._provedorPagamentoI);
  @override
  Future<List<Pagamento>> pegarLista() async {
    return await _provedorPagamentoI.pegarLista();
  }

  @override
  Future<void> registarListaPagamentos(
      List<Pagamento> lista, int idVenda) async {
    for (var cada in lista) {
      cada.idVenda = idVenda;
      await registarPagamento(cada);
    }
  }

  @override
  Future<int> registarPagamento(Pagamento pagamento) async {
    return await _provedorPagamentoI.registarPagamento(pagamento);
  }
}
