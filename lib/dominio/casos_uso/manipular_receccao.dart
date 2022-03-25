import 'package:yetu_gestor/contratos/manipular_entrada_i.dart';
import 'package:yetu_gestor/contratos/manipular_receccao_i.dart';
import 'package:yetu_gestor/contratos/provedor_receccao_i.dart';
import 'package:yetu_gestor/dominio/entidades/produto.dart';
import 'package:yetu_gestor/dominio/entidades/funcionario.dart';
import '../entidades/entrada.dart';
import '../entidades/estado.dart';
import '../entidades/receccao.dart';

class ManipularRececcao implements ManipularRececcaoI {
  final ManipularEntradaI _manipularEntradaI;
  final ProvedorRececcaoI _provedorRececcaoI;
  ManipularRececcao(this._provedorRececcaoI, this._manipularEntradaI) {}

  @override
  Future<void> receberProduto(
      Produto produto, int quantidade, Funcionario funcionario) async {
    var data = DateTime.now();
    var receccao = Receccao(
        estado: Estado.ATIVADO,
        idFuncionario: funcionario.id,
        idProduto: produto.id,
        quantidade: quantidade,
        data: data);
    await _manipularEntradaI.registarEntrada(Entrada(
        estado: Estado.ATIVADO,
        idProduto: produto.id,
        idRececcao: receccao.id,
        quantidade: quantidade,
        data: data));

    await _provedorRececcaoI.adicionarrRececcao(receccao);
  }

  @override
  Future<void> actualizaRececcao(Receccao receccao) async {
    await _provedorRececcaoI.actualizaRececcao(receccao);
  }

  @override
  Future<void> removerRececcao(Receccao receccao) async {
    await _provedorRececcaoI.removerRececcao(receccao);
  }

  @override
  Future<List<Receccao>> todas() async {
    return await _provedorRececcaoI.todas();
  }
}
