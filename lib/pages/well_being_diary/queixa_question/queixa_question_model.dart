import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/pages/well_being_diary/queixa_question_drop/queixa_question_drop_widget.dart';
import 'queixa_question_widget.dart' show QueixaQuestionWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class QueixaQuestionModel extends FlutterFlowModel<QueixaQuestionWidget> {
  ///  Local state fields for this component.

  List<dynamic> respostas = [];
  void addToRespostas(dynamic item) => respostas.add(item);
  void removeFromRespostas(dynamic item) => respostas.remove(item);
  void removeAtIndexFromRespostas(int index) => respostas.removeAt(index);
  void insertAtIndexInRespostas(int index, dynamic item) =>
      respostas.insert(index, item);
  void updateRespostasAtIndex(int index, Function(dynamic) updateFn) =>
      respostas[index] = updateFn(respostas[index]);

  ///  State fields for stateful widgets in this component.

  // State field(s) for dpFequ widget.
  String? dpFequValue;
  FormFieldController<String>? dpFequValueController;
  // State field(s) for dpPeriodo widget.
  String? dpPeriodoValue;
  FormFieldController<String>? dpPeriodoValueController;
  // Models for queixaQuestionDrop dynamic component.
  late FlutterFlowDynamicModels<QueixaQuestionDropModel>
      queixaQuestionDropModels1;

  @override
  void initState(BuildContext context) {
    queixaQuestionDropModels1 =
        FlutterFlowDynamicModels(() => QueixaQuestionDropModel());
  }

  @override
  void dispose() {
    queixaQuestionDropModels1.dispose();
  }
}
