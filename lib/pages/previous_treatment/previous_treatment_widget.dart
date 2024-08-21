import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'previous_treatment_model.dart';
export 'previous_treatment_model.dart';

class PreviousTreatmentWidget extends StatefulWidget {
  const PreviousTreatmentWidget({super.key});

  @override
  State<PreviousTreatmentWidget> createState() =>
      _PreviousTreatmentWidgetState();
}

class _PreviousTreatmentWidgetState extends State<PreviousTreatmentWidget> {
  late PreviousTreatmentModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PreviousTreatmentModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        body: SafeArea(
          top: true,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 32.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              child: GradientText(
                                'Tratamento prévio',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Mulish',
                                      color: const Color(0xFF13294B),
                                      fontSize: 24.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                colors: [
                                  FlutterFlowTheme.of(context).primary,
                                  FlutterFlowTheme.of(context).tertiary
                                ],
                                gradientDirection: GradientDirection.ltr,
                                gradientType: GradientType.linear,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  24.0, 8.0, 24.0, 0.0),
                              child: Text(
                                'Precisamos saber como está seu tratamento.',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Mulish',
                                      color: const Color(0xFF8798B5),
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                      lineHeight: 1.5,
                                    ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  24.0, 32.0, 24.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Atualmente, vocês já faz tratamento com Cannabis Medicinal?',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Mulish',
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 12.0, 0.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            _model.rout =
                                                'Não faço tratamento com Cannabis';
                                            setState(() {});
                                          },
                                          child: Container(
                                            width: double.infinity,
                                            height: 52.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                              border: Border.all(
                                                color: _model.rout ==
                                                        'Não faço tratamento com Cannabis'
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .primary
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .alternate,
                                              ),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(12.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  AnimatedDefaultTextStyle(
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Mulish',
                                                          color: _model.rout ==
                                                                  'Não faço tratamento com Cannabis'
                                                              ? FlutterFlowTheme
                                                                      .of(
                                                                          context)
                                                                  .primary
                                                              : FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                    duration: const Duration(
                                                        milliseconds: 600),
                                                    curve: Curves.easeIn,
                                                    child: const Text(
                                                      'Não faço tratamento com Cannabis',
                                                    ),
                                                  ),
                                                  if (_model.rout !=
                                                      'Não faço tratamento com Cannabis')
                                                    const Icon(
                                                      Icons.circle_outlined,
                                                      color: Color(0xFFDBE4F1),
                                                      size: 24.0,
                                                    ),
                                                  if (_model.rout ==
                                                      'Não faço tratamento com Cannabis')
                                                    Icon(
                                                      Icons
                                                          .check_circle_rounded,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      size: 24.0,
                                                    ),
                                                ].divide(const SizedBox(width: 8.0)),
                                              ),
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            _model.rout =
                                                'Já faço tratamento com Cannabis';
                                            setState(() {});
                                          },
                                          child: Container(
                                            width: double.infinity,
                                            height: 52.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                              border: Border.all(
                                                color: _model.rout ==
                                                        'Já faço tratamento com Cannabis'
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .primary
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .alternate,
                                              ),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(12.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    'Já faço tratamento com Cannabis',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Mulish',
                                                          color: _model.rout ==
                                                                  'Já faço tratamento com Cannabis'
                                                              ? FlutterFlowTheme
                                                                      .of(
                                                                          context)
                                                                  .primary
                                                              : FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                  ),
                                                  if (_model.rout !=
                                                      'Já faço tratamento com Cannabis')
                                                    const Icon(
                                                      Icons.circle_outlined,
                                                      color: Color(0xFFDBE4F1),
                                                      size: 24.0,
                                                    ),
                                                  if (_model.rout ==
                                                      'Já faço tratamento com Cannabis')
                                                    Icon(
                                                      Icons
                                                          .check_circle_rounded,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      size: 24.0,
                                                    ),
                                                ].divide(const SizedBox(width: 8.0)),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ].divide(const SizedBox(height: 18.0)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                    child: FFButtonWidget(
                      onPressed: (_model.rout == null || _model.rout == '')
                          ? null
                          : () async {
                              FFAppState().updatePacienteStruct(
                                (e) => e..tratamentoPrevio = _model.rout,
                              );
                              setState(() {});
                              await PacienteTable().update(
                                data: {
                                  'tramentoPrevio': _model.rout,
                                },
                                matchingRows: (rows) => rows.eq(
                                  'uuid',
                                  currentUserUid,
                                ),
                              );
                              if (_model.rout ==
                                  'Não faço tratamento com Cannabis') {
                                _model.st1 = await StatusPacientTable().insert({
                                  'paciente': FFAppState().paciente.id,
                                  'processo': 'consulta',
                                  'estagio': 'agendarConsulta',
                                });
                                await PacienteTable().update(
                                  data: {
                                    'status_atual': _model.st1?.id,
                                  },
                                  matchingRows: (rows) => rows.eq(
                                    'uuid',
                                    currentUserUid,
                                  ),
                                );

                                context.goNamed('homePage');
                              } else {
                                _model.st2 = await StatusPacientTable().insert({
                                  'paciente': FFAppState().paciente.id,
                                  'processo': 'tratamentoBip',
                                  'estagio': 'comprarBip',
                                });
                                await PacienteTable().update(
                                  data: {
                                    'status_atual': _model.st2?.id,
                                  },
                                  matchingRows: (rows) => rows.eq(
                                    'uuid',
                                    currentUserUid,
                                  ),
                                );

                                context.goNamed('homePage');
                              }

                              setState(() {});
                            },
                      text: 'Continuar',
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 48.0,
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Mulish',
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                ),
                        elevation: 3.0,
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                        disabledColor: FlutterFlowTheme.of(context).alternate,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
