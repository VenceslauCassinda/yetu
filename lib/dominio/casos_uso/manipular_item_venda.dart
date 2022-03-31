import 'package:yetu_gestor/contratos/casos_uso/manipular_item_venda_i.dart';
import 'package:yetu_gestor/contratos/casos_uso/manipular_produto_i.dart';
import 'package:yetu_gestor/contratos/casos_uso/manipular_stock_i.dart';
import 'package:yetu_gestor/contratos/provedores/provedor_item_venda_i.dart';
import 'package:yetu_gestor/dominio/entidades/item_venda.dart';
import 'package:yetu_gestor/fonte_dados/erros.dart';

class ManipularItemVenda implements ManipularItemVendaI {
  final ProvedorItemVendaI _provedorItemVendaI;
  final ManipularProdutoI _manipularProdutoI;
  final ManipularStockI _manipularStockI;

  ManipularItemVenda(
      this._provedorItemVendaI, this._manipularProdutoI, this._manipularStockI);
  @override
  Future<bool> actualizaItemVenda(ItemVenda dado) async {
    return await _provedorItemVendaI.actualizaItemVenda(dado);
  }

  @override
  Future<ItemVenda?> pegarItemVendaDeId(int id) async {
    return await _provedorItemVendaI.pegarItemVendaDeId(id);
  }

  @override
  Future<int> registarItemVenda(ItemVenda dado) async {
    var produto = await _manipularProdutoI.pegarProdutoDeId(dado.idProduto!);
    var stock = await _manipularStockI.pegarStockDoProdutoDeId(produto!.id!);
    if (stock.quantidade! < dado.quantidade!) {
      throw ErroStockInsuficiente("QUANTIDADE INSUFICIENTE!");
    }
    return await _provedorItemVendaI.registarItemVenda(dado);
  }

  @override
  Future<int> removerItemVenda(ItemVenda dado) async {
    return await _provedorItemVendaI.removerItemVenda(dado);
  }

  @override
  Future<List<ItemVenda>> todos() async {
    return await _provedorItemVendaI.todos();
  }

  @override
  double aplicarDescontoVenda(double totalApagar, int porcentagem) {
    if (porcentagem >= 0 && porcentagem <= 100) {
      if (porcentagem == 0) {
        return 0;
      }
      totalApagar = totalApagar - ((porcentagem / 100) * 100);
    } else {
      throw ErroPercentagemInvalida("PERCENTAGEM INCORRECTA!");
    }
    return totalApagar;
  }

  @override
  Future<List<ItemVenda>> calcularTotalPorItem(List<ItemVenda> itens) async {
    for (var i = 0; i < itens.length; i++) {
      var total = itens[i].produto!.listaPreco![0] * itens[i].quantidade!;
      var totalDescontado =
          total - aplicarDescontoVenda(total, itens[i].desconto!);
      itens[i].total = totalDescontado;
      print("===========> $total");
    }
    return itens;
  }
}