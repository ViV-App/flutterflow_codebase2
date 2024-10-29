// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MedicoStruct extends BaseStruct {
  MedicoStruct({
    int? id,
    DateTime? createdAt,
    String? nome,
    String? crm,
    String? uf,
  })  : _id = id,
        _createdAt = createdAt,
        _nome = nome,
        _crm = crm,
        _uf = uf;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  set createdAt(DateTime? val) => _createdAt = val;

  bool hasCreatedAt() => _createdAt != null;

  // "nome" field.
  String? _nome;
  String get nome => _nome ?? '';
  set nome(String? val) => _nome = val;

  bool hasNome() => _nome != null;

  // "crm" field.
  String? _crm;
  String get crm => _crm ?? '';
  set crm(String? val) => _crm = val;

  bool hasCrm() => _crm != null;

  // "uf" field.
  String? _uf;
  String get uf => _uf ?? '';
  set uf(String? val) => _uf = val;

  bool hasUf() => _uf != null;

  static MedicoStruct fromMap(Map<String, dynamic> data) => MedicoStruct(
        id: castToType<int>(data['id']),
        createdAt: data['created_at'] as DateTime?,
        nome: data['nome'] as String?,
        crm: data['crm'] as String?,
        uf: data['uf'] as String?,
      );

  static MedicoStruct? maybeFromMap(dynamic data) =>
      data is Map ? MedicoStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'created_at': _createdAt,
        'nome': _nome,
        'crm': _crm,
        'uf': _uf,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'created_at': serializeParam(
          _createdAt,
          ParamType.DateTime,
        ),
        'nome': serializeParam(
          _nome,
          ParamType.String,
        ),
        'crm': serializeParam(
          _crm,
          ParamType.String,
        ),
        'uf': serializeParam(
          _uf,
          ParamType.String,
        ),
      }.withoutNulls;

  static MedicoStruct fromSerializableMap(Map<String, dynamic> data) =>
      MedicoStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        createdAt: deserializeParam(
          data['created_at'],
          ParamType.DateTime,
          false,
        ),
        nome: deserializeParam(
          data['nome'],
          ParamType.String,
          false,
        ),
        crm: deserializeParam(
          data['crm'],
          ParamType.String,
          false,
        ),
        uf: deserializeParam(
          data['uf'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'MedicoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is MedicoStruct &&
        id == other.id &&
        createdAt == other.createdAt &&
        nome == other.nome &&
        crm == other.crm &&
        uf == other.uf;
  }

  @override
  int get hashCode => const ListEquality().hash([id, createdAt, nome, crm, uf]);
}

MedicoStruct createMedicoStruct({
  int? id,
  DateTime? createdAt,
  String? nome,
  String? crm,
  String? uf,
}) =>
    MedicoStruct(
      id: id,
      createdAt: createdAt,
      nome: nome,
      crm: crm,
      uf: uf,
    );
