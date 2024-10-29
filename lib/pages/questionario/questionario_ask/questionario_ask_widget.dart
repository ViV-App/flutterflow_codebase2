import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/upload_data.dart';
import '/pages/questionario/create_object/create_object_widget.dart';
import '/pages/questionario/object_description/object_description_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'questionario_ask_model.dart';
export 'questionario_ask_model.dart';

class QuestionarioAskWidget extends StatefulWidget {
  const QuestionarioAskWidget({
    super.key,
    required this.resposta,
    this.callback,
    this.sdw,
  });

  final RespostasQuestionarioRow? resposta;
  final Future Function(int? nextQuestion)? callback;
  final int? sdw;

  @override
  State<QuestionarioAskWidget> createState() => _QuestionarioAskWidgetState();
}

class _QuestionarioAskWidgetState extends State<QuestionarioAskWidget> {
  late QuestionarioAskModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QuestionarioAskModel());

    _model.textInputTextController ??= TextEditingController();
    _model.textInputFocusNode ??= FocusNode();

    _model.numberInputTextController ??= TextEditingController();
    _model.numberInputFocusNode ??= FocusNode();

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

    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
      child: FutureBuilder<List<RespostasQuestionarioRow>>(
        future: (_model.requestCompleter ??=
                Completer<List<RespostasQuestionarioRow>>()
                  ..complete(RespostasQuestionarioTable().querySingleRow(
                    queryFn: (q) => q.eq(
                      'id',
                      widget.resposta?.id,
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
          List<RespostasQuestionarioRow> mainRespostasQuestionarioRowList =
              snapshot.data!;

          final mainRespostasQuestionarioRow =
              mainRespostasQuestionarioRowList.isNotEmpty
                  ? mainRespostasQuestionarioRowList.first
                  : null;

          return SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(28.0, 32.0, 28.0, 0.0),
                  child: FutureBuilder<List<QuestionarioPerguntasRow>>(
                    future: QuestionarioPerguntasTable().querySingleRow(
                      queryFn: (q) => q.eq(
                        'id',
                        widget.resposta?.pergunta,
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
                              valueColor: AlwaysStoppedAnimation<Color>(
                                FlutterFlowTheme.of(context).primary,
                              ),
                            ),
                          ),
                        );
                      }
                      List<QuestionarioPerguntasRow>
                          columnQuestionarioPerguntasRowList = snapshot.data!;

                      final columnQuestionarioPerguntasRow =
                          columnQuestionarioPerguntasRowList.isNotEmpty
                              ? columnQuestionarioPerguntasRowList.first
                              : null;

                      return Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: const AlignmentDirectional(-1.0, -1.0),
                            child: Text(
                              valueOrDefault<String>(
                                () {
                                  if (columnQuestionarioPerguntasRow
                                          ?.pergunta ==
                                      'Após iniciar o tratamento, você notou melhora em sua queixa PRINCIPAL [base de dados] que busca tratar com a terapia canabinoide? ') {
                                    return 'Após iniciar o tratamento, você notou melhora em sua queixa PRINCIPAL [ ${FFAppState().paciente.queixaPrincipal} ] que busca tratar com a terapia canabinoide? ';
                                  } else if ((columnQuestionarioPerguntasRow
                                              ?.pergunta ==
                                          'Você notou melhora nas queixas SECUNDÁRIAS [Base de dados] que busca tratar com a terapia canabinoide? ') &&
                                      (FFAppState().paciente.queixas.length ==
                                          1)) {
                                    return 'Você notou melhora nas queixas SECUNDÁRIAS [ ${FFAppState().paciente.queixas[0]} ] que busca tratar com a terapia canabinoide? ';
                                  } else if ((columnQuestionarioPerguntasRow
                                              ?.pergunta ==
                                          'Você notou melhora nas queixas SECUNDÁRIAS [Base de dados] que busca tratar com a terapia canabinoide? ') &&
                                      (FFAppState().paciente.queixas.length ==
                                          2)) {
                                    return 'Você notou melhora nas queixas SECUNDÁRIAS [ ${FFAppState().paciente.queixas[0]}, ${FFAppState().paciente.queixas[1]} ] que busca tratar com a terapia canabinoide? ';
                                  } else {
                                    return columnQuestionarioPerguntasRow
                                        ?.pergunta;
                                  }
                                }(),
                                'Question',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Mulish',
                                    color: const Color(0xFF8798B5),
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                          if (columnQuestionarioPerguntasRow?.answerTyype ==
                              'single selector')
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 24.0, 0.0, 0.0),
                              child: Builder(
                                builder: (context) {
                                  final options = columnQuestionarioPerguntasRow
                                          ?.opcoes
                                          .toList() ??
                                      [];

                                  return Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: List.generate(options.length,
                                        (optionsIndex) {
                                      final optionsItem = options[optionsIndex];
                                      return InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          await RespostasQuestionarioTable()
                                              .update(
                                            data: {
                                              'single_text_response':
                                                  getJsonField(
                                                optionsItem,
                                                r'''$.title''',
                                              ).toString(),
                                              'next_question': getJsonField(
                                                optionsItem,
                                                r'''$.next_question''',
                                              ),
                                            },
                                            matchingRows: (rows) => rows.eq(
                                              'id',
                                              widget.resposta?.id,
                                            ),
                                          );
                                          safeSetState(() =>
                                              _model.requestCompleter = null);
                                          await widget.callback?.call(
                                            getJsonField(
                                              optionsItem,
                                              r'''$.next_question''',
                                            ),
                                          );
                                        },
                                        child: Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                            border: Border.all(
                                              color: mainRespostasQuestionarioRow
                                                          ?.singleTextResponse ==
                                                      getJsonField(
                                                        optionsItem,
                                                        r'''$.title''',
                                                      ).toString()
                                                  ? FlutterFlowTheme.of(context)
                                                      .primary
                                                  : const Color(0xFFDBE4F1),
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
                                                Expanded(
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    4.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          getJsonField(
                                                            optionsItem,
                                                            r'''$.title''',
                                                          ).toString(),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Mulish',
                                                                color: mainRespostasQuestionarioRow
                                                                            ?.singleTextResponse ==
                                                                        getJsonField(
                                                                          optionsItem,
                                                                          r'''$.title''',
                                                                        )
                                                                            .toString()
                                                                    ? FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary
                                                                    : FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                if (mainRespostasQuestionarioRow
                                                        ?.singleTextResponse !=
                                                    getJsonField(
                                                      optionsItem,
                                                      r'''$.title''',
                                                    ).toString())
                                                  const Icon(
                                                    Icons.circle_outlined,
                                                    color: Color(0xFFDBE4F1),
                                                    size: 24.0,
                                                  ),
                                                if (mainRespostasQuestionarioRow
                                                        ?.singleTextResponse ==
                                                    getJsonField(
                                                      optionsItem,
                                                      r'''$.title''',
                                                    ).toString())
                                                  Icon(
                                                    Icons.check_circle_sharp,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    size: 24.0,
                                                  ),
                                              ].divide(const SizedBox(width: 8.0)),
                                            ),
                                          ),
                                        ),
                                      );
                                    }).divide(const SizedBox(height: 12.0)),
                                  );
                                },
                              ),
                            ),
                          if (columnQuestionarioPerguntasRow?.answerTyype ==
                              'multi selector')
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 24.0, 0.0, 0.0),
                              child: Builder(
                                builder: (context) {
                                  final options = columnQuestionarioPerguntasRow
                                          ?.opcoes
                                          .toList() ??
                                      [];

                                  return Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: List.generate(options.length,
                                        (optionsIndex) {
                                      final optionsItem = options[optionsIndex];
                                      return InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          if (mainRespostasQuestionarioRow
                                                  ?.multiTextResponse
                                                  .contains(getJsonField(
                                                optionsItem,
                                                r'''$.title''',
                                              ).toString()) ==
                                              true) {
                                            await RespostasQuestionarioTable()
                                                .update(
                                              data: {
                                                'multi_text_response': functions
                                                    .removeItemAtString(
                                                        mainRespostasQuestionarioRow!
                                                            .multiTextResponse
                                                            .toList(),
                                                        getJsonField(
                                                          optionsItem,
                                                          r'''$.title''',
                                                        ).toString()),
                                                'next_question': getJsonField(
                                                  optionsItem,
                                                  r'''$.next_question''',
                                                ),
                                              },
                                              matchingRows: (rows) => rows.eq(
                                                'id',
                                                widget.resposta?.id,
                                              ),
                                            );
                                            safeSetState(() =>
                                                _model.requestCompleter = null);
                                          } else {
                                            await RespostasQuestionarioTable()
                                                .update(
                                              data: {
                                                'multi_text_response':
                                                    functions.addItemToList(
                                                        mainRespostasQuestionarioRow!
                                                            .multiTextResponse
                                                            .toList(),
                                                        getJsonField(
                                                          optionsItem,
                                                          r'''$.title''',
                                                        ).toString()),
                                                'next_question': getJsonField(
                                                  optionsItem,
                                                  r'''$.next_question''',
                                                ),
                                              },
                                              matchingRows: (rows) => rows.eq(
                                                'id',
                                                widget.resposta?.id,
                                              ),
                                            );
                                            safeSetState(() =>
                                                _model.requestCompleter = null);
                                          }

                                          await widget.callback?.call(
                                            getJsonField(
                                              optionsItem,
                                              r'''$.next_question''',
                                            ),
                                          );
                                        },
                                        child: Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                            border: Border.all(
                                              color: mainRespostasQuestionarioRow
                                                          ?.multiTextResponse
                                                          .contains(
                                                              getJsonField(
                                                        optionsItem,
                                                        r'''$.title''',
                                                      ).toString()) ==
                                                      true
                                                  ? FlutterFlowTheme.of(context)
                                                      .primary
                                                  : const Color(0xFFDBE4F1),
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
                                                Expanded(
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    4.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          getJsonField(
                                                            optionsItem,
                                                            r'''$.title''',
                                                          ).toString(),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Mulish',
                                                                color: mainRespostasQuestionarioRow?.multiTextResponse.contains(
                                                                            getJsonField(
                                                                          optionsItem,
                                                                          r'''$.title''',
                                                                        )
                                                                                .toString()) ==
                                                                        true
                                                                    ? FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary
                                                                    : FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                if (mainRespostasQuestionarioRow
                                                        ?.multiTextResponse
                                                        .contains(getJsonField(
                                                      optionsItem,
                                                      r'''$.title''',
                                                    ).toString()) ==
                                                    false)
                                                  const Icon(
                                                    Icons.circle_outlined,
                                                    color: Color(0xFFDBE4F1),
                                                    size: 24.0,
                                                  ),
                                                if (mainRespostasQuestionarioRow
                                                        ?.multiTextResponse
                                                        .contains(getJsonField(
                                                      optionsItem,
                                                      r'''$.title''',
                                                    ).toString()) ==
                                                    true)
                                                  Icon(
                                                    Icons.check_circle_sharp,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    size: 24.0,
                                                  ),
                                              ].divide(const SizedBox(width: 8.0)),
                                            ),
                                          ),
                                        ),
                                      );
                                    }).divide(const SizedBox(height: 12.0)),
                                  );
                                },
                              ),
                            ),
                          if (columnQuestionarioPerguntasRow?.answerTyype ==
                              'user queixa multi select')
                            FutureBuilder<List<PacienteRow>>(
                              future: PacienteTable().querySingleRow(
                                queryFn: (q) => q.eq(
                                  'id',
                                  FFAppState().paciente.id,
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
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                List<PacienteRow> multiQueixaPacienteRowList =
                                    snapshot.data!;

                                final multiQueixaPacienteRow =
                                    multiQueixaPacienteRowList.isNotEmpty
                                        ? multiQueixaPacienteRowList.first
                                        : null;

                                return Container(
                                  decoration: const BoxDecoration(),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 24.0, 0.0, 0.0),
                                    child: Builder(
                                      builder: (context) {
                                        final queixas = functions
                                            .addItemToList(
                                                multiQueixaPacienteRow!.queixas
                                                    .toList(),
                                                multiQueixaPacienteRow
                                                    .queixaPrincipal!)
                                            .toList();
                                        if (queixas.isEmpty) {
                                          return Center(
                                            child: Image.asset(
                                              'https://www.shutterstock.com/image-illustration/no-picture-available-placeholder-thumbnail-600nw-2179364083.jpg',
                                            ),
                                          );
                                        }

                                        return Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: List.generate(
                                              queixas.length, (queixasIndex) {
                                            final queixasItem =
                                                queixas[queixasIndex];
                                            return InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                if (mainRespostasQuestionarioRow!
                                                        .multiTextResponse
                                                        .length <
                                                    3) {
                                                  if (mainRespostasQuestionarioRow
                                                          .multiTextResponse
                                                          .contains(
                                                              queixasItem) ==
                                                      true) {
                                                    await RespostasQuestionarioTable()
                                                        .update(
                                                      data: {
                                                        'multi_text_response': functions
                                                            .removeItemAtString(
                                                                mainRespostasQuestionarioRow
                                                                    .multiTextResponse
                                                                    .toList(),
                                                                queixasItem),
                                                      },
                                                      matchingRows: (rows) =>
                                                          rows.eq(
                                                        'id',
                                                        widget.resposta?.id,
                                                      ),
                                                    );
                                                    safeSetState(() => _model
                                                            .requestCompleter =
                                                        null);
                                                  } else {
                                                    await RespostasQuestionarioTable()
                                                        .update(
                                                      data: {
                                                        'multi_text_response':
                                                            functions.addItemToList(
                                                                mainRespostasQuestionarioRow
                                                                    .multiTextResponse
                                                                    .toList(),
                                                                queixasItem),
                                                      },
                                                      matchingRows: (rows) =>
                                                          rows.eq(
                                                        'id',
                                                        widget.resposta?.id,
                                                      ),
                                                    );
                                                    _model.addToListQueixas(
                                                        queixasItem);
                                                    safeSetState(() {});
                                                    safeSetState(() => _model
                                                            .requestCompleter =
                                                        null);
                                                  }

                                                  await widget.callback?.call(
                                                    getJsonField(
                                                      columnQuestionarioPerguntasRow
                                                          ?.opcoes.first,
                                                      r'''$.next_question''',
                                                    ),
                                                  );
                                                  return;
                                                } else {
                                                  if (mainRespostasQuestionarioRow
                                                          .multiTextResponse
                                                          .contains(
                                                              queixasItem) ==
                                                      true) {
                                                    await RespostasQuestionarioTable()
                                                        .update(
                                                      data: {
                                                        'multi_text_response': functions
                                                            .removeItemAtString(
                                                                mainRespostasQuestionarioRow
                                                                    .multiTextResponse
                                                                    .toList(),
                                                                queixasItem),
                                                      },
                                                      matchingRows: (rows) =>
                                                          rows.eq(
                                                        'id',
                                                        widget.resposta?.id,
                                                      ),
                                                    );
                                                    safeSetState(() => _model
                                                            .requestCompleter =
                                                        null);
                                                    await _model
                                                        .waitForRequestCompleted();
                                                    return;
                                                  } else {
                                                    return;
                                                  }
                                                }
                                              },
                                              child: Container(
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                  border: Border.all(
                                                    color: mainRespostasQuestionarioRow
                                                                ?.multiTextResponse
                                                                .contains(
                                                                    queixasItem) ==
                                                            true
                                                        ? FlutterFlowTheme.of(
                                                                context)
                                                            .primary
                                                        : const Color(0xFFDBE4F1),
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(12.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Expanded(
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          4.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Text(
                                                                queixasItem,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Mulish',
                                                                      color: mainRespostasQuestionarioRow?.multiTextResponse.contains(queixasItem) ==
                                                                              true
                                                                          ? FlutterFlowTheme.of(context)
                                                                              .primary
                                                                          : FlutterFlowTheme.of(context)
                                                                              .primaryText,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                    ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      if (mainRespostasQuestionarioRow
                                                              ?.multiTextResponse
                                                              .contains(
                                                                  queixasItem) ==
                                                          false)
                                                        const Icon(
                                                          Icons.circle_outlined,
                                                          color:
                                                              Color(0xFFDBE4F1),
                                                          size: 24.0,
                                                        ),
                                                      if (mainRespostasQuestionarioRow
                                                              ?.multiTextResponse
                                                              .contains(
                                                                  queixasItem) ==
                                                          true)
                                                        Icon(
                                                          Icons
                                                              .check_circle_sharp,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          size: 24.0,
                                                        ),
                                                    ].divide(
                                                        const SizedBox(width: 8.0)),
                                                  ),
                                                ),
                                              ),
                                            );
                                          }).divide(const SizedBox(height: 12.0)),
                                        );
                                      },
                                    ),
                                  ),
                                );
                              },
                            ),
                          if (columnQuestionarioPerguntasRow?.answerTyype ==
                              'text input')
                            Align(
                              alignment: const AlignmentDirectional(0.0, -1.0),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 24.0, 0.0, 0.0),
                                child: TextFormField(
                                  controller: _model.textInputTextController,
                                  focusNode: _model.textInputFocusNode,
                                  onChanged: (_) => EasyDebounce.debounce(
                                    '_model.textInputTextController',
                                    const Duration(milliseconds: 500),
                                    () async {
                                      if (_model.textInputTextController.text ==
                                              '') {
                                        await widget.callback?.call(
                                          0,
                                        );
                                      } else {
                                        await RespostasQuestionarioTable()
                                            .update(
                                          data: {
                                            'single_text_response': _model
                                                .textInputTextController.text,
                                            'next_question': getJsonField(
                                              columnQuestionarioPerguntasRow
                                                  ?.opcoes.first,
                                              r'''$.next_question''',
                                            ),
                                          },
                                          matchingRows: (rows) => rows.eq(
                                            'id',
                                            widget.resposta?.id,
                                          ),
                                        );
                                        await widget.callback?.call(
                                          getJsonField(
                                            columnQuestionarioPerguntasRow
                                                ?.opcoes.first,
                                            r'''$.next_question''',
                                          ),
                                        );
                                      }
                                    },
                                  ),
                                  autofocus: false,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    isDense: false,
                                    hintText: 'Escreva..',
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Mulish',
                                          color: const Color(0xFF8798B5),
                                          letterSpacing: 0.0,
                                        ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Color(0x0E294B0D),
                                        width: 3.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        width: 3.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 3.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 3.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    filled: true,
                                    fillColor: Colors.white,
                                    contentPadding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            18.0, 32.0, 18.0, 0.0),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Mulish',
                                        letterSpacing: 0.0,
                                      ),
                                  maxLines: 10,
                                  minLines: 5,
                                  validator: _model
                                      .textInputTextControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                            ),
                          if (columnQuestionarioPerguntasRow?.answerTyype ==
                              'number input')
                            Align(
                              alignment: const AlignmentDirectional(0.0, -1.0),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 24.0, 0.0, 0.0),
                                child: TextFormField(
                                  controller: _model.numberInputTextController,
                                  focusNode: _model.numberInputFocusNode,
                                  onChanged: (_) => EasyDebounce.debounce(
                                    '_model.numberInputTextController',
                                    const Duration(milliseconds: 500),
                                    () async {
                                      if (_model.numberInputTextController
                                                  .text ==
                                              '') {
                                        await widget.callback?.call(
                                          0,
                                        );
                                      } else {
                                        await RespostasQuestionarioTable()
                                            .update(
                                          data: {
                                            'single_text_response': _model
                                                .numberInputTextController.text,
                                            'next_question': getJsonField(
                                              columnQuestionarioPerguntasRow
                                                  ?.opcoes.first,
                                              r'''$.next_question''',
                                            ),
                                          },
                                          matchingRows: (rows) => rows.eq(
                                            'id',
                                            widget.resposta?.id,
                                          ),
                                        );
                                        await widget.callback?.call(
                                          getJsonField(
                                            columnQuestionarioPerguntasRow
                                                ?.opcoes.first,
                                            r'''$.next_question''',
                                          ),
                                        );
                                      }
                                    },
                                  ),
                                  autofocus: false,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    isDense: false,
                                    hintText: () {
                                      if (columnQuestionarioPerguntasRow
                                              ?.pergunta ==
                                          'Altura aproximada') {
                                        return 'Ex.: 150';
                                      } else if (columnQuestionarioPerguntasRow
                                              ?.pergunta ==
                                          'Peso aproximado') {
                                        return 'Ex.: 80.4';
                                      } else {
                                        return '00';
                                      }
                                    }(),
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Mulish',
                                          color: const Color(0xFF8798B5),
                                          letterSpacing: 0.0,
                                        ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Color(0x0E294B0D),
                                        width: 3.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        width: 3.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 3.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 3.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    filled: true,
                                    fillColor: Colors.white,
                                    contentPadding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            18.0, 32.0, 18.0, 0.0),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Mulish',
                                        letterSpacing: 0.0,
                                      ),
                                  minLines: 1,
                                  keyboardType:
                                      const TextInputType.numberWithOptions(
                                          decimal: true),
                                  validator: _model
                                      .numberInputTextControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                            ),
                          if (columnQuestionarioPerguntasRow?.answerTyype ==
                              'create remedio')
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 24.0, 0.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Builder(
                                    builder: (context) {
                                      final objects =
                                          mainRespostasQuestionarioRow
                                                  ?.multiTextResponse
                                                  .toList() ??
                                              [];

                                      return Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: List.generate(objects.length,
                                            (objectsIndex) {
                                          final objectsItem =
                                              objects[objectsIndex];
                                          return Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              color: const Color(0x0F5D67E2),
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                            ),
                                            child: Stack(
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(18.0, 18.0,
                                                          18.0, 18.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    24.0,
                                                                    0.0),
                                                        child: Text(
                                                          objectsItem,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Mulish',
                                                                fontSize: 16.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                        ),
                                                      ),
                                                    ].divide(
                                                        const SizedBox(height: 24.0)),
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          1.0, -1.0),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 8.0,
                                                                8.0, 0.0),
                                                    child: InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        await RespostasQuestionarioTable()
                                                            .update(
                                                          data: {
                                                            'multi_text_response':
                                                                functions.removeItemAtIndex(
                                                                    mainRespostasQuestionarioRow!
                                                                        .multiTextResponse
                                                                        .toList(),
                                                                    objectsIndex),
                                                          },
                                                          matchingRows:
                                                              (rows) => rows.eq(
                                                            'id',
                                                            widget
                                                                .resposta?.id,
                                                          ),
                                                        );
                                                        safeSetState(() => _model
                                                                .requestCompleter =
                                                            null);
                                                      },
                                                      child: FaIcon(
                                                        FontAwesomeIcons
                                                            .minusCircle,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .tertiary,
                                                        size: 24.0,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        }).divide(const SizedBox(height: 18.0)),
                                      );
                                    },
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 24.0, 0.0, 0.0),
                                    child: Container(
                                      width: double.infinity,
                                      height: 285.0,
                                      decoration: const BoxDecoration(),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: wrapWithModel(
                                              model: _model.createObjectModel,
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child: CreateObjectWidget(
                                                resposta:
                                                    mainRespostasQuestionarioRow,
                                                callbck: () async {
                                                  safeSetState(() => _model
                                                      .requestCompleter = null);
                                                  await _model
                                                      .waitForRequestCompleted();
                                                  await RespostasQuestionarioTable()
                                                      .update(
                                                    data: {
                                                      'next_question':
                                                          getJsonField(
                                                        columnQuestionarioPerguntasRow
                                                            ?.opcoes.first,
                                                        r'''$.next_question''',
                                                      ),
                                                    },
                                                    matchingRows: (rows) =>
                                                        rows.eq(
                                                      'id',
                                                      widget.resposta?.id,
                                                    ),
                                                  );
                                                  await widget.callback?.call(
                                                    getJsonField(
                                                      columnQuestionarioPerguntasRow
                                                          ?.opcoes.first,
                                                      r'''$.next_question''',
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          if (columnQuestionarioPerguntasRow?.answerTyype ==
                              'enrich previous list')
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 24.0, 0.0, 0.0),
                                  child: FutureBuilder<
                                      List<RespostasQuestionarioRow>>(
                                    future: RespostasQuestionarioTable()
                                        .querySingleRow(
                                      queryFn: (q) => q
                                          .eq(
                                            'paciente',
                                            FFAppState().paciente.id,
                                          )
                                          .eq(
                                            'questionario',
                                            columnQuestionarioPerguntasRow
                                                ?.fluxoReferente,
                                          )
                                          .eq(
                                            'ordem',
                                            (mainRespostasQuestionarioRow!
                                                    .ordem!) -
                                                1,
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
                                          columnRespostasQuestionarioRowList =
                                          snapshot.data!;

                                      final columnRespostasQuestionarioRow =
                                          columnRespostasQuestionarioRowList
                                                  .isNotEmpty
                                              ? columnRespostasQuestionarioRowList
                                                  .first
                                              : null;

                                      return Builder(
                                        builder: (context) {
                                          final prevList =
                                              columnRespostasQuestionarioRow
                                                      ?.multiTextResponse
                                                      .toList() ??
                                                  [];

                                          return Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children:
                                                List.generate(prevList.length,
                                                    (prevListIndex) {
                                              final prevListItem =
                                                  prevList[prevListIndex];
                                              return Container(
                                                width: double.infinity,
                                                height: 180.0,
                                                decoration: const BoxDecoration(),
                                                child: ObjectDescriptionWidget(
                                                  key: Key(
                                                      'Keye7b_${prevListIndex}_of_${prevList.length}'),
                                                  queixa: prevListItem,
                                                  callbck: (response) async {
                                                    await RespostasQuestionarioTable()
                                                        .update(
                                                      data: {
                                                        'multi_text_response':
                                                            functions.removeItemAtIndex(
                                                                mainRespostasQuestionarioRow!
                                                                    .multiTextResponse
                                                                    .toList(),
                                                                prevListIndex),
                                                      },
                                                      matchingRows: (rows) =>
                                                          rows.eq(
                                                        'id',
                                                        mainRespostasQuestionarioRow
                                                            .id,
                                                      ),
                                                    );
                                                    await RespostasQuestionarioTable()
                                                        .update(
                                                      data: {
                                                        'multi_text_response':
                                                            functions.addItemToList(
                                                                mainRespostasQuestionarioRow
                                                                    .multiTextResponse
                                                                    .toList(),
                                                                response!),
                                                        'next_question':
                                                            getJsonField(
                                                          columnQuestionarioPerguntasRow
                                                              ?.opcoes.first,
                                                          r'''$.next_question''',
                                                        ),
                                                      },
                                                      matchingRows: (rows) =>
                                                          rows.eq(
                                                        'id',
                                                        mainRespostasQuestionarioRow
                                                            .id,
                                                      ),
                                                    );
                                                    await widget.callback?.call(
                                                      getJsonField(
                                                        columnQuestionarioPerguntasRow
                                                            ?.opcoes.first,
                                                        r'''$.next_question''',
                                                      ),
                                                    );
                                                  },
                                                ),
                                              );
                                            }).divide(const SizedBox(height: 24.0)),
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          if (columnQuestionarioPerguntasRow?.answerTyype ==
                              'enrich paciente queixas')
                            FutureBuilder<List<PacienteRow>>(
                              future: PacienteTable().querySingleRow(
                                queryFn: (q) => q.eq(
                                  'uuid',
                                  currentUserUid,
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
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                List<PacienteRow> enrichQueixasPacienteRowList =
                                    snapshot.data!;

                                final enrichQueixasPacienteRow =
                                    enrichQueixasPacienteRowList.isNotEmpty
                                        ? enrichQueixasPacienteRowList.first
                                        : null;

                                return Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 24.0, 0.0, 0.0),
                                      child: Builder(
                                        builder: (context) {
                                          final queixasUser = functions
                                              .addItemToList(
                                                  enrichQueixasPacienteRow!
                                                      .queixas
                                                      .toList(),
                                                  enrichQueixasPacienteRow
                                                      .queixaPrincipal!)
                                              .toList();

                                          return Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: List.generate(
                                                queixasUser.length,
                                                (queixasUserIndex) {
                                              final queixasUserItem =
                                                  queixasUser[queixasUserIndex];
                                              return Container(
                                                width: double.infinity,
                                                height: 180.0,
                                                decoration: const BoxDecoration(),
                                                child: ObjectDescriptionWidget(
                                                  key: Key(
                                                      'Keym31_${queixasUserIndex}_of_${queixasUser.length}'),
                                                  queixa: queixasUserItem,
                                                  callbck: (response) async {
                                                    await RespostasQuestionarioTable()
                                                        .update(
                                                      data: {
                                                        'multi_text_response':
                                                            functions.removeItemAtIndex(
                                                                mainRespostasQuestionarioRow!
                                                                    .multiTextResponse
                                                                    .toList(),
                                                                queixasUserIndex),
                                                      },
                                                      matchingRows: (rows) =>
                                                          rows.eq(
                                                        'id',
                                                        mainRespostasQuestionarioRow
                                                            .id,
                                                      ),
                                                    );
                                                    await RespostasQuestionarioTable()
                                                        .update(
                                                      data: {
                                                        'multi_text_response':
                                                            functions.addItemToList(
                                                                mainRespostasQuestionarioRow
                                                                    .multiTextResponse
                                                                    .toList(),
                                                                response!),
                                                        'next_question':
                                                            getJsonField(
                                                          columnQuestionarioPerguntasRow
                                                              ?.opcoes.first,
                                                          r'''$.next_question''',
                                                        ),
                                                      },
                                                      matchingRows: (rows) =>
                                                          rows.eq(
                                                        'id',
                                                        mainRespostasQuestionarioRow
                                                            .id,
                                                      ),
                                                    );
                                                    await widget.callback?.call(
                                                      getJsonField(
                                                        columnQuestionarioPerguntasRow
                                                            ?.opcoes.first,
                                                        r'''$.next_question''',
                                                      ),
                                                    );
                                                  },
                                                ),
                                              );
                                            }).divide(const SizedBox(height: 24.0)),
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          if (columnQuestionarioPerguntasRow?.answerTyype ==
                              'multi image')
                            Align(
                              alignment: const AlignmentDirectional(0.0, 1.0),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 24.0, 0.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Builder(
                                      builder: (context) {
                                        final images =
                                            mainRespostasQuestionarioRow
                                                    ?.multiTextResponse
                                                    .toList() ??
                                                [];

                                        return Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: List.generate(images.length,
                                              (imagesIndex) {
                                            final imagesItem =
                                                images[imagesIndex];
                                            return Stack(
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  child: Image.network(
                                                    imagesItem,
                                                    width: double.infinity,
                                                    height: 250.0,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          1.0, -1.0),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 12.0,
                                                                12.0, 0.0),
                                                    child:
                                                        FlutterFlowIconButton(
                                                      borderColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .warning,
                                                      borderRadius: 20.0,
                                                      borderWidth: 1.0,
                                                      buttonSize: 40.0,
                                                      fillColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .warning,
                                                      icon: FaIcon(
                                                        FontAwesomeIcons
                                                            .trashAlt,
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .primaryBackground,
                                                        size: 18.0,
                                                      ),
                                                      onPressed: () async {
                                                        await deleteSupabaseFileFromPublicUrl(
                                                            imagesItem);
                                                        await RespostasQuestionarioTable()
                                                            .update(
                                                          data: {
                                                            'multi_text_response':
                                                                functions.removeItemAtString(
                                                                    mainRespostasQuestionarioRow!
                                                                        .multiTextResponse
                                                                        .toList(),
                                                                    imagesItem),
                                                          },
                                                          matchingRows:
                                                              (rows) => rows.eq(
                                                            'id',
                                                            mainRespostasQuestionarioRow
                                                                .id,
                                                          ),
                                                        );
                                                        safeSetState(() => _model
                                                                .requestCompleter =
                                                            null);
                                                        await _model
                                                            .waitForRequestCompleted();
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            );
                                          }).divide(const SizedBox(height: 24.0)),
                                        );
                                      },
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 24.0, 0.0, 0.0),
                                      child: FlutterFlowIconButton(
                                        borderRadius: 20.0,
                                        borderWidth: 0.0,
                                        buttonSize: 40.0,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .primary,
                                        icon: const Icon(
                                          Icons.add,
                                          color: Colors.white,
                                          size: 24.0,
                                        ),
                                        onPressed: () async {
                                          final selectedMedia =
                                              await selectMediaWithSourceBottomSheet(
                                            context: context,
                                            storageFolderPath: 'documents',
                                            allowPhoto: true,
                                          );
                                          if (selectedMedia != null &&
                                              selectedMedia.every((m) =>
                                                  validateFileFormat(
                                                      m.storagePath,
                                                      context))) {
                                            safeSetState(() =>
                                                _model.isDataUploading = true);
                                            var selectedUploadedFiles =
                                                <FFUploadedFile>[];

                                            var downloadUrls = <String>[];
                                            try {
                                              selectedUploadedFiles =
                                                  selectedMedia
                                                      .map(
                                                          (m) => FFUploadedFile(
                                                                name: m
                                                                    .storagePath
                                                                    .split('/')
                                                                    .last,
                                                                bytes: m.bytes,
                                                                height: m
                                                                    .dimensions
                                                                    ?.height,
                                                                width: m
                                                                    .dimensions
                                                                    ?.width,
                                                                blurHash:
                                                                    m.blurHash,
                                                              ))
                                                      .toList();

                                              downloadUrls =
                                                  await uploadSupabaseStorageFiles(
                                                bucketName: 'users',
                                                selectedFiles: selectedMedia,
                                              );
                                            } finally {
                                              _model.isDataUploading = false;
                                            }
                                            if (selectedUploadedFiles.length ==
                                                    selectedMedia.length &&
                                                downloadUrls.length ==
                                                    selectedMedia.length) {
                                              safeSetState(() {
                                                _model.uploadedLocalFile =
                                                    selectedUploadedFiles.first;
                                                _model.uploadedFileUrl =
                                                    downloadUrls.first;
                                              });
                                            } else {
                                              safeSetState(() {});
                                              return;
                                            }
                                          }

                                          if (_model.uploadedFileUrl == '') {
                                            return;
                                          }

                                          await RespostasQuestionarioTable()
                                              .update(
                                            data: {
                                              'multi_text_response':
                                                  functions.addItemToList(
                                                      mainRespostasQuestionarioRow!
                                                          .multiTextResponse
                                                          .toList(),
                                                      _model.uploadedFileUrl),
                                            },
                                            matchingRows: (rows) => rows.eq(
                                              'id',
                                              mainRespostasQuestionarioRow.id,
                                            ),
                                          );
                                          safeSetState(() =>
                                              _model.requestCompleter = null);
                                          await _model
                                              .waitForRequestCompleted();
                                          await widget.callback?.call(
                                            getJsonField(
                                              columnQuestionarioPerguntasRow
                                                  ?.opcoes.first,
                                              r'''$.next_question''',
                                            ),
                                          );
                                          safeSetState(() {
                                            _model.isDataUploading = false;
                                            _model.uploadedLocalFile =
                                                FFUploadedFile(
                                                    bytes:
                                                        Uint8List.fromList([]));
                                            _model.uploadedFileUrl = '';
                                          });

                                          return;
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          if (columnQuestionarioPerguntasRow?.answerTyype ==
                              'multi image selector')
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 24.0, 0.0, 0.0),
                              child: Builder(
                                builder: (context) {
                                  final imags = columnQuestionarioPerguntasRow
                                          ?.opcoes
                                          .toList() ??
                                      [];

                                  return Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: List.generate(imags.length,
                                        (imagsIndex) {
                                      final imagsItem = imags[imagsIndex];
                                      return InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          await RespostasQuestionarioTable()
                                              .update(
                                            data: {
                                              'single_text_response':
                                                  getJsonField(
                                                imagsItem,
                                                r'''$.title''',
                                              ).toString(),
                                            },
                                            matchingRows: (rows) => rows.eq(
                                              'id',
                                              mainRespostasQuestionarioRow?.id,
                                            ),
                                          );
                                          safeSetState(() =>
                                              _model.requestCompleter = null);
                                          await _model
                                              .waitForRequestCompleted();
                                          await widget.callback?.call(
                                            columnQuestionarioPerguntasRow
                                                ?.ordem,
                                          );
                                        },
                                        child: Material(
                                          color: Colors.transparent,
                                          elevation: 0.0,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          child: Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                              border: Border.all(
                                                color: mainRespostasQuestionarioRow
                                                            ?.singleTextResponse ==
                                                        getJsonField(
                                                          imagsItem,
                                                          r'''$.title''',
                                                        ).toString()
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .primary
                                                    : const Color(0xFFDBE4F1),
                                                width: 3.0,
                                              ),
                                            ),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              child: Image.network(
                                                getJsonField(
                                                  imagsItem,
                                                  r'''$.title''',
                                                ).toString(),
                                                width: double.infinity,
                                                height: 70.0,
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    }).divide(const SizedBox(height: 24.0)),
                                  );
                                },
                              ),
                            ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
