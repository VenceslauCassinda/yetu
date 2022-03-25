import 'package:yetu_gestor/contratos/manipular_entrada_i.dart';
import 'package:yetu_gestor/contratos/manipular_stock_i.dart';
import 'package:yetu_gestor/contratos/provedor_entrada_i.dart';
import 'package:yetu_gestor/dominio/entidades/entrada.dart';

class ManipularEntrada implements ManipularEntradaI {
  final ProvedorEntradaI _provedorEntradaI;
  final ManipularStockI _manipularStockI;

  ManipularEntrada(this._provedorEntradaI, this._manipularStockI);

  @override
  Future<int> registarEntrada(Entrada entrada) async {
    var res = await _provedorEntradaI.registarEntrada(entrada);
    await _manipularStockI.aumentarQuantidadeStock(
        entrada.produto!.quantidade!, entrada.quantidade!);
    return res;
  }

  @override
  Future<List<Entrada>> pegarLista() async {
    return await _provedorEntradaI.pegarLista();
  }
}
