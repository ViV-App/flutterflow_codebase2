import '/backend/api_requests/api_calls.dart';
import '/components/complete_profile_alert/complete_profile_alert_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'profile_page_widget.dart' show ProfilePageWidget;
import 'package:flutter/material.dart';

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
