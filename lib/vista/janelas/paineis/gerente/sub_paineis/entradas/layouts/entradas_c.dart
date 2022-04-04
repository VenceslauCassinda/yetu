import 'package:get/get.dart';
import 'package:yetu_gestor/contratos/casos_uso/manipular_entrada_i.dart';
import 'package:yetu_gestor/dominio/casos_uso/manipula_stock.dart';
import 'package:yetu_gestor/dominio/casos_uso/manipular_entrada.dart';
import 'package:yetu_gestor/dominio/entidades/entrada.dart';
import 'package:yetu_gestor/dominio/entidades/produto.dart';
import 'package:yetu_gestor/fonte_dados/provedores/provedor_entrada.dart';
import 'package:yetu_gestor/fonte_dados/provedores/provedor_stock.dart';
import 'package:yetu_gestor/vista/janelas/paineis/gerente/painel_gerente_c.dart';

class EntradasC extends GetxController {
  late ManipularEntradaI _manipularEntradaI;
  bool visaoGeral;

  var lista = RxList<Entrada>();

  EntradasC({required this.visaoGeral}) {
    _manipularEntradaI =
        ManipularEntrada(ProvedorEntrada(), ManipularStock(ProvedorStock()));
  }
  @override
  void onInit() async {
    await pegarDados();
    super.onInit();
  }

  Future<void> pegarDados() async {
    lista.clear();
    List<Entrada> res = [];
    if (visaoGeral == true) {
      res = await _manipularEntradaI.pegarLista();
    } else {
      PainelGerenteC c = Get.find();
      Produto produto = (c.painelActual.value.valor as Produto);
      res = await _manipularEntradaI.pegarListaDoProduto(produto);
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
