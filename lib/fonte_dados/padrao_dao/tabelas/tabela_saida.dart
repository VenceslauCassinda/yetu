import 'package:drift/drift.dart';

class TabelaSaida extends Table{
  IntColumn get id => integer().autoIncrement()();
  IntColumn get estado => integer()();
  IntColumn get idProduto => integer()();
  IntColumn get idVenda => integer()();
  IntColumn get quantidade => integer()();
  DateTimeColumn get data => dateTime()();
}