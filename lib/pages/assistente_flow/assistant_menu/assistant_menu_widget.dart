import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'assistant_menu_model.dart';
export 'assistant_menu_model.dart';

class AssistantMenuWidget extends StatefulWidget {
  const AssistantMenuWidget({super.key});

  @override
  State<AssistantMenuWidget> createState() => _AssistantMenuWidgetState();
}

class _AssistantMenuWidgetState extends State<AssistantMenuWidget>
    with TickerProviderStateMixin {
  late AssistantMenuModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AssistantMenuModel());

    animationsMap.addAll({
      'containerOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.linear,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 24.0),
            end: Offset(0.0, 0.0),
          ),
          BlurEffect(
            curve: Curves.easeInOut,
            delay: 200.0.ms,
            duration: 200.0.ms,
            begin: Offset(2.0, 2.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'containerOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.linear,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 24.0),
            end: Offset(0.0, 0.0),
          ),
          BlurEffect(
            curve: Curves.easeInOut,
            delay: 200.0.ms,
            duration: 200.0.ms,
            begin: Offset(2.0, 2.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'containerOnPageLoadAnimation3': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.linear,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 24.0),
            end: Offset(0.0, 0.0),
          ),
          BlurEffect(
            curve: Curves.easeInOut,
            delay: 200.0.ms,
            duration: 200.0.ms,
            begin: Offset(2.0, 2.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'containerOnPageLoadAnimation4': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.linear,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 24.0),
            end: Offset(0.0, 0.0),
          ),
          BlurEffect(
            curve: Curves.easeInOut,
            delay: 200.0.ms,
            duration: 200.0.ms,
            begin: Offset(2.0, 2.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'containerOnPageLoadAnimation5': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.linear,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 24.0),
            end: Offset(0.0, 0.0),
          ),
          BlurEffect(
            curve: Curves.easeInOut,
            delay: 200.0.ms,
            duration: 200.0.ms,
            begin: Offset(2.0, 2.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'containerOnPageLoadAnimation6': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.linear,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 24.0),
            end: Offset(0.0, 0.0),
          ),
          BlurEffect(
            curve: Curves.easeInOut,
            delay: 200.0.ms,
            duration: 200.0.ms,
            begin: Offset(2.0, 2.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'containerOnPageLoadAnimation7': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.linear,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 24.0),
            end: Offset(0.0, 0.0),
          ),
          BlurEffect(
            curve: Curves.easeInOut,
            delay: 200.0.ms,
            duration: 200.0.ms,
            begin: Offset(2.0, 2.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'containerOnPageLoadAnimation8': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.linear,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 24.0),
            end: Offset(0.0, 0.0),
          ),
          BlurEffect(
            curve: Curves.easeInOut,
            delay: 200.0.ms,
            duration: 200.0.ms,
            begin: Offset(2.0, 2.0),
            end: Offset(0.0, 0.0),
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
      alignment: AlignmentDirectional(0.0, 1.0),
      child: FutureBuilder<List<StatusPacientRow>>(
        future: StatusPacientTable().querySingleRow(
          queryFn: (q) => q.eq(
            'paciente',
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
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            );
          }
          List<StatusPacientRow> columnStatusPacientRowList = snapshot.data!;

          final columnStatusPacientRow = columnStatusPacientRowList.isNotEmpty
              ? columnStatusPacientRowList.first
              : null;

          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 24.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if ((columnStatusPacientRow?.processo == 'tratamentoBip') &&
                        ((columnStatusPacientRow?.estagio ==
                                'visualizarAjusteBip') ||
                            (columnStatusPacientRow?.estagio ==
                                'emTratamento')))
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          context.pushNamed(
                            'ajustarDose',
                            queryParameters: {
                              'page': serializeParam(
                                'verDose',
                                ParamType.String,
                              ),
                            }.withoutNulls,
                            extra: <String, dynamic>{
                              kTransitionInfoKey: TransitionInfo(
                                hasTransition: true,
                                transitionType: PageTransitionType.fade,
                                duration: Duration(milliseconds: 0),
                              ),
                            },
                          );
                        },
                        child: Container(
                          height: 44.0,
                          decoration: BoxDecoration(
                            color: Color(0x0057636C),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(32.0),
                              bottomRight: Radius.circular(32.0),
                              topLeft: Radius.circular(32.0),
                              topRight: Radius.circular(32.0),
                            ),
                            border: Border.all(
                              color: Color(0xFFB5C0D3),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                42.0, 8.0, 42.0, 8.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Nova Dosagem',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Mulish',
                                        color: Color(0xFFB5C0D3),
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ).animateOnPageLoad(
                          animationsMap['containerOnPageLoadAnimation1']!),
                    if (() {
                      if ((columnStatusPacientRow?.processo ==
                              'tratamentoBip') &&
                          (columnStatusPacientRow?.estagio == 'comprarBip')) {
                        return true;
                      } else if ((columnStatusPacientRow?.processo ==
                              'tratamentoBip') &&
                          (columnStatusPacientRow?.estagio ==
                              'preencherFormularioBip')) {
                        return true;
                      } else {
                        return false;
                      }
                    }())
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          if ((columnStatusPacientRow?.processo ==
                                  'tratamentoBip') &&
                              (columnStatusPacientRow?.estagio ==
                                  'preencherFormularioBip')) {
                            context.pushNamed(
                              'ajustarDose',
                              queryParameters: {
                                'page': serializeParam(
                                  'preencher',
                                  ParamType.String,
                                ),
                              }.withoutNulls,
                              extra: <String, dynamic>{
                                kTransitionInfoKey: TransitionInfo(
                                  hasTransition: true,
                                  transitionType: PageTransitionType.fade,
                                  duration: Duration(milliseconds: 0),
                                ),
                              },
                            );
                          } else if ((columnStatusPacientRow?.processo ==
                                  'tratamentoBip') &&
                              (columnStatusPacientRow?.estagio ==
                                  'comprarBip')) {
                            context.pushNamed(
                              'planos',
                              extra: <String, dynamic>{
                                kTransitionInfoKey: TransitionInfo(
                                  hasTransition: true,
                                  transitionType: PageTransitionType.fade,
                                  duration: Duration(milliseconds: 0),
                                ),
                              },
                            );
                          } else {
                            return;
                          }
                        },
                        child: Container(
                          height: 44.0,
                          decoration: BoxDecoration(
                            color: Color(0x0057636C),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(32.0),
                              bottomRight: Radius.circular(32.0),
                              topLeft: Radius.circular(32.0),
                              topRight: Radius.circular(32.0),
                            ),
                            border: Border.all(
                              color: Color(0xFFB5C0D3),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                42.0, 8.0, 42.0, 8.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'AJuste de Dose',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Mulish',
                                        color: Color(0xFFB5C0D3),
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ).animateOnPageLoad(
                          animationsMap['containerOnPageLoadAnimation2']!),
                    if (() {
                      if ((columnStatusPacientRow?.processo ==
                              'planoTerapeutico') &&
                          (columnStatusPacientRow?.estagio ==
                              'confirmarRecebimento')) {
                        return true;
                      } else if (columnStatusPacientRow?.processo ==
                          'tratamentoBip') {
                        return true;
                      } else {
                        return false;
                      }
                    }())
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          if (columnStatusPacientRow?.processo ==
                              'tratamentoBip') {
                            context.pushNamed(
                              'confirmarRecebimento',
                              queryParameters: {
                                'verDosagem': serializeParam(
                                  true,
                                  ParamType.bool,
                                ),
                              }.withoutNulls,
                              extra: <String, dynamic>{
                                kTransitionInfoKey: TransitionInfo(
                                  hasTransition: true,
                                  transitionType: PageTransitionType.fade,
                                  duration: Duration(milliseconds: 0),
                                ),
                              },
                            );

                            Navigator.pop(context);
                          } else {
                            context.pushNamed(
                              'confirmarRecebimento',
                              queryParameters: {
                                'verDosagem': serializeParam(
                                  false,
                                  ParamType.bool,
                                ),
                              }.withoutNulls,
                              extra: <String, dynamic>{
                                kTransitionInfoKey: TransitionInfo(
                                  hasTransition: true,
                                  transitionType: PageTransitionType.fade,
                                  duration: Duration(milliseconds: 0),
                                ),
                              },
                            );

                            Navigator.pop(context);
                          }
                        },
                        child: Container(
                          height: 44.0,
                          decoration: BoxDecoration(
                            color: Color(0x0057636C),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(32.0),
                              bottomRight: Radius.circular(32.0),
                              topLeft: Radius.circular(32.0),
                              topRight: Radius.circular(32.0),
                            ),
                            border: Border.all(
                              color: Color(0xFFB5C0D3),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                42.0, 8.0, 42.0, 8.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Recebi o medicamento',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Mulish',
                                        color: Color(0xFFB5C0D3),
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ).animateOnPageLoad(
                          animationsMap['containerOnPageLoadAnimation3']!),
                    if (() {
                      if ((columnStatusPacientRow?.processo ==
                              'planoTerapeutico') &&
                          (columnStatusPacientRow?.estagio ==
                              'visualizarPlano')) {
                        return true;
                      } else if (columnStatusPacientRow?.processo ==
                          'tratamentoBip') {
                        return true;
                      } else {
                        return false;
                      }
                    }())
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          context.pushNamed(
                            'planoTerapeutico',
                            extra: <String, dynamic>{
                              kTransitionInfoKey: TransitionInfo(
                                hasTransition: true,
                                transitionType: PageTransitionType.fade,
                                duration: Duration(milliseconds: 0),
                              ),
                            },
                          );
                        },
                        child: Container(
                          height: 44.0,
                          decoration: BoxDecoration(
                            color: Color(0x0057636C),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(32.0),
                              bottomRight: Radius.circular(32.0),
                              topLeft: Radius.circular(32.0),
                              topRight: Radius.circular(32.0),
                            ),
                            border: Border.all(
                              color: Color(0xFFB5C0D3),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                42.0, 8.0, 42.0, 8.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Plano Terapêutico',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Mulish',
                                        color: Color(0xFFB5C0D3),
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ).animateOnPageLoad(
                          animationsMap['containerOnPageLoadAnimation4']!),
                    if ((columnStatusPacientRow?.processo == 'consulta') &&
                        (columnStatusPacientRow?.estagio ==
                            'formularioPreConsulta'))
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          context.pushNamed(
                            'formPreConsulta',
                            extra: <String, dynamic>{
                              kTransitionInfoKey: TransitionInfo(
                                hasTransition: true,
                                transitionType: PageTransitionType.fade,
                                duration: Duration(milliseconds: 0),
                              ),
                            },
                          );

                          Navigator.pop(context);
                        },
                        child: Container(
                          height: 44.0,
                          decoration: BoxDecoration(
                            color: Color(0x0057636C),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(32.0),
                              bottomRight: Radius.circular(32.0),
                              topLeft: Radius.circular(32.0),
                              topRight: Radius.circular(32.0),
                            ),
                            border: Border.all(
                              color: Color(0xFFB5C0D3),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                42.0, 8.0, 42.0, 8.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Realizar a Pré-consulta',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Mulish',
                                        color: Color(0xFFB5C0D3),
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ).animateOnPageLoad(
                          animationsMap['containerOnPageLoadAnimation5']!),
                    if (((columnStatusPacientRow?.processo == 'consulta') &&
                            (columnStatusPacientRow?.estagio ==
                                'pagarConsulta')) &&
                        responsiveVisibility(
                          context: context,
                          phone: false,
                          tablet: false,
                          tabletLandscape: false,
                          desktop: false,
                        ))
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          context.pushNamed(
                            'evolucao',
                            extra: <String, dynamic>{
                              kTransitionInfoKey: TransitionInfo(
                                hasTransition: true,
                                transitionType: PageTransitionType.fade,
                                duration: Duration(milliseconds: 0),
                              ),
                            },
                          );

                          Navigator.pop(context);
                        },
                        child: Container(
                          height: 44.0,
                          decoration: BoxDecoration(
                            color: Color(0x0057636C),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(32.0),
                              bottomRight: Radius.circular(32.0),
                              topLeft: Radius.circular(32.0),
                              topRight: Radius.circular(32.0),
                            ),
                            border: Border.all(
                              color: Color(0xFFB5C0D3),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                42.0, 8.0, 42.0, 8.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Pagar consulta',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Mulish',
                                        color: Color(0xFFB5C0D3),
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ).animateOnPageLoad(
                          animationsMap['containerOnPageLoadAnimation6']!),
                    if (((columnStatusPacientRow?.processo == 'consulta') &&
                            (columnStatusPacientRow?.estagio ==
                                'agendarConsulta')) &&
                        responsiveVisibility(
                          context: context,
                          phone: false,
                          tablet: false,
                          tabletLandscape: false,
                          desktop: false,
                        ))
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          context.pushNamed(
                            'evolucao',
                            extra: <String, dynamic>{
                              kTransitionInfoKey: TransitionInfo(
                                hasTransition: true,
                                transitionType: PageTransitionType.fade,
                                duration: Duration(milliseconds: 0),
                              ),
                            },
                          );

                          Navigator.pop(context);
                        },
                        child: Container(
                          height: 44.0,
                          decoration: BoxDecoration(
                            color: Color(0x0057636C),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(32.0),
                              bottomRight: Radius.circular(32.0),
                              topLeft: Radius.circular(32.0),
                              topRight: Radius.circular(32.0),
                            ),
                            border: Border.all(
                              color: Color(0xFFB5C0D3),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                42.0, 8.0, 42.0, 8.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Agende uma Consulta',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Mulish',
                                        color: Color(0xFFB5C0D3),
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ).animateOnPageLoad(
                          animationsMap['containerOnPageLoadAnimation7']!),
                    if (responsiveVisibility(
                      context: context,
                      phone: false,
                      tablet: false,
                      tabletLandscape: false,
                      desktop: false,
                    ))
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          context.pushNamed(
                            'chatViv',
                            extra: <String, dynamic>{
                              kTransitionInfoKey: TransitionInfo(
                                hasTransition: true,
                                transitionType: PageTransitionType.fade,
                                duration: Duration(milliseconds: 0),
                              ),
                            },
                          );

                          Navigator.pop(context);
                        },
                        child: Container(
                          height: 44.0,
                          decoration: BoxDecoration(
                            color: Color(0x0057636C),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(32.0),
                              bottomRight: Radius.circular(32.0),
                              topLeft: Radius.circular(32.0),
                              topRight: Radius.circular(32.0),
                            ),
                            border: Border.all(
                              color: Color(0xFFB5C0D3),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                42.0, 8.0, 42.0, 8.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Dúvidas Gerais',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Mulish',
                                        color: Color(0xFFB5C0D3),
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ).animateOnPageLoad(
                          animationsMap['containerOnPageLoadAnimation8']!),
                  ].divide(SizedBox(height: 12.0)),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 1.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 24.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      Navigator.pop(context);
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100.0),
                      child: Container(
                        width: 50.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                          color: Color(0xFFB5C0D3),
                          borderRadius: BorderRadius.circular(100.0),
                        ),
                        child: Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.close_rounded,
                                color: Colors.white,
                                size: 24.0,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
