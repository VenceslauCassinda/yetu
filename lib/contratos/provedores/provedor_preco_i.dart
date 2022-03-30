import 'package:yetu_gestor/dominio/entidades/preco.dart';
abstract class ProvedorPrecoI {
  Future<int> adicionarPrecoProduto(Preco preco);
  Future<void> removerPrecoProduto(double preco, int idProduto);
  Future<bool> existeProdutoComPreco(double preco, int idProduto);
}