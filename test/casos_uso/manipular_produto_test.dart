import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:yetu_gestor/contratos/manipular_produto_i.dart';
import 'package:yetu_gestor/dominio/casos_uso/manipula_stock.dart';
import 'package:yetu_gestor/dominio/casos_uso/manipular_produto.dart';
import 'package:yetu_gestor/dominio/entidades/produto.dart';
import 'package:yetu_gestor/fonte_dados/erros.dart';
import 'package:yetu_gestor/fonte_dados/padrao_dao/base_dados.dart';
import 'package:yetu_gestor/fonte_dados/provedores/provedor_produto.dart';
import 'package:yetu_gestor/fonte_dados/provedores/provedor_stock.dart';

import '../configuracao/test_config.dart';

void main() {
  TestConfig.prepareInitDataBase();
  Get.put(BancoDados());

  ManipularProdutoI manipularProdutoI = ManipularProduto(ProvedorProduto(), ManipularStock(ProvedorStock()));
  test("LISTAR PRODUTOS", () async {
    try {
      (await manipularProdutoI.pegarLista()).forEach((element) {
        print(element.toString());
      });
    } catch (e) {
      expect(true, e is ErroProdutoExistente);
    }
  });

  test("ADICIONAR PRODUTO", () async {
    try {
      var novo = Produto(nome: "Pera", precoCompra: 100, recebivel: true);
      await manipularProdutoI.adicionarProduto(novo);
      var lista = (await manipularProdutoI.pegarLista());
      var teste =
          lista.firstWhereOrNull((element) => element.nome == novo.nome);
      expect(true, teste != null);
    } catch (e) {
      expect(true, e is ErroProdutoExistente);
    }
  });

  test("ACTUALIZAR PRODUTO", () async {
    var lista = (await manipularProdutoI.pegarLista());
    if (lista.isNotEmpty) {
      var produto = lista.first;
      produto.nome = "Pera";

      try {
      await manipularProdutoI.actualizarProduto(produto);
      var teste = lista.firstWhereOrNull((element) => element.id == produto.id);
      expect(true, teste != null);
      expect("Pera", teste!.nome);
      expect(true, (await manipularProdutoI.existeProdutoComNome("Pera")));
      } catch (e) {
        expect(e, isA<ErroProdutoExistente>());
      }
    }
  });

  test("REMOVER PRODUTO", () async {
    var lista = (await manipularProdutoI.pegarLista());
    if (lista.isNotEmpty) {
      var produto = lista.first;
      await manipularProdutoI.removerProduto(produto);
      expect(
          false, (await manipularProdutoI.existeProdutoComNome(produto.nome!)));
    }
  });
}
