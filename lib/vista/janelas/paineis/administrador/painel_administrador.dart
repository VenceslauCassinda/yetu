// ignore_for_file: unnecessary_string_interpolations

import 'package:componentes_visuais/componentes/cabecalho_gaveta.dart';
import 'package:componentes_visuais/componentes/campo_texto.dart';
import 'package:componentes_visuais/componentes/imagem_circulo.dart';
import 'package:componentes_visuais/componentes/menu_drop_down.dart';
import 'package:componentes_visuais/componentes/modelo_item_lista.dart';
import 'package:componentes_visuais/componentes/validadores/validadcao_campos.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yetu_gestor/dominio/entidades/estado.dart';
import 'package:yetu_gestor/recursos/constantes.dart';
import 'package:yetu_gestor/vista/janelas/paineis/administrador/painel_administrador_c.dart';

import '../../../../dominio/entidades/nivel_acesso.dart';
import '../../../../dominio/entidades/sessao.dart';
import '../../../../dominio/entidades/usuario.dart';
import 'componentes/gaveta.dart';
import 'componentes/painel_direito.dart';

class PainelAdministrador extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CorpoAdministrador(),
    );
  }
}

class CorpoAdministrador extends StatelessWidget {
  late PainelAdministradorC _c;
  TextStyle headerStyle = TextStyle();
  CorpoAdministrador({
    Key? key,
  }) : super(key: key) {
    _c = Get.put(PainelAdministradorC());
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 2,
            child: GavetaNavegacao(
              linkImagem: "",
            )),
        Expanded(
          flex: 5,
          child: PainelDireito(c: _c),
        ),
      ],
    );
  }
}








