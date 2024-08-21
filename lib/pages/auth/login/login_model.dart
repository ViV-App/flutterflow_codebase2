import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'login_widget.dart' show LoginWidget;
import 'package:flutter/material.dart';

class LoginModel extends FlutterFlowModel<LoginWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for mail widget.
  FocusNode? mailFocusNode;
  TextEditingController? mailTextController;
  String? Function(BuildContext, String?)? mailTextControllerValidator;
  // State field(s) for ipPass widget.
  FocusNode? ipPassFocusNode;
  TextEditingController? ipPassTextController;
  late bool ipPassVisibility;
  String? Function(BuildContext, String?)? ipPassTextControllerValidator;
  String? _ipPassTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Senha obrigatória.';
    }

    return null;
  }

  // State field(s) for Checkbox widget.
  bool? checkboxValue;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<PacienteRow>? userReturned;
  // Stores action output result for [Backend Call - Query Rows] action in Container widget.
  List<PacienteRow>? userExist;

  @override
  void initState(BuildContext context) {
    ipPassVisibility = false;
    ipPassTextControllerValidator = _ipPassTextControllerValidator;
  }

  @override
  void dispose() {
    mailFocusNode?.dispose();
    mailTextController?.dispose();

    ipPassFocusNode?.dispose();
    ipPassTextController?.dispose();
  }
}
