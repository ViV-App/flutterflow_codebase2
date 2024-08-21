import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import '/backend/schema/structs/index.dart';
import 'backend/supabase/supabase.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      if (prefs.containsKey('ff_paciente')) {
        try {
          final serializedData = prefs.getString('ff_paciente') ?? '{}';
          _paciente =
              PacienteStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    _safeInit(() {
      _onboardingHomePage =
          prefs.getInt('ff_onboardingHomePage') ?? _onboardingHomePage;
    });
    _safeInit(() {
      _ultimoRegistroDiario = prefs.containsKey('ff_ultimoRegistroDiario')
          ? DateTime.fromMillisecondsSinceEpoch(
              prefs.getInt('ff_ultimoRegistroDiario')!)
          : _ultimoRegistroDiario;
    });
    _safeInit(() {
      _userRef = prefs.getString('ff_userRef') ?? _userRef;
    });
    _safeInit(() {
      if (prefs.containsKey('ff_fluxoConversa')) {
        try {
          final serializedData = prefs.getString('ff_fluxoConversa') ?? '{}';
          _fluxoConversa = FluxoConversacionalStruct.fromSerializableMap(
              jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  PacienteStruct _paciente = PacienteStruct();
  PacienteStruct get paciente => _paciente;
  set paciente(PacienteStruct value) {
    _paciente = value;
    prefs.setString('ff_paciente', value.serialize());
  }

  void updatePacienteStruct(Function(PacienteStruct) updateFn) {
    updateFn(_paciente);
    prefs.setString('ff_paciente', _paciente.serialize());
  }

  PrescricaoStruct _prescricao = PrescricaoStruct();
  PrescricaoStruct get prescricao => _prescricao;
  set prescricao(PrescricaoStruct value) {
    _prescricao = value;
  }

  void updatePrescricaoStruct(Function(PrescricaoStruct) updateFn) {
    updateFn(_prescricao);
  }

  int _onboardingHomePage = 0;
  int get onboardingHomePage => _onboardingHomePage;
  set onboardingHomePage(int value) {
    _onboardingHomePage = value;
    prefs.setInt('ff_onboardingHomePage', value);
  }

  DateTime? _ultimoRegistroDiario =
      DateTime.fromMillisecondsSinceEpoch(1717333560000);
  DateTime? get ultimoRegistroDiario => _ultimoRegistroDiario;
  set ultimoRegistroDiario(DateTime? value) {
    _ultimoRegistroDiario = value;
    value != null
        ? prefs.setInt('ff_ultimoRegistroDiario', value.millisecondsSinceEpoch)
        : prefs.remove('ff_ultimoRegistroDiario');
  }

  String _userRef = '';
  String get userRef => _userRef;
  set userRef(String value) {
    _userRef = value;
    prefs.setString('ff_userRef', value);
  }

  List<HorariosStruct> _horarios = [];
  List<HorariosStruct> get horarios => _horarios;
  set horarios(List<HorariosStruct> value) {
    _horarios = value;
  }

  void addToHorarios(HorariosStruct value) {
    horarios.add(value);
  }

  void removeFromHorarios(HorariosStruct value) {
    horarios.remove(value);
  }

  void removeAtIndexFromHorarios(int index) {
    horarios.removeAt(index);
  }

  void updateHorariosAtIndex(
    int index,
    HorariosStruct Function(HorariosStruct) updateFn,
  ) {
    horarios[index] = updateFn(_horarios[index]);
  }

  void insertAtIndexInHorarios(int index, HorariosStruct value) {
    horarios.insert(index, value);
  }

  FluxoConversacionalStruct _fluxoConversa = FluxoConversacionalStruct();
  FluxoConversacionalStruct get fluxoConversa => _fluxoConversa;
  set fluxoConversa(FluxoConversacionalStruct value) {
    _fluxoConversa = value;
    prefs.setString('ff_fluxoConversa', value.serialize());
  }

  void updateFluxoConversaStruct(Function(FluxoConversacionalStruct) updateFn) {
    updateFn(_fluxoConversa);
    prefs.setString('ff_fluxoConversa', _fluxoConversa.serialize());
  }

  bool _menuChatOpen = false;
  bool get menuChatOpen => _menuChatOpen;
  set menuChatOpen(bool value) {
    _menuChatOpen = value;
  }

  List<RespostaQuestStruct> _respostasQuests = [];
  List<RespostaQuestStruct> get respostasQuests => _respostasQuests;
  set respostasQuests(List<RespostaQuestStruct> value) {
    _respostasQuests = value;
  }

  void addToRespostasQuests(RespostaQuestStruct value) {
    respostasQuests.add(value);
  }

  void removeFromRespostasQuests(RespostaQuestStruct value) {
    respostasQuests.remove(value);
  }

  void removeAtIndexFromRespostasQuests(int index) {
    respostasQuests.removeAt(index);
  }

  void updateRespostasQuestsAtIndex(
    int index,
    RespostaQuestStruct Function(RespostaQuestStruct) updateFn,
  ) {
    respostasQuests[index] = updateFn(_respostasQuests[index]);
  }

  void insertAtIndexInRespostasQuests(int index, RespostaQuestStruct value) {
    respostasQuests.insert(index, value);
  }

  final _remediosManager = FutureRequestManager<List<MeusMedicamentosRow>>();
  Future<List<MeusMedicamentosRow>> remedios({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<MeusMedicamentosRow>> Function() requestFn,
  }) =>
      _remediosManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearRemediosCache() => _remediosManager.clear();
  void clearRemediosCacheKey(String? uniqueKey) =>
      _remediosManager.clearRequest(uniqueKey);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
