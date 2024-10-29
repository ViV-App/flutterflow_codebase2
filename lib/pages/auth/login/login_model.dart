import '/auth/supabase_auth/auth_util.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components/reset_password/reset_password_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'login_widget.dart' show LoginWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

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
