import 'package:get/get.dart';
import 'package:yetu_gestor/contratos/provedor_stock_i.dart';
import 'package:yetu_gestor/dominio/entidades/stock.dart';
import 'package:yetu_gestor/fonte_dados/padrao_dao/base_dados.dart';

class ProvedorStock implements ProvedorStockI {
  late StockDao _dao;
  ProvedorStock() {
    _dao = StockDao(Get.find());
  }
  @override
  Future<void> inicializarStockProduto(int idProduto) async {
    await _dao.inicializarStockProduto(idProduto);
  }

  @override
  Future<void> alterarQuantidadeStock(int idProduto, int quantidade) async {
    await _dao.alterarQuantidadeStock(idProduto, quantidade);
  }

  @override
  Future<Stock?> pegarStockDeId(int id) async {
    var res = await _dao.pegarStockDeId(id);
    if (res != null) {
      return Stock(
          id: res.id,
          estado: res.estado,
          idProduto: res.idProduto,
          quantidade: res.quantidade);
    }
    return null;
  }
}
