import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components/toast/toast_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/questionario/int_phone_number/int_phone_number_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'create_account_widget.dart' show CreateAccountWidget;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class CreateAccountModel extends FlutterFlowModel<CreateAccountWidget> {
  ///  Local state fields for this page.

  int? profile = 1;

  int? currentStep = 2;

  List<String> queixas = [];
  void addToQueixas(String item) => queixas.add(item);
  void removeFromQueixas(String item) => queixas.remove(item);
  void removeAtIndexFromQueixas(int index) => queixas.removeAt(index);
  void insertAtIndexInQueixas(int index, String item) =>
      queixas.insert(index, item);
  void updateQueixasAtIndex(int index, Function(String) updateFn) =>
      queixas[index] = updateFn(queixas[index]);

  List<String> contra = [];
  void addToContra(String item) => contra.add(item);
  void removeFromContra(String item) => contra.remove(item);
  void removeAtIndexFromContra(int index) => contra.removeAt(index);
  void insertAtIndexInContra(int index, String item) =>
      contra.insert(index, item);
  void updateContraAtIndex(int index, Function(String) updateFn) =>
      contra[index] = updateFn(contra[index]);

  String? nome;

  String? cpf;

  String? email;

  String? phone;

  String? pass;

  String? rout;

  String? ftoken;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - API (tracking)] action in createAccount widget.
  ApiCallResponse? apiResult23o;
  // State field(s) for ipNome widget.
  FocusNode? ipNomeFocusNode;
  TextEditingController? ipNomeTextController;
  String? Function(BuildContext, String?)? ipNomeTextControllerValidator;
  String? _ipNomeTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Obrigatório.';
    }

    return null;
  }

  // State field(s) for ipCPF widget.
  FocusNode? ipCPFFocusNode;
  TextEditingController? ipCPFTextController;
  final ipCPFMask = MaskTextInputFormatter(mask: '###.###.###-##');
  String? Function(BuildContext, String?)? ipCPFTextControllerValidator;
  String? _ipCPFTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'CPF inválido.';
    }

    if (val.length < 14) {
      return 'CPF inválido.';
    }

    return null;
  }

  // State field(s) for iEmail widget.
  FocusNode? iEmailFocusNode;
  TextEditingController? iEmailTextController;
  String? Function(BuildContext, String?)? iEmailTextControllerValidator;
  String? _iEmailTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'E-mail inválido.';
    }

    return null;
  }

  // Model for intPhoneNumber component.
  late IntPhoneNumberModel intPhoneNumberModel;
  // State field(s) for ipPass widget.
  FocusNode? ipPassFocusNode;
  TextEditingController? ipPassTextController;
  late bool ipPassVisibility;
  String? Function(BuildContext, String?)? ipPassTextControllerValidator;
  String? _ipPassTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Senha obrigatória.';
    }

    if (val.length < 6) {
      return 'No minimo 6 caracteres.';
    }

    return null;
  }

  // State field(s) for Checkbox widget.
  bool? checkboxValue;
  // Stores action output result for [Backend Call - API (tracking)] action in Button widget.
  ApiCallResponse? apiResult23ot;
  // Stores action output result for [Backend Call - API (create asaas customer)] action in Button widget.
  ApiCallResponse? customerAsaas;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  PacienteRow? createdUser;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<PacienteRow>? loggedUser;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  StatusPacientRow? st1;
  // Stores action output result for [Backend Call - API (nn acc created)] action in Button widget.
  ApiCallResponse? apiResultagx;
  // Stores action output result for [Backend Call - API (tracking)] action in Button widget.
  ApiCallResponse? apiResult23oc;

  @override
  void initState(BuildContext context) {
    ipNomeTextControllerValidator = _ipNomeTextControllerValidator;
    ipCPFTextControllerValidator = _ipCPFTextControllerValidator;
    iEmailTextControllerValidator = _iEmailTextControllerValidator;
    intPhoneNumberModel = createModel(context, () => IntPhoneNumberModel());
    ipPassVisibility = false;
    ipPassTextControllerValidator = _ipPassTextControllerValidator;
  }

  @override
  void dispose() {
    ipNomeFocusNode?.dispose();
    ipNomeTextController?.dispose();

    ipCPFFocusNode?.dispose();
    ipCPFTextController?.dispose();

    iEmailFocusNode?.dispose();
    iEmailTextController?.dispose();

    intPhoneNumberModel.dispose();
    ipPassFocusNode?.dispose();
    ipPassTextController?.dispose();
  }

  /// Action blocks.
  Future<bool?> checkCredentials(BuildContext context) async {
    List<PacienteRow>? fgd;

    fgd = await PacienteTable().queryRows(
      queryFn: (q) => q.eq(
        'cpf',
        ipCPFTextController.text,
      ),
    );

    return null;
  }
}
