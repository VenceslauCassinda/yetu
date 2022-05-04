import 'package:componentes_visuais/componentes/layout_confirmacao_accao.dart';
import 'package:componentes_visuais/dialogo/dialogos.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:yetu_gestor/contratos/casos_uso/manipular_dinheiro_sobra_i.dart';
import 'package:yetu_gestor/dominio/entidades/dinheiro_sobra.dart';
import 'package:yetu_gestor/fonte_dados/provedores/provedor_dinheiro_sobra.dart';
import '../../../../../../dominio/casos_uso/manipular_dinheiro_sobra.dart';
import '../../../../../../dominio/entidades/estado.dart';
import '../../../../../../dominio/entidades/funcionario.dart';
import '../../../../../../recursos/constantes.dart';
import 'layouts/layout_add_valor.dart';

class PainelDinheiroSobraC extends GetxController {
  RxList<DinheiroSobra> lista = RxList([]);
  var total = 0.0.obs;

  late ManipularDinheiroSobraI _manipularDinheiroSobraI;
  late Funcionario funcionario;
  PainelDinheiroSobraC(this.funcionario) {
    _manipularDinheiroSobraI = ManipularDinheiroSobra(ProvedorDinheiroSobra());
  }

  @override
  void onInit() async {
    await pegarLista();
    super.onInit();
  }

  void terminarSessao() {}

  pegarLista() async {
    var res = await _manipularDinheiroSobraI.pegarLista();
    for (var cada in res) {
      lista.add(cada);
      total.value += cada.valor ?? 0;
    }
  }

  void mostrarDialogoNovaValor(BuildContext context) {
    mostrarDialogoDeLayou(LayoutAddValor(
        accaoAoFinalizar: (valor) async {
          await adincionarDinheiro(valor);
        },
        titulo: "Insira o valor a mais"));
  }

  Future<void> adincionarDinheiro(String valor) async {
    var v = double.parse(valor);
    var dinheiro = DinheiroSobra(
        estado: Estado.ATIVADO,
        funcionario: funcionario,
        idFuncionario: funcionario.id,
        valor: v,
        data: DateTime.now());
    var id = await _manipularDinheiroSobraI.adicionarDinheiroSobra(dinheiro);
    total.value += v;
    dinheiro.id = id;
    lista.insert(0, dinheiro);
    voltar();
  }

  void removerDinheiro(DinheiroSobra element) async {
    await _manipularDinheiroSobraI.removerDinheiroSobraDeId(element.id!);
    lista.removeWhere((element1) => element1.id == element.id);
    voltar();
  }

  void mostrarDialodoRemover(DinheiroSobra element) {
    mostrarDialogoDeLayou(LayoutConfirmacaoAccao(
      accaoAoCancelar: () {
        voltar();
      },
      accaoAoConfirmar: () {
        removerDinheiro(element);
      },
      corButaoSim: primaryColor,
      pergunta: "Deseja mesmo eliminar este Dinheiro",
    ));
  }
}
