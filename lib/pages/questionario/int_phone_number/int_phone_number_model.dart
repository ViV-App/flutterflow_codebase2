import '/flutter_flow/flutter_flow_util.dart';
import 'int_phone_number_widget.dart' show IntPhoneNumberWidget;
import 'package:flutter/material.dart';

class IntPhoneNumberModel extends FlutterFlowModel<IntPhoneNumberWidget> {
  ///  Local state fields for this component.

  dynamic selectedCountry;

  ///  State fields for stateful widgets in this component.

  // State field(s) for ipEmail widget.
  FocusNode? ipEmailFocusNode1;
  TextEditingController? ipEmailTextController1;
  String? Function(BuildContext, String?)? ipEmailTextController1Validator;
  // State field(s) for ipEmail widget.
  FocusNode? ipEmailFocusNode2;
  TextEditingController? ipEmailTextController2;
  String? Function(BuildContext, String?)? ipEmailTextController2Validator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    ipEmailFocusNode1?.dispose();
    ipEmailTextController1?.dispose();

    ipEmailFocusNode2?.dispose();
    ipEmailTextController2?.dispose();
  }
}
