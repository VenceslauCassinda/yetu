import 'package:get/get.dart';
import 'package:yetu_gestor/contratos/manipular_funcionario_i.dart';
import 'package:yetu_gestor/dominio/casos_uso/manipular_fincionario.dart';
import 'package:yetu_gestor/dominio/casos_uso/manipular_usuario.dart';
import 'package:yetu_gestor/dominio/entidades/estado.dart';
import 'package:yetu_gestor/dominio/entidades/funcionario.dart';
import 'package:yetu_gestor/fonte_dados/provedores/provedor_funcionario.dart';
import 'package:yetu_gestor/fonte_dados/provedores/provedores_usuario.dart';

import '../../../aplicacao_c.dart';
import 'painel_gerente.dart';

class PainelGerenteC extends GetxController {
  var painelActual = Painel.NENHUM.obs;
  var lista = RxList<Funcionario>();
  var dadoPesquisado = "".obs;

  late ManipularFuncionarioI _manipularFuncionarioI;
  PainelGerenteC() {
    _manipularFuncionarioI = ManipularFuncionario(
        ManipularUsuario(ProvedorUsuario()), ProveedorFuncionario());
  }

  @override
  void onInit() async {
    await pegarTodos();
    super.onInit();
  }

  Future<void> mudarEstadoFuncionario(Funcionario funcionario) async {
    for (var i = 0; i < lista.length; i++) {
      if (funcionario.nomeUsuario == lista[i].nomeUsuario) {
        if (funcionario.estado == Estado.DESACTIVADO) {
          await _manipularFuncionarioI.activarFuncionario(funcionario);
          funcionario.estado = Estado.ATIVADO;
          lista[i] = funcionario;
        } else {
          await _manipularFuncionarioI.desactivarFuncionario(funcionario);
          funcionario.estado = Estado.DESACTIVADO;
          lista[i] = funcionario;
        }
        break;
      }
    }
  }

  Future<void> navegar(int tab) async {
    if (tab == 0) {
      await pegarTodos();
    }
    if (tab == 1) {
      await pegarActivos();
    }
    if (tab == 2) {
      await pegarDesactivos();
    }
  }

  void irParaPainel(Painel painel) {
    painelActual.value = painel;
  }

  Future<void> pegarTodos() async {
    lista.clear();
    for (var cada in (await _manipularFuncionarioI.pegarLista())) {
      lista.add(cada);
    }
  }

  Future<void> pegarActivos() async {
    lista.clear();
    for (var cada in (await _manipularFuncionarioI.pegarLista())) {
      if (cada.estado == Estado.ATIVADO) {
        lista.add(cada);
      }
    }
  }

  Future<void> pegarDesactivos() async {
    lista.clear();
    for (var cada in (await _manipularFuncionarioI.pegarLista())) {
      if (cada.estado == Estado.DESACTIVADO) {
        lista.add(cada);
      }
    }
  }

  void terminarSessao() {
    AplicacaoC.terminarSessao();
  }
}
