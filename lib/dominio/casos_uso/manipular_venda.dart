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

  ManipularVenda(this._provedorVendaI);
  @override
  Future<int> registarVenda(
      List<ItemVenda> itensVenda,
      List<Pagamento> pagamentos,
      double total,
      double parcela,
      Funcionario funcionario,
      Cliente cliente) async {
    var dataVenda = DateTime.now();
    var novaVenda = Venda(
        estado: Estado.ATIVADO,
        idFuncionario: funcionario.id,
        idCliente: cliente.id,
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
      total += cada.produto!.listaPreco![0];
    }
    return total;
  }

  @override
  double aplicarDescontoVenda(double totalApagar, int porcentagem) {
    if (porcentagem >= 0 && porcentagem <= 100) {
      totalApagar = totalApagar - ((porcentagem / 100) * 100);
    } else {
      throw Erro("PERCENTAGEM INCORRECTA!");
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
    return [];
  }
}
