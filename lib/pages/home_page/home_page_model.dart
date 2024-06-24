import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components/complete_profile_alert/complete_profile_alert_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'home_page_widget.dart' show HomePageWidget;
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart'
    show TutorialCoachMark;
import 'package:flutter/material.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  State fields for stateful widgets in this page.

  TutorialCoachMark? onboardingController;
  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - Query Rows] action in homePage widget.
  List<PacienteRow>? user;
  // Stores action output result for [Backend Call - Query Rows] action in homePage widget.
  List<PacienteRow>? user2;
  // Model for completeProfileAlert component.
  late CompleteProfileAlertModel completeProfileAlertModel;

  @override
  void initState(BuildContext context) {
    completeProfileAlertModel =
        createModel(context, () => CompleteProfileAlertModel());
  }

  @override
  void dispose() {
    onboardingController?.finish();
    unfocusNode.dispose();
    completeProfileAlertModel.dispose();
  }

  /// Action blocks.
  Future criarPacienteFromGoogle(BuildContext context) async {
    ApiCallResponse? apiResulto2u;
    List<PacienteRow>? userLogged;

    apiResulto2u = await CreatePacienteFromGoogleCall.call(
      uid: currentUserUid,
    );

    if ((apiResulto2u.succeeded ?? true)) {
      userLogged = await PacienteTable().queryRows(
        queryFn: (q) => q.eq(
          'uuid',
          currentUserUid,
        ),
      );
      FFAppState().paciente = PacienteStruct(
        nome: userLogged.first.nome,
        foto: userLogged.first.profilePic,
        id: userLogged.first.id,
        uuid: userLogged.first.uuid,
      );
      FFAppState().update(() {});
    }
  }
}
