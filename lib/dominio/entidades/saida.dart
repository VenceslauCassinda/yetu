import 'package:drift/drift.dart';
import 'package:yetu_gestor/dominio/entidades/produto.dart';

import '../../fonte_dados/padrao_dao/base_dados.dart';

class Saida {
  Produto? produto;
  int? id;
  int? estado;
  int? idProduto;
  int? idVenda;
  int? quantidade;
  DateTime? data;
  Saida(
      {this.id,
      this.produto,
      this.estado,
      required this.idProduto,
      required this.idVenda,
      required this.quantidade,
      required this.data});
  factory Saida.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Saida(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      estado: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}estado'])!,
      idProduto: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id_produto'])!,
      idVenda: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id_venda'])!,
      quantidade: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}quantidade'])!,
      data: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}data'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id!);
    map['estado'] = Variable<int>(estado!);
    map['id_produto'] = Variable<int>(idProduto!);
    map['id_venda'] = Variable<int>(idVenda!);
    map['quantidade'] = Variable<int>(quantidade!);
    map['data'] = Variable<DateTime>(data!);
    return map;
  }

  TabelaSaidaCompanion toCompanion(bool nullToAbsent) {
    return TabelaSaidaCompanion(
      id: Value(id!),
      estado: Value(estado!),
      idProduto: Value(idProduto!),
      idVenda: Value(idVenda!),
      quantidade: Value(quantidade!),
      data: Value(data!),
    );
  }

  factory Saida.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Saida(
      id: serializer.fromJson<int>(json['id']),
      estado: serializer.fromJson<int>(json['estado']),
      idProduto: serializer.fromJson<int>(json['idProduto']),
      idVenda: serializer.fromJson<int>(json['idVenda']),
      quantidade: serializer.fromJson<int>(json['quantidade']),
      data: serializer.fromJson<DateTime>(json['data']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id!),
      'estado': serializer.toJson<int>(estado!),
      'idProduto': serializer.toJson<int>(idProduto!),
      'idVenda': serializer.toJson<int>(idVenda!),
      'quantidade': serializer.toJson<int>(quantidade!),
      'data': serializer.toJson<DateTime>(data!),
    };
  }

  Saida copyWith(
          {int? id,
          int? estado,
          int? idProduto,
          int? idVenda,
          int? quantidade,
          DateTime? data}) =>
      Saida(
        id: id ?? this.id,
        estado: estado ?? this.estado,
        idProduto: idProduto ?? this.idProduto,
        idVenda: idVenda ?? this.idVenda,
        quantidade: quantidade ?? this.quantidade,
        data: data ?? this.data,
      );
  @override
  String toString() {
    return (StringBuffer('Saida(')
          ..write('id: $id, ')
          ..write('estado: $estado, ')
          ..write('idProduto: $idProduto, ')
          ..write('idVenda: $idVenda, ')
          ..write('quantidade: $quantidade, ')
          ..write('data: $data')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, estado, idProduto, idVenda, quantidade, data);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TabelaSaidaData &&
          other.id == this.id &&
          other.estado == this.estado &&
          other.idProduto == this.idProduto &&
          other.idVenda== this.idVenda &&
          other.quantidade == this.quantidade &&
          other.data == this.data);
}
