import '../dominio/entidades/stock.dart';

abstract class ProvedorStockI {
  Future<void> inicializarStockProduto(int idProduto);
  Future<void> alterarQuantidadeStock(int idProduto, int quantidade);
  Future<Stock?> pegarStockDeId(int id);
}
