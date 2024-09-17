import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/pages/well_being_diary/queixa_question_drop/queixa_question_drop_widget.dart';
import 'package:flutter/material.dart';
import 'queixa_question_model.dart';
export 'queixa_question_model.dart';

class QueixaQuestionWidget extends StatefulWidget {
  const QueixaQuestionWidget({
    super.key,
    this.queixa,
    this.queixaName,
    bool? principal,
    this.setReturn,
  }) : principal = principal ?? false;

  final StaticQueixasSaudeRow? queixa;
  final String? queixaName;
  final bool principal;
  final Future Function(dynamic response, String? periodo)? setReturn;

  @override
  State<QueixaQuestionWidget> createState() => _QueixaQuestionWidgetState();
}

class _QueixaQuestionWidgetState extends State<QueixaQuestionWidget> {
  late QueixaQuestionModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QueixaQuestionModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFFEFF4F9),
        borderRadius: BorderRadius.circular(9.0),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 0.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      widget.queixa!.logo!,
                      width: 32.0,
                      height: 32.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          valueOrDefault<String>(
                            widget.queixaName,
                            'd',
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Mulish',
                                    color: const Color(0xFF434854),
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w800,
                                  ),
                        ),
                        Text(
                          'Responda as perguntas em relação a ${widget.queixaName}',
                          textAlign: TextAlign.start,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Mulish',
                                    color: const Color(0xFF434854),
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ].divide(const SizedBox(height: 4.0)),
                    ),
                  ),
                ],
              ),
            ),
            if ((widget.queixaName == 'Disturbio do Sono') &&
                    (widget.principal == false)
                ? false
                : true)
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(18.0, 0.0, 18.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Periodo do dia',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Mulish',
                            fontSize: 16.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                      child: FlutterFlowDropDown<String>(
                        controller: _model.dropDownValueController ??=
                            FormFieldController<String>(null),
                        options: const ['Manhã', 'Tarde', 'Noite'],
                        onChanged: (val) =>
                            safeSetState(() => _model.dropDownValue = val),
                        width: double.infinity,
                        height: 48.0,
                        textStyle:
                            FlutterFlowTheme.of(context).bodyMedium.override(
                                  fontFamily: 'Mulish',
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
                        margin: const EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        hidesUnderline: true,
                        isOverButton: true,
                        isSearchable: false,
                        isMultiSelect: false,
                      ),
                    ),
                  ],
                ),
              ),
            if (() {
              if ((widget.principal == false) &&
                  (_model.dropDownValue != null &&
                      _model.dropDownValue != '')) {
                return true;
              } else if ((widget.principal == false) &&
                  (widget.queixaName == 'Disturbio do Sono')) {
                return true;
              } else {
                return false;
              }
            }())
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(18.0, 0.0, 18.0, 0.0),
                child: Builder(
                  builder: (context) {
                    final perguntas = widget.queixa?.perguntas
                            .where((e) =>
                                FFAppConstants.perguntatype.last ==
                                getJsonField(
                                  e,
                                  r'''$.pergunta_type''',
                                ).toString())
                            .toList()
                            .toList() ??
                        [];

                    return Column(
                      mainAxisSize: MainAxisSize.max,
                      children:
                          List.generate(perguntas.length, (perguntasIndex) {
                        final perguntasItem = perguntas[perguntasIndex];
                        return wrapWithModel(
                          model: _model.queixaQuestionDropModels1.getModel(
                            perguntasIndex.toString(),
                            perguntasIndex,
                          ),
                          updateCallback: () => safeSetState(() {}),
                          updateOnChange: true,
                          child: QueixaQuestionDropWidget(
                            key: Key(
                              'Keymis_${perguntasIndex.toString()}',
                            ),
                            pergunta: perguntasItem,
                            respostas: getJsonField(
                              perguntasItem,
                              r'''$.respostas''',
                              true,
                            ),
                            fieldType: getJsonField(
                              perguntasItem,
                              r'''$.resposta_type''',
                            ).toString(),
                            index: perguntasIndex,
                            sendRes: (resp) async {
                              await widget.setReturn?.call(
                                resp!,
                                _model.dropDownValue,
                              );
                            },
                          ),
                        );
                      }).divide(const SizedBox(height: 18.0)),
                    );
                  },
                ),
              ),
            if ((widget.principal == true) &&
                (_model.dropDownValue != null && _model.dropDownValue != ''))
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(18.0, 0.0, 18.0, 0.0),
                child: Builder(
                  builder: (context) {
                    final perguntas = widget.queixa?.perguntas
                            .where((e) =>
                                FFAppConstants.perguntatype.first ==
                                getJsonField(
                                  e,
                                  r'''$.pergunta_type''',
                                ).toString())
                            .toList()
                            .toList() ??
                        [];

                    return Column(
                      mainAxisSize: MainAxisSize.max,
                      children:
                          List.generate(perguntas.length, (perguntasIndex) {
                        final perguntasItem = perguntas[perguntasIndex];
                        return QueixaQuestionDropWidget(
                          key: Key(
                              'Keyoi5_${perguntasIndex}_of_${perguntas.length}'),
                          pergunta: perguntasItem,
                          respostas: getJsonField(
                            perguntasItem,
                            r'''$.respostas''',
                            true,
                          ),
                          fieldType: getJsonField(
                            perguntasItem,
                            r'''$.resposta_type''',
                          ).toString(),
                          index: perguntasIndex,
                          sendRes: (resp) async {
                            await widget.setReturn?.call(
                              resp!,
                              _model.dropDownValue,
                            );
                          },
                        );
                      }).divide(const SizedBox(height: 18.0)),
                    );
                  },
                ),
              ),
          ].divide(const SizedBox(height: 18.0)).addToEnd(const SizedBox(height: 18.0)),
        ),
      ),
    );
  }
}
