import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'conteudos_widget.dart' show ConteudosWidget;
import 'dart:async';
import 'package:flutter/material.dart';

class ConteudosModel extends FlutterFlowModel<ConteudosWidget> {
  ///  Local state fields for this page.

  List<int> anth = [];
  void addToAnth(int item) => anth.add(item);
  void removeFromAnth(int item) => anth.remove(item);
  void removeAtIndexFromAnth(int index) => anth.removeAt(index);
  void insertAtIndexInAnth(int index, int item) => anth.insert(index, item);
  void updateAnthAtIndex(int index, Function(int) updateFn) =>
      anth[index] = updateFn(anth[index]);

  ///  State fields for stateful widgets in this page.

  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  Completer<List<StaticConteudosRow>>? requestCompleter1;
  Completer<List<StaticConteudosRow>>? requestCompleter2;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Additional helper methods.
  Future waitForRequestCompleted1({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(const Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleter1?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  Future waitForRequestCompleted2({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(const Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleter2?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
