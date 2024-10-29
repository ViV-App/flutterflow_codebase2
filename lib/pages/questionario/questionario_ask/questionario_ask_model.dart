import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/upload_data.dart';
import '/pages/questionario/create_object/create_object_widget.dart';
import '/pages/questionario/object_description/object_description_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'questionario_ask_widget.dart' show QuestionarioAskWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class QuestionarioAskModel extends FlutterFlowModel<QuestionarioAskWidget> {
  ///  Local state fields for this component.

  List<String> listQueixas = [];
  void addToListQueixas(String item) => listQueixas.add(item);
  void removeFromListQueixas(String item) => listQueixas.remove(item);
  void removeAtIndexFromListQueixas(int index) => listQueixas.removeAt(index);
  void insertAtIndexInListQueixas(int index, String item) =>
      listQueixas.insert(index, item);
  void updateListQueixasAtIndex(int index, Function(String) updateFn) =>
      listQueixas[index] = updateFn(listQueixas[index]);

  ///  State fields for stateful widgets in this component.

  Completer<List<RespostasQuestionarioRow>>? requestCompleter;
  // State field(s) for textInput widget.
  FocusNode? textInputFocusNode;
  TextEditingController? textInputTextController;
  String? Function(BuildContext, String?)? textInputTextControllerValidator;
  // State field(s) for numberInput widget.
  FocusNode? numberInputFocusNode;
  TextEditingController? numberInputTextController;
  String? Function(BuildContext, String?)? numberInputTextControllerValidator;
  // Model for createObject component.
  late CreateObjectModel createObjectModel;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  @override
  void initState(BuildContext context) {
    createObjectModel = createModel(context, () => CreateObjectModel());
  }

  @override
  void dispose() {
    textInputFocusNode?.dispose();
    textInputTextController?.dispose();

    numberInputFocusNode?.dispose();
    numberInputTextController?.dispose();

    createObjectModel.dispose();
  }

  /// Additional helper methods.
  Future waitForRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
