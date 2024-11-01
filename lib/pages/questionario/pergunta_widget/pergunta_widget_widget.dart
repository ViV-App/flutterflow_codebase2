import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'pergunta_widget_model.dart';
export 'pergunta_widget_model.dart';

class PerguntaWidgetWidget extends StatefulWidget {
  const PerguntaWidgetWidget({
    super.key,
    this.pergunta,
    this.setResposta,
    this.respostaSetada,
  });

  final QuestionarioPerguntasRow? pergunta;
  final Future Function(int? ordemPergunta, int? nextPergunta, String? pergunta,
      String? resposta, bool? respostaExiste)? setResposta;
  final dynamic respostaSetada;

  @override
  State<PerguntaWidgetWidget> createState() => _PerguntaWidgetWidgetState();
}

class _PerguntaWidgetWidgetState extends State<PerguntaWidgetWidget> {
  late PerguntaWidgetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PerguntaWidgetModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(const Duration(milliseconds: 500));
      safeSetState(() {
        _model.textController?.text = valueOrDefault<String>(
          getJsonField(
            widget.respostaSetada,
            r'''$.resposta''',
          )?.toString().toString(),
          '.',
        );
        _model.textController?.selection =
            TextSelection.collapsed(offset: _model.textController!.text.length);
      });
      if (_model.textController.text == '.') {
        safeSetState(() {
          _model.textController?.clear();
        });
      } else {
        return;
      }
    });

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
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
      child: Container(
        decoration: const BoxDecoration(),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              valueOrDefault<String>(
                widget.pergunta?.pergunta,
                'Pergunta atual',
              ),
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Mulish',
                    color: FlutterFlowTheme.of(context).primaryText,
                    fontSize: 18.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w800,
                  ),
            ),
            if (widget.pergunta?.opcoesAtivadas == true)
              Expanded(
                child: Builder(
                  builder: (context) {
                    final opcoes = widget.pergunta?.opcoes.toList() ?? [];

                    return SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: List.generate(opcoes.length, (opcoesIndex) {
                          final opcoesItem = opcoes[opcoesIndex];
                          return InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              await widget.setResposta?.call(
                                widget.pergunta?.ordem,
                                getJsonField(
                                  opcoesItem,
                                  r'''$.next_question''',
                                ),
                                widget.pergunta?.pergunta,
                                getJsonField(
                                  opcoesItem,
                                  r'''$.title''',
                                ).toString(),
                                true,
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: getJsonField(
                                          widget.respostaSetada,
                                          r'''$.resposta''',
                                        ) ==
                                        getJsonField(
                                          opcoesItem,
                                          r'''$.title''',
                                        )
                                    ? FlutterFlowTheme.of(context).primary
                                    : const Color(0x00B5C0D3),
                                borderRadius: BorderRadius.circular(100.0),
                                border: Border.all(
                                  color: const Color(0xFFB5C0D3),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    32.0, 8.0, 32.0, 8.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      getJsonField(
                                        opcoesItem,
                                        r'''$.title''',
                                      ).toString(),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Mulish',
                                            color: getJsonField(
                                                      widget.respostaSetada,
                                                      r'''$.resposta''',
                                                    ) ==
                                                    getJsonField(
                                                      opcoesItem,
                                                      r'''$.title''',
                                                    )
                                                ? Colors.white
                                                : const Color(0xFFB5C0D3),
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }).divide(const SizedBox(height: 8.0)),
                      ),
                    );
                  },
                ),
              ),
            if (widget.pergunta?.opcoesAtivadas == false)
              Align(
                alignment: const AlignmentDirectional(0.0, -1.0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                  child: TextFormField(
                    controller: _model.textController,
                    focusNode: _model.textFieldFocusNode,
                    onChanged: (_) => EasyDebounce.debounce(
                      '_model.textController',
                      const Duration(milliseconds: 100),
                      () async {
                        if (_model.textController.text == '') {
                          await widget.setResposta?.call(
                            widget.pergunta?.ordem,
                            getJsonField(
                              widget.pergunta?.opcoes.first,
                              r'''$.next_question''',
                            ),
                            widget.pergunta?.pergunta,
                            _model.textController.text,
                            false,
                          );
                        } else {
                          await widget.setResposta?.call(
                            widget.pergunta?.ordem,
                            getJsonField(
                              widget.pergunta?.opcoes.first,
                              r'''$.next_question''',
                            ),
                            widget.pergunta?.pergunta,
                            _model.textController.text,
                            true,
                          );
                        }
                      },
                    ),
                    autofocus: false,
                    obscureText: false,
                    decoration: InputDecoration(
                      isDense: false,
                      hintText: 'Escreva..',
                      hintStyle:
                          FlutterFlowTheme.of(context).labelMedium.override(
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
                          color: FlutterFlowTheme.of(context).primary,
                          width: 3.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 3.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 3.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding:
                          const EdgeInsetsDirectional.fromSTEB(18.0, 32.0, 18.0, 0.0),
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Mulish',
                          letterSpacing: 0.0,
                        ),
                    maxLines: 10,
                    minLines: 5,
                    validator:
                        _model.textControllerValidator.asValidator(context),
                  ),
                ),
              ),
          ]
              .divide(const SizedBox(height: 12.0))
              .addToStart(const SizedBox(height: 12.0))
              .addToEnd(const SizedBox(height: 12.0)),
        ),
      ),
    );
  }
}
