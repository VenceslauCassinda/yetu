import 'package:yetu_gestor/contratos/manipular_produto_i.dart';
import 'package:yetu_gestor/contratos/provedor_produto_i.dart';
import 'package:yetu_gestor/dominio/entidades/produto.dart';
import 'package:yetu_gestor/fonte_dados/erros.dart';

class ManipularProduto implements ManipularProdutoI {
  late ProvedorProdutoI _provedorProdutoI;

  ManipularProduto(this._provedorProdutoI) {}
  @override
  Future<void> actualizarProduto(Produto dado) async {
    if ((await existeProdutoDiferenteDeNome(dado.id! ,dado.nome!)) == true) {
      throw ErroProdutoExistente("JÁ EXISTE UM PRODUCTO COM ESTE NOME!");
    }
    await _provedorProdutoI.actualizarProduto(dado);
  }

  @override
  Future<void> adicionarProduto(Produto dado) async {
    if ((await existeProdutoComNome(dado.nome!)) == true) {
      throw ErroProdutoExistente("JÁ EXISTE UM PRODUCTO COM ESTE NOME!");
    }
    await _provedorProdutoI.adicionarProduto(dado);
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
    return await _provedorProdutoI.existeProdutoDiferenteDeNome(id, nomeProduto);
  }
}
