import 'package:yetu_gestor/dominio/entidades/entrada.dart';
import 'package:yetu_gestor/dominio/entidades/saida.dart';

abstract class ManipularSaidaI {
  Future<int> registarSaida(Saida saida);
  Future<List<Saida>> pegarLista();
}
