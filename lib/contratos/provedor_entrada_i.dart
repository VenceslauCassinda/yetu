import 'package:yetu_gestor/dominio/entidades/entrada.dart';

abstract class ProvedorEntradaI {
  Future<int> registarEntrada(Entrada entrada);
  Future<List<Entrada>> pegarLista();
}
