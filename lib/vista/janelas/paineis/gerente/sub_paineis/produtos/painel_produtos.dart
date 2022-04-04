import 'package:componentes_visuais/componentes/butoes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../recursos/constantes.dart';
import '../../../../../componentes/tab_bar.dart';
import '../../../../../componentes/pesquisa.dart';
import '../../painel_gerente_c.dart';
import 'layouts/produtos.dart';
import 'layouts/produtos_c.dart';

class PainelProdutos extends StatelessWidget {
  late ProdutosC _c;
  PainelProdutos({
    Key? key,
  }) {
    initiC();
  }

  initiC() {
    try {
      _c = Get.find();
    } catch (e) {
      _c = Get.put(ProdutosC());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 62),
          child: LayoutPesquisa(
            accaoNaInsercaoNoCampoTexto: (dado) {},
            accaoAoSair: () {
              _c.terminarSessao();
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          child: Row(
            children: [
              Text(
                "PRODUTOS",
                style: TextStyle(color: primaryColor),
              ),
              Spacer(),
              Expanded(
                  child: ModeloTabBar(
                listaItens: ["Todos", "Activos", "Desactivos", "Eliminados"],
                indiceTabInicial: 1,
                accao: (indice) {
                  _c.navegar(indice);
                },
              ))
            ],
          ),
        ),
        Expanded(
          child: LayoutProdutos(lista: _c.lista, c: _c),
        ),
        Container(
          // width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.all(20),
          child: ModeloButao(
            corButao: primaryColor,
            corTitulo: Colors.white,
            butaoHabilitado: true,
            tituloButao: "Adicionar Produto",
            metodoChamadoNoClique: () {
              _c.mostrarDialogoAdicionarProduto();
            },
          ),
        ),
      ],
    );
  }
}