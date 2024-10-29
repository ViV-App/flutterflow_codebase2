import '/components/select_contry/select_contry_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'int_phone_number_widget.dart' show IntPhoneNumberWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

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
