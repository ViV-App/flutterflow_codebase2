import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dados_cadastrais_form_widget.dart' show DadosCadastraisFormWidget;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class DadosCadastraisFormModel
    extends FlutterFlowModel<DadosCadastraisFormWidget> {
  ///  Local state fields for this component.

  int currentStep = 1;

  FFUploadedFile? rgFrente;

  FFUploadedFile? rgVerso;

  FFUploadedFile? cpfFrente;

  FFUploadedFile? cpfVerso;

  List<FFUploadedFile> documents = [];
  void addToDocuments(FFUploadedFile item) => documents.add(item);
  void removeFromDocuments(FFUploadedFile item) => documents.remove(item);
  void removeAtIndexFromDocuments(int index) => documents.removeAt(index);
  void insertAtIndexInDocuments(int index, FFUploadedFile item) =>
      documents.insert(index, item);
  void updateDocumentsAtIndex(int index, Function(FFUploadedFile) updateFn) =>
      documents[index] = updateFn(documents[index]);

  ///  State fields for stateful widgets in this component.

  // State field(s) for sexo widget.
  String? sexoValue;
  FormFieldController<String>? sexoValueController;
  // State field(s) for identidade widget.
  String? identidadeValue;
  FormFieldController<String>? identidadeValueController;
  DateTime? datePicked;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for tempoTrab widget.
  String? tempoTrabValue;
  FormFieldController<String>? tempoTrabValueController;
  // State field(s) for altura widget.
  FocusNode? alturaFocusNode;
  TextEditingController? alturaTextController;
  final alturaMask = MaskTextInputFormatter(mask: '#,##');
  String? Function(BuildContext, String?)? alturaTextControllerValidator;
  // State field(s) for peso widget.
  FocusNode? pesoFocusNode;
  TextEditingController? pesoTextController;
  String? Function(BuildContext, String?)? pesoTextControllerValidator;
  // State field(s) for civilState widget.
  String? civilStateValue;
  FormFieldController<String>? civilStateValueController;
  // State field(s) for gringo widget.
  String? gringoValue;
  FormFieldController<String>? gringoValueController;
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading3 = false;
  FFUploadedFile uploadedLocalFile3 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading4 = false;
  FFUploadedFile uploadedLocalFile4 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading5 = false;
  List<FFUploadedFile> uploadedLocalFiles5 = [];
  List<String> uploadedFileUrls5 = [];

  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  DadosCadastraisRow? cadAta;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController1?.dispose();

    alturaFocusNode?.dispose();
    alturaTextController?.dispose();

    pesoFocusNode?.dispose();
    pesoTextController?.dispose();
  }
}
