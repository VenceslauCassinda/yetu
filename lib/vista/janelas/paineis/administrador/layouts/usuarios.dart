import 'package:componentes_visuais/componentes/campo_texto.dart';
import 'package:componentes_visuais/componentes/imagem_circulo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../dominio/entidades/estado.dart';
import '../../../../../dominio/entidades/nivel_acesso.dart';
import '../../../../../dominio/entidades/usuario.dart';
import '../../../../../recursos/constantes.dart';
import '../painel_administrador_c.dart';

class LayoutUsuarios extends StatelessWidget {
  const LayoutUsuarios({
    Key? key,
    required PainelAdministradorC c,
  })  : _c = c,
        super(key: key);

  final PainelAdministradorC _c;

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
            children: _c.usuarios
                .map((Usuario element) => ItemUsuario(
                      usuario: element,
                      aoClicar: () {
                        _c.mudar(element);
                      },
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }
}

class LayoutPesquisa extends StatelessWidget {
  const LayoutPesquisa({
    Key? key,
    required PainelAdministradorC c,
  })  : _c = c,
        super(key: key);

  final PainelAdministradorC _c;

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
              metodoChamadoNaInsersao: (dado) {
                _c.dadoPesquisado.value = dado;
              },
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

class ItemUsuario extends StatelessWidget {
  final Usuario usuario;
  final Function aoClicar;
  const ItemUsuario({
    Key? key,
    required this.usuario,
    required this.aoClicar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {
          aoClicar();
        },
        leading: Container(
            width: 50,
            child: ImagemNoCirculo(
                Icon(
                  Icons.person,
                  color: primaryColor,
                ),
                20)),
        title: Text("${usuario.nomeUsuario}"),
        subtitle: Text("Estado: ${Estado.paraTexto(usuario.estado!)}"),
        trailing:
            Text("Usuário: ${NivelAcesso.paraTexto(usuario.nivelAcesso!)}"),
      ),
    );
  }
}