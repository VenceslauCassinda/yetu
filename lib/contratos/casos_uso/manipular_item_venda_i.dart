import '../../dominio/entidades/item_venda.dart';

abstract class ManipularItemVendaI {
  Future<List<ItemVenda>> todos();
  Future<ItemVenda?> pegarItemVendaDeId(int id);
  Future<bool> actualizaItemVenda(ItemVenda dado);
  Future<int> registarItemVenda(ItemVenda dado);
  Future<void> removerItemVenda(ItemVenda dado);
}