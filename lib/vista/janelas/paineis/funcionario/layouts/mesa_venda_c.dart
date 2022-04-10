import 'package:componentes_visuais/dialogo/dialogos.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yetu_gestor/contratos/casos_uso/manipular_item_venda_i.dart';
import 'package:yetu_gestor/dominio/casos_uso/manipula_stock.dart';
import 'package:yetu_gestor/dominio/casos_uso/manipular_item_venda.dart';
import 'package:yetu_gestor/dominio/casos_uso/manipular_preco.dart';
import 'package:yetu_gestor/dominio/casos_uso/manipular_produto.dart';
import 'package:yetu_gestor/dominio/entidades/estado.dart';
import 'package:yetu_gestor/dominio/entidades/item_venda.dart';
import 'package:yetu_gestor/dominio/entidades/pagamento.dart';
import 'package:yetu_gestor/dominio/entidades/produto.dart';
import 'package:yetu_gestor/fonte_dados/provedores/provedor_item_venda.dart';
import 'package:yetu_gestor/fonte_dados/provedores/provedor_preco.dart';
import 'package:yetu_gestor/fonte_dados/provedores/provedor_produto.dart';
import 'package:yetu_gestor/fonte_dados/provedores/provedor_stock.dart';
import 'package:yetu_gestor/solucoes_uteis/console.dart';
import 'package:yetu_gestor/solucoes_uteis/geradores.dart';

import '../../../../../contratos/casos_uso/manipular_pagamento_i.dart';
import '../../../../../dominio/casos_uso/manipular_pagamento.dart';
import '../../../../../dominio/entidades/forma_pagamento.dart';
import '../../../../../fonte_dados/provedores/provedor_pagamento.dart';
import '../../gerente/layouts/layout_forma_pagamento.dart';

class MesaVendaC extends GetxController {
  RxList<Pagamento> listaPagamentos = <Pagamento>[].obs;
  RxList<ItemVenda> listaItensVenda = <ItemVenda>[].obs;
  RxList<bool> hojeOuData = RxList([true, false]);
  Rx<DateTime?> dataLevantamento = Rx(null);

  late ManipularPagamentoI _manipularPagamentoI;
  late ManipularItemVendaI _manipularItemVendaI;
  MesaVendaC() {
    _manipularPagamentoI = ManipularPagamento(ProvedorPagamento());
    _manipularItemVendaI = ManipularItemVenda(
        ProvedorItemVenda(),
        ManipularProduto(ProvedorProduto(), ManipularStock(ProvedorStock()),
            ManipularPreco(ProvedorPreco())),
        ManipularStock(ProvedorStock()));
  }

  void mostrarFormasPagamento(BuildContext context) {
    var aPagar = listaItensVenda.fold<double>(
        0, (previousValue, element) => ((element.total ?? 0) + previousValue));
    if (aPagar == 0) {
      mostrarSnack("Nenhum produto com quantidade pagável!");
      return;
    }
    var pago = listaPagamentos.fold<double>(
        0, (previousValue, element) => ((element.valor ?? 0) + previousValue));
    if (pago == aPagar) {
      mostrarSnack("Está tudo pago!");
      return;
    }
    mostrarDialogoDeLayou(
        FutureBuilder<List<FormaPagamento>>(
            future: _manipularPagamentoI.pegarListaFormasPagamento(),
            builder: (context, snapshot) {
              if (snapshot.data == null) {
                return CircularProgressIndicator();
              }
              var lista = snapshot.data!.map((e) => e.descricao!).toList();
              return LayoutFormaPagamento(
                  accaoAoFinalizar: (valor, opcao) async {
                    await adicionarValorPagamento(valor, opcao);
                  },
                  titulo: "Selecione a Forma de Pagamento",
                  listaItens: lista);
            }),
        naoFechar: true);
  }

  Future<void> adicionarValorPagamento(String valor, String? opcao) async {
    var soma = listaPagamentos.fold<double>(
        0, (previousValue, element) => element.valor! + previousValue);

    var totalApagar =
        await _manipularItemVendaI.calcularTotalApagar(listaItensVenda);
    if ((soma + double.parse(valor)) > totalApagar) {
      mostrarDialogoDeInformacao("""Valor demasiado alto!""");
      return;
    }
    listaPagamentos.add(Pagamento(
        idParaVista: gerarIdUnico(),
        formaPagamento: FormaPagamento(descricao: opcao),
        estado: Estado.ATIVADO,
        valor: double.parse(valor)));
    voltar();
  }

  void adicionarProdutoAmesa(Produto produto) {
    var teste = listaItensVenda
        .firstWhereOrNull((element) => element.idProduto == produto.id);
    if (teste != null) {
      mostrarDialogoDeInformacao("Este produto já foi adicionado!",
          naoFechar: true);
      return;
    }
    listaItensVenda.add(ItemVenda(
        estado: Estado.ATIVADO,
        idProduto: produto.id,
        produto: produto,
        quantidade: 0,
        desconto: 0));
  }

  void definirQuantidade(
      int valor,
      ItemVenda element,
      TextEditingController campoTextoQuantidadeC,
      TextEditingController campoTextoDescontoC) {
    if (element.produto!.listaPreco!.isEmpty) {
      mostrarDialogoDeInformacao("Produto sem preço!");
      return;
    }
    if (element.produto!.stock!.quantidade! < valor) {
      int quantidadeDisponivel = int.parse(campoTextoQuantidadeC.text) +
          (element.produto!.stock!.quantidade! - valor);
      campoTextoQuantidadeC.text = quantidadeDisponivel.toString();
      mostrarDialogoDeInformacao(
          "Produto com quantidade insuficiente em Stock!");
      valor = quantidadeDisponivel;
    }
    element.quantidade = valor;
    element.total = valor * element.produto!.listaPreco![0];

    descontar(
        int.tryParse(campoTextoDescontoC.text), element, campoTextoDescontoC);
  }

  void atualizarItemVenda(ItemVenda element) {
    for (var i = 0; i < listaItensVenda.length; i++) {
      if (listaItensVenda[i].idProduto == element.idProduto) {
        listaItensVenda[i] = element;
        break;
      }
    }
  }

  void descontar(int? valor, ItemVenda element,
      TextEditingController campoTextoDescontoC) async {
    if (valor == null) {
      valor = 0;
    }
    if ((valor < 0) || (valor > 100)) {
      mostrarDialogoDeInformacao("Desconto inválido!");
      campoTextoDescontoC.clear();
      return;
    }
    if (element.total == null) {
      mostrarDialogoDeInformacao("Por favor! Defina a quantidade!");
      campoTextoDescontoC.clear();
      return;
    }
    if (element.total == 0) {
      element.total = element.quantidade! * element.produto!.listaPreco![0];
    }

    element.total = _manipularItemVendaI.aplicarDescontoVenda(
        element.quantidade! * element.produto!.listaPreco![0], valor);
    atualizarItemVenda(element);
  }

  void removerPagamento(Pagamento pagamento) {
    listaPagamentos.removeWhere((element) {
      return element.idParaVista == pagamento.idParaVista;
    });
  }

  int contadorSeleccoesData = 0;
  void mudarData(int i, BuildContext context) async {
    hojeOuData[i] = !hojeOuData[i];
    for (var a = 0; a < hojeOuData.length; a++) {
      if (i != a) {
        hojeOuData[a] = !hojeOuData[a];
      }
    }
    var dataActual = DateTime.now();

    if (i == 1) {
      var dataSelecionada = await showDatePicker(
          context: context,
          initialDate:
              DateTime(dataActual.year, dataActual.month, dataActual.day + 1),
          firstDate:
              DateTime(dataActual.year, dataActual.month, dataActual.day + 1),
          lastDate: DateTime(2100));
      if (dataSelecionada != null) {
        dataLevantamento.value = dataSelecionada;
      } else {
        hojeOuData[0] = !hojeOuData[0];
        hojeOuData[1] = !hojeOuData[1];
      }
    } else {
      dataLevantamento.value = null;
    }
  }
}
