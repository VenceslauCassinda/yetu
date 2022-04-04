import 'package:componentes_visuais/componentes/butoes.dart';
import 'package:componentes_visuais/componentes/campo_texto.dart';
import 'package:componentes_visuais/componentes/menu_drop_down.dart';
import 'package:componentes_visuais/dialogo/dialogos.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:get/get.dart';
import 'package:yetu_gestor/contratos/casos_uso/manipular_pagamento_i.dart';
import 'package:yetu_gestor/contratos/casos_uso/manipular_produto_i.dart';
import 'package:yetu_gestor/contratos/casos_uso/manipular_stock_i.dart';
import 'package:yetu_gestor/dominio/casos_uso/manipular_pagamento.dart';
import 'package:yetu_gestor/dominio/entidades/forma_pagamento.dart';
import 'package:yetu_gestor/dominio/entidades/produto.dart';
import 'package:yetu_gestor/dominio/entidades/venda.dart';
import 'package:yetu_gestor/fonte_dados/provedores/provedor_pagamento.dart';
import 'package:yetu_gestor/vista/janelas/paineis/funcionario/layouts/mesa_venda.dart';
import 'package:yetu_gestor/vista/janelas/paineis/funcionario/painel_funcionario_c.dart';
import 'package:yetu_gestor/vista/janelas/paineis/gerente/layouts/layout_forma_pagamento.dart';
import 'package:yetu_gestor/vista/janelas/paineis/gerente/layouts/layout_quantidade.dart';
import 'package:yetu_gestor/vista/janelas/paineis/gerente/sub_paineis/produtos/layouts/produtos.dart';

import '../../../../../../dominio/casos_uso/manipula_stock.dart';
import '../../../../../../dominio/casos_uso/manipular_preco.dart';
import '../../../../../../dominio/casos_uso/manipular_produto.dart';
import '../../../../../../fonte_dados/provedores/provedor_preco.dart';
import '../../../../../../fonte_dados/provedores/provedor_produto.dart';
import '../../../../../../fonte_dados/provedores/provedor_stock.dart';
import '../../../../../../recursos/constantes.dart';
import '../../../../../componentes/pesquisa.dart';

class VendasC extends GetxController {
  RxList<Venda> lista = RxList<Venda>();
  late ManipularProdutoI _manipularProdutoI;
  late ManipularStockI _manipularStockI;
  late ManipularPagamentoI _manipularPagamentoI;
  VendasC() {
    _manipularStockI = ManipularStock(ProvedorStock());
    _manipularProdutoI = ManipularProduto(
        ProvedorProduto(), _manipularStockI, ManipularPreco(ProvedorPreco()));
    _manipularPagamentoI = ManipularPagamento(ProvedorPagamento());
  }

  @override
  void onInit() {
    super.onInit();
  }

  void terminarSessao() {
    PainelFuncionarioC c = Get.find();
    c.terminarSessao();
  }

  void navegar(int indice) {}

  void mostrarDialogoNovaVenda(BuildContext context) {
    mostrarDialogoDeLayou(LayoutMesaVenda(this));
  }

  void mostrarFormasPagamento(BuildContext context,
      {required Function(String valor, String? opcaoRetiradaSelecionada)
          accaoAoFinalizar}) {
    mostrarDialogoDeLayou(
        FutureBuilder<List<FormaPagamento>>(
            future: _manipularPagamentoI.pegarListaFormasPagamento(),
            builder: (context, snapshot) {
              if (snapshot.data == null) {
                return CircularProgressIndicator();
              }
              var lista = snapshot.data!.map((e) => e.descricao!).toList();
              return LayoutFormaPagamento(
                  accaoAoFinalizar: (valor, opcao) {
                    accaoAoFinalizar(valor, opcao);
                  },
                  titulo: "Selecione a Forma de Pagamento",
                  listaItens: lista);
            }),
        naoFechar: true);
  }

  Future<List<Produto>> pegarLista() async {
    return await _manipularProdutoI.pegarLista();
  }
}
