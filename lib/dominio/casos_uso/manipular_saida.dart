import 'package:yetu_gestor/contratos/manipular_saida_i.dart';
import 'package:yetu_gestor/contratos/manipular_stock_i.dart';
import 'package:yetu_gestor/contratos/provedor_saida_i.dart';
import 'package:yetu_gestor/dominio/entidades/saida.dart';

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
        saida.produto!.quantidade!, saida.quantidade!);
    return res;
  }
}
