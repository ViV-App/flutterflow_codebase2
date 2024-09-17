import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'bip_geral_infos_model.dart';
export 'bip_geral_infos_model.dart';

class BipGeralInfosWidget extends StatefulWidget {
  const BipGeralInfosWidget({
    super.key,
    this.reqBip,
    this.bip,
  });

  final AjusteDoseRequisicaoRow? reqBip;
  final String? bip;

  @override
  State<BipGeralInfosWidget> createState() => _BipGeralInfosWidgetState();
}

class _BipGeralInfosWidgetState extends State<BipGeralInfosWidget>
    with TickerProviderStateMixin {
  late BipGeralInfosModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BipGeralInfosModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      safeSetState(() => _model.requestCompleter = null);
      await _model.waitForRequestCompleted();
    });

    animationsMap.addAll({
      'columnOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          BlurEffect(
            curve: Curves.easeOut,
            delay: 100.0.ms,
            duration: 600.0.ms,
            begin: const Offset(2.0, 2.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'columnOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          BlurEffect(
            curve: Curves.easeOut,
            delay: 500.0.ms,
            duration: 600.0.ms,
            begin: const Offset(2.0, 2.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'columnOnPageLoadAnimation3': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          BlurEffect(
            curve: Curves.easeOut,
            delay: 900.0.ms,
            duration: 600.0.ms,
            begin: const Offset(2.0, 2.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'columnOnPageLoadAnimation4': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          BlurEffect(
            curve: Curves.easeOut,
            delay: 100.0.ms,
            duration: 600.0.ms,
            begin: const Offset(2.0, 2.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Align(
      alignment: const AlignmentDirectional(0.0, 1.0),
      child: FutureBuilder<List<PacienteRow>>(
        future: (_model.requestCompleter ??= Completer<List<PacienteRow>>()
              ..complete(PacienteTable().querySingleRow(
                queryFn: (q) => q.eq(
                  'uuid',
                  currentUserUid,
                ),
              )))
            .future,
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
          List<PacienteRow> containerPacienteRowList = snapshot.data!;

          final containerPacienteRow = containerPacienteRowList.isNotEmpty
              ? containerPacienteRowList.first
              : null;

          return Material(
            color: Colors.transparent,
            elevation: 3.0,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(0.0),
                bottomRight: Radius.circular(0.0),
                topLeft: Radius.circular(24.0),
                topRight: Radius.circular(24.0),
              ),
            ),
            child: Container(
              width: double.infinity,
              height: MediaQuery.sizeOf(context).height * 0.8,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(0.0),
                  bottomRight: Radius.circular(0.0),
                  topLeft: Radius.circular(24.0),
                  topRight: Radius.circular(24.0),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Align(
                    alignment: const AlignmentDirectional(0.0, -1.0),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                      child: Container(
                        width: 100.0,
                        height: 4.0,
                        decoration: BoxDecoration(
                          color: const Color(0xFFDBE4F1),
                          borderRadius: BorderRadius.circular(32.0),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                28.0, 62.0, 0.0, 0.0),
                            child: Text(
                              'Etapas',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Mulish',
                                    color: FlutterFlowTheme.of(context).primary,
                                    fontSize: 24.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ),
                          if (widget.bip == 'geral')
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  32.0, 32.0, 32.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Icon(
                                            Icons.check_circle,
                                            color: widget.reqBip?.produto ==
                                                    true
                                                ? FlutterFlowTheme.of(context)
                                                    .primary
                                                : FlutterFlowTheme.of(context)
                                                    .alternate,
                                            size: 24.0,
                                          ),
                                          Container(
                                            width: 1.0,
                                            height: 52.0,
                                            decoration: BoxDecoration(
                                              color: widget.reqBip?.produto ==
                                                      true
                                                  ? FlutterFlowTheme.of(context)
                                                      .primary
                                                  : FlutterFlowTheme.of(context)
                                                      .alternate,
                                            ),
                                          ),
                                        ],
                                      ).animateOnPageLoad(animationsMap[
                                          'columnOnPageLoadAnimation1']!),
                                      Expanded(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Utilização de Remédio',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Mulish',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    fontSize: 18.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                            ),
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  'Nos ajude entender quais os efeitos o remédio gerou',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Mulish',
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ].divide(const SizedBox(width: 18.0)),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Icon(
                                            Icons.check_circle,
                                            color: widget
                                                        .reqBip?.dadosGerais ==
                                                    true
                                                ? FlutterFlowTheme.of(context)
                                                    .primary
                                                : FlutterFlowTheme.of(context)
                                                    .alternate,
                                            size: 24.0,
                                          ),
                                          Container(
                                            width: 1.0,
                                            height: 52.0,
                                            decoration: BoxDecoration(
                                              color: widget.reqBip
                                                          ?.dadosGerais ==
                                                      true
                                                  ? FlutterFlowTheme.of(context)
                                                      .primary
                                                  : FlutterFlowTheme.of(context)
                                                      .alternate,
                                            ),
                                          ),
                                        ],
                                      ).animateOnPageLoad(animationsMap[
                                          'columnOnPageLoadAnimation2']!),
                                      Expanded(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Condições de Gerais',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Mulish',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    fontSize: 18.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                            ),
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  'Precisamos saber algumas informações complementares',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Mulish',
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ].divide(const SizedBox(width: 18.0)),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Icon(
                                            Icons.check_circle,
                                            color: widget.reqBip?.pam == true
                                                ? FlutterFlowTheme.of(context)
                                                    .primary
                                                : FlutterFlowTheme.of(context)
                                                    .alternate,
                                            size: 24.0,
                                          ),
                                          Container(
                                            width: 1.0,
                                            height: 52.0,
                                            decoration: BoxDecoration(
                                              color: widget.reqBip?.pam == true
                                                  ? FlutterFlowTheme.of(context)
                                                      .primary
                                                  : FlutterFlowTheme.of(context)
                                                      .alternate,
                                            ),
                                          ),
                                        ],
                                      ).animateOnPageLoad(animationsMap[
                                          'columnOnPageLoadAnimation3']!),
                                      Expanded(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Estilo de Vida',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Mulish',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    fontSize: 18.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                            ),
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  'Além da terapia canabinóide, como está seu estilo de vida',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Mulish',
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ].divide(const SizedBox(width: 18.0)),
                                  ),
                                ],
                              ),
                            ),
                          if (widget.bip == 'especifico')
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  32.0, 32.0, 32.0, 0.0),
                              child: Builder(
                                builder: (context) {
                                  final queixas = functions
                                      .addItemToList(
                                          containerPacienteRow!.queixas
                                              .toList(),
                                          containerPacienteRow
                                              .queixaPrincipal!)
                                      .toList();

                                  return Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: List.generate(queixas.length,
                                        (queixasIndex) {
                                      final queixasItem = queixas[queixasIndex];
                                      return Row(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Icon(
                                                Icons.check_circle,
                                                color: widget.reqBip
                                                            ?.queixasRespondidas
                                                            .contains(
                                                                queixasItem) ==
                                                        true
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .primary
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .alternate,
                                                size: 24.0,
                                              ),
                                              Container(
                                                width: 1.0,
                                                height: 52.0,
                                                decoration: BoxDecoration(
                                                  color: widget.reqBip
                                                              ?.queixasRespondidas
                                                              .contains(
                                                                  queixasItem) ==
                                                          true
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .primary
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .alternate,
                                                ),
                                              ),
                                            ],
                                          ).animateOnPageLoad(animationsMap[
                                              'columnOnPageLoadAnimation4']!),
                                          Expanded(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  queixasItem,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Mulish',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        fontSize: 18.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                ),
                                                if (responsiveVisibility(
                                                  context: context,
                                                  phone: false,
                                                  tablet: false,
                                                ))
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Text(
                                                        '',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Mulish',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                    ],
                                                  ),
                                              ],
                                            ),
                                          ),
                                        ].divide(const SizedBox(width: 18.0)),
                                      );
                                    }),
                                  );
                                },
                              ),
                            ),
                        ].addToEnd(const SizedBox(height: 32.0)),
                      ),
                    ),
                  ),
                  if (widget.bip == 'geral')
                    Align(
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 32.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            var shouldSetState = false;
                            if (widget.reqBip?.produto == false) {
                              _model.qst1 = await QuestionarioTable().queryRows(
                                queryFn: (q) => q.eq(
                                  'nome',
                                  'Produto',
                                ),
                              );
                              shouldSetState = true;
                              _model.res1 =
                                  await RespostasQuestionarioTable().queryRows(
                                queryFn: (q) => q
                                    .eq(
                                      'bipRequisicao',
                                      widget.reqBip?.id,
                                    )
                                    .eq(
                                      'questionario',
                                      _model.qst1?.first.id,
                                    ),
                              );
                              shouldSetState = true;
                              if ((_model.res1 != null &&
                                      (_model.res1)!.isNotEmpty) ==
                                  true) {
                                context.pushNamed(
                                  'questionarioBip',
                                  queryParameters: {
                                    'questionario': serializeParam(
                                      _model.qst1?.first,
                                      ParamType.SupabaseRow,
                                    ),
                                    'bipRequisicao': serializeParam(
                                      widget.reqBip?.id,
                                      ParamType.int,
                                    ),
                                  }.withoutNulls,
                                  extra: <String, dynamic>{
                                    kTransitionInfoKey: const TransitionInfo(
                                      hasTransition: true,
                                      transitionType: PageTransitionType.fade,
                                      duration: Duration(milliseconds: 0),
                                    ),
                                  },
                                );

                                Navigator.pop(context);
                                if (shouldSetState) safeSetState(() {});
                                return;
                              } else {
                                _model.apiResulte7s =
                                    await GenerateBipResponsesCall.call(
                                  bipReq: widget.reqBip?.id,
                                  paciente: FFAppState().paciente.id,
                                  questionario: _model.qst1?.first.id,
                                );

                                shouldSetState = true;

                                context.pushNamed(
                                  'questionarioBip',
                                  queryParameters: {
                                    'questionario': serializeParam(
                                      _model.qst1?.first,
                                      ParamType.SupabaseRow,
                                    ),
                                    'bipRequisicao': serializeParam(
                                      widget.reqBip?.id,
                                      ParamType.int,
                                    ),
                                  }.withoutNulls,
                                  extra: <String, dynamic>{
                                    kTransitionInfoKey: const TransitionInfo(
                                      hasTransition: true,
                                      transitionType: PageTransitionType.fade,
                                      duration: Duration(milliseconds: 0),
                                    ),
                                  },
                                );

                                Navigator.pop(context);
                                if (shouldSetState) safeSetState(() {});
                                return;
                              }
                            } else {
                              if (widget.reqBip?.dadosGerais == false) {
                                _model.qst2 =
                                    await QuestionarioTable().queryRows(
                                  queryFn: (q) => q.eq(
                                    'nome',
                                    'Dados Gerais',
                                  ),
                                );
                                shouldSetState = true;
                                _model.res2 = await RespostasQuestionarioTable()
                                    .queryRows(
                                  queryFn: (q) => q
                                      .eq(
                                        'bipRequisicao',
                                        widget.reqBip?.id,
                                      )
                                      .eq(
                                        'questionario',
                                        _model.qst2?.first.id,
                                      ),
                                );
                                shouldSetState = true;
                                if ((_model.res2 != null &&
                                        (_model.res2)!.isNotEmpty) ==
                                    true) {
                                  context.pushNamed(
                                    'questionarioBip',
                                    queryParameters: {
                                      'questionario': serializeParam(
                                        _model.qst2?.first,
                                        ParamType.SupabaseRow,
                                      ),
                                      'bipRequisicao': serializeParam(
                                        widget.reqBip?.id,
                                        ParamType.int,
                                      ),
                                    }.withoutNulls,
                                    extra: <String, dynamic>{
                                      kTransitionInfoKey: const TransitionInfo(
                                        hasTransition: true,
                                        transitionType: PageTransitionType.fade,
                                        duration: Duration(milliseconds: 0),
                                      ),
                                    },
                                  );

                                  Navigator.pop(context);
                                  if (shouldSetState) safeSetState(() {});
                                  return;
                                } else {
                                  _model.apiResulte7sd =
                                      await GenerateBipResponsesCall.call(
                                    bipReq: widget.reqBip?.id,
                                    paciente: FFAppState().paciente.id,
                                    questionario: _model.qst2?.first.id,
                                  );

                                  shouldSetState = true;

                                  context.pushNamed(
                                    'questionarioBip',
                                    queryParameters: {
                                      'questionario': serializeParam(
                                        _model.qst2?.first,
                                        ParamType.SupabaseRow,
                                      ),
                                      'bipRequisicao': serializeParam(
                                        widget.reqBip?.id,
                                        ParamType.int,
                                      ),
                                    }.withoutNulls,
                                    extra: <String, dynamic>{
                                      kTransitionInfoKey: const TransitionInfo(
                                        hasTransition: true,
                                        transitionType: PageTransitionType.fade,
                                        duration: Duration(milliseconds: 0),
                                      ),
                                    },
                                  );

                                  Navigator.pop(context);
                                  if (shouldSetState) safeSetState(() {});
                                  return;
                                }
                              } else {
                                if (widget.reqBip?.pam == false) {
                                  _model.qst3 =
                                      await QuestionarioTable().queryRows(
                                    queryFn: (q) => q.eq(
                                      'nome',
                                      'PAM',
                                    ),
                                  );
                                  shouldSetState = true;
                                  _model.res3 =
                                      await RespostasQuestionarioTable()
                                          .queryRows(
                                    queryFn: (q) => q
                                        .eq(
                                          'bipRequisicao',
                                          widget.reqBip?.id,
                                        )
                                        .eq(
                                          'questionario',
                                          _model.qst3?.first.id,
                                        ),
                                  );
                                  shouldSetState = true;
                                  if ((_model.res3 != null &&
                                          (_model.res3)!.isNotEmpty) ==
                                      true) {
                                    context.pushNamed(
                                      'questionarioBip',
                                      queryParameters: {
                                        'questionario': serializeParam(
                                          _model.qst3?.first,
                                          ParamType.SupabaseRow,
                                        ),
                                        'bipRequisicao': serializeParam(
                                          widget.reqBip?.id,
                                          ParamType.int,
                                        ),
                                      }.withoutNulls,
                                      extra: <String, dynamic>{
                                        kTransitionInfoKey: const TransitionInfo(
                                          hasTransition: true,
                                          transitionType:
                                              PageTransitionType.fade,
                                          duration: Duration(milliseconds: 0),
                                        ),
                                      },
                                    );

                                    Navigator.pop(context);
                                    if (shouldSetState) safeSetState(() {});
                                    return;
                                  } else {
                                    _model.apiResulte7sdz =
                                        await GenerateBipResponsesCall.call(
                                      bipReq: widget.reqBip?.id,
                                      paciente: FFAppState().paciente.id,
                                      questionario: _model.qst3?.first.id,
                                    );

                                    shouldSetState = true;

                                    context.pushNamed(
                                      'questionarioBip',
                                      queryParameters: {
                                        'questionario': serializeParam(
                                          _model.qst3?.first,
                                          ParamType.SupabaseRow,
                                        ),
                                        'bipRequisicao': serializeParam(
                                          widget.reqBip?.id,
                                          ParamType.int,
                                        ),
                                      }.withoutNulls,
                                      extra: <String, dynamic>{
                                        kTransitionInfoKey: const TransitionInfo(
                                          hasTransition: true,
                                          transitionType:
                                              PageTransitionType.fade,
                                          duration: Duration(milliseconds: 0),
                                        ),
                                      },
                                    );

                                    Navigator.pop(context);
                                    if (shouldSetState) safeSetState(() {});
                                    return;
                                  }
                                } else {
                                  if (shouldSetState) safeSetState(() {});
                                  return;
                                }
                              }
                            }

                            if (shouldSetState) safeSetState(() {});
                          },
                          text: 'Continuar',
                          options: FFButtonOptions(
                            width: 200.0,
                            height: 48.0,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
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
                            borderRadius: BorderRadius.circular(60.0),
                          ),
                        ),
                      ),
                    ),
                  if (widget.bip == 'especifico')
                    Align(
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 32.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            var shouldSetState = false;
                            _model.cUserN = await PacienteTable().queryRows(
                              queryFn: (q) => q.eq(
                                'uuid',
                                currentUserUid,
                              ),
                            );
                            shouldSetState = true;
                            if (functions
                                    .addItemToList(
                                        containerPacienteRow!.queixas.toList(),
                                        containerPacienteRow.queixaPrincipal!)
                                    .contains(widget.reqBip
                                        ?.queixasNaoRespondidas.first) ==
                                true) {
                              _model.qst0 = await QuestionarioTable().queryRows(
                                queryFn: (q) => q.eq(
                                  'nome',
                                  widget.reqBip?.queixasNaoRespondidas.first,
                                ),
                              );
                              shouldSetState = true;
                              _model.resps =
                                  await RespostasQuestionarioTable().queryRows(
                                queryFn: (q) => q
                                    .eq(
                                      'paciente',
                                      FFAppState().paciente.id,
                                    )
                                    .eq(
                                      'questionario',
                                      _model.qst0?.first.id,
                                    )
                                    .eq(
                                      'bipRequisicao',
                                      widget.reqBip?.id,
                                    ),
                              );
                              shouldSetState = true;
                              if ((_model.resps != null &&
                                      (_model.resps)!.isNotEmpty) ==
                                  false) {
                                _model.apiResultik5 =
                                    await GenerateBipResponsesCall.call(
                                  bipReq: widget.reqBip?.id,
                                  paciente: FFAppState().paciente.id,
                                  questionario: _model.qst0?.first.id,
                                );

                                shouldSetState = true;
                                Navigator.pop(context);

                                context.pushNamed(
                                  'questionarioBip',
                                  queryParameters: {
                                    'questionario': serializeParam(
                                      _model.qst0?.first,
                                      ParamType.SupabaseRow,
                                    ),
                                    'bipRequisicao': serializeParam(
                                      widget.reqBip?.id,
                                      ParamType.int,
                                    ),
                                    'queixa': serializeParam(
                                      _model.qst0?.first.nome,
                                      ParamType.String,
                                    ),
                                  }.withoutNulls,
                                );

                                if (shouldSetState) safeSetState(() {});
                                return;
                              } else {
                                Navigator.pop(context);

                                context.pushNamed(
                                  'questionarioBip',
                                  queryParameters: {
                                    'questionario': serializeParam(
                                      _model.qst0?.first,
                                      ParamType.SupabaseRow,
                                    ),
                                    'bipRequisicao': serializeParam(
                                      widget.reqBip?.id,
                                      ParamType.int,
                                    ),
                                    'queixa': serializeParam(
                                      _model.qst0?.first.nome,
                                      ParamType.String,
                                    ),
                                  }.withoutNulls,
                                );

                                if (shouldSetState) safeSetState(() {});
                                return;
                              }
                            } else {
                              if (shouldSetState) safeSetState(() {});
                              return;
                            }

                            if (shouldSetState) safeSetState(() {});
                          },
                          text: 'Continuar',
                          options: FFButtonOptions(
                            width: 200.0,
                            height: 48.0,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
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
                            borderRadius: BorderRadius.circular(60.0),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
