import 'package:get/get.dart';
import 'package:yetu_gestor/contratos/provedor_funcionario_i.dart';
import 'package:yetu_gestor/dominio/entidades/estado.dart';
import 'package:yetu_gestor/dominio/entidades/funcionario.dart';
import 'package:yetu_gestor/fonte_dados/padrao_dao/base_dados.dart';
import 'package:yetu_gestor/fonte_dados/serializadores/serializador_funcionario.dart';

import '../erros.dart';

class ProveedorFuncionario implements ProvedorFuncionarioI {
  late FuncionarioDao _dao;
  late SerializadorFuncionario _serializadorFuncionario;
  ProveedorFuncionario() {
    _dao = FuncionarioDao(Get.find());
    _serializadorFuncionario = SerializadorFuncionario();
  }
  @override
  Future<void> actualizarFuncionario(Funcionario dado) async {
    await _dao.actualizar(_serializadorFuncionario.toTabela(dado));
  }

  @override
  Future<void> adicionarFuncionario(Funcionario dado) async {
    if ((await existeFuncionarioComNomeUsuario(dado.nomeCompelto!)) == true) {
      throw ErroFuncionarioJaExiste("FUNCIONARIO JA EXISTENTE!");
    }
    await _dao.adicionar(_serializadorFuncionario.toCompanion(dado));
  }

  @override
  Future<bool> existeFuncionarioComNomeUsuario(String nomeUsuario) async {
    return (await _dao.existeFuncionario(nomeUsuario)) != null;
  }

  @override
  Future<List<Funcionario>> pegarLista() async {
    return (await _dao.todos());
  }

  @override
  Future<List<Funcionario>> pegarListaEliminados() async {
    return (await _dao.eliminados());
  }

  @override
  Future<void> removerFuncionario(Funcionario dado) async {
    dado.estado = Estado.ELIMINADO;
    await _dao.actualizar(_serializadorFuncionario.toTabela(dado));
  }

  @override
  Future<void> recuperarFuncionario(Funcionario dado) async {
    dado.estado = Estado.ATIVADO;
    await _dao.actualizar(_serializadorFuncionario.toTabela(dado));
  }

  @override
  Future<void> activarFuncionario(Funcionario dado) async {
    dado.estado = Estado.ATIVADO;
    await _dao.actualizar(_serializadorFuncionario.toTabela(dado));
  }

  @override
  Future<void> desactivarFuncionario(Funcionario dado) async {
    dado.estado = Estado.DESACTIVADO;
    await _dao.actualizar(_serializadorFuncionario.toTabela(dado));
  }

  @override
  Future<List<Funcionario>> todos() async {
    return (await _dao.todosSemFiltro())
        .map((e) => _serializadorFuncionario.fromTabela(e))
        .toList();
  }
}