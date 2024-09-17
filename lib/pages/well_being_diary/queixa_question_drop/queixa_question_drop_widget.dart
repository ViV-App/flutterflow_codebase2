import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'queixa_question_drop_model.dart';
export 'queixa_question_drop_model.dart';

class QueixaQuestionDropWidget extends StatefulWidget {
  const QueixaQuestionDropWidget({
    super.key,
    this.pergunta,
    this.respostas,
    this.fieldType,
    required this.sendRes,
    this.index,
  });

  final dynamic pergunta;
  final List<dynamic>? respostas;
  final String? fieldType;
  final Future Function(dynamic resp)? sendRes;
  final int? index;

  @override
  State<QueixaQuestionDropWidget> createState() =>
      _QueixaQuestionDropWidgetState();
}

class _QueixaQuestionDropWidgetState extends State<QueixaQuestionDropWidget> {
  late QueixaQuestionDropModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QueixaQuestionDropModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              getJsonField(
                widget.pergunta,
                r'''$.pergunta''',
              ).toString(),
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Mulish',
                    fontSize: 16.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            if (widget.fieldType == 'drop selector')
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                child: FlutterFlowDropDown<String>(
                  controller: _model.dropDownValueController1 ??=
                      FormFieldController<String>(
                    _model.dropDownValue1 ??= '',
                  ),
                  options: List<String>.from(
                      widget.respostas!.map((e) => e.toString()).toList()),
                  optionLabels: widget.respostas!
                      .map((e) => getJsonField(
                            e,
                            r'''$.resposta''',
                          ))
                      .toList()
                      .map((e) => e.toString())
                      .toList(),
                  onChanged: (val) async {
                    safeSetState(() => _model.dropDownValue1 = val);
                    _model.response = widget.respostas
                        ?.where((e) => _model.dropDownValue1 == e.toString())
                        .toList()
                        .first;
                    safeSetState(() {});
                    await widget.sendRes?.call(
                      <String, dynamic>{
                        'pergunta': getJsonField(
                          widget.pergunta,
                          r'''$.pergunta''',
                        ),
                        'resposta': _model.response,
                        'pergunta_index': widget.index,
                      },
                    );
                  },
                  width: double.infinity,
                  height: 48.0,
                  textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Mulish',
                        color: FlutterFlowTheme.of(context).primaryText,
                        letterSpacing: 0.0,
                      ),
                  hintText: 'Selecione uma opção',
                  icon: Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: FlutterFlowTheme.of(context).secondaryText,
                    size: 24.0,
                  ),
                  fillColor: const Color(0xFFF7FAFE),
                  elevation: 2.0,
                  borderColor: const Color(0x0E294B0D),
                  borderWidth: 2.0,
                  borderRadius: 8.0,
                  margin: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  hidesUnderline: true,
                  isOverButton: true,
                  isSearchable: false,
                  isMultiSelect: false,
                ),
              ),
            if (widget.fieldType == 'drop multi selector')
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                child: FlutterFlowDropDown<String>(
                  multiSelectController: _model.dropDownValueController2 ??=
                      FormListFieldController<String>(null),
                  options: widget.respostas!.map((e) => e.toString()).toList(),
                  width: double.infinity,
                  height: 48.0,
                  textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Mulish',
                        color: FlutterFlowTheme.of(context).primaryText,
                        letterSpacing: 0.0,
                      ),
                  hintText: 'Selecione uma opção',
                  icon: Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: FlutterFlowTheme.of(context).secondaryText,
                    size: 24.0,
                  ),
                  fillColor: const Color(0xFFF7FAFE),
                  elevation: 2.0,
                  borderColor: const Color(0x0E294B0D),
                  borderWidth: 2.0,
                  borderRadius: 8.0,
                  margin: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  hidesUnderline: true,
                  isOverButton: true,
                  isSearchable: false,
                  isMultiSelect: true,
                  onMultiSelectChanged: (val) =>
                      safeSetState(() => _model.dropDownValue2 = val),
                ),
              ),
            if (widget.fieldType == 'open input')
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                child: TextFormField(
                  controller: _model.textController,
                  focusNode: _model.textFieldFocusNode,
                  autofocus: false,
                  obscureText: false,
                  decoration: InputDecoration(
                    hintText: 'Digite sua resposta',
                    hintStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Mulish',
                          color: const Color(0xFFB5C0D3),
                          fontSize: 16.0,
                          letterSpacing: 0.0,
                        ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color(0x0E294B0D),
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).primary,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    filled: true,
                    fillColor: const Color(0xFFF7FAFE),
                    contentPadding:
                        const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Mulish',
                        letterSpacing: 0.0,
                      ),
                  validator:
                      _model.textControllerValidator.asValidator(context),
                ),
              ),
          ],
        ),
      ].divide(const SizedBox(height: 6.0)),
    );
  }
}
