import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/questionario/pergunta_widget/pergunta_widget_widget.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'cannabis_pra_mim_model.dart';
export 'cannabis_pra_mim_model.dart';

class CannabisPraMimWidget extends StatefulWidget {
  const CannabisPraMimWidget({
    super.key,
    this.fluxo,
  });

  final QuestionarioRow? fluxo;

  @override
  State<CannabisPraMimWidget> createState() => _CannabisPraMimWidgetState();
}

class _CannabisPraMimWidgetState extends State<CannabisPraMimWidget> {
  late CannabisPraMimModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CannabisPraMimModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                Align(
                  alignment: AlignmentDirectional(0.0, -1.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 24.0,
                          color: Color(0x33000000),
                          offset: Offset(
                            0.0,
                            8.0,
                          ),
                        )
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(18.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.safePop();
                            },
                            child: Icon(
                              Icons.arrow_back_ios_new,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 32.0,
                            ),
                          ),
                          Text(
                            valueOrDefault<String>(
                              widget!.fluxo?.nome,
                              'd',
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Mulish',
                                  color: FlutterFlowTheme.of(context).primary,
                                  fontSize: 18.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w800,
                                ),
                          ),
                          Icon(
                            Icons.add,
                            color: Color(0x015D67E2),
                            size: 32.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        if (_model.currentStep == 0)
                          Expanded(
                            child: Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    32.0, 0.0, 32.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Vou te ajudar com os seus Sintomas! Responda algumas perguntas para te orientar',
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Mulish',
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            fontSize: 18.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                    FFButtonWidget(
                                      onPressed: () {
                                        print('Button pressed ...');
                                      },
                                      text: 'Começar',
                                      options: FFButtonOptions(
                                        width: double.infinity,
                                        height: 48.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 24.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Mulish',
                                              color: Colors.white,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                        elevation: 3.0,
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(60.0),
                                      ),
                                    ),
                                  ].divide(SizedBox(height: 32.0)),
                                ),
                              ),
                            ),
                          ),
                        Expanded(
                          child: FutureBuilder<List<QuestionarioPerguntasRow>>(
                            future: QuestionarioPerguntasTable().queryRows(
                              queryFn: (q) => q
                                  .eq(
                                    'fluxo_referente',
                                    2,
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
                              List<QuestionarioPerguntasRow>
                                  pageViewQuestionarioPerguntasRowList =
                                  snapshot.data!;

                              return Container(
                                width: double.infinity,
                                height: double.infinity,
                                child: PageView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  controller: _model.pageViewController ??=
                                      PageController(
                                          initialPage: max(
                                              0,
                                              min(
                                                  0,
                                                  pageViewQuestionarioPerguntasRowList
                                                          .length -
                                                      1))),
                                  scrollDirection: Axis.horizontal,
                                  itemCount:
                                      pageViewQuestionarioPerguntasRowList
                                          .length,
                                  itemBuilder: (context, pageViewIndex) {
                                    final pageViewQuestionarioPerguntasRow =
                                        pageViewQuestionarioPerguntasRowList[
                                            pageViewIndex];
                                    return Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            32.0, 24.0, 32.0, 0.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child: wrapWithModel(
                                                model: _model
                                                    .perguntaWidgetModels
                                                    .getModel(
                                                  pageViewQuestionarioPerguntasRow
                                                      .ordem!
                                                      .toString(),
                                                  pageViewIndex,
                                                ),
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                updateOnChange: true,
                                                child: PerguntaWidgetWidget(
                                                  key: Key(
                                                    'Keywvo_${pageViewQuestionarioPerguntasRow.ordem!.toString()}',
                                                  ),
                                                  pergunta:
                                                      pageViewQuestionarioPerguntasRow,
                                                  respostaSetada:
                                                      _model.respostaAtual,
                                                  setResposta: (ordemPergunta,
                                                      nextPergunta,
                                                      pergunta,
                                                      resposta,
                                                      respostaExiste) async {
                                                    _model.nextQuestion =
                                                        nextPergunta;
                                                    _model.respostaAtual =
                                                        <String, dynamic>{
                                                      'ordemPergunta':
                                                          ordemPergunta,
                                                      'pergunta': pergunta,
                                                      'resposta': resposta,
                                                      'nextPergunta':
                                                          nextPergunta,
                                                    };
                                                    _model.respostaExiste =
                                                        respostaExiste;
                                                    safeSetState(() {});
                                                  },
                                                ),
                                              ),
                                            ),
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      child: FFButtonWidget(
                                                        onPressed: () async {
                                                          await _model
                                                              .pageViewController
                                                              ?.animateToPage(
                                                            _model
                                                                .prevList.last,
                                                            duration: Duration(
                                                                milliseconds:
                                                                    500),
                                                            curve: Curves.ease,
                                                          );
                                                          _model.nextQuestion =
                                                              getJsonField(
                                                            _model
                                                                .respostas.last,
                                                            r'''$.nextPergunta''',
                                                          );
                                                          safeSetState(() {});
                                                          _model
                                                              .removeFromPrevList(
                                                                  _model
                                                                      .prevList
                                                                      .last);
                                                          _model.respostaAtual =
                                                              _model.respostas
                                                                  .last;
                                                          _model
                                                              .removeFromRespostas(
                                                                  _model
                                                                      .respostas
                                                                      .last);
                                                          _model.respostaExiste =
                                                              true;
                                                          safeSetState(() {});
                                                        },
                                                        text: 'Voltar',
                                                        options:
                                                            FFButtonOptions(
                                                          width: 200.0,
                                                          height: 48.0,
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      24.0,
                                                                      0.0,
                                                                      24.0,
                                                                      0.0),
                                                          iconPadding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          color: Colors.white,
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmall
                                                                  .override(
                                                                    fontFamily:
                                                                        'Mulish',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                          elevation: 3.0,
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      60.0),
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: FFButtonWidget(
                                                        onPressed:
                                                            ((_model.respostaAtual ==
                                                                        null) ||
                                                                    (_model.respostaExiste ==
                                                                        false))
                                                                ? null
                                                                : () async {
                                                                    _model.addToRespostas(
                                                                        _model
                                                                            .respostaAtual!);
                                                                    _model.addToPrevList(
                                                                        pageViewQuestionarioPerguntasRow
                                                                            .ordem!);
                                                                    safeSetState(
                                                                        () {});
                                                                    unawaited(
                                                                      () async {
                                                                        await _model
                                                                            .pageViewController
                                                                            ?.animateToPage(
                                                                          _model
                                                                              .nextQuestion!,
                                                                          duration:
                                                                              Duration(milliseconds: 500),
                                                                          curve:
                                                                              Curves.ease,
                                                                        );
                                                                      }(),
                                                                    );
                                                                    _model.respostaAtual =
                                                                        null;
                                                                    _model.respostaExiste =
                                                                        false;
                                                                    safeSetState(
                                                                        () {});
                                                                  },
                                                        text: 'Próximo',
                                                        options:
                                                            FFButtonOptions(
                                                          width: 200.0,
                                                          height: 48.0,
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      24.0,
                                                                      0.0,
                                                                      24.0,
                                                                      0.0),
                                                          iconPadding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmall
                                                                  .override(
                                                                    fontFamily:
                                                                        'Mulish',
                                                                    color: Colors
                                                                        .white,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                          elevation: 3.0,
                                                          borderSide:
                                                              BorderSide(
                                                            color: Colors
                                                                .transparent,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      60.0),
                                                          disabledColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .alternate,
                                                          disabledTextColor:
                                                              Colors.white,
                                                        ),
                                                      ),
                                                    ),
                                                  ].divide(
                                                      SizedBox(width: 18.0)),
                                                ),
                                              ],
                                            ),
                                          ].addToEnd(SizedBox(height: 24.0)),
                                        ),
                                      ),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
