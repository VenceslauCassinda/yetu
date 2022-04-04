// ignore_for_file: unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yetu_gestor/vista/janelas/paineis/funcionario/sub_paineis/painel_vendas.dart';
import 'componentes/gaveta.dart';
import 'painel_funcionario_c.dart';

class PainelFuncionario extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Corpo(),
    );
  }
}

class Corpo extends StatelessWidget {
  late PainelFuncionarioC _c;
  TextStyle headerStyle = TextStyle();
  Corpo({
    Key? key,
  }) : super(key: key) {
    initiC();
  }

  initiC() {
    try {
      _c = Get.find();
    } catch (e) {
      _c = Get.put(PainelFuncionarioC());
    }
  }

  @override
  Widget build(BuildContext context) {
    Get.put(context);
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
            _c.painelActual.value;
            return PainelVendas();
          }),
        ),
      ],
    );
  }
}
