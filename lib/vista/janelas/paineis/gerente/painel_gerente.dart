// ignore_for_file: unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yetu_gestor/dominio/entidades/funcionario.dart';
import 'package:yetu_gestor/vista/janelas/paineis/gerente/painel_gerente_c.dart';

import 'componentes/gaveta.dart';
import 'componentes/painel_direito.dart';

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
            if (_c.painelActual.value == Painel.PRODUTOS) {
            }
            return PainelDireito(c: _c);
          }),
        ),
      ],
    );
  }
}

enum Painel {
  NENHUM,
  FUNCIONARIOS,
  PRODUTOS,
}
