import 'package:get/get.dart';
import 'package:yetu_gestor/contratos/provedor_entrada_i.dart';
import 'package:yetu_gestor/dominio/entidades/entrada.dart';
import 'package:yetu_gestor/fonte_dados/padrao_dao/base_dados.dart';

class ProvedorEntrada implements ProvedorEntradaI {
  late EntradaDao _dao;
  ProvedorEntrada() {
    _dao = EntradaDao(Get.find());
  }
  @override
  Future<int> registarEntrada(Entrada entrada) async {
    return await _dao.adicionarEntrada(entrada);
  }

  @override
  Future<List<Entrada>> pegarLista() async {
    return await _dao.todas();
  }
}