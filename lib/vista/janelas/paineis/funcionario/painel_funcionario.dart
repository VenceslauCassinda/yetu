// ignore_for_file: unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yetu_gestor/dominio/entidades/painel_actual.dart';
import 'package:yetu_gestor/vista/janelas/paineis/funcionario/sub_paineis/dinheiro_sobra/painel.dart';
import 'package:yetu_gestor/vista/janelas/paineis/funcionario/sub_paineis/saida_caixa/painel.dart';
import 'package:yetu_gestor/vista/janelas/paineis/funcionario/sub_paineis/vendas/painel_vendas.dart';
import 'componentes/gaveta.dart';
import 'painel_funcionario_c.dart';
import 'sub_paineis/dividas_encomendas_gerais/painel.dart';
import 'sub_paineis/historico/historico.dart';
import 'sub_paineis/recepcoes/painel.dart';

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
            if (_c.painelActual.value.indicadorPainel ==
                PainelActual.HISTORICO_VENDAS) {
              return PainelHistorico(
                c: _c,
                funcionario: _c.funcionarioActual,
              );
            }
            if (_c.painelActual.value.indicadorPainel ==
                PainelActual.VENDAS_ANTIGA) {
              return PainelVendas(
                data: _c.painelActual.value.valor as DateTime,
                funcionario: _c.funcionarioActual,
                funcionarioC: _c,
              );
            }
            if (_c.painelActual.value.indicadorPainel ==
                    PainelActual.DIVIDAS_GERAIS ||
                _c.painelActual.value.indicadorPainel ==
                    PainelActual.ENCOMENDAS_GERAIS) {
              return PainelDividasEncomendas(
                funcionario: _c.funcionarioActual,
                funcionarioC: _c,
              );
            }
            if (_c.painelActual.value.indicadorPainel ==
                PainelActual.RECEPCOES) {
              return PainelRecepcoes(
                funcionario: _c.funcionarioActual,
                painelFuncionarioC: _c,
              );
            }
            if (_c.painelActual.value.indicadorPainel ==
                PainelActual.DINHEIRO_SOBRA) {
              return PainelDinheiroSobra(
                funcionario: _c.funcionarioActual,
                c: _c,
              );
            }
            if (_c.painelActual.value.indicadorPainel ==
                PainelActual.SAIDA_CAIXA) {
              return PainelSaidaCaixa(
                _c,
                _c.funcionarioActual,
              );
            }
            return PainelVendas(
              data: DateTime.now(),
              funcionario: _c.funcionarioActual,
              funcionarioC: _c,
            );
          }),
        ),
      ],
    );
  }
}
