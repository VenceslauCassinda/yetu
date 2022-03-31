import 'package:yetu_gestor/dominio/entidades/item_venda.dart';
import 'package:yetu_gestor/dominio/entidades/saida.dart';
import '../../contratos/casos_uso/manipular_saida_i.dart';
import '../../contratos/casos_uso/manipular_stock_i.dart';
import '../../contratos/provedores/provedor_saida_i.dart';

class ManipularSaida implements ManipularSaidaI {
  final ProvedorSaidaI _provedorSaidaI;
  final ManipularStockI _manipularStockI;

  ManipularSaida(this._provedorSaidaI, this._manipularStockI);
  @override
  Future<List<Saida>> pegarLista() async {
    return await _provedorSaidaI.pegarLista();
  }

  @override
  Future<int> registarSaida(Saida saida) async {
    var res = await _provedorSaidaI.registarSaida(saida);
    await _manipularStockI.diminuirQuantidadeStock(
        saida.idProduto!, saida.quantidade!);
    return res;
  }

  @override
  Future<void> registarListaSaidas(List<ItemVenda> lista, int idVenda, DateTime data) async{
    for (var cada in lista) {
      await registarSaida(Saida(idProduto: cada.idProduto, idVenda: idVenda, quantidade: cada.quantidade, data: data));
    }
  }
}
