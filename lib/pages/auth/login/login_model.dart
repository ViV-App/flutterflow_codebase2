import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'login_widget.dart' show LoginWidget;
import 'package:flutter/material.dart';

class LoginModel extends FlutterFlowModel<LoginWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for ipEmail widget.
  FocusNode? ipEmailFocusNode;
  TextEditingController? ipEmailTextController;
  String? Function(BuildContext, String?)? ipEmailTextControllerValidator;
  String? _ipEmailTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'E-mail inválido.';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'E-mail inválido.';
    }
    return null;
  }

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

  @override
  void initState(BuildContext context) {
    ipEmailTextControllerValidator = _ipEmailTextControllerValidator;
    ipPassVisibility = false;
    ipPassTextControllerValidator = _ipPassTextControllerValidator;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    ipEmailFocusNode?.dispose();
    ipEmailTextController?.dispose();

    ipPassFocusNode?.dispose();
    ipPassTextController?.dispose();
  }
}
