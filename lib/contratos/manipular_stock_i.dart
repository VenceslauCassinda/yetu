import 'package:yetu_gestor/dominio/entidades/stock.dart';
import 'package:yetu_gestor/fonte_dados/padrao_dao/base_dados.dart';

abstract class ManipularStockI {
  Future<void> inicializarStockProduto(int idProduto);
  Future<void> aumentarQuantidadeStock(int idProduto, int quantidade);
  Future<void> diminuirQuantidadeStock(int idProduto, int quantidade);
  Future<Stock?> pegarStockDeId(int id);
}
