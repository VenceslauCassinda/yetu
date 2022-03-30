import 'package:yetu_gestor/dominio/entidades/preco.dart';
import 'package:yetu_gestor/dominio/entidades/produto.dart';
import '../../contratos/casos_uso/manipular_preco_i.dart';
import '../../contratos/provedores/provedor_preco_i.dart';

class ManipularPreco implements ManipularPrecoI {
  final ProvedorPrecoI _provedorPrecoI;
  ManipularPreco(this._provedorPrecoI) {}
  @override
  Future<int> adicionarPrecoProduto(Preco preco) async {
    return await _provedorPrecoI.adicionarPrecoProduto(preco);
  }

  @override
  Future<void> removerPrecoProduto(Preco preco) async {
    await _provedorPrecoI.removerPrecoProduto(preco.preco!, preco.idProduto!);
  }

  @override
  Future<bool> existeProdutoComPreco(Produto dado, double preco) async {
    return await _provedorPrecoI.existeProdutoComPreco(preco, dado.id!);
  }
}
