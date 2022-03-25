import 'package:drift/drift.dart';

class TabelaVenda extends Table{
  IntColumn get id => integer().autoIncrement()();
  IntColumn get estado => integer()();
  IntColumn get idFuncionario => integer()();
  DateTimeColumn get data => dateTime()();
  RealColumn get total => real()();
  TextColumn get nomeCliente => text()();
  TextColumn get telefoneCliente => text()();
}