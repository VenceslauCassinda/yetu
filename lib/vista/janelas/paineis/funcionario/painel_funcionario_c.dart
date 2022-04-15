import 'package:get/get.dart';
import 'package:yetu_gestor/contratos/casos_uso/manipular_funcionario_i.dart';
import 'package:yetu_gestor/dominio/casos_uso/manipular_fincionario.dart';
import 'package:yetu_gestor/dominio/casos_uso/manipular_usuario.dart';
import 'package:yetu_gestor/dominio/entidades/funcionario.dart';
import 'package:yetu_gestor/fonte_dados/provedores/provedor_funcionario.dart';
import 'package:yetu_gestor/fonte_dados/provedores/provedores_usuario.dart';
import 'package:yetu_gestor/vista/aplicacao_c.dart';

import '../../../../dominio/entidades/painel_actual.dart';
import '../../../../solucoes_uteis/console.dart';

class PainelFuncionarioC extends GetxController {
  var painelActual =
      PainelActual(indicadorPainel: PainelActual.NENHUM, valor: null).obs;
  late DateTime data;
  late Funcionario funcionarioActual;
  late ManipularFuncionarioI _manipularFuncionarioI;
  PainelFuncionarioC() {
    data = DateTime.now();
    _manipularFuncionarioI = ManipularFuncionario(
        ManipularUsuario(ProvedorUsuario()), ProveedorFuncionario());
  }
  @override
  void onInit() async {
    await inicializarFuncionario();
    super.onInit();
  }

  Future<void> inicializarFuncionario() async {
    funcionarioActual =
        await _manipularFuncionarioI.pegarFuncionarioDoUsuarioDeId(
            (pegarAplicacaoC().pegarUsuarioActual())!.id!);
  }

  void terminarSessao() {
    AplicacaoC.terminarSessao();
  }

  void navegar(int indice) {}

  void irParaPainel(int indice) {
    painelActual.value = PainelActual(indicadorPainel: indice, valor: null);
  }
}
