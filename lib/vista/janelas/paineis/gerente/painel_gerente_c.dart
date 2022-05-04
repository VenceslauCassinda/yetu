import 'package:get/get.dart';
import 'package:yetu_gestor/dominio/casos_uso/manipular_fincionario.dart';
import 'package:yetu_gestor/dominio/casos_uso/manipular_usuario.dart';
import 'package:yetu_gestor/dominio/entidades/estado.dart';
import 'package:yetu_gestor/dominio/entidades/funcionario.dart';
import 'package:yetu_gestor/fonte_dados/provedores/provedor_funcionario.dart';
import 'package:yetu_gestor/fonte_dados/provedores/provedores_usuario.dart';
import 'package:yetu_gestor/vista/janelas/paineis/funcionario/sub_paineis/dinheiro_sobra/painel_c.dart';
import 'package:yetu_gestor/vista/janelas/paineis/funcionario/sub_paineis/saida_caixa/painel_c.dart';
import 'package:yetu_gestor/vista/janelas/paineis/funcionario/sub_paineis/vendas/layouts/vendas_c.dart';
import 'package:yetu_gestor/vista/janelas/paineis/gerente/sub_paineis/entradas/layouts/entradas_c.dart';
import 'package:yetu_gestor/vista/janelas/paineis/gerente/sub_paineis/historico/historico_c.dart';
import 'package:yetu_gestor/vista/janelas/paineis/gerente/sub_paineis/investimento/painel_c.dart';
import 'package:yetu_gestor/vista/janelas/paineis/gerente/sub_paineis/pagamentos/pagamentos_c.dart';
import 'package:yetu_gestor/vista/janelas/paineis/gerente/sub_paineis/produtos/layouts/produtos_c.dart';
import 'package:yetu_gestor/vista/janelas/paineis/gerente/sub_paineis/saidas/layouts/saidas_c.dart';
import '../../../../contratos/casos_uso/manipular_funcionario_i.dart';
import '../../../../dominio/entidades/painel_actual.dart';
import '../../../aplicacao_c.dart';

class PainelGerenteC extends GetxController {
  var painelActual =
      PainelActual(indicadorPainel: PainelActual.NENHUM, valor: null).obs;
  var lista = RxList<Funcionario>();
  var dadoPesquisado = "".obs;
  late Funcionario funcionarioActual;

  var listaControladores = <Type>[];

  late ManipularFuncionarioI _manipularFuncionarioI;
  PainelGerenteC() {
    _manipularFuncionarioI = ManipularFuncionario(
        ManipularUsuario(ProvedorUsuario()), ProveedorFuncionario());
  }

  @override
  void onInit() async {
    await inicializarFuncionario();
    await pegarTodos();
    super.onInit();
  }

  Future<void> inicializarFuncionario() async {
    funcionarioActual =
        await _manipularFuncionarioI.pegarFuncionarioDoUsuarioDeId(
            (pegarAplicacaoC().pegarUsuarioActual())!.id!);
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

  void irParaPainel(int indicadorPainel, {valor}) async {
    painelActual.value =
        PainelActual(indicadorPainel: indicadorPainel, valor: valor);
    if (indicadorPainel == PainelActual.PRODUTOS) {
      ProdutosC c;
      try {
        c = Get.find();
      } catch (e) {
        c = Get.put(ProdutosC());
      }
      c.navegar(1);
      return;
    }
    if (indicadorPainel == PainelActual.ENTRADAS ||
        indicadorPainel == PainelActual.ENTRADAS_GERAL) {
      EntradasC c;
      try {
        c = Get.find();
        c.visaoGeral = indicadorPainel == PainelActual.ENTRADAS_GERAL;
      } catch (e) {
        c = Get.put(EntradasC(
            visaoGeral: indicadorPainel == PainelActual.ENTRADAS_GERAL));
      }
      c.pegarDados();
      return;
    }
    if (indicadorPainel == PainelActual.SAIDAS ||
        indicadorPainel == PainelActual.SAIDAS_GERAL) {
      SaidasC c;
      try {
        c = Get.find();
        c.visaoGeral = indicadorPainel == PainelActual.SAIDAS_GERAL;
      } catch (e) {
        c = Get.put(
            SaidasC(visaoGeral: indicadorPainel == PainelActual.SAIDAS_GERAL));
      }
      c.pegarDados();
      return;
    }
    if (indicadorPainel == PainelActual.PAGAMENTOS) {
      PagamentosC c;
      try {
        c = Get.find();
      } catch (e) {
        c = Get.put(PagamentosC());
      }
      await c.pegarDados();
      return;
    }
    if (PainelActual.VENDAS_FUNCIONARIOS ==
            painelActual.value.indicadorPainel ||
        PainelActual.VENDAS_ANTIGA == indicadorPainel) {
      Get.delete<VendasC>();
      Get.delete<HistoricoC>();
    }
    if (PainelActual.VENDAS == painelActual.value.indicadorPainel ||
        PainelActual.VENDAS_ANTIGA == indicadorPainel) {
      Get.delete<HistoricoC>();
    }
    if (PainelActual.SAIDA_CAIXA == painelActual.value.indicadorPainel) {
      Get.delete<PainelSaidaCaixaC>();
    }
    if (PainelActual.DINHEIRO_SOBRA == painelActual.value.indicadorPainel) {
      Get.delete<PainelDinheiroSobraC>();
    }
    if (PainelActual.INVESTIMENTO == painelActual.value.indicadorPainel) {
      Get.delete<PainelInvestimentoC>();
    }
  }

  Future<void> pegarTodos() async {
    lista.clear();
    for (var cada in (await _manipularFuncionarioI.pegarLista())) {
      if (cada.estado! >= Estado.ATIVADO) {
        lista.add(cada);
      }
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

PainelGerenteC pegarPainelGerenteC() {
  return Get.find();
}
