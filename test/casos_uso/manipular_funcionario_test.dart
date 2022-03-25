import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:yetu_gestor/contratos/manipular_funcionario_i.dart';
import 'package:yetu_gestor/dominio/casos_uso/manipular_fincionario.dart';
import 'package:yetu_gestor/dominio/casos_uso/manipular_usuario.dart';
import 'package:yetu_gestor/dominio/entidades/estado.dart';
import 'package:yetu_gestor/dominio/entidades/funcionario.dart';
import 'package:yetu_gestor/fonte_dados/erros.dart';
import 'package:yetu_gestor/fonte_dados/padrao_dao/base_dados.dart';
import 'package:yetu_gestor/fonte_dados/provedores/provedor_funcionario.dart';
import 'package:yetu_gestor/fonte_dados/provedores/provedores_usuario.dart';

import '../configuracao/test_config.dart';

void main() {
  TestConfig.prepareInitDataBase();
  Get.put(BancoDados());
  var manipularUsuario = ManipularUsuario(ProvedorUsuario());
  ManipularFuncionarioI manipularFuncionarioI =
      ManipularFuncionario(manipularUsuario, ProveedorFuncionario());
  test("ADICIONAR FUNCIONARIO", () async {
    try {
      var salvar =
          Funcionario(nomeCompelto: "As Moreira", palavraPasse: "11111111");
      await manipularFuncionarioI.adicionarFuncionario(salvar);
      var lista = (await manipularFuncionarioI.pegarLista());
      if (lista.isNotEmpty) {
        var usuario = lista.last;
        expect(salvar.nomeCompelto, usuario.nomeCompelto);
      }
    } catch (e) {
      var teste = (e is ErroFuncionarioJaExiste) || (e is ErroUsuarioJaExiste);
      expect(teste, true);
    }
  });

  test("ELIMINAR FUNCIONARIO", () async {
    var lista = (await manipularFuncionarioI.pegarLista());
    if (lista.isNotEmpty) {
      var usuario = lista.first;
      await manipularFuncionarioI.removerFuncionario(usuario);
      var eliminados = (await manipularFuncionarioI.pegarListaEliminados());
      var eliminado = eliminados
          .firstWhere((element) => element.nomeUsuario == usuario.nomeUsuario);
      expect(eliminado.estado, -1);
      expect(true,
          (await manipularFuncionarioI.pegarLista()).length < lista.length);
    }
  });

  test("DESACTIVAR FUNCIONARIO", () async {
    var lista = (await manipularFuncionarioI.pegarLista());
    if (lista.isNotEmpty) {
      var usuario =
          lista.firstWhereOrNull((element) => element.estado == Estado.ATIVADO);
      if (usuario != null) {
        await manipularFuncionarioI.desactivarFuncionario(usuario);
        usuario = (await manipularFuncionarioI.pegarLista()).firstWhere(
            (element) => element.nomeUsuario == usuario!.nomeUsuario);
        expect(usuario.estado, 0);
      }
    }
  });
  
  test("ACTIVAR FUNCIONARIO", () async {
    var lista = (await manipularFuncionarioI.pegarLista());
    if (lista.isNotEmpty) {
      var usuario =
          lista.firstWhereOrNull((element) => element.estado == Estado.DESACTIVADO);
      if (usuario != null) {
        await manipularFuncionarioI.activarFuncionario(usuario);
        usuario = (await manipularFuncionarioI.pegarLista()).firstWhere(
            (element) => element.nomeUsuario == usuario!.nomeUsuario);
        expect(usuario.estado, 1);
      }
    }
  });
  
  test("RECUPERAR FUNCIONARIO", () async {
    var lista = (await manipularFuncionarioI.pegarListaEliminados());
    if (lista.isNotEmpty) {
      var usuario =
          lista.firstWhereOrNull((element) => element.estado == Estado.ELIMINADO);
      if (usuario != null) {
        await manipularFuncionarioI.recuperarFuncionario(usuario);
        usuario = (await manipularFuncionarioI.pegarLista()).firstWhere(
            (element) => element.nomeUsuario == usuario!.nomeUsuario);
        expect(usuario.estado, 1);
      }
    }
  });
}