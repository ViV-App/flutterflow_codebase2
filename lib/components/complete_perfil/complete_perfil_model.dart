import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'complete_perfil_widget.dart' show CompletePerfilWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CompletePerfilModel extends FlutterFlowModel<CompletePerfilWidget> {
  ///  Local state fields for this component.

  int currentStep = 1;

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

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
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

  // State field(s) for ipPhone widget.
  FocusNode? ipPhoneFocusNode;
  TextEditingController? ipPhoneTextController;
  final ipPhoneMask = MaskTextInputFormatter(mask: '(##) #####-####');
  String? Function(BuildContext, String?)? ipPhoneTextControllerValidator;
  String? _ipPhoneTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Telefone inválido.';
    }

    if (val.length < 15) {
      return 'Telefone inválido.';
    }

    return null;
  }

  // State field(s) for Checkbox widget.
  bool? checkboxValue;

  @override
  void initState(BuildContext context) {
    ipNomeTextControllerValidator = _ipNomeTextControllerValidator;
    iEmailTextControllerValidator = _iEmailTextControllerValidator;
    ipCPFTextControllerValidator = _ipCPFTextControllerValidator;
    ipPhoneTextControllerValidator = _ipPhoneTextControllerValidator;
  }

  @override
  void dispose() {
    ipNomeFocusNode?.dispose();
    ipNomeTextController?.dispose();

    iEmailFocusNode?.dispose();
    iEmailTextController?.dispose();

    ipCPFFocusNode?.dispose();
    ipCPFTextController?.dispose();

    ipPhoneFocusNode?.dispose();
    ipPhoneTextController?.dispose();
  }

  /// Action blocks.
  Future completeCred(
    BuildContext context, {
    String? phone,
    String? cpf,
  }) async {
    await PacienteTable().update(
      data: {
        'telefone': phone,
        'cpf': cpf,
      },
      matchingRows: (rows) => rows.eq(
        'uuid',
        currentUserUid,
      ),
    );
    FFAppState().updatePacienteStruct(
      (e) => e
        ..telefone = phone
        ..cpf = cpf,
    );
    FFAppState().update(() {});
  }

  Future updateQueixas(
    BuildContext context, {
    List<String>? queixas,
  }) async {
    await PacienteTable().update(
      data: {
        'queixas': queixas,
      },
      matchingRows: (rows) => rows.eq(
        'uuid',
        currentUserUid,
      ),
    );
    FFAppState().updatePacienteStruct(
      (e) => e..queixas = queixas!.toList(),
    );
  }

  Future updateContra(
    BuildContext context, {
    List<String>? contra,
  }) async {
    await PacienteTable().update(
      data: {
        'contra_indicacoes': contra,
        'perfil_completo': true,
      },
      matchingRows: (rows) => rows.eq(
        'uuid',
        currentUserUid,
      ),
    );
    FFAppState().updatePacienteStruct(
      (e) => e
        ..contraIndicacoes = contra!.toList()
        ..perfilCompleto = true,
    );
    FFAppState().update(() {});
  }
}
