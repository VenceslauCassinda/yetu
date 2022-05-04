import 'package:componentes_visuais/dialogo/dialogos.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yetu_gestor/contratos/casos_uso/manipular_receccao_i.dart';
import 'package:yetu_gestor/dominio/casos_uso/manipula_stock.dart';
import 'package:yetu_gestor/dominio/casos_uso/manipular_entrada.dart';
import 'package:yetu_gestor/dominio/casos_uso/manipular_preco.dart';
import 'package:yetu_gestor/dominio/casos_uso/manipular_produto.dart';
import 'package:yetu_gestor/dominio/casos_uso/manipular_receccao.dart';
import 'package:yetu_gestor/dominio/entidades/entrada.dart';
import 'package:yetu_gestor/dominio/entidades/estado.dart';
import 'package:yetu_gestor/dominio/entidades/funcionario.dart';
import 'package:yetu_gestor/dominio/entidades/produto.dart';
import 'package:yetu_gestor/dominio/entidades/receccao.dart';
import 'package:yetu_gestor/fonte_dados/provedores/provedor_entrada.dart';
import 'package:yetu_gestor/fonte_dados/provedores/provedor_preco.dart';
import 'package:yetu_gestor/fonte_dados/provedores/provedor_produto.dart';
import 'package:yetu_gestor/fonte_dados/provedores/provedor_receccao.dart';
import 'package:yetu_gestor/fonte_dados/provedores/provedor_stock.dart';
import 'package:yetu_gestor/vista/janelas/paineis/funcionario/painel_funcionario_c.dart';
import 'package:yetu_gestor/vista/janelas/paineis/gerente/sub_paineis/produtos/layouts/produtos.dart';

import '../../../../../aplicacao_c.dart';
import '../../../../../componentes/pesquisa.dart';
import '../../../gerente/layouts/layout_quantidade.dart';

class RecepcoesC extends GetxController {
  late ManipularRececcaoI _manipularRececcaoI;
  late ManipularProduto _manipularProduto;
  var lista = RxList<Receccao>();
  late Funcionario funcionario;

  RecepcoesC(this.funcionario) {
    var maipularStock = ManipularStock(ProvedorStock());
    _manipularRececcaoI = ManipularRececcao(
        ProvedorRececcao(), ManipularEntrada(ProvedorEntrada(), maipularStock));
    _manipularProduto = ManipularProduto(
        ProvedorProduto(), maipularStock, ManipularPreco(ProvedorPreco()));
  }
  @override
  void onInit() async {
    await pegarDados();
    super.onInit();
  }

  Future<void> pegarDados() async {
    lista.clear();
    List<Receccao> res = [];
    res = await _manipularRececcaoI.pegarListaRececcoesFuncionario(funcionario);
    for (var cada in res) {
      lista.add(cada);
    }
  }

  void terminarSessao() {
    PainelFuncionarioC c = Get.find();
    c.terminarSessao();
  }

  void irParaPainel(int indicePainel) {
    PainelFuncionarioC c = Get.find();
    c.irParaPainel(indicePainel);
  }

  void mostrarDialogoProdutos(BuildContext context) async {
    mostrarDialogoDeLayou(Container(
      width: MediaQuery.of(context).size.width * .5,
      child: FutureBuilder<List<Produto>>(
          future: _manipularProduto.pegarLista(),
          builder: (c, s) {
            if (s.data == null) {
              return const CircularProgressIndicator();
            }
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: LayoutPesquisa(
                    accaoNaInsercaoNoCampoTexto: (dado) {},
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * .5,
                  child: SingleChildScrollView(
                    child: LayoutProdutos(
                      lista: s.data!,
                      accaoAoClicarCadaProduto: (p) {
                        mostrarDialogoReceber(p);
                      },
                    ),
                  ),
                ),
              ],
            );
          }),
    ));
  }

  void mostrarDialogoReceber(Produto produto) {
    voltar();
    mostrarDialogoDeLayou(LayoutQuantidade(
        comOpcaoRetirada: false,
        accaoAoFinalizar: (quantidade, opcaoRetiradaSelecionada) async {
          await _receberProduto(produto, quantidade);
        },
        titulo: "Receber produto ${produto.nome}"));
  }

  Future<void> _receberProduto(Produto produto, String quantidade) async {
    var motivo = Entrada.MOTIVO_ABASTECIMENTO;
    lista.add(Receccao(
        produto: produto,
        funcionario: funcionario,
        estado: Estado.ATIVADO,
        idFuncionario: funcionario.id,
        idProduto: produto.id,
        quantidade: int.parse(quantidade),
        data: DateTime.now()));
    await _manipularRececcaoI.receberProduto(
        produto, int.parse(quantidade), funcionario, motivo);
    voltar();
  }
}
