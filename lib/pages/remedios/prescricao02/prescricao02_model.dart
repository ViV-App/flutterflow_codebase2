import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/components/prescription_added/prescription_added_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'prescricao02_widget.dart' show Prescricao02Widget;
import 'package:flutter/material.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class Prescricao02Model extends FlutterFlowModel<Prescricao02Widget> {
  ///  Local state fields for this page.

  List<int> list = [0];
  void addToList(int item) => list.add(item);
  void removeFromList(int item) => list.remove(item);
  void removeAtIndexFromList(int index) => list.removeAt(index);
  void insertAtIndexInList(int index, int item) => list.insert(index, item);
  void updateListAtIndex(int index, Function(int) updateFn) =>
      list[index] = updateFn(list[index]);

  List<String> shot = [];
  void addToShot(String item) => shot.add(item);
  void removeFromShot(String item) => shot.remove(item);
  void removeAtIndexFromShot(int index) => shot.removeAt(index);
  void insertAtIndexInShot(int index, String item) => shot.insert(index, item);
  void updateShotAtIndex(int index, Function(String) updateFn) =>
      shot[index] = updateFn(shot[index]);

  List<DateTime> horario = [];
  void addToHorario(DateTime item) => horario.add(item);
  void removeFromHorario(DateTime item) => horario.remove(item);
  void removeAtIndexFromHorario(int index) => horario.removeAt(index);
  void insertAtIndexInHorario(int index, DateTime item) =>
      horario.insert(index, item);
  void updateHorarioAtIndex(int index, Function(DateTime) updateFn) =>
      horario[index] = updateFn(horario[index]);

  DateTime? date;

  List<dynamic> dosagens = [];
  void addToDosagens(dynamic item) => dosagens.add(item);
  void removeFromDosagens(dynamic item) => dosagens.remove(item);
  void removeAtIndexFromDosagens(int index) => dosagens.removeAt(index);
  void insertAtIndexInDosagens(int index, dynamic item) =>
      dosagens.insert(index, item);
  void updateDosagensAtIndex(int index, Function(dynamic) updateFn) =>
      dosagens[index] = updateFn(dosagens[index]);

  int indx = 0;

  int indx2 = 1;

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  DateTime? datePicked;
  // State field(s) for Switch widget.
  bool? switchValue;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  StaticMedicamentosRow? newMed;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<StaticMedicamentosRow>? selectedMed;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();
  }

  /// Action blocks.
  Future createPrescription(
    BuildContext context, {
    StaticMedicamentosRow? remedio,
    List<dynamic>? doses,
  }) async {
    if (switchValue == true) {
      await PrescricaoTable().insert({
        'horarios': supaSerializeList<DateTime>(
            FFAppState().horarios.map((e) => e.horario).withoutNulls.toList()),
        'medicamento': remedio?.id,
        'duracao_dias': FFAppState().prescricao.duracaoDias,
        'date_start': supaSerialize<DateTime>(date),
        'continuo': true,
        'paciente': FFAppState().paciente.id,
        'concentracao': int.tryParse(textController2.text),
        'doses': functions.convertHorarioToJson(FFAppState().horarios.toList()),
      });
      FFAppState().clearRemediosCache();
      await showDialog(
        barrierDismissible: false,
        context: context,
        builder: (dialogContext) {
          return Dialog(
            elevation: 0,
            insetPadding: EdgeInsets.zero,
            backgroundColor: Colors.transparent,
            alignment: const AlignmentDirectional(0.0, -1.0)
                .resolve(Directionality.of(context)),
            child: WebViewAware(
              child: GestureDetector(
                onTap: () => FocusScope.of(dialogContext).unfocus(),
                child: const PrescriptionAddedWidget(),
              ),
            ),
          );
        },
      );
    } else {
      await PrescricaoTable().insert({
        'horarios': supaSerializeList<DateTime>(
            FFAppState().horarios.map((e) => e.horario).withoutNulls.toList()),
        'medicamento': remedio?.id,
        'duracao_dias': FFAppState().prescricao.duracaoDias,
        'date_start': supaSerialize<DateTime>(date),
        'date_end': supaSerialize<DateTime>(functions.getFinalDate(
            date!, FFAppState().prescricao.duracaoDias - 1)),
        'continuo': false,
        'paciente': FFAppState().paciente.id,
        'concentracao': int.tryParse(textController2.text),
        'doses': functions.convertHorarioToJson(FFAppState().horarios.toList()),
      });
      FFAppState().clearRemediosCache();
      await showDialog(
        barrierDismissible: false,
        context: context,
        builder: (dialogContext) {
          return Dialog(
            elevation: 0,
            insetPadding: EdgeInsets.zero,
            backgroundColor: Colors.transparent,
            alignment: const AlignmentDirectional(0.0, -1.0)
                .resolve(Directionality.of(context)),
            child: WebViewAware(
              child: GestureDetector(
                onTap: () => FocusScope.of(dialogContext).unfocus(),
                child: const PrescriptionAddedWidget(),
              ),
            ),
          );
        },
      );
    }
  }

  Future createDoses(
    BuildContext context, {
    StaticMedicamentosRow? remedio,
  }) async {
    while (indx2 <= FFAppState().horarios.length) {
      addToDosagens(FFAppState().horarios[indx].toMap());
      indx = indx + 1;
      indx2 = indx2 + 1;
    }
    FFAppState().updatePacienteStruct(
      (e) => e..id = FFAppState().paciente.id,
    );
    FFAppState().update(() {});
    await Future.delayed(const Duration(milliseconds: 3000));
    await CreatePrescriptionCall.call(
      dosesJson: dosagens,
    );
  }
}
