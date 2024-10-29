import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components/custom_date_picker_widget.dart';
import '/components/delete_prescription/delete_prescription_widget.dart';
import '/components/duracao_dias/duracao_dias_widget.dart';
import '/components/horario_prescricao/horario_prescricao_widget.dart';
import '/components/prescription_edited/prescription_edited_widget.dart';
import '/components/remedio_card/remedio_card_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'edit_prescription_widget.dart' show EditPrescriptionWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class EditPrescriptionModel extends FlutterFlowModel<EditPrescriptionWidget> {
  ///  Local state fields for this component.

  List<HorariosStruct> timeslots = [];
  void addToTimeslots(HorariosStruct item) => timeslots.add(item);
  void removeFromTimeslots(HorariosStruct item) => timeslots.remove(item);
  void removeAtIndexFromTimeslots(int index) => timeslots.removeAt(index);
  void insertAtIndexInTimeslots(int index, HorariosStruct item) =>
      timeslots.insert(index, item);
  void updateTimeslotsAtIndex(int index, Function(HorariosStruct) updateFn) =>
      timeslots[index] = updateFn(timeslots[index]);

  int nvar = 0;

  bool alterado = false;

  List<dynamic> dats = [];
  void addToDats(dynamic item) => dats.add(item);
  void removeFromDats(dynamic item) => dats.remove(item);
  void removeAtIndexFromDats(int index) => dats.removeAt(index);
  void insertAtIndexInDats(int index, dynamic item) => dats.insert(index, item);
  void updateDatsAtIndex(int index, Function(dynamic) updateFn) =>
      dats[index] = updateFn(dats[index]);

  DateTime? newDate;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (tracking)] action in editPrescription widget.
  ApiCallResponse? apiResultnh7;
  // Model for remedioCard component.
  late RemedioCardModel remedioCardModel;
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
  // State field(s) for Switch widget.
  bool? switchValue;
  // Stores action output result for [Backend Call - API (tracking)] action in Button widget.
  ApiCallResponse? apiResult23o;
  // Stores action output result for [Backend Call - API (tracking)] action in Button widget.
  ApiCallResponse? apiResult5h9;

  @override
  void initState(BuildContext context) {
    remedioCardModel = createModel(context, () => RemedioCardModel());
  }

  @override
  void dispose() {
    remedioCardModel.dispose();
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();
  }
}
