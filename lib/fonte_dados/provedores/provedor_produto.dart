import 'package:get/get.dart';
import 'package:yetu_gestor/contratos/provedor_produto_i.dart';
import 'package:yetu_gestor/dominio/entidades/produto.dart';

import '../padrao_dao/base_dados.dart';

class ProvedorProduto implements ProvedorProdutoI {
  late ProdutoDao _dao;
  ProvedorProduto() {
    _dao = ProdutoDao(Get.find());
  }
  @override
  Future<void> actualizarProduto(Produto dado) async {
    await _dao.actualizarProduto(dado.toCompanion(true));
  }

  @override
  Future<void> adicionarProduto(Produto dado) async {
    await _dao.adicionarProduto(dado.toCompanion(true));
  }

  @override
  Future<bool> existeProdutoComNome(String nome) async {
    var res = await _dao.existeProdutoDeNome(nome);
    return res != null;
  }

  @override
  Future<List<Produto>> pegarLista() async {
    return (await _dao.todos())
        .map((e) => Produto(
              id: e.id,
              nome: e.nome,
              estado: e.estado,
              precoCompra: e.precoCompra,
              recebivel: e.recebivel,
            ))
        .toList();
  }

  @override
  Future<void> removerProduto(Produto dado) async {
    await _dao.removerProduto(dado.id!);
  }

  @override
  Future<bool> existeProdutoDiferenteDeNome(int id, String nomeProduto) async {
    return (await _dao.existeProdutoDiferenteDeNome(id, nomeProduto)) != null;
  }
}
