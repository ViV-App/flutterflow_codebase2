import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/questionario/questionario_ask/questionario_ask_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'questionario_bip_model.dart';
export 'questionario_bip_model.dart';

class QuestionarioBipWidget extends StatefulWidget {
  const QuestionarioBipWidget({
    super.key,
    this.questionario,
    this.bipRequisicao,
    this.queixa,
  });

  final QuestionarioRow? questionario;
  final int? bipRequisicao;
  final String? queixa;

  @override
  State<QuestionarioBipWidget> createState() => _QuestionarioBipWidgetState();
}

class _QuestionarioBipWidgetState extends State<QuestionarioBipWidget> {
  late QuestionarioBipModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QuestionarioBipModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.apiResultwq1 = await ResetFormResponsesCall.call(
        paciente: FFAppState().paciente.id,
        formulario: widget.questionario?.id,
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
            decoration: const BoxDecoration(),
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
                            widget.questionario?.id,
                          )
                          .eq(
                            'bipRequisicao',
                            widget.bipRequisicao,
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

                      return SizedBox(
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
                                  padding: const EdgeInsetsDirectional.fromSTEB(
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
                                              widget.questionario?.id,
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
                                        backgroundColor: const Color(0xFFE0E3E7),
                                        barRadius: const Radius.circular(12.0),
                                        padding: EdgeInsets.zero,
                                      );
                                    },
                                  ),
                                ),
                                Align(
                                  alignment: const AlignmentDirectional(-1.0, -1.0),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
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
                                          duration: const Duration(milliseconds: 500),
                                          curve: Curves.ease,
                                        );
                                      },
                                      child: Text(
                                        valueOrDefault<String>(
                                          widget.questionario?.nome,
                                          'a',
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
                                        'Key1db_${pageViewRespostasQuestionarioRow.id.toString()}',
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
                                  padding: const EdgeInsetsDirectional.fromSTEB(
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
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      24.0, 0.0, 24.0, 0.0),
                                              iconPadding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color: Colors.white,
                                              textStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily: 'Mulish',
                                                    color: const Color(0xFFB5C0D3),
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                              elevation: 3.0,
                                              borderSide: const BorderSide(
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
                                                    const Duration(milliseconds: 500),
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
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      24.0, 0.0, 24.0, 0.0),
                                              iconPadding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color: Colors.white,
                                              textStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily: 'Mulish',
                                                    color: const Color(0xFFB5C0D3),
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                              elevation: 3.0,
                                              borderSide: const BorderSide(
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
                                              const AlignmentDirectional(0.0, 0.0),
                                          child: FFButtonWidget(
                                            onPressed: ((_model.nextQuestion ==
                                                        null) ||
                                                    (_model.nextQuestion == 0))
                                                ? null
                                                : () async {
                                                    var shouldSetState = false;
                                                    if (_model.lastQuestion ==
                                                        true) {
                                                      if (widget.questionario
                                                              ?.nome ==
                                                          'Produto') {
                                                        await AjusteDoseRequisicaoTable()
                                                            .update(
                                                          data: {
                                                            'produto': true,
                                                          },
                                                          matchingRows:
                                                              (rows) => rows.eq(
                                                            'id',
                                                            widget
                                                                .bipRequisicao,
                                                          ),
                                                        );

                                                        context.goNamed(
                                                          'ajustarDose',
                                                          queryParameters: {
                                                            'page':
                                                                serializeParam(
                                                              'preencher',
                                                              ParamType.String,
                                                            ),
                                                          }.withoutNulls,
                                                          extra: <String,
                                                              dynamic>{
                                                            kTransitionInfoKey:
                                                                const TransitionInfo(
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

                                                        if (shouldSetState) {
                                                          safeSetState(() {});
                                                        }
                                                        return;
                                                      } else if (widget
                                                              .questionario
                                                              ?.nome ==
                                                          'Dados Gerais') {
                                                        await AjusteDoseRequisicaoTable()
                                                            .update(
                                                          data: {
                                                            'dadosGerais': true,
                                                          },
                                                          matchingRows:
                                                              (rows) => rows.eq(
                                                            'id',
                                                            widget
                                                                .bipRequisicao,
                                                          ),
                                                        );

                                                        context.goNamed(
                                                          'ajustarDose',
                                                          queryParameters: {
                                                            'page':
                                                                serializeParam(
                                                              'preencher',
                                                              ParamType.String,
                                                            ),
                                                          }.withoutNulls,
                                                          extra: <String,
                                                              dynamic>{
                                                            kTransitionInfoKey:
                                                                const TransitionInfo(
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

                                                        if (shouldSetState) {
                                                          safeSetState(() {});
                                                        }
                                                        return;
                                                      } else if (widget
                                                              .questionario
                                                              ?.nome ==
                                                          'PAM') {
                                                        await AjusteDoseRequisicaoTable()
                                                            .update(
                                                          data: {
                                                            'pam': true,
                                                          },
                                                          matchingRows:
                                                              (rows) => rows.eq(
                                                            'id',
                                                            widget
                                                                .bipRequisicao,
                                                          ),
                                                        );

                                                        context.goNamed(
                                                          'ajustarDose',
                                                          queryParameters: {
                                                            'page':
                                                                serializeParam(
                                                              'preencher',
                                                              ParamType.String,
                                                            ),
                                                          }.withoutNulls,
                                                          extra: <String,
                                                              dynamic>{
                                                            kTransitionInfoKey:
                                                                const TransitionInfo(
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

                                                        if (shouldSetState) {
                                                          safeSetState(() {});
                                                        }
                                                        return;
                                                      } else if (widget
                                                              .questionario
                                                              ?.categoria ==
                                                          'BIP Especifico') {
                                                        _model.req =
                                                            await AjusteDoseRequisicaoTable()
                                                                .queryRows(
                                                          queryFn: (q) => q.eq(
                                                            'id',
                                                            widget
                                                                .bipRequisicao,
                                                          ),
                                                        );
                                                        shouldSetState = true;
                                                        await AjusteDoseRequisicaoTable()
                                                            .update(
                                                          data: {
                                                            'queixasRespondidas':
                                                                functions.addItemToList(
                                                                    _model
                                                                        .req!
                                                                        .first
                                                                        .queixasRespondidas
                                                                        .toList(),
                                                                    widget
                                                                        .queixa!),
                                                          },
                                                          matchingRows:
                                                              (rows) => rows.eq(
                                                            'id',
                                                            widget
                                                                .bipRequisicao,
                                                          ),
                                                        );
                                                        await AjusteDoseRequisicaoTable()
                                                            .update(
                                                          data: {
                                                            'queixasNaoRespondidas':
                                                                functions.removeItemAtString(
                                                                    _model
                                                                        .req!
                                                                        .first
                                                                        .queixasNaoRespondidas
                                                                        .toList(),
                                                                    widget
                                                                        .queixa!),
                                                          },
                                                          matchingRows:
                                                              (rows) => rows.eq(
                                                            'id',
                                                            widget
                                                                .bipRequisicao,
                                                          ),
                                                        );
                                                        _model.req11 =
                                                            await AjusteDoseRequisicaoTable()
                                                                .queryRows(
                                                          queryFn: (q) => q.eq(
                                                            'id',
                                                            widget
                                                                .bipRequisicao,
                                                          ),
                                                        );
                                                        shouldSetState = true;
                                                        if ((_model.req11?.first
                                                                        .queixasNaoRespondidas !=
                                                                    null &&
                                                                (_model
                                                                        .req11
                                                                        ?.first
                                                                        .queixasNaoRespondidas)!
                                                                    .isNotEmpty) ==
                                                            false) {
                                                          await StatusPacientTable()
                                                              .update(
                                                            data: {
                                                              'processo':
                                                                  'tratamentoBip',
                                                              'estagio':
                                                                  'receberAjusteBip',
                                                            },
                                                            matchingRows:
                                                                (rows) =>
                                                                    rows.eq(
                                                              'paciente',
                                                              FFAppState()
                                                                  .paciente
                                                                  .id,
                                                            ),
                                                          );

                                                          context.pushNamed(
                                                              'homePage');

                                                          await showDialog(
                                                            context: context,
                                                            builder:
                                                                (alertDialogContext) {
                                                              return WebViewAware(
                                                                child:
                                                                    AlertDialog(
                                                                  title: const Text(
                                                                      'Ajuste de dose solicitado'),
                                                                  content: const Text(
                                                                      'Dentro de 10 dias, seu ajuste de dose estará disponivel no app!'),
                                                                  actions: [
                                                                    TextButton(
                                                                      onPressed:
                                                                          () =>
                                                                              Navigator.pop(alertDialogContext),
                                                                      child: const Text(
                                                                          'Ok'),
                                                                    ),
                                                                  ],
                                                                ),
                                                              );
                                                            },
                                                          );
                                                        } else {
                                                          context.pushNamed(
                                                            'ajustarDose',
                                                            queryParameters: {
                                                              'page':
                                                                  serializeParam(
                                                                'preencher',
                                                                ParamType
                                                                    .String,
                                                              ),
                                                            }.withoutNulls,
                                                          );

                                                          await Future.delayed(
                                                              const Duration(
                                                                  milliseconds:
                                                                      500));
                                                        }

                                                        if (shouldSetState) {
                                                          safeSetState(() {});
                                                        }
                                                        return;
                                                      } else {
                                                        if (shouldSetState) {
                                                          safeSetState(() {});
                                                        }
                                                        return;
                                                      }
                                                    } else {
                                                      if (widget.questionario
                                                              ?.id ==
                                                          14) {
                                                        _model.req1 =
                                                            await AjusteDoseRequisicaoTable()
                                                                .queryRows(
                                                          queryFn: (q) => q.eq(
                                                            'id',
                                                            widget
                                                                .bipRequisicao,
                                                          ),
                                                        );
                                                        shouldSetState = true;
                                                        await AjusteDoseRequisicaoTable()
                                                            .update(
                                                          data: {
                                                            'queixasRespondidas':
                                                                functions.addItemToList(
                                                                    _model
                                                                        .req1!
                                                                        .first
                                                                        .queixasRespondidas
                                                                        .toList(),
                                                                    widget
                                                                        .queixa!),
                                                          },
                                                          matchingRows:
                                                              (rows) => rows.eq(
                                                            'id',
                                                            widget
                                                                .bipRequisicao,
                                                          ),
                                                        );
                                                        await AjusteDoseRequisicaoTable()
                                                            .update(
                                                          data: {
                                                            'queixasNaoRespondidas':
                                                                functions.removeItemAtString(
                                                                    _model
                                                                        .req1!
                                                                        .first
                                                                        .queixasNaoRespondidas
                                                                        .toList(),
                                                                    widget
                                                                        .queixa!),
                                                          },
                                                          matchingRows:
                                                              (rows) => rows.eq(
                                                            'id',
                                                            widget
                                                                .bipRequisicao,
                                                          ),
                                                        );
                                                        _model.req12 =
                                                            await AjusteDoseRequisicaoTable()
                                                                .queryRows(
                                                          queryFn: (q) => q.eq(
                                                            'id',
                                                            widget
                                                                .bipRequisicao,
                                                          ),
                                                        );
                                                        shouldSetState = true;
                                                        if ((_model.req12?.first
                                                                        .queixasNaoRespondidas !=
                                                                    null &&
                                                                (_model
                                                                        .req12
                                                                        ?.first
                                                                        .queixasNaoRespondidas)!
                                                                    .isNotEmpty) ==
                                                            false) {
                                                          context.pushNamed(
                                                              'homePage');
                                                        } else {
                                                          context.pushNamed(
                                                            'ajustarDose',
                                                            queryParameters: {
                                                              'page':
                                                                  serializeParam(
                                                                'preencher',
                                                                ParamType
                                                                    .String,
                                                              ),
                                                            }.withoutNulls,
                                                          );

                                                          await Future.delayed(
                                                              const Duration(
                                                                  milliseconds:
                                                                      500));
                                                        }

                                                        if (shouldSetState) {
                                                          safeSetState(() {});
                                                        }
                                                        return;
                                                      } else {
                                                        await _model
                                                            .pageViewController
                                                            ?.animateToPage(
                                                          _model.nextQuestion!,
                                                          duration: const Duration(
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
                                                        if (shouldSetState) {
                                                          safeSetState(() {});
                                                        }
                                                        return;
                                                      }
                                                    }

                                                    if (shouldSetState) {
                                                      safeSetState(() {});
                                                    }
                                                  },
                                            text: 'Continuar',
                                            options: FFButtonOptions(
                                              width: 200.0,
                                              height: 48.0,
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      24.0, 0.0, 24.0, 0.0),
                                              iconPadding: const EdgeInsetsDirectional
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
                                              borderSide: const BorderSide(
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
                                    ].divide(const SizedBox(width: 24.0)),
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
