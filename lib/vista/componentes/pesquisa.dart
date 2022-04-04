import 'package:componentes_visuais/componentes/campo_texto.dart';
import 'package:flutter/material.dart';

class LayoutPesquisa extends StatelessWidget {
  final Function(String dado) accaoNaInsercaoNoCampoTexto;
  Function? accaoAoSair;

  LayoutPesquisa(
      {Key? key, required this.accaoNaInsercaoNoCampoTexto, this.accaoAoSair})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 6,
          child: CampoTexto(
            context: context,
            campoBordado: false,
            icone: const Icon(Icons.search),
            metodoChamadoNaInsersao: (dado) {
              accaoNaInsercaoNoCampoTexto(dado);
            },
          ),
        ),
        Visibility(
          visible: accaoAoSair != null,
          child: Expanded(
            flex: 1,
            child: MaterialButton(
              onPressed: () {
                accaoAoSair!();
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
          ),
        )
      ],
    );
  }
}
