// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PacienteStruct extends BaseStruct {
  PacienteStruct({
    int? id,
    String? uuid,
    DateTime? createdAt,
    String? nome,
    String? telefone,
    String? cpf,
    List<String>? queixas,
    List<String>? contraIndicacoes,
    String? foto,
    bool? perfilCompleto,
    double? peso,
    double? altura,
    MedicoStruct? medico,
  })  : _id = id,
        _uuid = uuid,
        _createdAt = createdAt,
        _nome = nome,
        _telefone = telefone,
        _cpf = cpf,
        _queixas = queixas,
        _contraIndicacoes = contraIndicacoes,
        _foto = foto,
        _perfilCompleto = perfilCompleto,
        _peso = peso,
        _altura = altura,
        _medico = medico;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "uuid" field.
  String? _uuid;
  String get uuid => _uuid ?? '';
  set uuid(String? val) => _uuid = val;

  bool hasUuid() => _uuid != null;

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

  // "telefone" field.
  String? _telefone;
  String get telefone => _telefone ?? '';
  set telefone(String? val) => _telefone = val;

  bool hasTelefone() => _telefone != null;

  // "cpf" field.
  String? _cpf;
  String get cpf => _cpf ?? '';
  set cpf(String? val) => _cpf = val;

  bool hasCpf() => _cpf != null;

  // "queixas" field.
  List<String>? _queixas;
  List<String> get queixas => _queixas ?? const [];
  set queixas(List<String>? val) => _queixas = val;

  void updateQueixas(Function(List<String>) updateFn) {
    updateFn(queixas ??= []);
  }

  bool hasQueixas() => _queixas != null;

  // "contra_indicacoes" field.
  List<String>? _contraIndicacoes;
  List<String> get contraIndicacoes => _contraIndicacoes ?? const [];
  set contraIndicacoes(List<String>? val) => _contraIndicacoes = val;

  void updateContraIndicacoes(Function(List<String>) updateFn) {
    updateFn(contraIndicacoes ??= []);
  }

  bool hasContraIndicacoes() => _contraIndicacoes != null;

  // "foto" field.
  String? _foto;
  String get foto => _foto ?? '';
  set foto(String? val) => _foto = val;

  bool hasFoto() => _foto != null;

  // "perfil_completo" field.
  bool? _perfilCompleto;
  bool get perfilCompleto => _perfilCompleto ?? false;
  set perfilCompleto(bool? val) => _perfilCompleto = val;

  bool hasPerfilCompleto() => _perfilCompleto != null;

  // "peso" field.
  double? _peso;
  double get peso => _peso ?? 0.0;
  set peso(double? val) => _peso = val;

  void incrementPeso(double amount) => peso = peso + amount;

  bool hasPeso() => _peso != null;

  // "altura" field.
  double? _altura;
  double get altura => _altura ?? 0.0;
  set altura(double? val) => _altura = val;

  void incrementAltura(double amount) => altura = altura + amount;

  bool hasAltura() => _altura != null;

  // "medico" field.
  MedicoStruct? _medico;
  MedicoStruct get medico => _medico ?? MedicoStruct();
  set medico(MedicoStruct? val) => _medico = val;

  void updateMedico(Function(MedicoStruct) updateFn) {
    updateFn(medico ??= MedicoStruct());
  }

  bool hasMedico() => _medico != null;

  static PacienteStruct fromMap(Map<String, dynamic> data) => PacienteStruct(
        id: castToType<int>(data['id']),
        uuid: data['uuid'] as String?,
        createdAt: data['created_at'] as DateTime?,
        nome: data['nome'] as String?,
        telefone: data['telefone'] as String?,
        cpf: data['cpf'] as String?,
        queixas: getDataList(data['queixas']),
        contraIndicacoes: getDataList(data['contra_indicacoes']),
        foto: data['foto'] as String?,
        perfilCompleto: data['perfil_completo'] as bool?,
        peso: castToType<double>(data['peso']),
        altura: castToType<double>(data['altura']),
        medico: MedicoStruct.maybeFromMap(data['medico']),
      );

  static PacienteStruct? maybeFromMap(dynamic data) =>
      data is Map ? PacienteStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'uuid': _uuid,
        'created_at': _createdAt,
        'nome': _nome,
        'telefone': _telefone,
        'cpf': _cpf,
        'queixas': _queixas,
        'contra_indicacoes': _contraIndicacoes,
        'foto': _foto,
        'perfil_completo': _perfilCompleto,
        'peso': _peso,
        'altura': _altura,
        'medico': _medico?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'uuid': serializeParam(
          _uuid,
          ParamType.String,
        ),
        'created_at': serializeParam(
          _createdAt,
          ParamType.DateTime,
        ),
        'nome': serializeParam(
          _nome,
          ParamType.String,
        ),
        'telefone': serializeParam(
          _telefone,
          ParamType.String,
        ),
        'cpf': serializeParam(
          _cpf,
          ParamType.String,
        ),
        'queixas': serializeParam(
          _queixas,
          ParamType.String,
          isList: true,
        ),
        'contra_indicacoes': serializeParam(
          _contraIndicacoes,
          ParamType.String,
          isList: true,
        ),
        'foto': serializeParam(
          _foto,
          ParamType.String,
        ),
        'perfil_completo': serializeParam(
          _perfilCompleto,
          ParamType.bool,
        ),
        'peso': serializeParam(
          _peso,
          ParamType.double,
        ),
        'altura': serializeParam(
          _altura,
          ParamType.double,
        ),
        'medico': serializeParam(
          _medico,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static PacienteStruct fromSerializableMap(Map<String, dynamic> data) =>
      PacienteStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        uuid: deserializeParam(
          data['uuid'],
          ParamType.String,
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
        telefone: deserializeParam(
          data['telefone'],
          ParamType.String,
          false,
        ),
        cpf: deserializeParam(
          data['cpf'],
          ParamType.String,
          false,
        ),
        queixas: deserializeParam<String>(
          data['queixas'],
          ParamType.String,
          true,
        ),
        contraIndicacoes: deserializeParam<String>(
          data['contra_indicacoes'],
          ParamType.String,
          true,
        ),
        foto: deserializeParam(
          data['foto'],
          ParamType.String,
          false,
        ),
        perfilCompleto: deserializeParam(
          data['perfil_completo'],
          ParamType.bool,
          false,
        ),
        peso: deserializeParam(
          data['peso'],
          ParamType.double,
          false,
        ),
        altura: deserializeParam(
          data['altura'],
          ParamType.double,
          false,
        ),
        medico: deserializeStructParam(
          data['medico'],
          ParamType.DataStruct,
          false,
          structBuilder: MedicoStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'PacienteStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is PacienteStruct &&
        id == other.id &&
        uuid == other.uuid &&
        createdAt == other.createdAt &&
        nome == other.nome &&
        telefone == other.telefone &&
        cpf == other.cpf &&
        listEquality.equals(queixas, other.queixas) &&
        listEquality.equals(contraIndicacoes, other.contraIndicacoes) &&
        foto == other.foto &&
        perfilCompleto == other.perfilCompleto &&
        peso == other.peso &&
        altura == other.altura &&
        medico == other.medico;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        uuid,
        createdAt,
        nome,
        telefone,
        cpf,
        queixas,
        contraIndicacoes,
        foto,
        perfilCompleto,
        peso,
        altura,
        medico
      ]);
}

PacienteStruct createPacienteStruct({
  int? id,
  String? uuid,
  DateTime? createdAt,
  String? nome,
  String? telefone,
  String? cpf,
  String? foto,
  bool? perfilCompleto,
  double? peso,
  double? altura,
  MedicoStruct? medico,
}) =>
    PacienteStruct(
      id: id,
      uuid: uuid,
      createdAt: createdAt,
      nome: nome,
      telefone: telefone,
      cpf: cpf,
      foto: foto,
      perfilCompleto: perfilCompleto,
      peso: peso,
      altura: altura,
      medico: medico ?? MedicoStruct(),
    );
