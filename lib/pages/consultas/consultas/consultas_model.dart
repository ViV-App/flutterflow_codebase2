import '/flutter_flow/flutter_flow_util.dart';
import 'consultas_widget.dart' show ConsultasWidget;
import 'package:flutter/material.dart';

class ConsultasModel extends FlutterFlowModel<ConsultasWidget> {
  ///  Local state fields for this page.

  List<int> list = [];
  void addToList(int item) => list.add(item);
  void removeFromList(int item) => list.remove(item);
  void removeAtIndexFromList(int index) => list.removeAt(index);
  void insertAtIndexInList(int index, int item) => list.insert(index, item);
  void updateListAtIndex(int index, Function(int) updateFn) =>
      list[index] = updateFn(list[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
