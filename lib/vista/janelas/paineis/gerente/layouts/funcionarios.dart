import 'package:componentes_visuais/componentes/icone_item.dart';
import 'package:componentes_visuais/componentes/imagem_circulo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yetu_gestor/dominio/entidades/funcionario.dart';
import 'package:yetu_gestor/vista/janelas/paineis/gerente/painel_gerente_c.dart';

import '../../../../../dominio/entidades/estado.dart';
import '../../../../../recursos/constantes.dart';

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
                      aoClicar: () {},
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }
}

class ItemFuncionario extends StatelessWidget {
  final Funcionario usuario;
  final Function aoClicar;
  late PainelGerenteC _c;
  ItemFuncionario({
    Key? key,
    required this.usuario,
    required this.aoClicar,
  }) : super(key: key) {
    _c = Get.find();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.all(20),
            width: 50,
            height: 50,
            child: ImagemNoCirculo(
                Icon(
                  Icons.person,
                  color: primaryColor,
                ),
                20),
          ),
          Text("${usuario.nomeCompelto}"),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconeItem(
              titulo: "Vendas",
              icone: Icons.sell,
              metodoQuandoItemClicado: () {},
              cor: primaryColor,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconeItem(
              titulo: usuario.estado == Estado.DESACTIVADO
                  ? "Activar"
                  : "Desactivar",
              icone: usuario.estado == Estado.DESACTIVADO
                  ? Icons.check
                  : Icons.close,
              metodoQuandoItemClicado: () {
                _c.mudarEstadoFuncionario(usuario);
              },
              cor: primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
