import 'package:drift/drift.dart';

class Preco{
  int? id;
  int? estado;
  int? idProduto;
  double? preco;
  Preco(
      {this.id,
      required this.estado,
      required this.idProduto,
      required this.preco});
  factory Preco.fromData(Map<String, dynamic> data,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Preco(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      estado: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}estado'])!,
      idProduto: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id_produto'])!,
      preco: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}preco'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id!);
    map['estado'] = Variable<int>(estado!);
    map['id_produto'] = Variable<int>(idProduto!);
    map['preco'] = Variable<double>(preco!);
    return map;
  }

  TabelaPrecoCompanion toCompanion(bool nullToAbsent) {
    return TabelaPrecoCompanion(
      id: Value(id!),
      estado: Value(estado!),
      idProduto: Value(idProduto!),
      preco: Value(preco!),
    );
  }

  factory Preco.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Preco(
      id: serializer.fromJson<int>(json['id']),
      estado: serializer.fromJson<int>(json['estado']),
      idProduto: serializer.fromJson<int>(json['idProduto']),
      preco: serializer.fromJson<double>(json['preco']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id!),
      'estado': serializer.toJson<int>(estado!),
      'idProduto': serializer.toJson<int>(idProduto!),
      'preco': serializer.toJson<double>(preco!),
    };
  }

  Preco copyWith(
          {int? id, int? estado, int? idProduto, double? preco}) =>
      Preco(
        id: id ?? this.id,
        estado: estado ?? this.estado,
        idProduto: idProduto ?? this.idProduto,
        preco: preco ?? this.preco,
      );
  @override
  String toString() {
    return (StringBuffer('Preco(')
          ..write('id: $id, ')
          ..write('estado: $estado, ')
          ..write('idProduto: $idProduto, ')
          ..write('preco: $preco')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, estado, idProduto, preco);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Preco &&
          other.id == this.id &&
          other.estado == this.estado &&
          other.idProduto == this.idProduto &&
          other.preco == this.preco);
}

class TabelaPrecoCompanion extends UpdateCompanion<Preco> {
  final Value<int> id;
  final Value<int> estado;
  final Value<int> idProduto;
  final Value<double> preco;
  const TabelaPrecoCompanion({
    this.id = const Value.absent(),
    this.estado = const Value.absent(),
    this.idProduto = const Value.absent(),
    this.preco = const Value.absent(),
  });
  TabelaPrecoCompanion.insert({
    this.id = const Value.absent(),
    required int estado,
    required int idProduto,
    required double preco,
  })  : estado = Value(estado),
        idProduto = Value(idProduto),
        preco = Value(preco);
  static Insertable<Preco> custom({
    Expression<int>? id,
    Expression<int>? estado,
    Expression<int>? idProduto,
    Expression<double>? preco,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (estado != null) 'estado': estado,
      if (idProduto != null) 'id_produto': idProduto,
      if (preco != null) 'preco': preco,
    });
  }

  TabelaPrecoCompanion copyWith(
      {Value<int>? id,
      Value<int>? estado,
      Value<int>? idProduto,
      Value<double>? preco}) {
    return TabelaPrecoCompanion(
      id: id ?? this.id,
      estado: estado ?? this.estado,
      idProduto: idProduto ?? this.idProduto,
      preco: preco ?? this.preco,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (estado.present) {
      map['estado'] = Variable<int>(estado.value);
    }
    if (idProduto.present) {
      map['id_produto'] = Variable<int>(idProduto.value);
    }
    if (preco.present) {
      map['preco'] = Variable<double>(preco.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TabelaPrecoCompanion(')
          ..write('id: $id, ')
          ..write('estado: $estado, ')
          ..write('idProduto: $idProduto, ')
          ..write('preco: $preco')
          ..write(')'))
        .toString();
  }
}