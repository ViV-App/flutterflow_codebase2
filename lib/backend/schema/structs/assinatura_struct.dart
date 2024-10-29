// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AssinaturaStruct extends BaseStruct {
  AssinaturaStruct({
    int? assinaturaId,
    int? plano,
    String? status,
    bool? registroBemViver,
    bool? registroAlertasMedicamento,
    String? evolucaoBemViver,
    bool? acessoAssistente,
    int? bipMensal,
    BipVigenteStruct? bipVigente,
  })  : _assinaturaId = assinaturaId,
        _plano = plano,
        _status = status,
        _registroBemViver = registroBemViver,
        _registroAlertasMedicamento = registroAlertasMedicamento,
        _evolucaoBemViver = evolucaoBemViver,
        _acessoAssistente = acessoAssistente,
        _bipMensal = bipMensal,
        _bipVigente = bipVigente;

  // "assinaturaId" field.
  int? _assinaturaId;
  int get assinaturaId => _assinaturaId ?? 0;
  set assinaturaId(int? val) => _assinaturaId = val;

  void incrementAssinaturaId(int amount) =>
      assinaturaId = assinaturaId + amount;

  bool hasAssinaturaId() => _assinaturaId != null;

  // "plano" field.
  int? _plano;
  int get plano => _plano ?? 0;
  set plano(int? val) => _plano = val;

  void incrementPlano(int amount) => plano = plano + amount;

  bool hasPlano() => _plano != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  set status(String? val) => _status = val;

  bool hasStatus() => _status != null;

  // "registroBemViver" field.
  bool? _registroBemViver;
  bool get registroBemViver => _registroBemViver ?? false;
  set registroBemViver(bool? val) => _registroBemViver = val;

  bool hasRegistroBemViver() => _registroBemViver != null;

  // "registroAlertasMedicamento" field.
  bool? _registroAlertasMedicamento;
  bool get registroAlertasMedicamento => _registroAlertasMedicamento ?? false;
  set registroAlertasMedicamento(bool? val) =>
      _registroAlertasMedicamento = val;

  bool hasRegistroAlertasMedicamento() => _registroAlertasMedicamento != null;

  // "evolucaoBemViver" field.
  String? _evolucaoBemViver;
  String get evolucaoBemViver => _evolucaoBemViver ?? '';
  set evolucaoBemViver(String? val) => _evolucaoBemViver = val;

  bool hasEvolucaoBemViver() => _evolucaoBemViver != null;

  // "acessoAssistente" field.
  bool? _acessoAssistente;
  bool get acessoAssistente => _acessoAssistente ?? false;
  set acessoAssistente(bool? val) => _acessoAssistente = val;

  bool hasAcessoAssistente() => _acessoAssistente != null;

  // "bipMensal" field.
  int? _bipMensal;
  int get bipMensal => _bipMensal ?? 0;
  set bipMensal(int? val) => _bipMensal = val;

  void incrementBipMensal(int amount) => bipMensal = bipMensal + amount;

  bool hasBipMensal() => _bipMensal != null;

  // "bipVigente" field.
  BipVigenteStruct? _bipVigente;
  BipVigenteStruct get bipVigente => _bipVigente ?? BipVigenteStruct();
  set bipVigente(BipVigenteStruct? val) => _bipVigente = val;

  void updateBipVigente(Function(BipVigenteStruct) updateFn) {
    updateFn(_bipVigente ??= BipVigenteStruct());
  }

  bool hasBipVigente() => _bipVigente != null;

  static AssinaturaStruct fromMap(Map<String, dynamic> data) =>
      AssinaturaStruct(
        assinaturaId: castToType<int>(data['assinaturaId']),
        plano: castToType<int>(data['plano']),
        status: data['status'] as String?,
        registroBemViver: data['registroBemViver'] as bool?,
        registroAlertasMedicamento: data['registroAlertasMedicamento'] as bool?,
        evolucaoBemViver: data['evolucaoBemViver'] as String?,
        acessoAssistente: data['acessoAssistente'] as bool?,
        bipMensal: castToType<int>(data['bipMensal']),
        bipVigente: BipVigenteStruct.maybeFromMap(data['bipVigente']),
      );

  static AssinaturaStruct? maybeFromMap(dynamic data) => data is Map
      ? AssinaturaStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'assinaturaId': _assinaturaId,
        'plano': _plano,
        'status': _status,
        'registroBemViver': _registroBemViver,
        'registroAlertasMedicamento': _registroAlertasMedicamento,
        'evolucaoBemViver': _evolucaoBemViver,
        'acessoAssistente': _acessoAssistente,
        'bipMensal': _bipMensal,
        'bipVigente': _bipVigente?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'assinaturaId': serializeParam(
          _assinaturaId,
          ParamType.int,
        ),
        'plano': serializeParam(
          _plano,
          ParamType.int,
        ),
        'status': serializeParam(
          _status,
          ParamType.String,
        ),
        'registroBemViver': serializeParam(
          _registroBemViver,
          ParamType.bool,
        ),
        'registroAlertasMedicamento': serializeParam(
          _registroAlertasMedicamento,
          ParamType.bool,
        ),
        'evolucaoBemViver': serializeParam(
          _evolucaoBemViver,
          ParamType.String,
        ),
        'acessoAssistente': serializeParam(
          _acessoAssistente,
          ParamType.bool,
        ),
        'bipMensal': serializeParam(
          _bipMensal,
          ParamType.int,
        ),
        'bipVigente': serializeParam(
          _bipVigente,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static AssinaturaStruct fromSerializableMap(Map<String, dynamic> data) =>
      AssinaturaStruct(
        assinaturaId: deserializeParam(
          data['assinaturaId'],
          ParamType.int,
          false,
        ),
        plano: deserializeParam(
          data['plano'],
          ParamType.int,
          false,
        ),
        status: deserializeParam(
          data['status'],
          ParamType.String,
          false,
        ),
        registroBemViver: deserializeParam(
          data['registroBemViver'],
          ParamType.bool,
          false,
        ),
        registroAlertasMedicamento: deserializeParam(
          data['registroAlertasMedicamento'],
          ParamType.bool,
          false,
        ),
        evolucaoBemViver: deserializeParam(
          data['evolucaoBemViver'],
          ParamType.String,
          false,
        ),
        acessoAssistente: deserializeParam(
          data['acessoAssistente'],
          ParamType.bool,
          false,
        ),
        bipMensal: deserializeParam(
          data['bipMensal'],
          ParamType.int,
          false,
        ),
        bipVigente: deserializeStructParam(
          data['bipVigente'],
          ParamType.DataStruct,
          false,
          structBuilder: BipVigenteStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'AssinaturaStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AssinaturaStruct &&
        assinaturaId == other.assinaturaId &&
        plano == other.plano &&
        status == other.status &&
        registroBemViver == other.registroBemViver &&
        registroAlertasMedicamento == other.registroAlertasMedicamento &&
        evolucaoBemViver == other.evolucaoBemViver &&
        acessoAssistente == other.acessoAssistente &&
        bipMensal == other.bipMensal &&
        bipVigente == other.bipVigente;
  }

  @override
  int get hashCode => const ListEquality().hash([
        assinaturaId,
        plano,
        status,
        registroBemViver,
        registroAlertasMedicamento,
        evolucaoBemViver,
        acessoAssistente,
        bipMensal,
        bipVigente
      ]);
}

AssinaturaStruct createAssinaturaStruct({
  int? assinaturaId,
  int? plano,
  String? status,
  bool? registroBemViver,
  bool? registroAlertasMedicamento,
  String? evolucaoBemViver,
  bool? acessoAssistente,
  int? bipMensal,
  BipVigenteStruct? bipVigente,
}) =>
    AssinaturaStruct(
      assinaturaId: assinaturaId,
      plano: plano,
      status: status,
      registroBemViver: registroBemViver,
      registroAlertasMedicamento: registroAlertasMedicamento,
      evolucaoBemViver: evolucaoBemViver,
      acessoAssistente: acessoAssistente,
      bipMensal: bipMensal,
      bipVigente: bipVigente ?? BipVigenteStruct(),
    );
