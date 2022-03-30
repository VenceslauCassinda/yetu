import 'package:drift/drift.dart';
import 'package:yetu_gestor/dominio/entidades/estado.dart';

import '../../fonte_dados/padrao_dao/base_dados.dart';

class Produto {
  List<double>? listaPreco = [];
  int? id;
  int? quantidade;
  int? estado;
  String? nome;
  double? precoCompra;
  bool? recebivel;
  Produto(
      {this.id,
      this.estado,
      this.listaPreco,
      this.nome,
      this.precoCompra,
      this.recebivel,
      this.quantidade});
  factory Produto.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Produto(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      quantidade: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}quantidade'])!,
      estado: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}estado'])!,
      nome: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}nome'])!,
      precoCompra: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}preco_compra'])!,
      recebivel: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}recebivel'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id!);
    map['quantidade'] = Variable<int>(quantidade!);
    map['estado'] = Variable<int>(estado!);
    map['nome'] = Variable<String>(nome!);
    map['preco_compra'] = Variable<double>(precoCompra!);
    map['recebivel'] = Variable<bool>(recebivel!);
    return map;
  }

  TabelaProdutoCompanion toCompanion(bool nullToAbsent) {
    return TabelaProdutoCompanion(
      id: Value(id ?? -1),
      estado: Value(estado ?? Estado.ATIVADO),
      nome: Value(nome!),
      precoCompra: Value(precoCompra ?? 0),
      recebivel: Value(recebivel ?? false),
    );
  }

  factory Produto.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Produto(
      id: serializer.fromJson<int>(json['id']),
      estado: serializer.fromJson<int>(json['estado']),
      quantidade: serializer.fromJson<int>(json['quantidade']),
      nome: serializer.fromJson<String>(json['nome']),
      precoCompra: serializer.fromJson<double>(json['precoCompra']),
      recebivel: serializer.fromJson<bool>(json['recebivel']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id!),
      'quantidade': serializer.toJson<int>(quantidade!),
      'estado': serializer.toJson<int>(estado!),
      'nome': serializer.toJson<String>(nome!),
      'precoCompra': serializer.toJson<double>(precoCompra!),
      'recebivel': serializer.toJson<bool>(recebivel!),
    };
  }

  Produto copyWith(
          {int? id,
          int? estado,
          int? quantidade,
          String? nome,
          double? precoCompra,
          bool? recebivel}) =>
      Produto(
        id: id ?? this.id,
        quantidade: quantidade ?? this.quantidade,
        estado: estado ?? this.estado,
        nome: nome ?? this.nome,
        precoCompra: precoCompra ?? this.precoCompra,
        recebivel: recebivel ?? this.recebivel,
      );
  @override
  String toString() {
    return (StringBuffer('TabelaProdutoData(')
          ..write('id: $id, ')
          ..write('quantidade: $quantidade, ')
          ..write('estado: $estado, ')
          ..write('nome: $nome, ')
          ..write('precoCompra: $precoCompra, ')
          ..write('recebivel: $recebivel, ')
          ..write('precos: $listaPreco')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, estado, nome, precoCompra, recebivel);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TabelaProdutoData &&
          other.id == id &&
          other.estado == estado &&
          other.nome == nome &&
          other.precoCompra == precoCompra &&
          other.recebivel == recebivel);
}
