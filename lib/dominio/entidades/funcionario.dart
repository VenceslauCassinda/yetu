// ignore_for_file: overridden_fields

import 'package:drift/drift.dart';
import 'package:yetu_gestor/dominio/entidades/usuario.dart';

class Funcionario extends Usuario {
  String? nomeCompelto;
  @override
  int? id;
  int? idUsuario;
  @override
  String? nomeUsuario;
  @override
  String? imagemPerfil;
  @override
  String? palavraPasse;
  @override
  int? nivelAcesso;
  @override
  int? estado;
  @override
  bool? logado;

  Funcionario({this.nomeCompelto,
      this.id,
      this.estado,
      this.logado,
      this.idUsuario,
      this.nomeUsuario,
      this.imagemPerfil,
      this.palavraPasse,
      this.nivelAcesso})
      : super(
            estado: estado,
            id: id,
            imagemPerfil: imagemPerfil,
            logado: logado,
            nivelAcesso: nivelAcesso,
            nomeUsuario: nomeCompelto,
            palavraPasse: palavraPasse);
}
