import 'package:componentes_visuais/componentes/icone_item.dart';
import 'package:componentes_visuais/componentes/imagem_circulo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yetu_gestor/dominio/entidades/produto.dart';
import 'package:yetu_gestor/vista/janelas/paineis/gerente/sub_paineis/produtos/layouts/produtos_c.dart';

import '../../../../../../../dominio/entidades/estado.dart';
import '../../../../../../../recursos/constantes.dart';
import '../../../../../../componentes/item_produto.dart';

class LayoutProdutos extends StatelessWidget {
  final List<Produto> lista;
  Function? accaoAoClicarCadaProduto;
  ProdutosC? c;
  LayoutProdutos({required this.lista, this.c, this.accaoAoClicarCadaProduto});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: lista
              .map((produto) => InkWell(
                    onTap: () {
                      if (accaoAoClicarCadaProduto != null) {
                        accaoAoClicarCadaProduto!();
                      }
                    },
                    child: ItemProduto(
                      produto: produto,
                      c: c,
                    ),
                  ))
              .toList(),
        ),
      ),
    );
  }
}
