import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yetu_gestor/dominio/entidades/funcionario.dart';
import 'package:yetu_gestor/dominio/entidades/painel_actual.dart';
import 'package:yetu_gestor/vista/janelas/paineis/gerente/painel_gerente_c.dart';

import '../../../../../../componentes/item_funcionario.dart';

class LayoutFuncionarios extends StatelessWidget {
  const LayoutFuncionarios({
    Key? key,
    required PainelGerenteC c,
  })  : _c = c,
        super(key: key);

  final PainelGerenteC _c;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Obx(
        () => Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: _c.lista
                .map((Funcionario element) => ItemFuncionario(
                      usuario: element,
                      aoClicar: () {
                        _c.irParaPainel(PainelActual.VENDAS_FUNCIONARIOS,
                            valor: element);
                      },
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }
}
