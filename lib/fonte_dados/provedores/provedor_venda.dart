import 'package:get/get.dart';
import 'package:yetu_gestor/dominio/entidades/venda.dart';
import 'package:yetu_gestor/fonte_dados/padrao_dao/base_dados.dart';

import '../../contratos/provedores/provedor_venda_i.dart';

class ProvedorVenda implements ProvedorVendaI {
  late VendaDao _dao;
  ProvedorVenda() {
    _dao = VendaDao(Get.find());
  }

  @override
  Future<bool> actualizarVenda(Venda venda) async {
    return await _dao.actualizarVenda(venda);
  }

  @override
  Future<int> adicionarVenda(Venda venda) async {
    return await _dao.adicionarVenda(venda);
  }

  @override
  Future<List<Venda>> pegarLista() async {
    return await _dao.todas();
  }

  @override
  Future<int> removerVendaDeId(int id) async {
    return await _dao.removerVendaDeId(id);
  }
}
