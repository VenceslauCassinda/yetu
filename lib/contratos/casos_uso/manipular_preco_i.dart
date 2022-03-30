import 'package:yetu_gestor/dominio/entidades/preco.dart';

import '../../dominio/entidades/produto.dart';

abstract class ManipularPrecoI {
  Future<int> adicionarPrecoProduto(Preco preco);
  Future<void> removerPrecoProduto(Preco preco);
  Future<bool> existeProdutoComPreco(Produto dado, double preco);
}