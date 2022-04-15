import 'package:componentes_visuais/componentes/butoes.dart';
import 'package:componentes_visuais/componentes/formatos/formatos.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yetu_gestor/dominio/entidades/funcionario.dart';
import 'package:yetu_gestor/solucoes_uteis/formato_dado.dart';

import '../../../../../../../recursos/constantes.dart';
import '../../../../../componentes/pesquisa.dart';
import '../../../../../componentes/tab_bar.dart';
import 'layouts/vendas.dart';
import 'layouts/vendas_c.dart';

class PainelVendas extends StatelessWidget {
  PainelVendas({
    Key? key,
    required this.data, required this.funcionario,
  }) {
    initiC();
  }

  late VendasC _c;
  final DateTime data;
  final Funcionario funcionario;

  initiC() {
    try {
      _c = Get.find();
      _c.data = data;
      _c.funcionario = funcionario;
    } catch (e) {
      _c = Get.put(VendasC(data, funcionario));
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
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: Text(
              "CAIXA: ${formatar(_c.lista.fold<double>(0, (antigoV, cadaV) => ((cadaV.pagamentos ?? []).fold<double>(0, (antigoP, cadaP) => (cadaP.valor ?? 0) + antigoP)) + antigoV))} KZ",
              style: TextStyle(color: primaryColor, fontSize: 30),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          child: Row(
            children: [
              Text(
                "HOJE - ${formatarMesOuDia(data.day)}/${formatarMesOuDia(data.month)}/${data.year}",
                style: TextStyle(color: primaryColor),
              ),
              Spacer(),
              Expanded(
                  child: ModeloTabBar(
                listaItens: ["TODAS", "VENDAS", "ENCOMENDAS", "DÍVIDAS"],
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
