import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:componentes_visuais/componentes/item_gaveta.dart';
import 'package:yetu_gestor/recursos/constantes.dart';
import 'package:yetu_gestor/vista/componentes/logo.dart';
import 'package:yetu_gestor/vista/janelas/paineis/gerente/painel_gerente.dart';
import 'package:yetu_gestor/vista/janelas/paineis/gerente/painel_gerente_c.dart';

class GavetaNavegacao extends StatelessWidget {
  final String linkImagem;
  final PainelGerenteC c;

  const GavetaNavegacao({Key? key, required this.linkImagem, required this.c})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 2,
          child: Center(
            child: Logo(
              cor: primaryColor,
              tamanhoTexto: 30.sp,
            ),
          ),
        ),
        Expanded(
          flex: 8,
          child: Container(
            decoration: const BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.only(topRight: Radius.circular(20))),
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              children: [
                ItemDaGaveta(
                    cor: branca,
                    icone: Icons.people,
                    titulo: "Funcionários",
                    metodoQuandoItemClicado: () async {
                      c.irParaPainel(Painel.FUNCIONARIOS);
                    }),
                ItemDaGaveta(
                    cor: branca,
                    icone: Icons.people,
                    titulo: "Produtos",
                    metodoQuandoItemClicado: () async {
                      c.irParaPainel(Painel.PRODUTOS);
                    }),
              ],
            ),
          ),
        ),
      ],
    );
  }
}