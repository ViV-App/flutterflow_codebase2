import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'av_quinzenal_widget.dart' show AvQuinzenalWidget;
import 'package:flutter/material.dart';

class AvQuinzenalModel extends FlutterFlowModel<AvQuinzenalWidget> {
  ///  Local state fields for this component.

  int? currentStep = 1;

  int? check01 = 1;

  int? check02 = 1;

  ///  State fields for stateful widgets in this component.

  // State field(s) for RatingBar widget.
  double? ratingBarValue1;
  // State field(s) for RatingBar widget.
  double? ratingBarValue2;
  // State field(s) for RatingBar widget.
  double? ratingBarValue3;
  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController1;
  // State field(s) for RatingBar widget.
  double? ratingBarValue4;
  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController2;
  // State field(s) for RatingBar widget.
  double? ratingBarValue5;
  // State field(s) for RatingBar widget.
  double? ratingBarValue6;
  // State field(s) for RatingBar widget.
  double? ratingBarValue7;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Additional helper methods.
  String? get radioButtonValue1 => radioButtonValueController1?.value;
  String? get radioButtonValue2 => radioButtonValueController2?.value;
}
