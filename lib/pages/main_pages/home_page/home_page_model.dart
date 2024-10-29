import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components/complete_profile_alert/complete_profile_alert_widget.dart';
import '/components/home_page_status_component/home_page_status_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'home_page_widget.dart' show HomePageWidget;
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart'
    show TutorialCoachMark;
import 'package:flutter/material.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  Local state fields for this page.

  String? fcm;

  DateTime? date;

  ///  State fields for stateful widgets in this page.

  TutorialCoachMark? onboarding01Controller;
  // Stores action output result for [Backend Call - API (tracking)] action in homePage widget.
  ApiCallResponse? apiResult23r;
  // Stores action output result for [Backend Call - API (tracking)] action in homePage widget.
  ApiCallResponse? apiResult23rbh;
  // Stores action output result for [Backend Call - Query Rows] action in homePage widget.
  List<PacienteRow>? user;
  // Stores action output result for [Backend Call - Query Rows] action in homePage widget.
  List<AssinaturaRow>? assinatura;
  // Stores action output result for [Custom Action - getFCMToken] action in homePage widget.
  String? fcmTk;
  // Stores action output result for [Backend Call - Query Rows] action in homePage widget.
  List<PacienteRow>? checktk;
  // Stores action output result for [Custom Action - getFCMToken] action in homePage widget.
  String? fctk;
  // Stores action output result for [Backend Call - API (tracking)] action in homePage widget.
  ApiCallResponse? apiResultfzn;
  // Stores action output result for [Backend Call - API (tracking)] action in CircleImage widget.
  ApiCallResponse? apiResult6x1;
  // Model for completeProfileAlert component.
  late CompleteProfileAlertModel completeProfileAlertModel;
  // Stores action output result for [Backend Call - API (tracking)] action in Container widget.
  ApiCallResponse? apiResultzmj;
  // Stores action output result for [Backend Call - API (tracking)] action in Container widget.
  ApiCallResponse? apiResultzmjc;
  // Stores action output result for [Backend Call - API (tracking)] action in Container widget.
  ApiCallResponse? apiResultzmjf;
  // Stores action output result for [Backend Call - API (tracking)] action in Container widget.
  ApiCallResponse? apiResultzmjz;
  // Model for homePageStatusComponent component.
  late HomePageStatusComponentModel homePageStatusComponentModel;
  // Stores action output result for [Backend Call - API (tracking)] action in Container widget.
  ApiCallResponse? apiResultwcv;
  // Stores action output result for [Backend Call - API (tracking)] action in Container widget.
  ApiCallResponse? apiResultwcvz;
  // Stores action output result for [Backend Call - API (tracking)] action in Container widget.
  ApiCallResponse? apiResultwcf;
  // Stores action output result for [Backend Call - API (tracking)] action in Button widget.
  ApiCallResponse? apiResultwcp;
  // Stores action output result for [Backend Call - API (tracking)] action in Container widget.
  ApiCallResponse? apiResultwcb;

  @override
  void initState(BuildContext context) {
    completeProfileAlertModel =
        createModel(context, () => CompleteProfileAlertModel());
    homePageStatusComponentModel =
        createModel(context, () => HomePageStatusComponentModel());
  }

  @override
  void dispose() {
    onboarding01Controller?.finish();
    completeProfileAlertModel.dispose();
    homePageStatusComponentModel.dispose();
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
