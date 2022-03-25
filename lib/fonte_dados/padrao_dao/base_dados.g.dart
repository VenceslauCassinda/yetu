// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_dados.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class TabelaUsuarioData extends DataClass
    implements Insertable<TabelaUsuarioData> {
  final int id;
  final int nivelAcesso;
  final int? estado;
  final String nomeUsuario;
  final bool? logado;
  final String imagemPerfil;
  final String palavraPasse;
  TabelaUsuarioData(
      {required this.id,
      required this.nivelAcesso,
      this.estado,
      required this.nomeUsuario,
      this.logado,
      required this.imagemPerfil,
      required this.palavraPasse});
  factory TabelaUsuarioData.fromData(Map<String, dynamic> data,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return TabelaUsuarioData(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      nivelAcesso: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}nivel_acesso'])!,
      estado: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}estado']),
      nomeUsuario: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}nome_usuario'])!,
      logado: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}logado']),
      imagemPerfil: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}imagem_perfil'])!,
      palavraPasse: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}palavra_passe'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['nivel_acesso'] = Variable<int>(nivelAcesso);
    if (!nullToAbsent || estado != null) {
      map['estado'] = Variable<int?>(estado);
    }
    map['nome_usuario'] = Variable<String>(nomeUsuario);
    if (!nullToAbsent || logado != null) {
      map['logado'] = Variable<bool?>(logado);
    }
    map['imagem_perfil'] = Variable<String>(imagemPerfil);
    map['palavra_passe'] = Variable<String>(palavraPasse);
    return map;
  }

  TabelaUsuarioCompanion toCompanion(bool nullToAbsent) {
    return TabelaUsuarioCompanion(
      id: Value(id),
      nivelAcesso: Value(nivelAcesso),
      estado:
          estado == null && nullToAbsent ? const Value.absent() : Value(estado),
      nomeUsuario: Value(nomeUsuario),
      logado:
          logado == null && nullToAbsent ? const Value.absent() : Value(logado),
      imagemPerfil: Value(imagemPerfil),
      palavraPasse: Value(palavraPasse),
    );
  }

  factory TabelaUsuarioData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TabelaUsuarioData(
      id: serializer.fromJson<int>(json['id']),
      nivelAcesso: serializer.fromJson<int>(json['nivelAcesso']),
      estado: serializer.fromJson<int?>(json['estado']),
      nomeUsuario: serializer.fromJson<String>(json['nomeUsuario']),
      logado: serializer.fromJson<bool?>(json['logado']),
      imagemPerfil: serializer.fromJson<String>(json['imagemPerfil']),
      palavraPasse: serializer.fromJson<String>(json['palavraPasse']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'nivelAcesso': serializer.toJson<int>(nivelAcesso),
      'estado': serializer.toJson<int?>(estado),
      'nomeUsuario': serializer.toJson<String>(nomeUsuario),
      'logado': serializer.toJson<bool?>(logado),
      'imagemPerfil': serializer.toJson<String>(imagemPerfil),
      'palavraPasse': serializer.toJson<String>(palavraPasse),
    };
  }

  TabelaUsuarioData copyWith(
          {int? id,
          int? nivelAcesso,
          int? estado,
          String? nomeUsuario,
          bool? logado,
          String? imagemPerfil,
          String? palavraPasse}) =>
      TabelaUsuarioData(
        id: id ?? this.id,
        nivelAcesso: nivelAcesso ?? this.nivelAcesso,
        estado: estado ?? this.estado,
        nomeUsuario: nomeUsuario ?? this.nomeUsuario,
        logado: logado ?? this.logado,
        imagemPerfil: imagemPerfil ?? this.imagemPerfil,
        palavraPasse: palavraPasse ?? this.palavraPasse,
      );
  @override
  String toString() {
    return (StringBuffer('TabelaUsuarioData(')
          ..write('id: $id, ')
          ..write('nivelAcesso: $nivelAcesso, ')
          ..write('estado: $estado, ')
          ..write('nomeUsuario: $nomeUsuario, ')
          ..write('logado: $logado, ')
          ..write('imagemPerfil: $imagemPerfil, ')
          ..write('palavraPasse: $palavraPasse')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, nivelAcesso, estado, nomeUsuario, logado, imagemPerfil, palavraPasse);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TabelaUsuarioData &&
          other.id == this.id &&
          other.nivelAcesso == this.nivelAcesso &&
          other.estado == this.estado &&
          other.nomeUsuario == this.nomeUsuario &&
          other.logado == this.logado &&
          other.imagemPerfil == this.imagemPerfil &&
          other.palavraPasse == this.palavraPasse);
}

class TabelaUsuarioCompanion extends UpdateCompanion<TabelaUsuarioData> {
  final Value<int> id;
  final Value<int> nivelAcesso;
  final Value<int?> estado;
  final Value<String> nomeUsuario;
  final Value<bool?> logado;
  final Value<String> imagemPerfil;
  final Value<String> palavraPasse;
  const TabelaUsuarioCompanion({
    this.id = const Value.absent(),
    this.nivelAcesso = const Value.absent(),
    this.estado = const Value.absent(),
    this.nomeUsuario = const Value.absent(),
    this.logado = const Value.absent(),
    this.imagemPerfil = const Value.absent(),
    this.palavraPasse = const Value.absent(),
  });
  TabelaUsuarioCompanion.insert({
    this.id = const Value.absent(),
    required int nivelAcesso,
    this.estado = const Value.absent(),
    required String nomeUsuario,
    this.logado = const Value.absent(),
    required String imagemPerfil,
    required String palavraPasse,
  })  : nivelAcesso = Value(nivelAcesso),
        nomeUsuario = Value(nomeUsuario),
        imagemPerfil = Value(imagemPerfil),
        palavraPasse = Value(palavraPasse);
  static Insertable<TabelaUsuarioData> custom({
    Expression<int>? id,
    Expression<int>? nivelAcesso,
    Expression<int?>? estado,
    Expression<String>? nomeUsuario,
    Expression<bool?>? logado,
    Expression<String>? imagemPerfil,
    Expression<String>? palavraPasse,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (nivelAcesso != null) 'nivel_acesso': nivelAcesso,
      if (estado != null) 'estado': estado,
      if (nomeUsuario != null) 'nome_usuario': nomeUsuario,
      if (logado != null) 'logado': logado,
      if (imagemPerfil != null) 'imagem_perfil': imagemPerfil,
      if (palavraPasse != null) 'palavra_passe': palavraPasse,
    });
  }

  TabelaUsuarioCompanion copyWith(
      {Value<int>? id,
      Value<int>? nivelAcesso,
      Value<int?>? estado,
      Value<String>? nomeUsuario,
      Value<bool?>? logado,
      Value<String>? imagemPerfil,
      Value<String>? palavraPasse}) {
    return TabelaUsuarioCompanion(
      id: id ?? this.id,
      nivelAcesso: nivelAcesso ?? this.nivelAcesso,
      estado: estado ?? this.estado,
      nomeUsuario: nomeUsuario ?? this.nomeUsuario,
      logado: logado ?? this.logado,
      imagemPerfil: imagemPerfil ?? this.imagemPerfil,
      palavraPasse: palavraPasse ?? this.palavraPasse,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (nivelAcesso.present) {
      map['nivel_acesso'] = Variable<int>(nivelAcesso.value);
    }
    if (estado.present) {
      map['estado'] = Variable<int?>(estado.value);
    }
    if (nomeUsuario.present) {
      map['nome_usuario'] = Variable<String>(nomeUsuario.value);
    }
    if (logado.present) {
      map['logado'] = Variable<bool?>(logado.value);
    }
    if (imagemPerfil.present) {
      map['imagem_perfil'] = Variable<String>(imagemPerfil.value);
    }
    if (palavraPasse.present) {
      map['palavra_passe'] = Variable<String>(palavraPasse.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TabelaUsuarioCompanion(')
          ..write('id: $id, ')
          ..write('nivelAcesso: $nivelAcesso, ')
          ..write('estado: $estado, ')
          ..write('nomeUsuario: $nomeUsuario, ')
          ..write('logado: $logado, ')
          ..write('imagemPerfil: $imagemPerfil, ')
          ..write('palavraPasse: $palavraPasse')
          ..write(')'))
        .toString();
  }
}

class $TabelaUsuarioTable extends TabelaUsuario
    with TableInfo<$TabelaUsuarioTable, TabelaUsuarioData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TabelaUsuarioTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _nivelAcessoMeta =
      const VerificationMeta('nivelAcesso');
  @override
  late final GeneratedColumn<int?> nivelAcesso = GeneratedColumn<int?>(
      'nivel_acesso', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _estadoMeta = const VerificationMeta('estado');
  @override
  late final GeneratedColumn<int?> estado = GeneratedColumn<int?>(
      'estado', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _nomeUsuarioMeta =
      const VerificationMeta('nomeUsuario');
  @override
  late final GeneratedColumn<String?> nomeUsuario = GeneratedColumn<String?>(
      'nome_usuario', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _logadoMeta = const VerificationMeta('logado');
  @override
  late final GeneratedColumn<bool?> logado = GeneratedColumn<bool?>(
      'logado', aliasedName, true,
      type: const BoolType(),
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (logado IN (0, 1))');
  final VerificationMeta _imagemPerfilMeta =
      const VerificationMeta('imagemPerfil');
  @override
  late final GeneratedColumn<String?> imagemPerfil = GeneratedColumn<String?>(
      'imagem_perfil', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _palavraPasseMeta =
      const VerificationMeta('palavraPasse');
  @override
  late final GeneratedColumn<String?> palavraPasse = GeneratedColumn<String?>(
      'palavra_passe', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        nivelAcesso,
        estado,
        nomeUsuario,
        logado,
        imagemPerfil,
        palavraPasse
      ];
  @override
  String get aliasedName => _alias ?? 'tabela_usuario';
  @override
  String get actualTableName => 'tabela_usuario';
  @override
  VerificationContext validateIntegrity(Insertable<TabelaUsuarioData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('nivel_acesso')) {
      context.handle(
          _nivelAcessoMeta,
          nivelAcesso.isAcceptableOrUnknown(
              data['nivel_acesso']!, _nivelAcessoMeta));
    } else if (isInserting) {
      context.missing(_nivelAcessoMeta);
    }
    if (data.containsKey('estado')) {
      context.handle(_estadoMeta,
          estado.isAcceptableOrUnknown(data['estado']!, _estadoMeta));
    }
    if (data.containsKey('nome_usuario')) {
      context.handle(
          _nomeUsuarioMeta,
          nomeUsuario.isAcceptableOrUnknown(
              data['nome_usuario']!, _nomeUsuarioMeta));
    } else if (isInserting) {
      context.missing(_nomeUsuarioMeta);
    }
    if (data.containsKey('logado')) {
      context.handle(_logadoMeta,
          logado.isAcceptableOrUnknown(data['logado']!, _logadoMeta));
    }
    if (data.containsKey('imagem_perfil')) {
      context.handle(
          _imagemPerfilMeta,
          imagemPerfil.isAcceptableOrUnknown(
              data['imagem_perfil']!, _imagemPerfilMeta));
    } else if (isInserting) {
      context.missing(_imagemPerfilMeta);
    }
    if (data.containsKey('palavra_passe')) {
      context.handle(
          _palavraPasseMeta,
          palavraPasse.isAcceptableOrUnknown(
              data['palavra_passe']!, _palavraPasseMeta));
    } else if (isInserting) {
      context.missing(_palavraPasseMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TabelaUsuarioData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return TabelaUsuarioData.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $TabelaUsuarioTable createAlias(String alias) {
    return $TabelaUsuarioTable(attachedDatabase, alias);
  }
}

class TabelaFuncionarioData extends DataClass
    implements Insertable<TabelaFuncionarioData> {
  final int id;
  final int estado;
  final int idUsuario;
  final String nomeCompleto;
  TabelaFuncionarioData(
      {required this.id,
      required this.estado,
      required this.idUsuario,
      required this.nomeCompleto});
  factory TabelaFuncionarioData.fromData(Map<String, dynamic> data,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return TabelaFuncionarioData(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      estado: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}estado'])!,
      idUsuario: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id_usuario'])!,
      nomeCompleto: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}nome_completo'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['estado'] = Variable<int>(estado);
    map['id_usuario'] = Variable<int>(idUsuario);
    map['nome_completo'] = Variable<String>(nomeCompleto);
    return map;
  }

  TabelaFuncionarioCompanion toCompanion(bool nullToAbsent) {
    return TabelaFuncionarioCompanion(
      id: Value(id),
      estado: Value(estado),
      idUsuario: Value(idUsuario),
      nomeCompleto: Value(nomeCompleto),
    );
  }

  factory TabelaFuncionarioData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TabelaFuncionarioData(
      id: serializer.fromJson<int>(json['id']),
      estado: serializer.fromJson<int>(json['estado']),
      idUsuario: serializer.fromJson<int>(json['idUsuario']),
      nomeCompleto: serializer.fromJson<String>(json['nomeCompleto']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'estado': serializer.toJson<int>(estado),
      'idUsuario': serializer.toJson<int>(idUsuario),
      'nomeCompleto': serializer.toJson<String>(nomeCompleto),
    };
  }

  TabelaFuncionarioData copyWith(
          {int? id, int? estado, int? idUsuario, String? nomeCompleto}) =>
      TabelaFuncionarioData(
        id: id ?? this.id,
        estado: estado ?? this.estado,
        idUsuario: idUsuario ?? this.idUsuario,
        nomeCompleto: nomeCompleto ?? this.nomeCompleto,
      );
  @override
  String toString() {
    return (StringBuffer('TabelaFuncionarioData(')
          ..write('id: $id, ')
          ..write('estado: $estado, ')
          ..write('idUsuario: $idUsuario, ')
          ..write('nomeCompleto: $nomeCompleto')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, estado, idUsuario, nomeCompleto);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TabelaFuncionarioData &&
          other.id == this.id &&
          other.estado == this.estado &&
          other.idUsuario == this.idUsuario &&
          other.nomeCompleto == this.nomeCompleto);
}

class TabelaFuncionarioCompanion
    extends UpdateCompanion<TabelaFuncionarioData> {
  final Value<int> id;
  final Value<int> estado;
  final Value<int> idUsuario;
  final Value<String> nomeCompleto;
  const TabelaFuncionarioCompanion({
    this.id = const Value.absent(),
    this.estado = const Value.absent(),
    this.idUsuario = const Value.absent(),
    this.nomeCompleto = const Value.absent(),
  });
  TabelaFuncionarioCompanion.insert({
    this.id = const Value.absent(),
    required int estado,
    required int idUsuario,
    required String nomeCompleto,
  })  : estado = Value(estado),
        idUsuario = Value(idUsuario),
        nomeCompleto = Value(nomeCompleto);
  static Insertable<TabelaFuncionarioData> custom({
    Expression<int>? id,
    Expression<int>? estado,
    Expression<int>? idUsuario,
    Expression<String>? nomeCompleto,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (estado != null) 'estado': estado,
      if (idUsuario != null) 'id_usuario': idUsuario,
      if (nomeCompleto != null) 'nome_completo': nomeCompleto,
    });
  }

  TabelaFuncionarioCompanion copyWith(
      {Value<int>? id,
      Value<int>? estado,
      Value<int>? idUsuario,
      Value<String>? nomeCompleto}) {
    return TabelaFuncionarioCompanion(
      id: id ?? this.id,
      estado: estado ?? this.estado,
      idUsuario: idUsuario ?? this.idUsuario,
      nomeCompleto: nomeCompleto ?? this.nomeCompleto,
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
    if (idUsuario.present) {
      map['id_usuario'] = Variable<int>(idUsuario.value);
    }
    if (nomeCompleto.present) {
      map['nome_completo'] = Variable<String>(nomeCompleto.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TabelaFuncionarioCompanion(')
          ..write('id: $id, ')
          ..write('estado: $estado, ')
          ..write('idUsuario: $idUsuario, ')
          ..write('nomeCompleto: $nomeCompleto')
          ..write(')'))
        .toString();
  }
}

class $TabelaFuncionarioTable extends TabelaFuncionario
    with TableInfo<$TabelaFuncionarioTable, TabelaFuncionarioData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TabelaFuncionarioTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _estadoMeta = const VerificationMeta('estado');
  @override
  late final GeneratedColumn<int?> estado = GeneratedColumn<int?>(
      'estado', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _idUsuarioMeta = const VerificationMeta('idUsuario');
  @override
  late final GeneratedColumn<int?> idUsuario = GeneratedColumn<int?>(
      'id_usuario', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _nomeCompletoMeta =
      const VerificationMeta('nomeCompleto');
  @override
  late final GeneratedColumn<String?> nomeCompleto = GeneratedColumn<String?>(
      'nome_completo', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, estado, idUsuario, nomeCompleto];
  @override
  String get aliasedName => _alias ?? 'tabela_funcionario';
  @override
  String get actualTableName => 'tabela_funcionario';
  @override
  VerificationContext validateIntegrity(
      Insertable<TabelaFuncionarioData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('estado')) {
      context.handle(_estadoMeta,
          estado.isAcceptableOrUnknown(data['estado']!, _estadoMeta));
    } else if (isInserting) {
      context.missing(_estadoMeta);
    }
    if (data.containsKey('id_usuario')) {
      context.handle(_idUsuarioMeta,
          idUsuario.isAcceptableOrUnknown(data['id_usuario']!, _idUsuarioMeta));
    } else if (isInserting) {
      context.missing(_idUsuarioMeta);
    }
    if (data.containsKey('nome_completo')) {
      context.handle(
          _nomeCompletoMeta,
          nomeCompleto.isAcceptableOrUnknown(
              data['nome_completo']!, _nomeCompletoMeta));
    } else if (isInserting) {
      context.missing(_nomeCompletoMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TabelaFuncionarioData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return TabelaFuncionarioData.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $TabelaFuncionarioTable createAlias(String alias) {
    return $TabelaFuncionarioTable(attachedDatabase, alias);
  }
}

class TabelaProdutoData extends DataClass
    implements Insertable<TabelaProdutoData> {
  final int id;
  final int estado;
  final String nome;
  final double precoCompra;
  final bool recebivel;
  TabelaProdutoData(
      {required this.id,
      required this.estado,
      required this.nome,
      required this.precoCompra,
      required this.recebivel});
  factory TabelaProdutoData.fromData(Map<String, dynamic> data,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return TabelaProdutoData(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
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
    map['id'] = Variable<int>(id);
    map['estado'] = Variable<int>(estado);
    map['nome'] = Variable<String>(nome);
    map['preco_compra'] = Variable<double>(precoCompra);
    map['recebivel'] = Variable<bool>(recebivel);
    return map;
  }

  TabelaProdutoCompanion toCompanion(bool nullToAbsent) {
    return TabelaProdutoCompanion(
      id: Value(id),
      estado: Value(estado),
      nome: Value(nome),
      precoCompra: Value(precoCompra),
      recebivel: Value(recebivel),
    );
  }

  factory TabelaProdutoData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TabelaProdutoData(
      id: serializer.fromJson<int>(json['id']),
      estado: serializer.fromJson<int>(json['estado']),
      nome: serializer.fromJson<String>(json['nome']),
      precoCompra: serializer.fromJson<double>(json['precoCompra']),
      recebivel: serializer.fromJson<bool>(json['recebivel']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'estado': serializer.toJson<int>(estado),
      'nome': serializer.toJson<String>(nome),
      'precoCompra': serializer.toJson<double>(precoCompra),
      'recebivel': serializer.toJson<bool>(recebivel),
    };
  }

  TabelaProdutoData copyWith(
          {int? id,
          int? estado,
          String? nome,
          double? precoCompra,
          bool? recebivel}) =>
      TabelaProdutoData(
        id: id ?? this.id,
        estado: estado ?? this.estado,
        nome: nome ?? this.nome,
        precoCompra: precoCompra ?? this.precoCompra,
        recebivel: recebivel ?? this.recebivel,
      );
  @override
  String toString() {
    return (StringBuffer('TabelaProdutoData(')
          ..write('id: $id, ')
          ..write('estado: $estado, ')
          ..write('nome: $nome, ')
          ..write('precoCompra: $precoCompra, ')
          ..write('recebivel: $recebivel')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, estado, nome, precoCompra, recebivel);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TabelaProdutoData &&
          other.id == this.id &&
          other.estado == this.estado &&
          other.nome == this.nome &&
          other.precoCompra == this.precoCompra &&
          other.recebivel == this.recebivel);
}

class TabelaProdutoCompanion extends UpdateCompanion<TabelaProdutoData> {
  final Value<int> id;
  final Value<int> estado;
  final Value<String> nome;
  final Value<double> precoCompra;
  final Value<bool> recebivel;
  const TabelaProdutoCompanion({
    this.id = const Value.absent(),
    this.estado = const Value.absent(),
    this.nome = const Value.absent(),
    this.precoCompra = const Value.absent(),
    this.recebivel = const Value.absent(),
  });
  TabelaProdutoCompanion.insert({
    this.id = const Value.absent(),
    required int estado,
    required String nome,
    required double precoCompra,
    required bool recebivel,
  })  : estado = Value(estado),
        nome = Value(nome),
        precoCompra = Value(precoCompra),
        recebivel = Value(recebivel);
  static Insertable<TabelaProdutoData> custom({
    Expression<int>? id,
    Expression<int>? estado,
    Expression<String>? nome,
    Expression<double>? precoCompra,
    Expression<bool>? recebivel,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (estado != null) 'estado': estado,
      if (nome != null) 'nome': nome,
      if (precoCompra != null) 'preco_compra': precoCompra,
      if (recebivel != null) 'recebivel': recebivel,
    });
  }

  TabelaProdutoCompanion copyWith(
      {Value<int>? id,
      Value<int>? estado,
      Value<String>? nome,
      Value<double>? precoCompra,
      Value<bool>? recebivel}) {
    return TabelaProdutoCompanion(
      id: id ?? this.id,
      estado: estado ?? this.estado,
      nome: nome ?? this.nome,
      precoCompra: precoCompra ?? this.precoCompra,
      recebivel: recebivel ?? this.recebivel,
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
    if (nome.present) {
      map['nome'] = Variable<String>(nome.value);
    }
    if (precoCompra.present) {
      map['preco_compra'] = Variable<double>(precoCompra.value);
    }
    if (recebivel.present) {
      map['recebivel'] = Variable<bool>(recebivel.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TabelaProdutoCompanion(')
          ..write('id: $id, ')
          ..write('estado: $estado, ')
          ..write('nome: $nome, ')
          ..write('precoCompra: $precoCompra, ')
          ..write('recebivel: $recebivel')
          ..write(')'))
        .toString();
  }
}

class $TabelaProdutoTable extends TabelaProduto
    with TableInfo<$TabelaProdutoTable, TabelaProdutoData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TabelaProdutoTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _estadoMeta = const VerificationMeta('estado');
  @override
  late final GeneratedColumn<int?> estado = GeneratedColumn<int?>(
      'estado', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _nomeMeta = const VerificationMeta('nome');
  @override
  late final GeneratedColumn<String?> nome = GeneratedColumn<String?>(
      'nome', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _precoCompraMeta =
      const VerificationMeta('precoCompra');
  @override
  late final GeneratedColumn<double?> precoCompra = GeneratedColumn<double?>(
      'preco_compra', aliasedName, false,
      type: const RealType(), requiredDuringInsert: true);
  final VerificationMeta _recebivelMeta = const VerificationMeta('recebivel');
  @override
  late final GeneratedColumn<bool?> recebivel = GeneratedColumn<bool?>(
      'recebivel', aliasedName, false,
      type: const BoolType(),
      requiredDuringInsert: true,
      defaultConstraints: 'CHECK (recebivel IN (0, 1))');
  @override
  List<GeneratedColumn> get $columns =>
      [id, estado, nome, precoCompra, recebivel];
  @override
  String get aliasedName => _alias ?? 'tabela_produto';
  @override
  String get actualTableName => 'tabela_produto';
  @override
  VerificationContext validateIntegrity(Insertable<TabelaProdutoData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('estado')) {
      context.handle(_estadoMeta,
          estado.isAcceptableOrUnknown(data['estado']!, _estadoMeta));
    } else if (isInserting) {
      context.missing(_estadoMeta);
    }
    if (data.containsKey('nome')) {
      context.handle(
          _nomeMeta, nome.isAcceptableOrUnknown(data['nome']!, _nomeMeta));
    } else if (isInserting) {
      context.missing(_nomeMeta);
    }
    if (data.containsKey('preco_compra')) {
      context.handle(
          _precoCompraMeta,
          precoCompra.isAcceptableOrUnknown(
              data['preco_compra']!, _precoCompraMeta));
    } else if (isInserting) {
      context.missing(_precoCompraMeta);
    }
    if (data.containsKey('recebivel')) {
      context.handle(_recebivelMeta,
          recebivel.isAcceptableOrUnknown(data['recebivel']!, _recebivelMeta));
    } else if (isInserting) {
      context.missing(_recebivelMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TabelaProdutoData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return TabelaProdutoData.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $TabelaProdutoTable createAlias(String alias) {
    return $TabelaProdutoTable(attachedDatabase, alias);
  }
}

class TabelaPrecoData extends DataClass implements Insertable<TabelaPrecoData> {
  final int id;
  final int estado;
  final int idProduto;
  final double preco;
  TabelaPrecoData(
      {required this.id,
      required this.estado,
      required this.idProduto,
      required this.preco});
  factory TabelaPrecoData.fromData(Map<String, dynamic> data,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return TabelaPrecoData(
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
    map['id'] = Variable<int>(id);
    map['estado'] = Variable<int>(estado);
    map['id_produto'] = Variable<int>(idProduto);
    map['preco'] = Variable<double>(preco);
    return map;
  }

  TabelaPrecoCompanion toCompanion(bool nullToAbsent) {
    return TabelaPrecoCompanion(
      id: Value(id),
      estado: Value(estado),
      idProduto: Value(idProduto),
      preco: Value(preco),
    );
  }

  factory TabelaPrecoData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TabelaPrecoData(
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
      'id': serializer.toJson<int>(id),
      'estado': serializer.toJson<int>(estado),
      'idProduto': serializer.toJson<int>(idProduto),
      'preco': serializer.toJson<double>(preco),
    };
  }

  TabelaPrecoData copyWith(
          {int? id, int? estado, int? idProduto, double? preco}) =>
      TabelaPrecoData(
        id: id ?? this.id,
        estado: estado ?? this.estado,
        idProduto: idProduto ?? this.idProduto,
        preco: preco ?? this.preco,
      );
  @override
  String toString() {
    return (StringBuffer('TabelaPrecoData(')
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
      (other is TabelaPrecoData &&
          other.id == this.id &&
          other.estado == this.estado &&
          other.idProduto == this.idProduto &&
          other.preco == this.preco);
}

class TabelaPrecoCompanion extends UpdateCompanion<TabelaPrecoData> {
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
  static Insertable<TabelaPrecoData> custom({
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

class $TabelaPrecoTable extends TabelaPreco
    with TableInfo<$TabelaPrecoTable, TabelaPrecoData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TabelaPrecoTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _estadoMeta = const VerificationMeta('estado');
  @override
  late final GeneratedColumn<int?> estado = GeneratedColumn<int?>(
      'estado', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _idProdutoMeta = const VerificationMeta('idProduto');
  @override
  late final GeneratedColumn<int?> idProduto = GeneratedColumn<int?>(
      'id_produto', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _precoMeta = const VerificationMeta('preco');
  @override
  late final GeneratedColumn<double?> preco = GeneratedColumn<double?>(
      'preco', aliasedName, false,
      type: const RealType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, estado, idProduto, preco];
  @override
  String get aliasedName => _alias ?? 'tabela_preco';
  @override
  String get actualTableName => 'tabela_preco';
  @override
  VerificationContext validateIntegrity(Insertable<TabelaPrecoData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('estado')) {
      context.handle(_estadoMeta,
          estado.isAcceptableOrUnknown(data['estado']!, _estadoMeta));
    } else if (isInserting) {
      context.missing(_estadoMeta);
    }
    if (data.containsKey('id_produto')) {
      context.handle(_idProdutoMeta,
          idProduto.isAcceptableOrUnknown(data['id_produto']!, _idProdutoMeta));
    } else if (isInserting) {
      context.missing(_idProdutoMeta);
    }
    if (data.containsKey('preco')) {
      context.handle(
          _precoMeta, preco.isAcceptableOrUnknown(data['preco']!, _precoMeta));
    } else if (isInserting) {
      context.missing(_precoMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TabelaPrecoData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return TabelaPrecoData.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $TabelaPrecoTable createAlias(String alias) {
    return $TabelaPrecoTable(attachedDatabase, alias);
  }
}

class TabelaVendaData extends DataClass implements Insertable<TabelaVendaData> {
  final int id;
  final int estado;
  final int idFuncionario;
  final DateTime data;
  final double total;
  final String nomeCliente;
  final String telefoneCliente;
  TabelaVendaData(
      {required this.id,
      required this.estado,
      required this.idFuncionario,
      required this.data,
      required this.total,
      required this.nomeCliente,
      required this.telefoneCliente});
  factory TabelaVendaData.fromData(Map<String, dynamic> data,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return TabelaVendaData(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      estado: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}estado'])!,
      idFuncionario: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id_funcionario'])!,
      data: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}data'])!,
      total: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}total'])!,
      nomeCliente: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}nome_cliente'])!,
      telefoneCliente: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}telefone_cliente'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['estado'] = Variable<int>(estado);
    map['id_funcionario'] = Variable<int>(idFuncionario);
    map['data'] = Variable<DateTime>(data);
    map['total'] = Variable<double>(total);
    map['nome_cliente'] = Variable<String>(nomeCliente);
    map['telefone_cliente'] = Variable<String>(telefoneCliente);
    return map;
  }

  TabelaVendaCompanion toCompanion(bool nullToAbsent) {
    return TabelaVendaCompanion(
      id: Value(id),
      estado: Value(estado),
      idFuncionario: Value(idFuncionario),
      data: Value(data),
      total: Value(total),
      nomeCliente: Value(nomeCliente),
      telefoneCliente: Value(telefoneCliente),
    );
  }

  factory TabelaVendaData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TabelaVendaData(
      id: serializer.fromJson<int>(json['id']),
      estado: serializer.fromJson<int>(json['estado']),
      idFuncionario: serializer.fromJson<int>(json['idFuncionario']),
      data: serializer.fromJson<DateTime>(json['data']),
      total: serializer.fromJson<double>(json['total']),
      nomeCliente: serializer.fromJson<String>(json['nomeCliente']),
      telefoneCliente: serializer.fromJson<String>(json['telefoneCliente']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'estado': serializer.toJson<int>(estado),
      'idFuncionario': serializer.toJson<int>(idFuncionario),
      'data': serializer.toJson<DateTime>(data),
      'total': serializer.toJson<double>(total),
      'nomeCliente': serializer.toJson<String>(nomeCliente),
      'telefoneCliente': serializer.toJson<String>(telefoneCliente),
    };
  }

  TabelaVendaData copyWith(
          {int? id,
          int? estado,
          int? idFuncionario,
          DateTime? data,
          double? total,
          String? nomeCliente,
          String? telefoneCliente}) =>
      TabelaVendaData(
        id: id ?? this.id,
        estado: estado ?? this.estado,
        idFuncionario: idFuncionario ?? this.idFuncionario,
        data: data ?? this.data,
        total: total ?? this.total,
        nomeCliente: nomeCliente ?? this.nomeCliente,
        telefoneCliente: telefoneCliente ?? this.telefoneCliente,
      );
  @override
  String toString() {
    return (StringBuffer('TabelaVendaData(')
          ..write('id: $id, ')
          ..write('estado: $estado, ')
          ..write('idFuncionario: $idFuncionario, ')
          ..write('data: $data, ')
          ..write('total: $total, ')
          ..write('nomeCliente: $nomeCliente, ')
          ..write('telefoneCliente: $telefoneCliente')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, estado, idFuncionario, data, total, nomeCliente, telefoneCliente);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TabelaVendaData &&
          other.id == this.id &&
          other.estado == this.estado &&
          other.idFuncionario == this.idFuncionario &&
          other.data == this.data &&
          other.total == this.total &&
          other.nomeCliente == this.nomeCliente &&
          other.telefoneCliente == this.telefoneCliente);
}

class TabelaVendaCompanion extends UpdateCompanion<TabelaVendaData> {
  final Value<int> id;
  final Value<int> estado;
  final Value<int> idFuncionario;
  final Value<DateTime> data;
  final Value<double> total;
  final Value<String> nomeCliente;
  final Value<String> telefoneCliente;
  const TabelaVendaCompanion({
    this.id = const Value.absent(),
    this.estado = const Value.absent(),
    this.idFuncionario = const Value.absent(),
    this.data = const Value.absent(),
    this.total = const Value.absent(),
    this.nomeCliente = const Value.absent(),
    this.telefoneCliente = const Value.absent(),
  });
  TabelaVendaCompanion.insert({
    this.id = const Value.absent(),
    required int estado,
    required int idFuncionario,
    required DateTime data,
    required double total,
    required String nomeCliente,
    required String telefoneCliente,
  })  : estado = Value(estado),
        idFuncionario = Value(idFuncionario),
        data = Value(data),
        total = Value(total),
        nomeCliente = Value(nomeCliente),
        telefoneCliente = Value(telefoneCliente);
  static Insertable<TabelaVendaData> custom({
    Expression<int>? id,
    Expression<int>? estado,
    Expression<int>? idFuncionario,
    Expression<DateTime>? data,
    Expression<double>? total,
    Expression<String>? nomeCliente,
    Expression<String>? telefoneCliente,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (estado != null) 'estado': estado,
      if (idFuncionario != null) 'id_funcionario': idFuncionario,
      if (data != null) 'data': data,
      if (total != null) 'total': total,
      if (nomeCliente != null) 'nome_cliente': nomeCliente,
      if (telefoneCliente != null) 'telefone_cliente': telefoneCliente,
    });
  }

  TabelaVendaCompanion copyWith(
      {Value<int>? id,
      Value<int>? estado,
      Value<int>? idFuncionario,
      Value<DateTime>? data,
      Value<double>? total,
      Value<String>? nomeCliente,
      Value<String>? telefoneCliente}) {
    return TabelaVendaCompanion(
      id: id ?? this.id,
      estado: estado ?? this.estado,
      idFuncionario: idFuncionario ?? this.idFuncionario,
      data: data ?? this.data,
      total: total ?? this.total,
      nomeCliente: nomeCliente ?? this.nomeCliente,
      telefoneCliente: telefoneCliente ?? this.telefoneCliente,
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
    if (idFuncionario.present) {
      map['id_funcionario'] = Variable<int>(idFuncionario.value);
    }
    if (data.present) {
      map['data'] = Variable<DateTime>(data.value);
    }
    if (total.present) {
      map['total'] = Variable<double>(total.value);
    }
    if (nomeCliente.present) {
      map['nome_cliente'] = Variable<String>(nomeCliente.value);
    }
    if (telefoneCliente.present) {
      map['telefone_cliente'] = Variable<String>(telefoneCliente.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TabelaVendaCompanion(')
          ..write('id: $id, ')
          ..write('estado: $estado, ')
          ..write('idFuncionario: $idFuncionario, ')
          ..write('data: $data, ')
          ..write('total: $total, ')
          ..write('nomeCliente: $nomeCliente, ')
          ..write('telefoneCliente: $telefoneCliente')
          ..write(')'))
        .toString();
  }
}

class $TabelaVendaTable extends TabelaVenda
    with TableInfo<$TabelaVendaTable, TabelaVendaData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TabelaVendaTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _estadoMeta = const VerificationMeta('estado');
  @override
  late final GeneratedColumn<int?> estado = GeneratedColumn<int?>(
      'estado', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _idFuncionarioMeta =
      const VerificationMeta('idFuncionario');
  @override
  late final GeneratedColumn<int?> idFuncionario = GeneratedColumn<int?>(
      'id_funcionario', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _dataMeta = const VerificationMeta('data');
  @override
  late final GeneratedColumn<DateTime?> data = GeneratedColumn<DateTime?>(
      'data', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _totalMeta = const VerificationMeta('total');
  @override
  late final GeneratedColumn<double?> total = GeneratedColumn<double?>(
      'total', aliasedName, false,
      type: const RealType(), requiredDuringInsert: true);
  final VerificationMeta _nomeClienteMeta =
      const VerificationMeta('nomeCliente');
  @override
  late final GeneratedColumn<String?> nomeCliente = GeneratedColumn<String?>(
      'nome_cliente', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _telefoneClienteMeta =
      const VerificationMeta('telefoneCliente');
  @override
  late final GeneratedColumn<String?> telefoneCliente =
      GeneratedColumn<String?>('telefone_cliente', aliasedName, false,
          type: const StringType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, estado, idFuncionario, data, total, nomeCliente, telefoneCliente];
  @override
  String get aliasedName => _alias ?? 'tabela_venda';
  @override
  String get actualTableName => 'tabela_venda';
  @override
  VerificationContext validateIntegrity(Insertable<TabelaVendaData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('estado')) {
      context.handle(_estadoMeta,
          estado.isAcceptableOrUnknown(data['estado']!, _estadoMeta));
    } else if (isInserting) {
      context.missing(_estadoMeta);
    }
    if (data.containsKey('id_funcionario')) {
      context.handle(
          _idFuncionarioMeta,
          idFuncionario.isAcceptableOrUnknown(
              data['id_funcionario']!, _idFuncionarioMeta));
    } else if (isInserting) {
      context.missing(_idFuncionarioMeta);
    }
    if (data.containsKey('data')) {
      context.handle(
          _dataMeta, this.data.isAcceptableOrUnknown(data['data']!, _dataMeta));
    } else if (isInserting) {
      context.missing(_dataMeta);
    }
    if (data.containsKey('total')) {
      context.handle(
          _totalMeta, total.isAcceptableOrUnknown(data['total']!, _totalMeta));
    } else if (isInserting) {
      context.missing(_totalMeta);
    }
    if (data.containsKey('nome_cliente')) {
      context.handle(
          _nomeClienteMeta,
          nomeCliente.isAcceptableOrUnknown(
              data['nome_cliente']!, _nomeClienteMeta));
    } else if (isInserting) {
      context.missing(_nomeClienteMeta);
    }
    if (data.containsKey('telefone_cliente')) {
      context.handle(
          _telefoneClienteMeta,
          telefoneCliente.isAcceptableOrUnknown(
              data['telefone_cliente']!, _telefoneClienteMeta));
    } else if (isInserting) {
      context.missing(_telefoneClienteMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TabelaVendaData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return TabelaVendaData.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $TabelaVendaTable createAlias(String alias) {
    return $TabelaVendaTable(attachedDatabase, alias);
  }
}

class TabelaItemVendaData extends DataClass
    implements Insertable<TabelaItemVendaData> {
  final int id;
  final int estado;
  final int idProduto;
  final int idVenda;
  final int quantidade;
  final double total;
  final double desconto;
  TabelaItemVendaData(
      {required this.id,
      required this.estado,
      required this.idProduto,
      required this.idVenda,
      required this.quantidade,
      required this.total,
      required this.desconto});
  factory TabelaItemVendaData.fromData(Map<String, dynamic> data,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return TabelaItemVendaData(
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
      total: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}total'])!,
      desconto: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}desconto'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['estado'] = Variable<int>(estado);
    map['id_produto'] = Variable<int>(idProduto);
    map['id_venda'] = Variable<int>(idVenda);
    map['quantidade'] = Variable<int>(quantidade);
    map['total'] = Variable<double>(total);
    map['desconto'] = Variable<double>(desconto);
    return map;
  }

  TabelaItemVendaCompanion toCompanion(bool nullToAbsent) {
    return TabelaItemVendaCompanion(
      id: Value(id),
      estado: Value(estado),
      idProduto: Value(idProduto),
      idVenda: Value(idVenda),
      quantidade: Value(quantidade),
      total: Value(total),
      desconto: Value(desconto),
    );
  }

  factory TabelaItemVendaData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TabelaItemVendaData(
      id: serializer.fromJson<int>(json['id']),
      estado: serializer.fromJson<int>(json['estado']),
      idProduto: serializer.fromJson<int>(json['idProduto']),
      idVenda: serializer.fromJson<int>(json['idVenda']),
      quantidade: serializer.fromJson<int>(json['quantidade']),
      total: serializer.fromJson<double>(json['total']),
      desconto: serializer.fromJson<double>(json['desconto']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'estado': serializer.toJson<int>(estado),
      'idProduto': serializer.toJson<int>(idProduto),
      'idVenda': serializer.toJson<int>(idVenda),
      'quantidade': serializer.toJson<int>(quantidade),
      'total': serializer.toJson<double>(total),
      'desconto': serializer.toJson<double>(desconto),
    };
  }

  TabelaItemVendaData copyWith(
          {int? id,
          int? estado,
          int? idProduto,
          int? idVenda,
          int? quantidade,
          double? total,
          double? desconto}) =>
      TabelaItemVendaData(
        id: id ?? this.id,
        estado: estado ?? this.estado,
        idProduto: idProduto ?? this.idProduto,
        idVenda: idVenda ?? this.idVenda,
        quantidade: quantidade ?? this.quantidade,
        total: total ?? this.total,
        desconto: desconto ?? this.desconto,
      );
  @override
  String toString() {
    return (StringBuffer('TabelaItemVendaData(')
          ..write('id: $id, ')
          ..write('estado: $estado, ')
          ..write('idProduto: $idProduto, ')
          ..write('idVenda: $idVenda, ')
          ..write('quantidade: $quantidade, ')
          ..write('total: $total, ')
          ..write('desconto: $desconto')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, estado, idProduto, idVenda, quantidade, total, desconto);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TabelaItemVendaData &&
          other.id == this.id &&
          other.estado == this.estado &&
          other.idProduto == this.idProduto &&
          other.idVenda == this.idVenda &&
          other.quantidade == this.quantidade &&
          other.total == this.total &&
          other.desconto == this.desconto);
}

class TabelaItemVendaCompanion extends UpdateCompanion<TabelaItemVendaData> {
  final Value<int> id;
  final Value<int> estado;
  final Value<int> idProduto;
  final Value<int> idVenda;
  final Value<int> quantidade;
  final Value<double> total;
  final Value<double> desconto;
  const TabelaItemVendaCompanion({
    this.id = const Value.absent(),
    this.estado = const Value.absent(),
    this.idProduto = const Value.absent(),
    this.idVenda = const Value.absent(),
    this.quantidade = const Value.absent(),
    this.total = const Value.absent(),
    this.desconto = const Value.absent(),
  });
  TabelaItemVendaCompanion.insert({
    this.id = const Value.absent(),
    required int estado,
    required int idProduto,
    required int idVenda,
    required int quantidade,
    required double total,
    required double desconto,
  })  : estado = Value(estado),
        idProduto = Value(idProduto),
        idVenda = Value(idVenda),
        quantidade = Value(quantidade),
        total = Value(total),
        desconto = Value(desconto);
  static Insertable<TabelaItemVendaData> custom({
    Expression<int>? id,
    Expression<int>? estado,
    Expression<int>? idProduto,
    Expression<int>? idVenda,
    Expression<int>? quantidade,
    Expression<double>? total,
    Expression<double>? desconto,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (estado != null) 'estado': estado,
      if (idProduto != null) 'id_produto': idProduto,
      if (idVenda != null) 'id_venda': idVenda,
      if (quantidade != null) 'quantidade': quantidade,
      if (total != null) 'total': total,
      if (desconto != null) 'desconto': desconto,
    });
  }

  TabelaItemVendaCompanion copyWith(
      {Value<int>? id,
      Value<int>? estado,
      Value<int>? idProduto,
      Value<int>? idVenda,
      Value<int>? quantidade,
      Value<double>? total,
      Value<double>? desconto}) {
    return TabelaItemVendaCompanion(
      id: id ?? this.id,
      estado: estado ?? this.estado,
      idProduto: idProduto ?? this.idProduto,
      idVenda: idVenda ?? this.idVenda,
      quantidade: quantidade ?? this.quantidade,
      total: total ?? this.total,
      desconto: desconto ?? this.desconto,
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
    if (idVenda.present) {
      map['id_venda'] = Variable<int>(idVenda.value);
    }
    if (quantidade.present) {
      map['quantidade'] = Variable<int>(quantidade.value);
    }
    if (total.present) {
      map['total'] = Variable<double>(total.value);
    }
    if (desconto.present) {
      map['desconto'] = Variable<double>(desconto.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TabelaItemVendaCompanion(')
          ..write('id: $id, ')
          ..write('estado: $estado, ')
          ..write('idProduto: $idProduto, ')
          ..write('idVenda: $idVenda, ')
          ..write('quantidade: $quantidade, ')
          ..write('total: $total, ')
          ..write('desconto: $desconto')
          ..write(')'))
        .toString();
  }
}

class $TabelaItemVendaTable extends TabelaItemVenda
    with TableInfo<$TabelaItemVendaTable, TabelaItemVendaData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TabelaItemVendaTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _estadoMeta = const VerificationMeta('estado');
  @override
  late final GeneratedColumn<int?> estado = GeneratedColumn<int?>(
      'estado', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _idProdutoMeta = const VerificationMeta('idProduto');
  @override
  late final GeneratedColumn<int?> idProduto = GeneratedColumn<int?>(
      'id_produto', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _idVendaMeta = const VerificationMeta('idVenda');
  @override
  late final GeneratedColumn<int?> idVenda = GeneratedColumn<int?>(
      'id_venda', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _quantidadeMeta = const VerificationMeta('quantidade');
  @override
  late final GeneratedColumn<int?> quantidade = GeneratedColumn<int?>(
      'quantidade', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _totalMeta = const VerificationMeta('total');
  @override
  late final GeneratedColumn<double?> total = GeneratedColumn<double?>(
      'total', aliasedName, false,
      type: const RealType(), requiredDuringInsert: true);
  final VerificationMeta _descontoMeta = const VerificationMeta('desconto');
  @override
  late final GeneratedColumn<double?> desconto = GeneratedColumn<double?>(
      'desconto', aliasedName, false,
      type: const RealType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, estado, idProduto, idVenda, quantidade, total, desconto];
  @override
  String get aliasedName => _alias ?? 'tabela_item_venda';
  @override
  String get actualTableName => 'tabela_item_venda';
  @override
  VerificationContext validateIntegrity(
      Insertable<TabelaItemVendaData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('estado')) {
      context.handle(_estadoMeta,
          estado.isAcceptableOrUnknown(data['estado']!, _estadoMeta));
    } else if (isInserting) {
      context.missing(_estadoMeta);
    }
    if (data.containsKey('id_produto')) {
      context.handle(_idProdutoMeta,
          idProduto.isAcceptableOrUnknown(data['id_produto']!, _idProdutoMeta));
    } else if (isInserting) {
      context.missing(_idProdutoMeta);
    }
    if (data.containsKey('id_venda')) {
      context.handle(_idVendaMeta,
          idVenda.isAcceptableOrUnknown(data['id_venda']!, _idVendaMeta));
    } else if (isInserting) {
      context.missing(_idVendaMeta);
    }
    if (data.containsKey('quantidade')) {
      context.handle(
          _quantidadeMeta,
          quantidade.isAcceptableOrUnknown(
              data['quantidade']!, _quantidadeMeta));
    } else if (isInserting) {
      context.missing(_quantidadeMeta);
    }
    if (data.containsKey('total')) {
      context.handle(
          _totalMeta, total.isAcceptableOrUnknown(data['total']!, _totalMeta));
    } else if (isInserting) {
      context.missing(_totalMeta);
    }
    if (data.containsKey('desconto')) {
      context.handle(_descontoMeta,
          desconto.isAcceptableOrUnknown(data['desconto']!, _descontoMeta));
    } else if (isInserting) {
      context.missing(_descontoMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TabelaItemVendaData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return TabelaItemVendaData.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $TabelaItemVendaTable createAlias(String alias) {
    return $TabelaItemVendaTable(attachedDatabase, alias);
  }
}

class TabelaEntradaData extends DataClass
    implements Insertable<TabelaEntradaData> {
  final int id;
  final int estado;
  final int idProduto;
  final int idRececcao;
  final int quantidade;
  final DateTime data;
  TabelaEntradaData(
      {required this.id,
      required this.estado,
      required this.idProduto,
      required this.idRececcao,
      required this.quantidade,
      required this.data});
  factory TabelaEntradaData.fromData(Map<String, dynamic> data,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return TabelaEntradaData(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      estado: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}estado'])!,
      idProduto: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id_produto'])!,
      idRececcao: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id_receccao'])!,
      quantidade: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}quantidade'])!,
      data: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}data'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['estado'] = Variable<int>(estado);
    map['id_produto'] = Variable<int>(idProduto);
    map['id_receccao'] = Variable<int>(idRececcao);
    map['quantidade'] = Variable<int>(quantidade);
    map['data'] = Variable<DateTime>(data);
    return map;
  }

  TabelaEntradaCompanion toCompanion(bool nullToAbsent) {
    return TabelaEntradaCompanion(
      id: Value(id),
      estado: Value(estado),
      idProduto: Value(idProduto),
      idRececcao: Value(idRececcao),
      quantidade: Value(quantidade),
      data: Value(data),
    );
  }

  factory TabelaEntradaData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TabelaEntradaData(
      id: serializer.fromJson<int>(json['id']),
      estado: serializer.fromJson<int>(json['estado']),
      idProduto: serializer.fromJson<int>(json['idProduto']),
      idRececcao: serializer.fromJson<int>(json['idRececcao']),
      quantidade: serializer.fromJson<int>(json['quantidade']),
      data: serializer.fromJson<DateTime>(json['data']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'estado': serializer.toJson<int>(estado),
      'idProduto': serializer.toJson<int>(idProduto),
      'idRececcao': serializer.toJson<int>(idRececcao),
      'quantidade': serializer.toJson<int>(quantidade),
      'data': serializer.toJson<DateTime>(data),
    };
  }

  TabelaEntradaData copyWith(
          {int? id,
          int? estado,
          int? idProduto,
          int? idRececcao,
          int? quantidade,
          DateTime? data}) =>
      TabelaEntradaData(
        id: id ?? this.id,
        estado: estado ?? this.estado,
        idProduto: idProduto ?? this.idProduto,
        idRececcao: idRececcao ?? this.idRececcao,
        quantidade: quantidade ?? this.quantidade,
        data: data ?? this.data,
      );
  @override
  String toString() {
    return (StringBuffer('TabelaEntradaData(')
          ..write('id: $id, ')
          ..write('estado: $estado, ')
          ..write('idProduto: $idProduto, ')
          ..write('idRececcao: $idRececcao, ')
          ..write('quantidade: $quantidade, ')
          ..write('data: $data')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, estado, idProduto, idRececcao, quantidade, data);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TabelaEntradaData &&
          other.id == this.id &&
          other.estado == this.estado &&
          other.idProduto == this.idProduto &&
          other.idRececcao == this.idRececcao &&
          other.quantidade == this.quantidade &&
          other.data == this.data);
}

class TabelaEntradaCompanion extends UpdateCompanion<TabelaEntradaData> {
  final Value<int> id;
  final Value<int> estado;
  final Value<int> idProduto;
  final Value<int> idRececcao;
  final Value<int> quantidade;
  final Value<DateTime> data;
  const TabelaEntradaCompanion({
    this.id = const Value.absent(),
    this.estado = const Value.absent(),
    this.idProduto = const Value.absent(),
    this.idRececcao = const Value.absent(),
    this.quantidade = const Value.absent(),
    this.data = const Value.absent(),
  });
  TabelaEntradaCompanion.insert({
    this.id = const Value.absent(),
    required int estado,
    required int idProduto,
    required int idRececcao,
    required int quantidade,
    required DateTime data,
  })  : estado = Value(estado),
        idProduto = Value(idProduto),
        idRececcao = Value(idRececcao),
        quantidade = Value(quantidade),
        data = Value(data);
  static Insertable<TabelaEntradaData> custom({
    Expression<int>? id,
    Expression<int>? estado,
    Expression<int>? idProduto,
    Expression<int>? idRececcao,
    Expression<int>? quantidade,
    Expression<DateTime>? data,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (estado != null) 'estado': estado,
      if (idProduto != null) 'id_produto': idProduto,
      if (idRececcao != null) 'id_receccao': idRececcao,
      if (quantidade != null) 'quantidade': quantidade,
      if (data != null) 'data': data,
    });
  }

  TabelaEntradaCompanion copyWith(
      {Value<int>? id,
      Value<int>? estado,
      Value<int>? idProduto,
      Value<int>? idRececcao,
      Value<int>? quantidade,
      Value<DateTime>? data}) {
    return TabelaEntradaCompanion(
      id: id ?? this.id,
      estado: estado ?? this.estado,
      idProduto: idProduto ?? this.idProduto,
      idRececcao: idRececcao ?? this.idRececcao,
      quantidade: quantidade ?? this.quantidade,
      data: data ?? this.data,
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
    if (idRececcao.present) {
      map['id_receccao'] = Variable<int>(idRececcao.value);
    }
    if (quantidade.present) {
      map['quantidade'] = Variable<int>(quantidade.value);
    }
    if (data.present) {
      map['data'] = Variable<DateTime>(data.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TabelaEntradaCompanion(')
          ..write('id: $id, ')
          ..write('estado: $estado, ')
          ..write('idProduto: $idProduto, ')
          ..write('idRececcao: $idRececcao, ')
          ..write('quantidade: $quantidade, ')
          ..write('data: $data')
          ..write(')'))
        .toString();
  }
}

class $TabelaEntradaTable extends TabelaEntrada
    with TableInfo<$TabelaEntradaTable, TabelaEntradaData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TabelaEntradaTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _estadoMeta = const VerificationMeta('estado');
  @override
  late final GeneratedColumn<int?> estado = GeneratedColumn<int?>(
      'estado', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _idProdutoMeta = const VerificationMeta('idProduto');
  @override
  late final GeneratedColumn<int?> idProduto = GeneratedColumn<int?>(
      'id_produto', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _idRececcaoMeta = const VerificationMeta('idRececcao');
  @override
  late final GeneratedColumn<int?> idRececcao = GeneratedColumn<int?>(
      'id_receccao', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _quantidadeMeta = const VerificationMeta('quantidade');
  @override
  late final GeneratedColumn<int?> quantidade = GeneratedColumn<int?>(
      'quantidade', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _dataMeta = const VerificationMeta('data');
  @override
  late final GeneratedColumn<DateTime?> data = GeneratedColumn<DateTime?>(
      'data', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, estado, idProduto, idRececcao, quantidade, data];
  @override
  String get aliasedName => _alias ?? 'tabela_entrada';
  @override
  String get actualTableName => 'tabela_entrada';
  @override
  VerificationContext validateIntegrity(Insertable<TabelaEntradaData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('estado')) {
      context.handle(_estadoMeta,
          estado.isAcceptableOrUnknown(data['estado']!, _estadoMeta));
    } else if (isInserting) {
      context.missing(_estadoMeta);
    }
    if (data.containsKey('id_produto')) {
      context.handle(_idProdutoMeta,
          idProduto.isAcceptableOrUnknown(data['id_produto']!, _idProdutoMeta));
    } else if (isInserting) {
      context.missing(_idProdutoMeta);
    }
    if (data.containsKey('id_receccao')) {
      context.handle(
          _idRececcaoMeta,
          idRececcao.isAcceptableOrUnknown(
              data['id_receccao']!, _idRececcaoMeta));
    } else if (isInserting) {
      context.missing(_idRececcaoMeta);
    }
    if (data.containsKey('quantidade')) {
      context.handle(
          _quantidadeMeta,
          quantidade.isAcceptableOrUnknown(
              data['quantidade']!, _quantidadeMeta));
    } else if (isInserting) {
      context.missing(_quantidadeMeta);
    }
    if (data.containsKey('data')) {
      context.handle(
          _dataMeta, this.data.isAcceptableOrUnknown(data['data']!, _dataMeta));
    } else if (isInserting) {
      context.missing(_dataMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TabelaEntradaData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return TabelaEntradaData.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $TabelaEntradaTable createAlias(String alias) {
    return $TabelaEntradaTable(attachedDatabase, alias);
  }
}

class TabelaSaidaData extends DataClass implements Insertable<TabelaSaidaData> {
  final int id;
  final int estado;
  final int idProduto;
  final int idVenda;
  final int quantidade;
  final DateTime data;
  TabelaSaidaData(
      {required this.id,
      required this.estado,
      required this.idProduto,
      required this.idVenda,
      required this.quantidade,
      required this.data});
  factory TabelaSaidaData.fromData(Map<String, dynamic> data,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return TabelaSaidaData(
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
    map['id'] = Variable<int>(id);
    map['estado'] = Variable<int>(estado);
    map['id_produto'] = Variable<int>(idProduto);
    map['id_venda'] = Variable<int>(idVenda);
    map['quantidade'] = Variable<int>(quantidade);
    map['data'] = Variable<DateTime>(data);
    return map;
  }

  TabelaSaidaCompanion toCompanion(bool nullToAbsent) {
    return TabelaSaidaCompanion(
      id: Value(id),
      estado: Value(estado),
      idProduto: Value(idProduto),
      idVenda: Value(idVenda),
      quantidade: Value(quantidade),
      data: Value(data),
    );
  }

  factory TabelaSaidaData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TabelaSaidaData(
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
      'id': serializer.toJson<int>(id),
      'estado': serializer.toJson<int>(estado),
      'idProduto': serializer.toJson<int>(idProduto),
      'idVenda': serializer.toJson<int>(idVenda),
      'quantidade': serializer.toJson<int>(quantidade),
      'data': serializer.toJson<DateTime>(data),
    };
  }

  TabelaSaidaData copyWith(
          {int? id,
          int? estado,
          int? idProduto,
          int? idVenda,
          int? quantidade,
          DateTime? data}) =>
      TabelaSaidaData(
        id: id ?? this.id,
        estado: estado ?? this.estado,
        idProduto: idProduto ?? this.idProduto,
        idVenda: idVenda ?? this.idVenda,
        quantidade: quantidade ?? this.quantidade,
        data: data ?? this.data,
      );
  @override
  String toString() {
    return (StringBuffer('TabelaSaidaData(')
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
          other.idVenda == this.idVenda &&
          other.quantidade == this.quantidade &&
          other.data == this.data);
}

class TabelaSaidaCompanion extends UpdateCompanion<TabelaSaidaData> {
  final Value<int> id;
  final Value<int> estado;
  final Value<int> idProduto;
  final Value<int> idVenda;
  final Value<int> quantidade;
  final Value<DateTime> data;
  const TabelaSaidaCompanion({
    this.id = const Value.absent(),
    this.estado = const Value.absent(),
    this.idProduto = const Value.absent(),
    this.idVenda = const Value.absent(),
    this.quantidade = const Value.absent(),
    this.data = const Value.absent(),
  });
  TabelaSaidaCompanion.insert({
    this.id = const Value.absent(),
    required int estado,
    required int idProduto,
    required int idVenda,
    required int quantidade,
    required DateTime data,
  })  : estado = Value(estado),
        idProduto = Value(idProduto),
        idVenda = Value(idVenda),
        quantidade = Value(quantidade),
        data = Value(data);
  static Insertable<TabelaSaidaData> custom({
    Expression<int>? id,
    Expression<int>? estado,
    Expression<int>? idProduto,
    Expression<int>? idVenda,
    Expression<int>? quantidade,
    Expression<DateTime>? data,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (estado != null) 'estado': estado,
      if (idProduto != null) 'id_produto': idProduto,
      if (idVenda != null) 'id_venda': idVenda,
      if (quantidade != null) 'quantidade': quantidade,
      if (data != null) 'data': data,
    });
  }

  TabelaSaidaCompanion copyWith(
      {Value<int>? id,
      Value<int>? estado,
      Value<int>? idProduto,
      Value<int>? idVenda,
      Value<int>? quantidade,
      Value<DateTime>? data}) {
    return TabelaSaidaCompanion(
      id: id ?? this.id,
      estado: estado ?? this.estado,
      idProduto: idProduto ?? this.idProduto,
      idVenda: idVenda ?? this.idVenda,
      quantidade: quantidade ?? this.quantidade,
      data: data ?? this.data,
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
    if (idVenda.present) {
      map['id_venda'] = Variable<int>(idVenda.value);
    }
    if (quantidade.present) {
      map['quantidade'] = Variable<int>(quantidade.value);
    }
    if (data.present) {
      map['data'] = Variable<DateTime>(data.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TabelaSaidaCompanion(')
          ..write('id: $id, ')
          ..write('estado: $estado, ')
          ..write('idProduto: $idProduto, ')
          ..write('idVenda: $idVenda, ')
          ..write('quantidade: $quantidade, ')
          ..write('data: $data')
          ..write(')'))
        .toString();
  }
}

class $TabelaSaidaTable extends TabelaSaida
    with TableInfo<$TabelaSaidaTable, TabelaSaidaData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TabelaSaidaTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _estadoMeta = const VerificationMeta('estado');
  @override
  late final GeneratedColumn<int?> estado = GeneratedColumn<int?>(
      'estado', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _idProdutoMeta = const VerificationMeta('idProduto');
  @override
  late final GeneratedColumn<int?> idProduto = GeneratedColumn<int?>(
      'id_produto', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _idVendaMeta = const VerificationMeta('idVenda');
  @override
  late final GeneratedColumn<int?> idVenda = GeneratedColumn<int?>(
      'id_venda', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _quantidadeMeta = const VerificationMeta('quantidade');
  @override
  late final GeneratedColumn<int?> quantidade = GeneratedColumn<int?>(
      'quantidade', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _dataMeta = const VerificationMeta('data');
  @override
  late final GeneratedColumn<DateTime?> data = GeneratedColumn<DateTime?>(
      'data', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, estado, idProduto, idVenda, quantidade, data];
  @override
  String get aliasedName => _alias ?? 'tabela_saida';
  @override
  String get actualTableName => 'tabela_saida';
  @override
  VerificationContext validateIntegrity(Insertable<TabelaSaidaData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('estado')) {
      context.handle(_estadoMeta,
          estado.isAcceptableOrUnknown(data['estado']!, _estadoMeta));
    } else if (isInserting) {
      context.missing(_estadoMeta);
    }
    if (data.containsKey('id_produto')) {
      context.handle(_idProdutoMeta,
          idProduto.isAcceptableOrUnknown(data['id_produto']!, _idProdutoMeta));
    } else if (isInserting) {
      context.missing(_idProdutoMeta);
    }
    if (data.containsKey('id_venda')) {
      context.handle(_idVendaMeta,
          idVenda.isAcceptableOrUnknown(data['id_venda']!, _idVendaMeta));
    } else if (isInserting) {
      context.missing(_idVendaMeta);
    }
    if (data.containsKey('quantidade')) {
      context.handle(
          _quantidadeMeta,
          quantidade.isAcceptableOrUnknown(
              data['quantidade']!, _quantidadeMeta));
    } else if (isInserting) {
      context.missing(_quantidadeMeta);
    }
    if (data.containsKey('data')) {
      context.handle(
          _dataMeta, this.data.isAcceptableOrUnknown(data['data']!, _dataMeta));
    } else if (isInserting) {
      context.missing(_dataMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TabelaSaidaData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return TabelaSaidaData.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $TabelaSaidaTable createAlias(String alias) {
    return $TabelaSaidaTable(attachedDatabase, alias);
  }
}

class TabelaStockData extends DataClass implements Insertable<TabelaStockData> {
  final int id;
  final int estado;
  final int idProduto;
  final int quantidade;
  TabelaStockData(
      {required this.id,
      required this.estado,
      required this.idProduto,
      required this.quantidade});
  factory TabelaStockData.fromData(Map<String, dynamic> data,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return TabelaStockData(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      estado: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}estado'])!,
      idProduto: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id_produto'])!,
      quantidade: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}quantidade'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['estado'] = Variable<int>(estado);
    map['id_produto'] = Variable<int>(idProduto);
    map['quantidade'] = Variable<int>(quantidade);
    return map;
  }

  TabelaStockCompanion toCompanion(bool nullToAbsent) {
    return TabelaStockCompanion(
      id: Value(id),
      estado: Value(estado),
      idProduto: Value(idProduto),
      quantidade: Value(quantidade),
    );
  }

  factory TabelaStockData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TabelaStockData(
      id: serializer.fromJson<int>(json['id']),
      estado: serializer.fromJson<int>(json['estado']),
      idProduto: serializer.fromJson<int>(json['idProduto']),
      quantidade: serializer.fromJson<int>(json['quantidade']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'estado': serializer.toJson<int>(estado),
      'idProduto': serializer.toJson<int>(idProduto),
      'quantidade': serializer.toJson<int>(quantidade),
    };
  }

  TabelaStockData copyWith(
          {int? id, int? estado, int? idProduto, int? quantidade}) =>
      TabelaStockData(
        id: id ?? this.id,
        estado: estado ?? this.estado,
        idProduto: idProduto ?? this.idProduto,
        quantidade: quantidade ?? this.quantidade,
      );
  @override
  String toString() {
    return (StringBuffer('TabelaStockData(')
          ..write('id: $id, ')
          ..write('estado: $estado, ')
          ..write('idProduto: $idProduto, ')
          ..write('quantidade: $quantidade')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, estado, idProduto, quantidade);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TabelaStockData &&
          other.id == this.id &&
          other.estado == this.estado &&
          other.idProduto == this.idProduto &&
          other.quantidade == this.quantidade);
}

class TabelaStockCompanion extends UpdateCompanion<TabelaStockData> {
  final Value<int> id;
  final Value<int> estado;
  final Value<int> idProduto;
  final Value<int> quantidade;
  const TabelaStockCompanion({
    this.id = const Value.absent(),
    this.estado = const Value.absent(),
    this.idProduto = const Value.absent(),
    this.quantidade = const Value.absent(),
  });
  TabelaStockCompanion.insert({
    this.id = const Value.absent(),
    required int estado,
    required int idProduto,
    required int quantidade,
  })  : estado = Value(estado),
        idProduto = Value(idProduto),
        quantidade = Value(quantidade);
  static Insertable<TabelaStockData> custom({
    Expression<int>? id,
    Expression<int>? estado,
    Expression<int>? idProduto,
    Expression<int>? quantidade,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (estado != null) 'estado': estado,
      if (idProduto != null) 'id_produto': idProduto,
      if (quantidade != null) 'quantidade': quantidade,
    });
  }

  TabelaStockCompanion copyWith(
      {Value<int>? id,
      Value<int>? estado,
      Value<int>? idProduto,
      Value<int>? quantidade}) {
    return TabelaStockCompanion(
      id: id ?? this.id,
      estado: estado ?? this.estado,
      idProduto: idProduto ?? this.idProduto,
      quantidade: quantidade ?? this.quantidade,
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
    if (quantidade.present) {
      map['quantidade'] = Variable<int>(quantidade.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TabelaStockCompanion(')
          ..write('id: $id, ')
          ..write('estado: $estado, ')
          ..write('idProduto: $idProduto, ')
          ..write('quantidade: $quantidade')
          ..write(')'))
        .toString();
  }
}

class $TabelaStockTable extends TabelaStock
    with TableInfo<$TabelaStockTable, TabelaStockData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TabelaStockTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _estadoMeta = const VerificationMeta('estado');
  @override
  late final GeneratedColumn<int?> estado = GeneratedColumn<int?>(
      'estado', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _idProdutoMeta = const VerificationMeta('idProduto');
  @override
  late final GeneratedColumn<int?> idProduto = GeneratedColumn<int?>(
      'id_produto', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _quantidadeMeta = const VerificationMeta('quantidade');
  @override
  late final GeneratedColumn<int?> quantidade = GeneratedColumn<int?>(
      'quantidade', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, estado, idProduto, quantidade];
  @override
  String get aliasedName => _alias ?? 'tabela_stock';
  @override
  String get actualTableName => 'tabela_stock';
  @override
  VerificationContext validateIntegrity(Insertable<TabelaStockData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('estado')) {
      context.handle(_estadoMeta,
          estado.isAcceptableOrUnknown(data['estado']!, _estadoMeta));
    } else if (isInserting) {
      context.missing(_estadoMeta);
    }
    if (data.containsKey('id_produto')) {
      context.handle(_idProdutoMeta,
          idProduto.isAcceptableOrUnknown(data['id_produto']!, _idProdutoMeta));
    } else if (isInserting) {
      context.missing(_idProdutoMeta);
    }
    if (data.containsKey('quantidade')) {
      context.handle(
          _quantidadeMeta,
          quantidade.isAcceptableOrUnknown(
              data['quantidade']!, _quantidadeMeta));
    } else if (isInserting) {
      context.missing(_quantidadeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TabelaStockData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return TabelaStockData.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $TabelaStockTable createAlias(String alias) {
    return $TabelaStockTable(attachedDatabase, alias);
  }
}

class TabelaRececcaoData extends DataClass
    implements Insertable<TabelaRececcaoData> {
  final int id;
  final int estado;
  final int idFuncionario;
  final int idProduto;
  final int quantidade;
  final DateTime data;
  TabelaRececcaoData(
      {required this.id,
      required this.estado,
      required this.idFuncionario,
      required this.idProduto,
      required this.quantidade,
      required this.data});
  factory TabelaRececcaoData.fromData(Map<String, dynamic> data,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return TabelaRececcaoData(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      estado: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}estado'])!,
      idFuncionario: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id_funcionario'])!,
      idProduto: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id_produto'])!,
      quantidade: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}quantidade'])!,
      data: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}data'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['estado'] = Variable<int>(estado);
    map['id_funcionario'] = Variable<int>(idFuncionario);
    map['id_produto'] = Variable<int>(idProduto);
    map['quantidade'] = Variable<int>(quantidade);
    map['data'] = Variable<DateTime>(data);
    return map;
  }

  TabelaRececcaoCompanion toCompanion(bool nullToAbsent) {
    return TabelaRececcaoCompanion(
      id: Value(id),
      estado: Value(estado),
      idFuncionario: Value(idFuncionario),
      idProduto: Value(idProduto),
      quantidade: Value(quantidade),
      data: Value(data),
    );
  }

  factory TabelaRececcaoData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TabelaRececcaoData(
      id: serializer.fromJson<int>(json['id']),
      estado: serializer.fromJson<int>(json['estado']),
      idFuncionario: serializer.fromJson<int>(json['idFuncionario']),
      idProduto: serializer.fromJson<int>(json['idProduto']),
      quantidade: serializer.fromJson<int>(json['quantidade']),
      data: serializer.fromJson<DateTime>(json['data']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'estado': serializer.toJson<int>(estado),
      'idFuncionario': serializer.toJson<int>(idFuncionario),
      'idProduto': serializer.toJson<int>(idProduto),
      'quantidade': serializer.toJson<int>(quantidade),
      'data': serializer.toJson<DateTime>(data),
    };
  }

  TabelaRececcaoData copyWith(
          {int? id,
          int? estado,
          int? idFuncionario,
          int? idProduto,
          int? quantidade,
          DateTime? data}) =>
      TabelaRececcaoData(
        id: id ?? this.id,
        estado: estado ?? this.estado,
        idFuncionario: idFuncionario ?? this.idFuncionario,
        idProduto: idProduto ?? this.idProduto,
        quantidade: quantidade ?? this.quantidade,
        data: data ?? this.data,
      );
  @override
  String toString() {
    return (StringBuffer('TabelaRececcaoData(')
          ..write('id: $id, ')
          ..write('estado: $estado, ')
          ..write('idFuncionario: $idFuncionario, ')
          ..write('idProduto: $idProduto, ')
          ..write('quantidade: $quantidade, ')
          ..write('data: $data')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, estado, idFuncionario, idProduto, quantidade, data);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TabelaRececcaoData &&
          other.id == this.id &&
          other.estado == this.estado &&
          other.idFuncionario == this.idFuncionario &&
          other.idProduto == this.idProduto &&
          other.quantidade == this.quantidade &&
          other.data == this.data);
}

class TabelaRececcaoCompanion extends UpdateCompanion<TabelaRececcaoData> {
  final Value<int> id;
  final Value<int> estado;
  final Value<int> idFuncionario;
  final Value<int> idProduto;
  final Value<int> quantidade;
  final Value<DateTime> data;
  const TabelaRececcaoCompanion({
    this.id = const Value.absent(),
    this.estado = const Value.absent(),
    this.idFuncionario = const Value.absent(),
    this.idProduto = const Value.absent(),
    this.quantidade = const Value.absent(),
    this.data = const Value.absent(),
  });
  TabelaRececcaoCompanion.insert({
    this.id = const Value.absent(),
    required int estado,
    required int idFuncionario,
    required int idProduto,
    required int quantidade,
    required DateTime data,
  })  : estado = Value(estado),
        idFuncionario = Value(idFuncionario),
        idProduto = Value(idProduto),
        quantidade = Value(quantidade),
        data = Value(data);
  static Insertable<TabelaRececcaoData> custom({
    Expression<int>? id,
    Expression<int>? estado,
    Expression<int>? idFuncionario,
    Expression<int>? idProduto,
    Expression<int>? quantidade,
    Expression<DateTime>? data,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (estado != null) 'estado': estado,
      if (idFuncionario != null) 'id_funcionario': idFuncionario,
      if (idProduto != null) 'id_produto': idProduto,
      if (quantidade != null) 'quantidade': quantidade,
      if (data != null) 'data': data,
    });
  }

  TabelaRececcaoCompanion copyWith(
      {Value<int>? id,
      Value<int>? estado,
      Value<int>? idFuncionario,
      Value<int>? idProduto,
      Value<int>? quantidade,
      Value<DateTime>? data}) {
    return TabelaRececcaoCompanion(
      id: id ?? this.id,
      estado: estado ?? this.estado,
      idFuncionario: idFuncionario ?? this.idFuncionario,
      idProduto: idProduto ?? this.idProduto,
      quantidade: quantidade ?? this.quantidade,
      data: data ?? this.data,
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
    if (idFuncionario.present) {
      map['id_funcionario'] = Variable<int>(idFuncionario.value);
    }
    if (idProduto.present) {
      map['id_produto'] = Variable<int>(idProduto.value);
    }
    if (quantidade.present) {
      map['quantidade'] = Variable<int>(quantidade.value);
    }
    if (data.present) {
      map['data'] = Variable<DateTime>(data.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TabelaRececcaoCompanion(')
          ..write('id: $id, ')
          ..write('estado: $estado, ')
          ..write('idFuncionario: $idFuncionario, ')
          ..write('idProduto: $idProduto, ')
          ..write('quantidade: $quantidade, ')
          ..write('data: $data')
          ..write(')'))
        .toString();
  }
}

class $TabelaRececcaoTable extends TabelaRececcao
    with TableInfo<$TabelaRececcaoTable, TabelaRececcaoData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TabelaRececcaoTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _estadoMeta = const VerificationMeta('estado');
  @override
  late final GeneratedColumn<int?> estado = GeneratedColumn<int?>(
      'estado', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _idFuncionarioMeta =
      const VerificationMeta('idFuncionario');
  @override
  late final GeneratedColumn<int?> idFuncionario = GeneratedColumn<int?>(
      'id_funcionario', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _idProdutoMeta = const VerificationMeta('idProduto');
  @override
  late final GeneratedColumn<int?> idProduto = GeneratedColumn<int?>(
      'id_produto', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _quantidadeMeta = const VerificationMeta('quantidade');
  @override
  late final GeneratedColumn<int?> quantidade = GeneratedColumn<int?>(
      'quantidade', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _dataMeta = const VerificationMeta('data');
  @override
  late final GeneratedColumn<DateTime?> data = GeneratedColumn<DateTime?>(
      'data', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, estado, idFuncionario, idProduto, quantidade, data];
  @override
  String get aliasedName => _alias ?? 'tabela_receccao';
  @override
  String get actualTableName => 'tabela_receccao';
  @override
  VerificationContext validateIntegrity(Insertable<TabelaRececcaoData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('estado')) {
      context.handle(_estadoMeta,
          estado.isAcceptableOrUnknown(data['estado']!, _estadoMeta));
    } else if (isInserting) {
      context.missing(_estadoMeta);
    }
    if (data.containsKey('id_funcionario')) {
      context.handle(
          _idFuncionarioMeta,
          idFuncionario.isAcceptableOrUnknown(
              data['id_funcionario']!, _idFuncionarioMeta));
    } else if (isInserting) {
      context.missing(_idFuncionarioMeta);
    }
    if (data.containsKey('id_produto')) {
      context.handle(_idProdutoMeta,
          idProduto.isAcceptableOrUnknown(data['id_produto']!, _idProdutoMeta));
    } else if (isInserting) {
      context.missing(_idProdutoMeta);
    }
    if (data.containsKey('quantidade')) {
      context.handle(
          _quantidadeMeta,
          quantidade.isAcceptableOrUnknown(
              data['quantidade']!, _quantidadeMeta));
    } else if (isInserting) {
      context.missing(_quantidadeMeta);
    }
    if (data.containsKey('data')) {
      context.handle(
          _dataMeta, this.data.isAcceptableOrUnknown(data['data']!, _dataMeta));
    } else if (isInserting) {
      context.missing(_dataMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TabelaRececcaoData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return TabelaRececcaoData.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $TabelaRececcaoTable createAlias(String alias) {
    return $TabelaRececcaoTable(attachedDatabase, alias);
  }
}

abstract class _$BancoDados extends GeneratedDatabase {
  _$BancoDados(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $TabelaUsuarioTable tabelaUsuario = $TabelaUsuarioTable(this);
  late final $TabelaFuncionarioTable tabelaFuncionario =
      $TabelaFuncionarioTable(this);
  late final $TabelaProdutoTable tabelaProduto = $TabelaProdutoTable(this);
  late final $TabelaPrecoTable tabelaPreco = $TabelaPrecoTable(this);
  late final $TabelaVendaTable tabelaVenda = $TabelaVendaTable(this);
  late final $TabelaItemVendaTable tabelaItemVenda =
      $TabelaItemVendaTable(this);
  late final $TabelaEntradaTable tabelaEntrada = $TabelaEntradaTable(this);
  late final $TabelaSaidaTable tabelaSaida = $TabelaSaidaTable(this);
  late final $TabelaStockTable tabelaStock = $TabelaStockTable(this);
  late final $TabelaRececcaoTable tabelaRececcao = $TabelaRececcaoTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        tabelaUsuario,
        tabelaFuncionario,
        tabelaProduto,
        tabelaPreco,
        tabelaVenda,
        tabelaItemVenda,
        tabelaEntrada,
        tabelaSaida,
        tabelaStock,
        tabelaRececcao
      ];
}

// **************************************************************************
// DaoGenerator
// **************************************************************************

mixin _$UsuarioDaoMixin on DatabaseAccessor<BancoDados> {
  $TabelaUsuarioTable get tabelaUsuario => attachedDatabase.tabelaUsuario;
}
mixin _$StockDaoMixin on DatabaseAccessor<BancoDados> {
  $TabelaStockTable get tabelaStock => attachedDatabase.tabelaStock;
}
mixin _$RececcaoDaoMixin on DatabaseAccessor<BancoDados> {
  $TabelaRececcaoTable get tabelaRececcao => attachedDatabase.tabelaRececcao;
  $TabelaProdutoTable get tabelaProduto => attachedDatabase.tabelaProduto;
  $TabelaFuncionarioTable get tabelaFuncionario =>
      attachedDatabase.tabelaFuncionario;
}
mixin _$EntradaDaoMixin on DatabaseAccessor<BancoDados> {
  $TabelaEntradaTable get tabelaEntrada => attachedDatabase.tabelaEntrada;
  $TabelaProdutoTable get tabelaProduto => attachedDatabase.tabelaProduto;
}
mixin _$SaidaDaoMixin on DatabaseAccessor<BancoDados> {
  $TabelaSaidaTable get tabelaSaida => attachedDatabase.tabelaSaida;
  $TabelaProdutoTable get tabelaProduto => attachedDatabase.tabelaProduto;
}
mixin _$ProdutoDaoMixin on DatabaseAccessor<BancoDados> {
  $TabelaProdutoTable get tabelaProduto => attachedDatabase.tabelaProduto;
  $TabelaStockTable get tabelaStock => attachedDatabase.tabelaStock;
  $TabelaPrecoTable get tabelaPreco => attachedDatabase.tabelaPreco;
}
mixin _$FuncionarioDaoMixin on DatabaseAccessor<BancoDados> {
  $TabelaFuncionarioTable get tabelaFuncionario =>
      attachedDatabase.tabelaFuncionario;
  $TabelaUsuarioTable get tabelaUsuario => attachedDatabase.tabelaUsuario;
}
