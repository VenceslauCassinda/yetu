import 'package:yetu_gestor/dominio/entidades/estado.dart';
import 'package:yetu_gestor/dominio/entidades/preco.dart';
import 'package:yetu_gestor/dominio/entidades/produto.dart';
import 'package:yetu_gestor/fonte_dados/erros.dart';

import '../../contratos/casos_uso/manipular_preco_i.dart';
import '../../contratos/casos_uso/manipular_produto_i.dart';
import '../../contratos/casos_uso/manipular_stock_i.dart';
import '../../contratos/provedores/provedor_produto_i.dart';

class ManipularProduto implements ManipularProdutoI {
  late ProvedorProdutoI _provedorProdutoI;
  late ManipularStockI _manipularStockI;
  final ManipularPrecoI _manipularPrecoI;

  ManipularProduto(
      this._provedorProdutoI, this._manipularStockI, this._manipularPrecoI) {}
  @override
  Future<void> actualizarProduto(Produto dado) async {
    if ((await existeProdutoDiferenteDeNome(dado.id!, dado.nome!)) == true) {
      throw ErroProdutoExistente("JÁ EXISTE UM PRODUCTO COM ESTE NOME!");
    }
    await _provedorProdutoI.actualizarProduto(dado);
  }

  @override
  Future<int> adicionarProduto(Produto dado) async {
    if ((await existeProdutoComNome(dado.nome!)) == true) {
      throw ErroProdutoExistente("JÁ EXISTE UM PRODUCTO COM ESTE NOME!");
    }
    var res = await _provedorProdutoI.adicionarProduto(dado);
    var id = await _manipularStockI.inicializarStockProduto(res);
    
    return res;
  }

  @override
  Future<bool> existeProdutoComNome(String nome) async {
    return await _provedorProdutoI.existeProdutoComNome(nome);
  }

  @override
  Future<List<Produto>> pegarLista() async {
    return await _provedorProdutoI.pegarLista();
  }

  @override
  Future<void> removerProduto(Produto dado) async {
    await _provedorProdutoI.removerProduto(dado);
  }

  @override
  Future<bool> existeProdutoDiferenteDeNome(int id, String nomeProduto) async {
    return await _provedorProdutoI.existeProdutoDiferenteDeNome(
        id, nomeProduto);
  }

  @override
  Future<int> adicionarPrecoProduto(Produto dado, double preco) async {
    if ((await existeProdutoComPreco(dado, preco)) == true) {
      throw ErroProdutoComPrecoExistente(
          "JÁ EXISTE UM PRODUTO COM ESTE PREÇO!");
    }
    var res = await _manipularPrecoI.adicionarPrecoProduto(
        Preco(estado: Estado.ATIVADO, idProduto: dado.id, preco: preco));
    return res;
  }

  @override
  Future<bool> existeProdutoComPreco(Produto dado, double preco) async {
    return await _manipularPrecoI.existeProdutoComPreco(dado, preco);
  }

  @override
  Future<void> removerPrecoProduto(Produto dado, double preco) async {
    await _manipularPrecoI.removerPrecoProduto(
        Preco(estado: Estado.ELIMINADO, idProduto: dado.id, preco: preco));
  }
}
