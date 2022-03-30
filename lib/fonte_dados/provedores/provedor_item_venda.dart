import 'package:get/get.dart';
import 'package:yetu_gestor/contratos/provedores/provedor_item_venda_i.dart';
import 'package:yetu_gestor/dominio/entidades/item_venda.dart';
import 'package:yetu_gestor/fonte_dados/padrao_dao/base_dados.dart';

class ProvedorItemVenda implements ProvedorItemVendaI {
  late ItemVendaDao _dao;
  ProvedorItemVenda() {
    _dao = ItemVendaDao(Get.find());
  }
  @override
  Future<bool> actualizaItemVenda(ItemVenda dado) async {
    return false;
  }

  @override
  Future<ItemVenda?> pegarItemVendaDeId(int id) async {}

  @override
  Future<int> registarItemVenda(ItemVenda dado) async {
    return -1;
  }

  @override
  Future<void> removerItemVenda(ItemVenda dado) async {}

  @override
  Future<List<ItemVenda>> todos() async {
    return [];
  }
}
