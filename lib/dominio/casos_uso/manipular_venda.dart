import 'package:yetu_gestor/contratos/casos_uso/manipular_cliente_I.dart';
import 'package:yetu_gestor/contratos/casos_uso/manipular_funcionario_i.dart';
import 'package:yetu_gestor/contratos/casos_uso/manipular_pagamento_i.dart';
import 'package:yetu_gestor/contratos/casos_uso/manipular_saida_i.dart';
import 'package:yetu_gestor/contratos/casos_uso/manipular_stock_i.dart';
import 'package:yetu_gestor/dominio/entidades/estado.dart';
import 'package:yetu_gestor/dominio/entidades/pagamento.dart';

import 'package:yetu_gestor/dominio/entidades/item_venda.dart';

import 'package:yetu_gestor/dominio/entidades/funcionario.dart';

import 'package:yetu_gestor/dominio/entidades/cliente.dart';
import 'package:yetu_gestor/dominio/entidades/venda.dart';
import 'package:yetu_gestor/fonte_dados/erros.dart';

import '../../contratos/casos_uso/manipular_venda_i.dart';
import '../../contratos/provedores/provedor_venda_i.dart';

class ManipularVenda implements ManipularVendaI {
  final ProvedorVendaI _provedorVendaI;
  final ManipularSaidaI _manipularSaidaI;
  final ManipularPagamentoI _manipularPagamentoI;
  final ManipularClienteI _manipularClienteI;
  final ManipularStockI _manipularStockI;

  ManipularVenda(
      this._provedorVendaI,
      this._manipularSaidaI,
      this._manipularPagamentoI,
      this._manipularClienteI,
      this._manipularStockI);
  @override
  Future<int> registarVenda(
      double total,
      double parcela,
      Funcionario funcionario,
      Cliente cliente,
      DateTime dataLevantamentoCompra) async {
    var idCliente = await _manipularClienteI.registarCliente(cliente);

    var dataVenda = DateTime.now();
    var novaVenda = Venda(
        estado: Estado.ATIVADO,
        idFuncionario: funcionario.id,
        dataLevantamentoCompra: dataLevantamentoCompra,
        idCliente: idCliente,
        data: dataVenda,
        total: 100,
        parcela: parcela);
    var idVenda = await _provedorVendaI.adicionarVenda(novaVenda);
    return idVenda;
  }

  @override
  double calcularTotalVenda(List<ItemVenda> itensVenda) {
    var total = 0.0;
    for (var cada in itensVenda) {
      total += cada.total!;
    }
    return total;
  }

  @override
  double aplicarDescontoVenda(double totalApagar, int porcentagem) {
    if (porcentagem >= 0 && porcentagem <= 100) {
      totalApagar = totalApagar - ((porcentagem / 100) * 100);
    } else {
      throw ErroPercentagemInvalida("PERCENTAGEM INCORRECTA!");
    }
    return totalApagar;
  }

  @override
  double calcularParcelaApagar(double totalApagar, double parcelaJaPaga) {
    var total = totalApagar - parcelaJaPaga;
    return total;
  }

  @override
  Future<List<Venda>> pegarLista() async {
    return await _provedorVendaI.pegarLista();
  }

  @override
  Future<int> vender(
      List<ItemVenda> itensVenda,
      List<Pagamento> pagamentos,
      double total,
      Funcionario funcionario,
      Cliente cliente,
      DateTime dataLevantamentoCompra) async {
    var teste = await pegarItemComStockInsuficiente(itensVenda);
    if (teste != null) {
      throw ErroStockInsuficiente("QUANTIDADE INSUFICIENTE!");
    }
    var parcela = calcularParcelaPaga(pagamentos);
    if (parcela > total) {
      throw ErroPagamentoInvalido(
          "PAGAMENTOS INCORRECTOS!\nRETIFIQUE O VALOR DOS PAGAMENTOS!");
    }

    int idVenda = await registarVenda(
      total,
      parcela,
      funcionario,
      cliente,
      dataLevantamentoCompra,
    );
    var vendaFeita = await _provedorVendaI.pegarVendaDeId(idVenda);
    if (vendaFeita != null) {
      await _manipularPagamentoI.registarListaPagamentos(pagamentos, idVenda);
      await _manipularSaidaI.registarListaSaidas(
          itensVenda, idVenda, vendaFeita.data!);
    } else {
      throw ErroVendaInvalida("VENDA INVÁLIDA!");
    }
    return idVenda;
  }

  @override
  List<Pagamento> associarPagamentosAvenda(
      List<Pagamento> pagamentos, int idVenda) {
    for (var i = 0; i < pagamentos.length; i++) {
      pagamentos[i].idVenda = idVenda;
    }
    return pagamentos;
  }

  @override
  double calcularParcelaPaga(List<Pagamento> pagamentos) {
    var total = 0.0;
    for (var cada in pagamentos) {
      total += cada.valor!;
    }
    return total;
  }

  @override
  bool vendaEstaPaga(Venda venda) {
    return venda.total! == venda.parcela;
  }

  @override
  bool vendaOuEncomenda(Venda venda) {
    var dataVenda =
        DateTime(venda.data!.year, venda.data!.month, venda.data!.day);
    var dataLevantamento = DateTime(venda.dataLevantamentoCompra!.year,
        venda.dataLevantamentoCompra!.month, venda.dataLevantamentoCompra!.day);
    return dataVenda == dataLevantamento;
  }

  @override
  Future<ItemVenda?> pegarItemComStockInsuficiente(
      List<ItemVenda> lista) async {
    ItemVenda? item;
    for (var cada in lista) {
      var stock =
          await _manipularStockI.pegarStockDoProdutoDeId(cada.produto!.id!);
      if (cada.quantidade! > stock.quantidade!) {
        item = cada;
        break;
      }
    }
    return item;
  }

  @override
  bool vendaOuDivida(Venda venda) {
    return venda.pagamentos.isNotEmpty;
  }
}
