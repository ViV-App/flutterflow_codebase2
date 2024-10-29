import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/pages/well_being_diary/queixa_question_drop/queixa_question_drop_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'queixa_question_model.dart';
export 'queixa_question_model.dart';

class QueixaQuestionWidget extends StatefulWidget {
  const QueixaQuestionWidget({
    super.key,
    this.queixa,
    this.queixaName,
    bool? principal,
    this.setReturn,
  }) : this.principal = principal ?? false;

  final StaticQueixasSaudeRow? queixa;
  final String? queixaName;
  final bool principal;
  final Future Function(dynamic response, String? periodo, String frequencia)?
      setReturn;

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
        color: Color(0xFFEFF4F9),
        borderRadius: BorderRadius.circular(9.0),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 0.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      widget!.queixa!.logo!,
                      width: 32.0,
                      height: 32.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          valueOrDefault<String>(
                            widget!.queixaName,
                            'd',
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Mulish',
                                    color: Color(0xFF434854),
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w800,
                                  ),
                        ),
                        Text(
                          'Responda as perguntas em relação a ${widget!.queixaName}',
                          textAlign: TextAlign.start,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Mulish',
                                    color: Color(0xFF434854),
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ].divide(SizedBox(height: 4.0)),
                    ),
                  ),
                ],
              ),
            ),
            if (widget!.queixaName == 'Distúrbios do Sono' ? false : true)
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(18.0, 0.0, 18.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      () {
                        if (widget!.queixaName == 'Ansiedade') {
                          return 'Quantas vezes por dia voce está sentindo ansiedade?';
                        } else if (widget!.queixaName == 'Dor crônica') {
                          return 'Quantas vezes por dia voce está sentindo dor?';
                        } else if (widget!.queixaName ==
                            'Tremores (Parkinson e Tremor essencial)') {
                          return 'Quantas vezes por dia voce está sentindo o tremor?';
                        } else if (widget!.queixaName == 'Epilepsia') {
                          return 'Quantas vezes por dia voce apresentou epilesia?';
                        } else if (widget!.queixaName ==
                            'Transtorno do espectro autista') {
                          return 'Quantas vezes por dia voce apresentou compartamentos estereotipados ou comorbidades do TEA?';
                        } else if (widget!.queixaName ==
                            'Doença inflamatória Intestinal') {
                          return 'Quantas vezes por dia voce está sentindo sintomas da Doença Inflamatória Intestinal?';
                        } else if (widget!.queixaName == 'Demência') {
                          return 'Qual a frequência que o paciente apresentou crises: ansiedade, agitação, humor ruim, tristeza ou deficit cognitivo?';
                        } else if (widget!.queixaName ==
                            'Náusea e Vômitos (causado por quimioterápicos) ') {
                          return 'Quantas vezes por dia voce está sentindo Náuseas e/ou Vômitos?';
                        } else {
                          return 'Período';
                        }
                      }(),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Mulish',
                            fontSize: 16.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                      child: FlutterFlowDropDown<String>(
                        controller: _model.dpFequValueController ??=
                            FormFieldController<String>(null),
                        options: ['0', '1 a 2', '3 ou mais', 'O tempo todo'],
                        onChanged: (val) =>
                            safeSetState(() => _model.dpFequValue = val),
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
                        fillColor: Color(0xFFF7FAFE),
                        elevation: 2.0,
                        borderColor: Color(0x0E294B0D),
                        borderWidth: 2.0,
                        borderRadius: 8.0,
                        margin: EdgeInsetsDirectional.fromSTEB(
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
              if ((widget!.queixaName == 'Distúrbios do Sono') &&
                  (widget!.principal == false)) {
                return false;
              } else if ((_model.dpFequValue == null ||
                      _model.dpFequValue == '') ||
                  (_model.dpFequValue == '0')) {
                return false;
              } else {
                return true;
              }
            }())
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(18.0, 0.0, 18.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      () {
                        if (widget!.queixaName == 'Ansiedade') {
                          return 'Em qual período do dia a ansiedade é maior?';
                        } else if (widget!.queixaName == 'Dor crônica') {
                          return 'Em qual período do dia a dor é maior?';
                        } else if (widget!.queixaName ==
                            'Tremores (Parkinson e Tremor essencial)') {
                          return 'Quando o tremor acontece, elaes são piores em qual período do dia?';
                        } else if (widget!.queixaName == 'Epilepsia') {
                          return 'Quando as crises acontecem, elas são piores em qual periodo do dia?';
                        } else if (widget!.queixaName ==
                            'Transtorno do espectro autista') {
                          return 'Quando as comportamentos estereótipados ou comorbidades do TEA acontecem, elas são piores em qual período do dia?';
                        } else if (widget!.queixaName ==
                            'Doença inflamatória Intestinal') {
                          return 'Quando os sintomas da Doença Inflamatória Intestinal acontece, eles são piores em qual período do dia?';
                        } else if (widget!.queixaName == 'Demência') {
                          return 'Quando as crises acontecem, elas são piores em qual período do dia?';
                        } else if (widget!.queixaName ==
                            'Náusea e Vômitos (causado por quimioterápicos) ') {
                          return 'Em qual período do dia as Náuseas e/ou Vômitos são mais intensos?';
                        } else {
                          return 'Período';
                        }
                      }(),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Mulish',
                            fontSize: 16.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                      child: FlutterFlowDropDown<String>(
                        controller: _model.dpPeriodoValueController ??=
                            FormFieldController<String>(null),
                        options: ['Manhã', 'Tarde', 'Noite'],
                        onChanged: (val) =>
                            safeSetState(() => _model.dpPeriodoValue = val),
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
                        fillColor: Color(0xFFF7FAFE),
                        elevation: 2.0,
                        borderColor: Color(0x0E294B0D),
                        borderWidth: 2.0,
                        borderRadius: 8.0,
                        margin: EdgeInsetsDirectional.fromSTEB(
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
              if ((widget!.principal == false) &&
                  ((_model.dpFequValue != null && _model.dpFequValue != '') &&
                      (_model.dpFequValue != '0'))) {
                return true;
              } else if ((widget!.principal == false) &&
                  (widget!.queixaName == 'Distúrbios do Sono')) {
                return true;
              } else {
                return false;
              }
            }())
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(18.0, 0.0, 18.0, 0.0),
                child: Builder(
                  builder: (context) {
                    final perguntas = widget!.queixa?.perguntas
                            ?.where((e) =>
                                FFAppConstants.perguntatype.last ==
                                getJsonField(
                                  e,
                                  r'''$.pergunta_type''',
                                ).toString())
                            .toList()
                            ?.toList() ??
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
                                _model.dpFequValue,
                                _model.dpFequValue!,
                              );
                            },
                          ),
                        );
                      }).divide(SizedBox(height: 18.0)),
                    );
                  },
                ),
              ),
            if (() {
              if ((widget!.principal == true) &&
                  ((_model.dpFequValue != '0') &&
                      (_model.dpFequValue != null &&
                          _model.dpFequValue != ''))) {
                return true;
              } else if (widget!.queixaName == 'Distúrbios do Sono') {
                return true;
              } else {
                return false;
              }
            }())
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(18.0, 0.0, 18.0, 0.0),
                child: Builder(
                  builder: (context) {
                    final perguntas = widget!.queixa?.perguntas
                            ?.where((e) =>
                                FFAppConstants.perguntatype.first ==
                                getJsonField(
                                  e,
                                  r'''$.pergunta_type''',
                                ).toString())
                            .toList()
                            ?.toList() ??
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
                              _model.dpPeriodoValue,
                              _model.dpFequValue!,
                            );
                          },
                        );
                      }).divide(SizedBox(height: 18.0)),
                    );
                  },
                ),
              ),
          ].divide(SizedBox(height: 18.0)).addToEnd(SizedBox(height: 18.0)),
        ),
      ),
    );
  }
}
