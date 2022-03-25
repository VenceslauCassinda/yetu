import 'package:componentes_visuais/componentes/campo_texto.dart';
import 'package:flutter/material.dart';
import 'package:yetu_gestor/vista/aplicacao_c.dart';

import '../painel_gerente_c.dart';

class LayoutPesquisa extends StatelessWidget {
  const LayoutPesquisa({
    Key? key,
    required PainelGerenteC c,
  })  : _c = c,
        super(key: key);

  final PainelGerenteC _c;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      child: Row(
        children: [
          Expanded(
            flex: 6,
            child: CampoTexto(
              context: context,
              campoBordado: false,
              icone: const Icon(Icons.search),
              metodoChamadoNaInsersao: (dado) {},
            ),
          ),
          Expanded(
            flex: 1,
            child: MaterialButton(
              onPressed: () {
                _c.terminarSessao();
              },
              child: Row(
                children: [
                  Icon(Icons.logout),
                  SizedBox(
                    width: 20,
                  ),
                  Text("Sair")
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
