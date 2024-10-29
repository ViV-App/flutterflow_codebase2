import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components/complete_profile_alert/complete_profile_alert_widget.dart';
import '/components/data_security/data_security_widget.dart';
import '/components/health_data/health_data_widget.dart';
import '/components/personal_data/personal_data_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/flutter_flow/permissions_util.dart';
import 'profile_page_widget.dart' show ProfilePageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class ProfilePageModel extends FlutterFlowModel<ProfilePageWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (tracking)] action in profilePage widget.
  ApiCallResponse? apiResult23o;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // Stores action output result for [Backend Call - API (tracking)] action in Icon widget.
  ApiCallResponse? apiResult23rbv;
  // Model for completeProfileAlert component.
  late CompleteProfileAlertModel completeProfileAlertModel;
  // Stores action output result for [Backend Call - API (tracking)] action in Container widget.
  ApiCallResponse? apiResulty70z;
  // Stores action output result for [Backend Call - API (tracking)] action in Container widget.
  ApiCallResponse? apiResult23r;
  // Stores action output result for [Backend Call - API (tracking)] action in Container widget.
  ApiCallResponse? apiResult23rg;
  // Stores action output result for [Backend Call - API (tracking)] action in Container widget.
  ApiCallResponse? apiResult23rr;
  // Stores action output result for [Backend Call - API (tracking)] action in Button widget.
  ApiCallResponse? apiResult23rgv;

  @override
  void initState(BuildContext context) {
    completeProfileAlertModel =
        createModel(context, () => CompleteProfileAlertModel());
  }

  @override
  void dispose() {
    completeProfileAlertModel.dispose();
  }
}
