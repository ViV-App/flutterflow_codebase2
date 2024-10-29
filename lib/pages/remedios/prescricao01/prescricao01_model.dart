import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components/choose_med/choose_med_widget.dart';
import '/components/create_med/create_med_widget.dart';
import '/flutter_flow/flutter_flow_autocomplete_options_list.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'prescricao01_widget.dart' show Prescricao01Widget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class Prescricao01Model extends FlutterFlowModel<Prescricao01Widget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (tracking)] action in prescricao01 widget.
  ApiCallResponse? apiResultwcv;
  // State field(s) for DropDown widget.
  String? dropDownValue1;
  FormFieldController<String>? dropDownValueController1;
  // State field(s) for inpCannabis widget.
  final inpCannabisKey = GlobalKey();
  FocusNode? inpCannabisFocusNode;
  TextEditingController? inpCannabisTextController;
  String? inpCannabisSelectedOption;
  String? Function(BuildContext, String?)? inpCannabisTextControllerValidator;
  // Stores action output result for [Backend Call - Query Rows] action in inpCannabis widget.
  List<StaticMedicamentosRow>? medCopyCopy;
  // Stores action output result for [Backend Call - Query Rows] action in inpCannabis widget.
  List<StaticMedicamentosRow>? medCopyCopy2;
  // State field(s) for inpMedc widget.
  FocusNode? inpMedcFocusNode;
  TextEditingController? inpMedcTextController;
  String? Function(BuildContext, String?)? inpMedcTextControllerValidator;
  // State field(s) for DropDown widget.
  int? dropDownValue2;
  FormFieldController<int>? dropDownValueController2;
  // State field(s) for inpVolume widget.
  FocusNode? inpVolumeFocusNode;
  TextEditingController? inpVolumeTextController;
  String? Function(BuildContext, String?)? inpVolumeTextControllerValidator;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<StaticMedicamentosRow>? medc1;
  // Stores action output result for [Backend Call - API (tracking)] action in Button widget.
  ApiCallResponse? apiResultwcvb;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    inpCannabisFocusNode?.dispose();

    inpMedcFocusNode?.dispose();
    inpMedcTextController?.dispose();

    inpVolumeFocusNode?.dispose();
    inpVolumeTextController?.dispose();
  }
}
