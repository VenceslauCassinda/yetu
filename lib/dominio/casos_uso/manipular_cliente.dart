import 'package:yetu_gestor/dominio/entidades/cliente.dart';

import '../../contratos/casos_uso/manipular_cliente_I.dart';
import '../../contratos/provedores/provedor_cliente_i.dart';

class ManipularCliente implements ManipularClienteI {
  final ProvedorClienteI _provedorClienteI;

  ManipularCliente(this._provedorClienteI);
  @override
  Future<bool> actualizaCliente(Cliente dado) async {
    return await _provedorClienteI.actualizaCliente(dado);
  }

  @override
  Future<int> registarCliente(Cliente dado) async {
    return await _provedorClienteI.adicionarCliente(dado);
  }

  @override
  Future<Cliente?> pegarClienteDeId(int id) async {
    return await _provedorClienteI.pegarClienteDeId(id);
  }

  @override
  Future<void> removerCliente(Cliente dado) async {
    await _provedorClienteI.removerCliente(dado);
  }

  @override
  Future<List<Cliente>> todos() async {
    return await _provedorClienteI.todos();
  }
}
