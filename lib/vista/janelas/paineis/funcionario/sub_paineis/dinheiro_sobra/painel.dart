import 'package:componentes_visuais/componentes/butoes.dart';
import 'package:componentes_visuais/componentes/formatos/formatos.dart';
import 'package:componentes_visuais/componentes/modelo_item_lista.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yetu_gestor/dominio/entidades/funcionario.dart';
import 'package:yetu_gestor/dominio/entidades/painel_actual.dart';
import 'package:yetu_gestor/vista/componentes/item_dinheiro_sobra.dart';

import '../../../../../../dominio/entidades/nivel_acesso.dart';
import '../../../../../../recursos/constantes.dart';
import '../../../../../../solucoes_uteis/formato_dado.dart';
import '../../../../../componentes/pesquisa.dart';
import '../../painel_funcionario_c.dart';
import 'painel_c.dart';

class PainelDinheiroSobra extends StatelessWidget {
  PainelDinheiroSobra({
    Key? key,
    required var c,
    required this.funcionario,
    this.accaoAoVoltar,
  })  : _funcionarioC = c,
        super(key: key) {
    initiC();
  }

  late PainelDinheiroSobraC _c;
  var _funcionarioC;
  final Funcionario funcionario;
  Function? accaoAoVoltar;

  initiC() {
    try {
      _c = Get.find();
      _c.funcionario = funcionario;
    } catch (e) {
      _c = Get.put(PainelDinheiroSobraC(funcionario));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
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
              if (accaoAoVoltar != null) {
                accaoAoVoltar!();
              }
              _funcionarioC.irParaPainel(PainelActual.INICIO);
            },
          ),
        ),
        Obx(
          () => Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            width: double.infinity,
            child: Text(
              "Total: ${formatar(_c.total.value)} KZ",
              style: TextStyle(color: primaryColor, fontSize: 30),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Obx((() {
              return SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: _c.lista
                      .map((element) => ItemDinheiroSobra(
                            dinheiroSobra: element,
                            aoClicar: () {},
                            aoRemover: () {
                              _c.mostrarDialodoRemover(element);
                            },
                            visaoGeral:
                                funcionario.nivelAcesso == NivelAcesso.GERENTE,
                          ))
                      .toList(),
                ),
              );
            })),
          ),
        ),
        Container(
          // width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.all(20),
          child: ModeloButao(
            corButao: primaryColor,
            corTitulo: Colors.white,
            butaoHabilitado: true,
            tituloButao: "Adicionar Dinheiro",
            metodoChamadoNoClique: () {
              _c.mostrarDialogoNovaValor(context);
            },
          ),
        ),
      ],
    );
  }
}
