import 'package:yetu_gestor/contratos/manipular_stock_i.dart';
import 'package:yetu_gestor/contratos/provedor_stock_i.dart';
import 'package:yetu_gestor/dominio/entidades/stock.dart';

class ManipularStock implements ManipularStockI {
  late ProvedorStockI _provedorStockI;
  ManipularStock(this._provedorStockI) {}
  @override
  Future<void> inicializarStockProduto(int idProduto) async {
    await _provedorStockI.inicializarStockProduto(idProduto);
  }

  @override
  Future<void> aumentarQuantidadeStock(int idProduto, int quantidade) async {
    var stock = await pegarStockDeId(idProduto);
    if (stock != null) {
      var novaQuantidade = stock.quantidade! + quantidade;
      await _provedorStockI.alterarQuantidadeStock(idProduto, novaQuantidade);
    }
  }

  @override
  Future<Stock?> pegarStockDeId(int id) async {
    return await _provedorStockI.pegarStockDeId(id);
  }

  @override
  Future<void> diminuirQuantidadeStock(int idProduto, int quantidade) async{
    var stock = await pegarStockDeId(idProduto);
    if (stock != null) {
      var novaQuantidade = stock.quantidade! - quantidade;
      await _provedorStockI.alterarQuantidadeStock(idProduto, novaQuantidade);
    }
  }
}
