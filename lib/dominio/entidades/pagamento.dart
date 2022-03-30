import 'package:drift/drift.dart';
import 'package:yetu_gestor/dominio/entidades/forma_pagamento.dart';

import '../../fonte_dados/padrao_dao/base_dados.dart';

class Pagamento {
  FormaPagamento? formaPagamento;
  int? id;
  int? idFormaPagamento;
  int? estado;
  int? idVenda;
  int? tipo;
  double? valor;
  Pagamento(
      {
        this.id,
        this.formaPagamento,
      required this.idFormaPagamento,
      required this.estado,
      required this.idVenda,
      required this.tipo,
      required this.valor});
  factory Pagamento.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Pagamento(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      idFormaPagamento: const IntType().mapFromDatabaseResponse(
          data['${effectivePrefix}id_forma_pagamento'])!,
      estado: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}estado'])!,
      idVenda: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id_venda'])!,
      tipo: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}tipo'])!,
      valor: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}valor'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id!);
    map['id_forma_pagamento'] = Variable<int>(idFormaPagamento!);
    map['estado'] = Variable<int>(estado!);
    map['id_venda'] = Variable<int>(idVenda!);
    map['tipo'] = Variable<int>(tipo!);
    map['valor'] = Variable<double>(valor!);
    return map;
  }

  TabelaPagamentoCompanion toCompanion(bool nullToAbsent) {
    return TabelaPagamentoCompanion(
      id: Value(id!),
      idFormaPagamento: Value(idFormaPagamento!),
      estado: Value(estado!),
      idVenda: Value(idVenda!),
      tipo: Value(tipo!),
      valor: Value(valor!),
    );
  }

  factory Pagamento.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Pagamento(
      id: serializer.fromJson<int>(json['id']),
      idFormaPagamento: serializer.fromJson<int>(json['idFormaPagamento']),
      estado: serializer.fromJson<int>(json['estado']),
      idVenda: serializer.fromJson<int>(json['idVenda']),
      tipo: serializer.fromJson<int>(json['tipo']),
      valor: serializer.fromJson<double>(json['valor']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id!),
      'idFormaPagamento': serializer.toJson<int>(idFormaPagamento!),
      'estado': serializer.toJson<int>(estado!),
      'idVenda': serializer.toJson<int>(idVenda!),
      'tipo': serializer.toJson<int>(tipo!),
      'valor': serializer.toJson<double>(valor!),
    };
  }

  Pagamento copyWith(
          {int? id,
          int? idFormaPagamento,
          int? estado,
          int? idVenda,
          int? tipo,
          double? valor}) =>
      Pagamento(
        id: id ?? this.id,
        idFormaPagamento: idFormaPagamento ?? this.idFormaPagamento,
        estado: estado ?? this.estado,
        idVenda: idVenda ?? this.idVenda,
        tipo: tipo ?? this.tipo,
        valor: valor ?? this.valor,
      );
  @override
  String toString() {
    return (StringBuffer('Pagamento(')
          ..write('id: $id, ')
          ..write('idFormaPagamento: $idFormaPagamento, ')
          ..write('estado: $estado, ')
          ..write('idVenda: $idVenda, ')
          ..write('tipo: $tipo, ')
          ..write('valor: $valor')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, idFormaPagamento, estado, idVenda, tipo, valor);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Pagamento &&
          other.id == this.id &&
          other.idFormaPagamento == this.idFormaPagamento &&
          other.estado == this.estado &&
          other.idVenda == this.idVenda &&
          other.tipo == this.tipo &&
          other.valor == this.valor);
}
