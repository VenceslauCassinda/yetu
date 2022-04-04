import 'package:get/get.dart';
import 'package:yetu_gestor/vista/aplicacao_c.dart';

import '../../../../dominio/entidades/painel_actual.dart';

class PainelFuncionarioC extends GetxController {
  var painelActual =
      PainelActual(indicadorPainel: PainelActual.NENHUM, valor: null).obs;
  void terminarSessao() {
    AplicacaoC.terminarSessao();
  }

  void navegar(int indice) {}
}
