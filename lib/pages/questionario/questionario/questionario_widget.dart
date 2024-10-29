import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/components/forms_filled/forms_filled_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/questionario/questionario_ask/questionario_ask_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'questionario_model.dart';
export 'questionario_model.dart';

class QuestionarioWidget extends StatefulWidget {
  const QuestionarioWidget({
    super.key,
    this.questionario,
  });

  final QuestionarioRow? questionario;

  @override
  State<QuestionarioWidget> createState() => _QuestionarioWidgetState();
}

class _QuestionarioWidgetState extends State<QuestionarioWidget> {
  late QuestionarioModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QuestionarioModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.apiResultwq1 = await ResetFormResponsesCall.call(
        paciente: FFAppState().paciente.id,
        formulario: widget!.questionario?.id,
        ordem: 0,
      );
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: FutureBuilder<List<RespostasQuestionarioRow>>(
                    future: RespostasQuestionarioTable().queryRows(
                      queryFn: (q) => q
                          .eq(
                            'paciente',
                            FFAppState().paciente.id,
                          )
                          .eq(
                            'questionario',
                            widget!.questionario?.id,
                          )
                          .order('ordem', ascending: true),
                    ),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 50.0,
                            height: 50.0,
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                FlutterFlowTheme.of(context).primary,
                              ),
                            ),
                          ),
                        );
                      }
                      List<RespostasQuestionarioRow>
                          pageViewRespostasQuestionarioRowList = snapshot.data!;

                      return Container(
                        width: double.infinity,
                        height: 500.0,
                        child: PageView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          controller: _model.pageViewController ??=
                              PageController(
                                  initialPage: max(
                                      0,
                                      min(
                                          0,
                                          pageViewRespostasQuestionarioRowList
                                                  .length -
                                              1))),
                          onPageChanged: (_) async {
                            _model.lastQuestion =
                                pageViewRespostasQuestionarioRowList
                                            .last.ordem ==
                                        _model.pageViewCurrentIndex
                                    ? true
                                    : false;
                            safeSetState(() {});
                            _model.nextQuestion =
                                pageViewRespostasQuestionarioRowList[
                                        _model.pageViewCurrentIndex]
                                    .nextQuestion;
                            safeSetState(() {});
                            if (pageViewRespostasQuestionarioRowList[
                                        _model.pageViewCurrentIndex]
                                    .pergunta ==
                                30) {
                              _model.nextQuestion = 20;
                              safeSetState(() {});
                              return;
                            } else {
                              return;
                            }
                          },
                          scrollDirection: Axis.horizontal,
                          itemCount:
                              pageViewRespostasQuestionarioRowList.length,
                          itemBuilder: (context, pageViewIndex) {
                            final pageViewRespostasQuestionarioRow =
                                pageViewRespostasQuestionarioRowList[
                                    pageViewIndex];
                            return Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      32.0, 24.0, 32.0, 12.0),
                                  child: FutureBuilder<
                                      List<RespostasQuestionarioRow>>(
                                    future: _model.loader(
                                      requestFn: () =>
                                          RespostasQuestionarioTable()
                                              .queryRows(
                                        queryFn: (q) => q
                                            .eq(
                                              'paciente',
                                              FFAppState().paciente.id,
                                            )
                                            .eq(
                                              'questionario',
                                              widget!.questionario?.id,
                                            )
                                            .order('ordem', ascending: true),
                                      ),
                                    ),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 50.0,
                                            height: 50.0,
                                            child: CircularProgressIndicator(
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                      List<RespostasQuestionarioRow>
                                          progressBarRespostasQuestionarioRowList =
                                          snapshot.data!;

                                      return LinearPercentIndicator(
                                        percent: functions.divideAndNormalize(
                                            pageViewIndex + 1,
                                            progressBarRespostasQuestionarioRowList
                                                .length),
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.85,
                                        lineHeight: 12.0,
                                        animation: true,
                                        animateFromLastPercent: true,
                                        progressColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                        backgroundColor: Color(0xFFE0E3E7),
                                        barRadius: Radius.circular(12.0),
                                        padding: EdgeInsets.zero,
                                      );
                                    },
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(-1.0, -1.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        28.0, 12.0, 0.0, 0.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        await _model.pageViewController
                                            ?.animateToPage(
                                          28,
                                          duration: Duration(milliseconds: 500),
                                          curve: Curves.ease,
                                        );
                                      },
                                      child: Text(
                                        valueOrDefault<String>(
                                          widget!.questionario?.nome,
                                          'c',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Mulish',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              fontSize: 24.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: wrapWithModel(
                                    model:
                                        _model.questionarioAskModels.getModel(
                                      pageViewRespostasQuestionarioRow.id
                                          .toString(),
                                      pageViewIndex,
                                    ),
                                    updateCallback: () => safeSetState(() {}),
                                    updateOnChange: true,
                                    child: QuestionarioAskWidget(
                                      key: Key(
                                        'Keyv3h_${pageViewRespostasQuestionarioRow.id.toString()}',
                                      ),
                                      resposta:
                                          pageViewRespostasQuestionarioRow,
                                      callback: (nextQuestion) async {
                                        _model.nextQuestion = nextQuestion;
                                        safeSetState(() {});
                                      },
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24.0, 8.0, 24.0, 32.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      if (pageViewRespostasQuestionarioRow
                                              .ordem ==
                                          0)
                                        Expanded(
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              context.safePop();
                                            },
                                            text: 'Voltar',
                                            options: FFButtonOptions(
                                              width: 200.0,
                                              height: 48.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      24.0, 0.0, 24.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color: Colors.white,
                                              textStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily: 'Mulish',
                                                    color: Color(0xFFB5C0D3),
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                              elevation: 3.0,
                                              borderSide: BorderSide(
                                                color: Color(0xFFB5C0D3),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(60.0),
                                            ),
                                          ),
                                        ),
                                      if (pageViewRespostasQuestionarioRow
                                              .ordem! >
                                          0)
                                        Expanded(
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              _model.nextQuestion =
                                                  pageViewRespostasQuestionarioRow
                                                      .ordem;
                                              safeSetState(() {});
                                              await _model.pageViewController
                                                  ?.animateToPage(
                                                _model.previuousQuestions.last,
                                                duration:
                                                    Duration(milliseconds: 500),
                                                curve: Curves.ease,
                                              );
                                              _model
                                                  .removeFromPreviuousQuestions(
                                                      _model.previuousQuestions
                                                          .last);
                                              safeSetState(() {});
                                            },
                                            text: 'Voltar',
                                            options: FFButtonOptions(
                                              width: 200.0,
                                              height: 48.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      24.0, 0.0, 24.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color: Colors.white,
                                              textStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily: 'Mulish',
                                                    color: Color(0xFFB5C0D3),
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                              elevation: 3.0,
                                              borderSide: BorderSide(
                                                color: Color(0xFFB5C0D3),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(60.0),
                                            ),
                                          ),
                                        ),
                                      Expanded(
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: FFButtonWidget(
                                            onPressed: ((_model.nextQuestion ==
                                                        null) ||
                                                    (_model.nextQuestion == 0))
                                                ? null
                                                : () async {
                                                    var _shouldSetState = false;
                                                    await Future.wait([
                                                      Future(() async {
                                                        if (_model
                                                                .lastQuestion ==
                                                            true) {
                                                          if (widget!
                                                                  .questionario
                                                                  ?.nome ==
                                                              'Queixa e Diagnóstico') {
                                                            await PacienteTable()
                                                                .update(
                                                              data: {
                                                                'hist_medico_preenchido':
                                                                    true,
                                                              },
                                                              matchingRows:
                                                                  (rows) =>
                                                                      rows.eq(
                                                                'uuid',
                                                                currentUserUid,
                                                              ),
                                                            );
                                                            _model.apiResultr3x =
                                                                await GenerateResponsesCall
                                                                    .call(
                                                              paciente:
                                                                  FFAppState()
                                                                      .paciente
                                                                      .id,
                                                              questionario: 4,
                                                            );

                                                            _shouldSetState =
                                                                true;

                                                            context.goNamed(
                                                              'formPreConsulta',
                                                              extra: <String,
                                                                  dynamic>{
                                                                kTransitionInfoKey:
                                                                    TransitionInfo(
                                                                  hasTransition:
                                                                      true,
                                                                  transitionType:
                                                                      PageTransitionType
                                                                          .fade,
                                                                  duration: Duration(
                                                                      milliseconds:
                                                                          0),
                                                                ),
                                                              },
                                                            );

                                                            _model.wrverfvr =
                                                                await SegmentGroup
                                                                    .trackingCall
                                                                    .call(
                                                              userId:
                                                                  currentUserUid,
                                                              eventName:
                                                                  'pre-appointment concluded',
                                                              propertiesJson: <String,
                                                                  dynamic>{
                                                                'questionario':
                                                                    widget!
                                                                        .questionario,
                                                              },
                                                            );

                                                            _shouldSetState =
                                                                true;
                                                            if (_shouldSetState)
                                                              safeSetState(
                                                                  () {});
                                                            return;
                                                          } else if (widget!
                                                                  .questionario
                                                                  ?.nome ==
                                                              'Histórico de Saúde') {
                                                            await PacienteTable()
                                                                .update(
                                                              data: {
                                                                'fam_social_hist_preenchido':
                                                                    true,
                                                              },
                                                              matchingRows:
                                                                  (rows) =>
                                                                      rows.eq(
                                                                'uuid',
                                                                currentUserUid,
                                                              ),
                                                            );
                                                            _model.apiResultr3xd3 =
                                                                await GenerateResponsesCall
                                                                    .call(
                                                              paciente:
                                                                  FFAppState()
                                                                      .paciente
                                                                      .id,
                                                              questionario: 5,
                                                            );

                                                            _shouldSetState =
                                                                true;

                                                            context.goNamed(
                                                              'formPreConsulta',
                                                              extra: <String,
                                                                  dynamic>{
                                                                kTransitionInfoKey:
                                                                    TransitionInfo(
                                                                  hasTransition:
                                                                      true,
                                                                  transitionType:
                                                                      PageTransitionType
                                                                          .fade,
                                                                  duration: Duration(
                                                                      milliseconds:
                                                                          0),
                                                                ),
                                                              },
                                                            );

                                                            _model.rg435g54 =
                                                                await SegmentGroup
                                                                    .trackingCall
                                                                    .call(
                                                              userId:
                                                                  currentUserUid,
                                                              eventName:
                                                                  'pre-appointment concluded',
                                                              propertiesJson: <String,
                                                                  dynamic>{
                                                                'questionario':
                                                                    widget!
                                                                        .questionario,
                                                              },
                                                            );

                                                            _shouldSetState =
                                                                true;
                                                            if (_shouldSetState)
                                                              safeSetState(
                                                                  () {});
                                                            return;
                                                          } else if (widget!
                                                                  .questionario
                                                                  ?.nome ==
                                                              'Hábitos de vida') {
                                                            await PacienteTable()
                                                                .update(
                                                              data: {
                                                                'lifestyle_preenchido':
                                                                    true,
                                                              },
                                                              matchingRows:
                                                                  (rows) =>
                                                                      rows.eq(
                                                                'uuid',
                                                                currentUserUid,
                                                              ),
                                                            );
                                                            _model.apiResultr3xd3a =
                                                                await GenerateResponsesCall
                                                                    .call(
                                                              paciente:
                                                                  FFAppState()
                                                                      .paciente
                                                                      .id,
                                                              questionario: 6,
                                                            );

                                                            _shouldSetState =
                                                                true;

                                                            context.goNamed(
                                                              'formPreConsulta',
                                                              extra: <String,
                                                                  dynamic>{
                                                                kTransitionInfoKey:
                                                                    TransitionInfo(
                                                                  hasTransition:
                                                                      true,
                                                                  transitionType:
                                                                      PageTransitionType
                                                                          .fade,
                                                                  duration: Duration(
                                                                      milliseconds:
                                                                          0),
                                                                ),
                                                              },
                                                            );

                                                            _model.rg545gt4g =
                                                                await SegmentGroup
                                                                    .trackingCall
                                                                    .call(
                                                              userId:
                                                                  currentUserUid,
                                                              eventName:
                                                                  'pre-appointment concluded',
                                                              propertiesJson: <String,
                                                                  dynamic>{
                                                                'questionario':
                                                                    widget!
                                                                        .questionario,
                                                              },
                                                            );

                                                            _shouldSetState =
                                                                true;
                                                            if (_shouldSetState)
                                                              safeSetState(
                                                                  () {});
                                                            return;
                                                          } else if (widget!
                                                                  .questionario
                                                                  ?.nome ==
                                                              'Histórico Famíliar e Psicosocial') {
                                                            await PacienteTable()
                                                                .update(
                                                              data: {
                                                                'funcionalidade_preenchida':
                                                                    true,
                                                              },
                                                              matchingRows:
                                                                  (rows) =>
                                                                      rows.eq(
                                                                'uuid',
                                                                currentUserUid,
                                                              ),
                                                            );
                                                            await StatusPacientTable()
                                                                .update(
                                                              data: {
                                                                'processo':
                                                                    'tratamentoBip',
                                                                'estagio':
                                                                    'preencherFormularioBip',
                                                              },
                                                              matchingRows:
                                                                  (rows) =>
                                                                      rows.eq(
                                                                'paciente',
                                                                pageViewRespostasQuestionarioRow
                                                                    .paciente,
                                                              ),
                                                            );
                                                            _shouldSetState =
                                                                true;
                                                            await showModalBottomSheet(
                                                              isScrollControlled:
                                                                  true,
                                                              backgroundColor:
                                                                  Colors
                                                                      .transparent,
                                                              enableDrag: false,
                                                              context: context,
                                                              builder:
                                                                  (context) {
                                                                return WebViewAware(
                                                                  child:
                                                                      GestureDetector(
                                                                    onTap: () =>
                                                                        FocusScope.of(context)
                                                                            .unfocus(),
                                                                    child:
                                                                        Padding(
                                                                      padding: MediaQuery
                                                                          .viewInsetsOf(
                                                                              context),
                                                                      child:
                                                                          Container(
                                                                        height: MediaQuery.sizeOf(context).height *
                                                                            0.85,
                                                                        child:
                                                                            FormsFilledWidget(),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            ).then((value) =>
                                                                safeSetState(
                                                                    () {}));

                                                            context.goNamed(
                                                              'homePage',
                                                              extra: <String,
                                                                  dynamic>{
                                                                kTransitionInfoKey:
                                                                    TransitionInfo(
                                                                  hasTransition:
                                                                      true,
                                                                  transitionType:
                                                                      PageTransitionType
                                                                          .fade,
                                                                  duration: Duration(
                                                                      milliseconds:
                                                                          0),
                                                                ),
                                                              },
                                                            );

                                                            _model.rfg534g45 =
                                                                await SegmentGroup
                                                                    .trackingCall
                                                                    .call(
                                                              userId:
                                                                  currentUserUid,
                                                              eventName:
                                                                  'pre-appointment concluded',
                                                              propertiesJson: <String,
                                                                  dynamic>{
                                                                'questionario':
                                                                    widget!
                                                                        .questionario,
                                                              },
                                                            );

                                                            _shouldSetState =
                                                                true;
                                                            if (_shouldSetState)
                                                              safeSetState(
                                                                  () {});
                                                            return;
                                                          } else {
                                                            if (_shouldSetState)
                                                              safeSetState(
                                                                  () {});
                                                            return;
                                                          }
                                                        } else {
                                                          await _model
                                                              .pageViewController
                                                              ?.animateToPage(
                                                            _model
                                                                .nextQuestion!,
                                                            duration: Duration(
                                                                milliseconds:
                                                                    500),
                                                            curve: Curves.ease,
                                                          );
                                                          _model.addToPreviuousQuestions(
                                                              pageViewRespostasQuestionarioRow
                                                                  .ordem!);
                                                          safeSetState(() {});
                                                          await actions
                                                              .hideKeyboard();
                                                          if (_shouldSetState)
                                                            safeSetState(() {});
                                                          return;
                                                        }
                                                      }),
                                                      Future(() async {
                                                        _model.apiResultoio =
                                                            await SegmentGroup
                                                                .trackingCall
                                                                .call(
                                                          userId:
                                                              currentUserUid,
                                                          eventName:
                                                              'next assistant pre-appointment clicked',
                                                          propertiesJson: <String,
                                                              dynamic>{
                                                            'questionario':
                                                                widget!
                                                                    .questionario,
                                                            'step':
                                                                pageViewRespostasQuestionarioRow
                                                                    .ordem,
                                                          },
                                                        );

                                                        _shouldSetState = true;
                                                      }),
                                                    ]);
                                                    if (_shouldSetState)
                                                      safeSetState(() {});
                                                  },
                                            text: 'Continuar',
                                            options: FFButtonOptions(
                                              width: 200.0,
                                              height: 48.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      24.0, 0.0, 24.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily: 'Mulish',
                                                        color: Colors.white,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                              elevation: 3.0,
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(60.0),
                                              disabledColor:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              disabledTextColor: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ].divide(SizedBox(width: 24.0)),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
