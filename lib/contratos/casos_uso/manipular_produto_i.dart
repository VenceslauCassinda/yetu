import 'package:yetu_gestor/dominio/entidades/produto.dart';

abstract class ManipularProdutoI {
  Future<List<Produto>> pegarLista();
  Future<int> adicionarProduto(Produto dado);
  Future<int> adicionarPrecoProduto(Produto dado, double preco);
  Future<void> removerProduto(Produto dado);
  Future<void> removerPrecoProduto(Produto dado, double preco);
  Future<bool> existeProdutoComNome(String nome);
  Future<bool> existeProdutoComPreco(Produto dado, double preco);
  Future<void> actualizarProduto(Produto dado);
  Future<bool> existeProdutoDiferenteDeNome(int id, String nomeProduto);
}
