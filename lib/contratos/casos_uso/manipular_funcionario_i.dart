import 'package:yetu_gestor/dominio/entidades/usuario.dart';

import '../../dominio/entidades/funcionario.dart';

abstract class ManipularFuncionarioI {
  Future<List<Funcionario>> pegarLista();
  Future<List<Funcionario>> todos();
  Future<List<Funcionario>> pegarListaEliminados();
  Future<Usuario> adicionarFuncionario(Funcionario dado);
  Future<void> removerFuncionario(Funcionario dado);
  Future<void> actualizarFuncionario(Funcionario dado);
  Future<void> activarFuncionario(Funcionario dado);
  Future<void> recuperarFuncionario(Funcionario dado);
  Future<void> desactivarFuncionario(Funcionario dado);
}
