import 'package:yetu_gestor/dominio/entidades/cliente.dart';

abstract class ManipularClienteI {
  Future<List<Cliente>> todos();
  Future<Cliente?> pegarClienteDeId(int id);
  Future<bool> actualizaCliente(Cliente dado);
  Future<int> registarCliente(Cliente dado);
  Future<void> removerCliente(Cliente dado);
}
