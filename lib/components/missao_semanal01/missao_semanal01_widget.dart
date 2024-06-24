import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'missao_semanal01_model.dart';
export 'missao_semanal01_model.dart';

class MissaoSemanal01Widget extends StatefulWidget {
  const MissaoSemanal01Widget({super.key});

  @override
  State<MissaoSemanal01Widget> createState() => _MissaoSemanal01WidgetState();
}

class _MissaoSemanal01WidgetState extends State<MissaoSemanal01Widget>
    with TickerProviderStateMixin {
  late MissaoSemanal01Model _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MissaoSemanal01Model());

    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: const Offset(0.0, -48.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(10.0, 32.0, 10.0, 0.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Container(
          height: 225.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Stack(
            children: [
              const SizedBox(
                width: double.infinity,
                height: 225.0,
                child: custom_widgets.Gradients(
                  width: double.infinity,
                  height: 225.0,
                  gradientStyle: 'trident',
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: double.infinity,
                  height: 200.0,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF7FAFE),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(8.0, 18.0, 8.0, 12.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                12.0, 0.0, 0.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Misssão semanal:',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Mulish',
                                        fontSize: 18.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w800,
                                      ),
                                ),
                                Align(
                                  alignment: const AlignmentDirectional(0.0, -1.0),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 12.0, 8.0, 0.0),
                                    child: Text(
                                      'Preencha no minimo 03 vezes o seu diário de bem estar nessa semana e ganhe uma recompensa!',
                                      textAlign: TextAlign.start,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Mulish',
                                            color: const Color(0xFF42526D),
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Container(
                              width: 100.0,
                              height: 72.0,
                              constraints: const BoxConstraints(
                                minWidth: 100.0,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    'Dom',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Mulish',
                                          fontSize: 12.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                  Icon(
                                    Icons.check_circle,
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    size: 36.0,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              width: 100.0,
                              height: 72.0,
                              constraints: const BoxConstraints(
                                minWidth: 100.0,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    'Seg',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Mulish',
                                          fontSize: 12.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                  Icon(
                                    Icons.check_circle,
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    size: 36.0,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              width: 100.0,
                              height: 72.0,
                              constraints: const BoxConstraints(
                                minWidth: 100.0,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    'Ter',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Mulish',
                                          fontSize: 12.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                  Icon(
                                    Icons.check_circle,
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    size: 36.0,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              width: 100.0,
                              height: 72.0,
                              constraints: const BoxConstraints(
                                minWidth: 100.0,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    'Qua',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Mulish',
                                          fontSize: 12.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                  Icon(
                                    Icons.check_circle,
                                    color: FlutterFlowTheme.of(context).primary,
                                    size: 36.0,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              width: 100.0,
                              height: 72.0,
                              constraints: const BoxConstraints(
                                minWidth: 100.0,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    'Qui',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Mulish',
                                          fontSize: 12.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                  Icon(
                                    Icons.check_circle,
                                    color: FlutterFlowTheme.of(context).primary,
                                    size: 36.0,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              width: 100.0,
                              height: 72.0,
                              constraints: const BoxConstraints(
                                minWidth: 100.0,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    'Sex',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Mulish',
                                          fontSize: 12.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                  Icon(
                                    Icons.check_circle,
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    size: 36.0,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              width: 100.0,
                              height: 72.0,
                              constraints: const BoxConstraints(
                                minWidth: 100.0,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    'Sab',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Mulish',
                                          fontSize: 12.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                  Icon(
                                    Icons.check_circle,
                                    color: FlutterFlowTheme.of(context).primary,
                                    size: 36.0,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!),
    );
  }
}
