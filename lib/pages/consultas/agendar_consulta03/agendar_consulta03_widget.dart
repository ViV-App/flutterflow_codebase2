import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'agendar_consulta03_model.dart';
export 'agendar_consulta03_model.dart';

class AgendarConsulta03Widget extends StatefulWidget {
  const AgendarConsulta03Widget({super.key});

  @override
  State<AgendarConsulta03Widget> createState() =>
      _AgendarConsulta03WidgetState();
}

class _AgendarConsulta03WidgetState extends State<AgendarConsulta03Widget> {
  late AgendarConsulta03Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AgendarConsulta03Model());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: const Color(0xFFF6F9FE),
        body: SafeArea(
          top: true,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              color: Color(0x00FFFFFF),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(18.0, 24.0, 0.0, 0.0),
                  child: Icon(
                    Icons.close,
                    color: FlutterFlowTheme.of(context).secondaryText,
                    size: 32.0,
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Icon(
                        Icons.check_circle,
                        color: FlutterFlowTheme.of(context).primary,
                        size: 125.0,
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 0.0),
                        child: Text(
                          'Obrigado!',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Mulish',
                                    fontSize: 32.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'ID da compra: ',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Mulish',
                                    color: const Color(0xFF6E78FF),
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            Text(
                              '021983019283',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Mulish',
                                    color: const Color(0xFF8798B5),
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ].divide(const SizedBox(width: 4.0)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            32.0, 18.0, 32.0, 0.0),
                        child: Text(
                          'Sua consulta foi agendada com sucesso, você receberá um email de confirmação e poderá visualizar seu agendamento sempre que necessário no seu calendário',
                          textAlign: TextAlign.center,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Mulish',
                                    color: const Color(0xFF8798B5),
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            24.0, 32.0, 24.0, 0.0),
                        child: FFButtonWidget(
                          onPressed: () {
                            print('Button pressed ...');
                          },
                          text: 'Ver minha agenda',
                          options: FFButtonOptions(
                            width: double.infinity,
                            height: 48.0,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: const Color(0xFFF7FAFE),
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Mulish',
                                  color: FlutterFlowTheme.of(context).primary,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                ),
                            elevation: 3.0,
                            borderSide: const BorderSide(
                              color: Color(0x805058BF),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(18.0, 0.0, 0.0, 24.0),
                  child: Icon(
                    Icons.close,
                    color: Colors.transparent,
                    size: 24.0,
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
