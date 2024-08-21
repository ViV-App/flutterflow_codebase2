// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BipVigenteStruct extends BaseStruct {
  BipVigenteStruct({
    int? qntdBipAssinatura,
    int? qntdBipAddon,
    int? qntdDisponivel,
  })  : _qntdBipAssinatura = qntdBipAssinatura,
        _qntdBipAddon = qntdBipAddon,
        _qntdDisponivel = qntdDisponivel;

  // "qntdBipAssinatura" field.
  int? _qntdBipAssinatura;
  int get qntdBipAssinatura => _qntdBipAssinatura ?? 0;
  set qntdBipAssinatura(int? val) => _qntdBipAssinatura = val;

  void incrementQntdBipAssinatura(int amount) =>
      qntdBipAssinatura = qntdBipAssinatura + amount;

  bool hasQntdBipAssinatura() => _qntdBipAssinatura != null;

  // "qntdBipAddon" field.
  int? _qntdBipAddon;
  int get qntdBipAddon => _qntdBipAddon ?? 0;
  set qntdBipAddon(int? val) => _qntdBipAddon = val;

  void incrementQntdBipAddon(int amount) =>
      qntdBipAddon = qntdBipAddon + amount;

  bool hasQntdBipAddon() => _qntdBipAddon != null;

  // "qntdDisponivel" field.
  int? _qntdDisponivel;
  int get qntdDisponivel => _qntdDisponivel ?? 0;
  set qntdDisponivel(int? val) => _qntdDisponivel = val;

  void incrementQntdDisponivel(int amount) =>
      qntdDisponivel = qntdDisponivel + amount;

  bool hasQntdDisponivel() => _qntdDisponivel != null;

  static BipVigenteStruct fromMap(Map<String, dynamic> data) =>
      BipVigenteStruct(
        qntdBipAssinatura: castToType<int>(data['qntdBipAssinatura']),
        qntdBipAddon: castToType<int>(data['qntdBipAddon']),
        qntdDisponivel: castToType<int>(data['qntdDisponivel']),
      );

  static BipVigenteStruct? maybeFromMap(dynamic data) => data is Map
      ? BipVigenteStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'qntdBipAssinatura': _qntdBipAssinatura,
        'qntdBipAddon': _qntdBipAddon,
        'qntdDisponivel': _qntdDisponivel,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'qntdBipAssinatura': serializeParam(
          _qntdBipAssinatura,
          ParamType.int,
        ),
        'qntdBipAddon': serializeParam(
          _qntdBipAddon,
          ParamType.int,
        ),
        'qntdDisponivel': serializeParam(
          _qntdDisponivel,
          ParamType.int,
        ),
      }.withoutNulls;

  static BipVigenteStruct fromSerializableMap(Map<String, dynamic> data) =>
      BipVigenteStruct(
        qntdBipAssinatura: deserializeParam(
          data['qntdBipAssinatura'],
          ParamType.int,
          false,
        ),
        qntdBipAddon: deserializeParam(
          data['qntdBipAddon'],
          ParamType.int,
          false,
        ),
        qntdDisponivel: deserializeParam(
          data['qntdDisponivel'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'BipVigenteStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is BipVigenteStruct &&
        qntdBipAssinatura == other.qntdBipAssinatura &&
        qntdBipAddon == other.qntdBipAddon &&
        qntdDisponivel == other.qntdDisponivel;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([qntdBipAssinatura, qntdBipAddon, qntdDisponivel]);
}

BipVigenteStruct createBipVigenteStruct({
  int? qntdBipAssinatura,
  int? qntdBipAddon,
  int? qntdDisponivel,
}) =>
    BipVigenteStruct(
      qntdBipAssinatura: qntdBipAssinatura,
      qntdBipAddon: qntdBipAddon,
      qntdDisponivel: qntdDisponivel,
    );
