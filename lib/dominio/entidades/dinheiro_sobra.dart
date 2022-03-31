import 'package:drift/drift.dart';

import '../../fonte_dados/padrao_dao/base_dados.dart';
import 'funcionario.dart';

class DinheiroSobra {
  Funcionario? funcionario;
  
  int? id;
  int? estado;
  int? idFuncionario;
  double? valor;
  DinheiroSobra(
      {this.id,
      required this.estado,
      this.funcionario,
      required this.idFuncionario,
      required this.valor});
  factory DinheiroSobra.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return DinheiroSobra(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      estado: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}estado'])!,
      idFuncionario: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id_funcionario'])!,
      valor: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}valor'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id!);
    map['estado'] = Variable<int>(estado!);
    map['id_funcionario'] = Variable<int>(idFuncionario!);
    map['valor'] = Variable<double>(valor!);
    return map;
  }

  TabelaDinheiroSobraCompanion toCompanion(bool nullToAbsent) {
    return TabelaDinheiroSobraCompanion(
      estado: Value(estado!),
      idFuncionario: Value(idFuncionario!),
      valor: Value(valor!),
    );
  }

  factory DinheiroSobra.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DinheiroSobra(
      id: serializer.fromJson<int>(json['id']),
      estado: serializer.fromJson<int>(json['estado']),
      idFuncionario: serializer.fromJson<int>(json['idFuncionario']),
      valor: serializer.fromJson<double>(json['valor']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id!),
      'estado': serializer.toJson<int>(estado!),
      'idFuncionario': serializer.toJson<int>(idFuncionario!),
      'valor': serializer.toJson<double>(valor!),
    };
  }

  DinheiroSobra copyWith(
          {int? id, int? estado, int? idFuncionario, double? valor}) =>
      DinheiroSobra(
        id: id ?? this.id,
        estado: estado ?? this.estado,
        idFuncionario: idFuncionario ?? this.idFuncionario,
        valor: valor ?? this.valor,
      );
  @override
  String toString() {
    return (StringBuffer('DinheiroSobra(')
          ..write('id: $id, ')
          ..write('estado: $estado, ')
          ..write('idFuncionario: $idFuncionario, ')
          ..write('valor: $valor')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, estado, idFuncionario, valor);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DinheiroSobra &&
          other.id == this.id &&
          other.estado == this.estado &&
          other.idFuncionario == this.idFuncionario &&
          other.valor == this.valor);
}
