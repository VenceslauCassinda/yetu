import '../dominio/entidades/funcionario.dart';

abstract class ProvedorFuncionarioI {
  Future<List<Funcionario>> pegarLista();
  Future<List<Funcionario>> todos();
  Future<List<Funcionario>> pegarListaEliminados();
  Future<int> adicionarFuncionario(Funcionario dado);
  Future<bool> existeFuncionarioComNomeUsuario(String nomeUsuario);
  Future<void> removerFuncionario(Funcionario dado);
  Future<void> actualizarFuncionario(Funcionario dado);
  Future<void> recuperarFuncionario(Funcionario dado);
  Future<void> activarFuncionario(Funcionario dado);
  Future<void> desactivarFuncionario(Funcionario dado);
}
