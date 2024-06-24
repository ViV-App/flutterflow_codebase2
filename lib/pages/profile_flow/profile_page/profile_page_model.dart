import '/components/complete_profile_alert/complete_profile_alert_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'profile_page_widget.dart' show ProfilePageWidget;
import 'package:flutter/material.dart';

class ProfilePageModel extends FlutterFlowModel<ProfilePageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // Model for completeProfileAlert component.
  late CompleteProfileAlertModel completeProfileAlertModel;

  @override
  void initState(BuildContext context) {
    completeProfileAlertModel =
        createModel(context, () => CompleteProfileAlertModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    completeProfileAlertModel.dispose();
  }
}
