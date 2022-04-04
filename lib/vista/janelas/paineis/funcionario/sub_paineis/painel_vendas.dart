import 'package:componentes_visuais/componentes/butoes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../recursos/constantes.dart';
import '../../../../componentes/pesquisa.dart';
import '../../../../componentes/tab_bar.dart';
import 'layouts/vendas.dart';
import 'layouts/vendas_c.dart';

class PainelVendas extends StatelessWidget {
  PainelVendas({
    Key? key,
  }) {
    initiC();
  }

  late VendasC _c;

  initiC() {
    try {
      _c = Get.find();
    } catch (e) {
      _c = Get.put(VendasC());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: LayoutPesquisa(
            accaoNaInsercaoNoCampoTexto: (dado) {},
            accaoAoSair: () {
              _c.terminarSessao();
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 0),
          child: Row(
            children: [
              Text(
                "VENDAS",
                style: TextStyle(color: primaryColor),
              ),
              Spacer(),
              Expanded(
                  child: ModeloTabBar(
                listaItens: [],
                indiceTabInicial: 0,
                accao: (indice) {
                  _c.navegar(indice);
                },
              ))
            ],
          ),
        ),
        Expanded(
          child: LayoutVendas(visaoGeral: true),
        ),
        Container(
          // width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.all(20),
          child: ModeloButao(
            corButao: primaryColor,
            corTitulo: Colors.white,
            butaoHabilitado: true,
            tituloButao: "Adicionar Venda",
            metodoChamadoNoClique: () {
              _c.mostrarDialogoNovaVenda(context);
            },
          ),
        ),
      ],
    );
  }
}
