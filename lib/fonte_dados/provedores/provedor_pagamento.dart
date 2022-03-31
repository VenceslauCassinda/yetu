import 'package:get/get.dart';
import 'package:yetu_gestor/contratos/provedores/provedor_pagamento_i.dart';
import 'package:yetu_gestor/fonte_dados/padrao_dao/base_dados.dart';

import '../../dominio/entidades/pagamento.dart';

class ProvedorPagamento implements ProvedorPagamentoI {
  late PagamentoDao _dao;
  ProvedorPagamento() {
    _dao = PagamentoDao(Get.find());
  }
  @override
  Future<List<Pagamento>> pegarLista() async {
    var res = await _dao.todos();

    return res
        .map((e) => Pagamento(
            idFormaPagamento: e.idFormaPagamento,
            estado: e.estado,
            idVenda: e.idVenda,
            valor: e.valor))
        .toList();
  }

  @override
  Future<int> registarPagamento(Pagamento pagamento) async {
    return await _dao.adicionarPagamento(pagamento);
  }
}
