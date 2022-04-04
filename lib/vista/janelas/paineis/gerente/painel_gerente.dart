// ignore_for_file: unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yetu_gestor/dominio/entidades/painel_actual.dart';
import 'package:yetu_gestor/vista/janelas/paineis/gerente/painel_gerente_c.dart';
import 'package:yetu_gestor/vista/janelas/paineis/gerente/sub_paineis/entradas/painel_entradas.dart';
import 'package:yetu_gestor/vista/janelas/paineis/gerente/sub_paineis/pagamentos/painel_pagamentos.dart';
import 'package:yetu_gestor/vista/janelas/paineis/gerente/sub_paineis/saidas/painel_saidas.dart';

import 'componentes/gaveta.dart';
import 'sub_paineis/funcionarios/painel_direito.dart';
import 'sub_paineis/produtos/painel_produtos.dart';

class PainelGerente extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CorpoGerente(),
    );
  }
}

class CorpoGerente extends StatelessWidget {
  late PainelGerenteC _c;
  TextStyle headerStyle = TextStyle();
  CorpoGerente({
    Key? key,
  }) : super(key: key) {
    _c = Get.put(PainelGerenteC());
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 2,
            child: GavetaNavegacao(
              linkImagem: "",
              c: _c,
            )),
        Expanded(
          flex: 5,
          child: Obx(() {
            if (_c.painelActual.value.indicadorPainel ==
                PainelActual.PRODUTOS) {
              return PainelProdutos();
            }
            if (_c.painelActual.value.indicadorPainel ==
                PainelActual.ENTRADAS_GERAL) {
              return PainelEntradas(
                visaoGeral: true,
              );
            }
            if (_c.painelActual.value.indicadorPainel ==
                PainelActual.ENTRADAS) {
              return PainelEntradas(
                visaoGeral: false,
              );
            }
            if (_c.painelActual.value.indicadorPainel ==
                PainelActual.SAIDAS_GERAL) {
              return PainelSaidas(
                visaoGeral: true,
              );
            }
            if (_c.painelActual.value.indicadorPainel == PainelActual.SAIDAS) {
              return PainelSaidas(
                visaoGeral: false,
              );
            }
            if (_c.painelActual.value.indicadorPainel ==
                PainelActual.PAGAMENTOS) {
              return PainelPagamentos();
            }
            return PainelDireito(c: _c);
          }),
        ),
      ],
    );
  }
}
