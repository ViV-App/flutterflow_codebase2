import '/flutter_flow/flutter_flow_util.dart';
import 'create_objects_widget.dart' show CreateObjectsWidget;
import 'package:flutter/material.dart';

class CreateObjectsModel extends FlutterFlowModel<CreateObjectsWidget> {
  ///  Local state fields for this component.

  List<dynamic> jsons = [];
  void addToJsons(dynamic item) => jsons.add(item);
  void removeFromJsons(dynamic item) => jsons.remove(item);
  void removeAtIndexFromJsons(int index) => jsons.removeAt(index);
  void insertAtIndexInJsons(int index, dynamic item) =>
      jsons.insert(index, item);
  void updateJsonsAtIndex(int index, Function(dynamic) updateFn) =>
      jsons[index] = updateFn(jsons[index]);

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
