import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yetu_gestor/vista/janelas/paineis/gerente/componentes/tab_bar.dart';

import '../../../../../recursos/constantes.dart';
import '../layouts/funcionarios.dart';
import '../layouts/pesquisa.dart';
import '../painel_gerente.dart';
import '../painel_gerente_c.dart';

class PainelDireito extends StatelessWidget {
  const PainelDireito({
    Key? key,
    required PainelGerenteC c,
  })  : _c = c,
        super(key: key);

  final PainelGerenteC _c;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LayoutPesquisa(c: _c),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          child: Row(
            children: [
              Text(
                "FUNCIONÁRIOS",
                style: TextStyle(color: primaryColor),
              ),
              Spacer(),
              Expanded(
                  child: ModeloTabBar(
                c: _c,
              ))
            ],
          ),
        ),
        Expanded(
          child: LayoutFuncionarios(c: _c),
        )
      ],
    );
  }
}