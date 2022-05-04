import 'package:componentes_visuais/componentes/butoes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yetu_gestor/vista/componentes/item_investimento.dart';
import '../../../../../../dominio/entidades/painel_actual.dart';
import '../../../../../../recursos/constantes.dart';
import '../../../../../componentes/tab_bar.dart';
import '../../../../../componentes/pesquisa.dart';
import '../../painel_gerente_c.dart';
import 'painel_c.dart';

class PainelInvestimento extends StatelessWidget {
  late PainelInvestimentoC _c;
  final PainelGerenteC gerenteC;
  PainelInvestimento({
    Key? key,
    required this.gerenteC,
  }) {
    initiC();
  }

  initiC() {
    try {
      _c = Get.find();
    } catch (e) {
      _c = Get.put(PainelInvestimentoC());
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
            accaoAoVoltar: () {
              gerenteC.irParaPainel(PainelActual.FUNCIONARIOS);
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          child: Row(
            children: [
              Text(
                "INVESTIMENTO POR PRODUTOS",
                style: TextStyle(color: primaryColor),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          child: Row(
            children: [
              Obx(() {
                  return Text(
                    "TOTAL INVESTIDO: ${_c.totalInvestido.value}",
                    style: TextStyle(color: primaryColor),
                  );
                }
              )
            ],
          ),
        ),
        Expanded(
          child: Obx(() {
            _c.lista.isEmpty;
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: _c.lista
                      .map((produto) => InkWell(
                            onTap: () {},
                            child: ItemInvestimento(
                              produto: produto,
                              c: _c,
                            ),
                          ))
                      .toList(),
                ),
              ),
            );
          }),
        ),
      ],
    );
  }
}
