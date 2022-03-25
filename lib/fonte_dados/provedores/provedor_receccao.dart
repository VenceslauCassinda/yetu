import 'package:get/get.dart';
import 'package:yetu_gestor/contratos/provedor_receccao_i.dart';
import 'package:yetu_gestor/dominio/entidades/entrada.dart';
import 'package:yetu_gestor/dominio/entidades/produto.dart';
import 'package:yetu_gestor/fonte_dados/padrao_dao/base_dados.dart';
import '../../dominio/entidades/receccao.dart';

class ProvedorRececcao implements ProvedorRececcaoI {
  late RececcaoDao _dao;
  ProvedorRececcao() {
    _dao = RececcaoDao(Get.find());
  }
  @override
  Future<void> receberProduto(Receccao receccao) async {
    await _dao.adicionarRececcao(receccao);
  }

  @override
  Future<void> actualizaRececcao(Receccao receccao) async {
    await _dao.actualizaRececcao(receccao);
  }

  @override
  Future<void> removerRececcao(Receccao receccao) async {
    await _dao.removerRececcao(receccao);
  }

  @override
  Future<List<Receccao>> todas() async {
    return await _dao.todas();
  }

  @override
  Future<int> adicionarrRececcao(Receccao receccao) async {
    return await _dao.adicionarRececcao(receccao);
  }
}
