import 'dart:developer';

import 'package:get/get.dart';
import 'package:yetu_gestor/contratos/casos_uso/manipular_saida_i.dart';
import 'package:yetu_gestor/dominio/casos_uso/manipula_stock.dart';
import 'package:yetu_gestor/dominio/casos_uso/manipular_saida.dart';
import 'package:yetu_gestor/dominio/entidades/produto.dart';
import 'package:yetu_gestor/dominio/entidades/saida.dart';
import 'package:yetu_gestor/fonte_dados/provedores/provedor_saida.dart';
import 'package:yetu_gestor/fonte_dados/provedores/provedor_stock.dart';
import 'package:yetu_gestor/vista/janelas/paineis/gerente/painel_gerente_c.dart';

class SaidasC extends GetxController {
  late ManipularSaidaI _manipularSaidaI;
  bool visaoGeral;

  var lista = RxList<Saida>();

  SaidasC({required this.visaoGeral}) {
    _manipularSaidaI =
        ManipularSaida(ProvedorSaida(), ManipularStock(ProvedorStock()));
  }
  @override
  void onInit() async {
    await pegarDados();
    super.onInit();
  }

  Future<void> pegarDados() async {
    lista.clear();
    List<Saida> res = [];
    if (visaoGeral == true) {
      res = await _manipularSaidaI.pegarLista();
    } else {
      PainelGerenteC c = Get.find();
      Produto produto = (c.painelActual.value.valor as Produto);
      res = await _manipularSaidaI.pegarListaDoProduto(produto);
    }
    for (var cada in res) {
      lista.add(cada);
    }
  }

  void terminarSessao() {
    PainelGerenteC c = Get.find();
    c.terminarSessao();
  }

  void irParaPainel(int indicePainel) {
    PainelGerenteC c = Get.find();
    c.irParaPainel(indicePainel);
  }
}
