import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'home_page_status_component_model.dart';
export 'home_page_status_component_model.dart';

class HomePageStatusComponentWidget extends StatefulWidget {
  const HomePageStatusComponentWidget({
    super.key,
    this.status,
  });

  final StatusPacientRow? status;

  @override
  State<HomePageStatusComponentWidget> createState() =>
      _HomePageStatusComponentWidgetState();
}

class _HomePageStatusComponentWidgetState
    extends State<HomePageStatusComponentWidget> {
  late HomePageStatusComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageStatusComponentModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        if (widget.status?.processo == 'consulta') {
          return;
        } else if (widget.status?.processo == 'planoTerapeutico') {
          if (widget.status?.estagio == 'visualizarPlano') {
            context.pushNamed(
              'planoTerapeutico',
              extra: <String, dynamic>{
                kTransitionInfoKey: const TransitionInfo(
                  hasTransition: true,
                  transitionType: PageTransitionType.fade,
                  duration: Duration(milliseconds: 0),
                ),
              },
            );
          } else if (widget.status?.estagio == 'confirmarRecebimento') {
            context.pushNamed(
              'confirmarRecebimento',
              extra: <String, dynamic>{
                kTransitionInfoKey: const TransitionInfo(
                  hasTransition: true,
                  transitionType: PageTransitionType.fade,
                  duration: Duration(milliseconds: 0),
                ),
              },
            );
          } else if (widget.status?.estagio == 'formularioPreConsulta') {
            context.pushNamed(
              'formPreConsulta',
              extra: <String, dynamic>{
                kTransitionInfoKey: const TransitionInfo(
                  hasTransition: true,
                  transitionType: PageTransitionType.fade,
                  duration: Duration(milliseconds: 0),
                ),
              },
            );
          } else {
            return;
          }

          return;
        } else if (widget.status?.processo == 'tratamentoBip') {
          if (widget.status?.estagio == 'comprarBip') {
            if (FFAppState().paciente.assinatura.plano != 1) {
              context.pushNamed(
                'comprarBip',
                extra: <String, dynamic>{
                  kTransitionInfoKey: const TransitionInfo(
                    hasTransition: true,
                    transitionType: PageTransitionType.fade,
                    duration: Duration(milliseconds: 0),
                  ),
                },
              );
            } else {
              context.pushNamed(
                'planos',
                extra: <String, dynamic>{
                  kTransitionInfoKey: const TransitionInfo(
                    hasTransition: true,
                    transitionType: PageTransitionType.fade,
                    duration: Duration(milliseconds: 0),
                  ),
                },
              );
            }

            return;
          } else if (widget.status?.estagio == 'preencherFormularioBip') {
            context.pushNamed(
              'ajustarDose',
              queryParameters: {
                'page': serializeParam(
                  'preencher',
                  ParamType.String,
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

            return;
          } else if (widget.status?.estagio == 'visualizarAjusteBip') {
            context.pushNamed(
              'ajustarDose',
              queryParameters: {
                'page': serializeParam(
                  'verDose',
                  ParamType.String,
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

            return;
          } else {
            return;
          }
        } else {
          return;
        }
      },
      child: Material(
        color: Colors.transparent,
        elevation: 3.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(9.0),
        ),
        child: Container(
          width: double.infinity,
          height: 80.0,
          decoration: BoxDecoration(
            color: () {
              if ((widget.status?.processo == 'consulta') &&
                  (widget.status?.estagio == 'agendarConsulta')) {
                return const Color(0xFF34D1BF);
              } else if ((widget.status?.processo == 'consulta') &&
                  (widget.status?.estagio == 'pagarConsulta')) {
                return const Color(0xFFD30000);
              } else if ((widget.status?.processo == 'planoTerapeutico') &&
                  (widget.status?.estagio == 'formularioPreConsulta')) {
                return const Color(0xFFFFA438);
              } else if ((widget.status?.processo == 'planoTerapeutico') &&
                  (widget.status?.estagio == 'visualizarPlano')) {
                return const Color(0xFF00BFD9);
              } else if ((widget.status?.processo == 'planoTerapeutico') &&
                  (widget.status?.estagio == 'confirmarRecebimento')) {
                return const Color(0xFF00BFD9);
              } else if ((widget.status?.processo == 'tratamentoBip') &&
                  (widget.status?.estagio == 'comprarBip')) {
                return const Color(0xFFF17373);
              } else if ((widget.status?.processo == 'tratamentoBip') &&
                  (widget.status?.estagio == 'preencherFormularioBip')) {
                return const Color(0xFF00BFD9);
              } else if ((widget.status?.processo == 'tratamentoBip') &&
                  (widget.status?.estagio == 'recberAjusteBip')) {
                return const Color(0xFF00BFD9);
              } else if ((widget.status?.processo == 'tratamentoBip') &&
                  (widget.status?.estagio == 'visualizarAjusteBip')) {
                return const Color(0xFF00BFD9);
              } else {
                return const Color(0x00000000);
              }
            }(),
            borderRadius: BorderRadius.circular(9.0),
          ),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(18.0, 0.0, 18.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: 32.0,
                  height: 32.0,
                  decoration: BoxDecoration(
                    color: () {
                      if ((widget.status?.processo == 'consulta') &&
                          (widget.status?.estagio == 'agendarConsulta')) {
                        return const Color(0xFF289F91);
                      } else if ((widget.status?.processo == 'consulta') &&
                          (widget.status?.estagio == 'pagarConsulta')) {
                        return const Color(0xFF7C0000);
                      } else if ((widget.status?.processo ==
                              'planoTerapeutico') &&
                          (widget.status?.estagio ==
                              'formularioPreConsulta')) {
                        return const Color(0xFFC16A02);
                      } else if ((widget.status?.processo ==
                              'planoTerapeutico') &&
                          (widget.status?.estagio == 'visualizarPlano')) {
                        return const Color(0xFF007E8F);
                      } else if ((widget.status?.processo ==
                              'planoTerapeutico') &&
                          (widget.status?.estagio == 'confirmarRecebimento')) {
                        return const Color(0xFF007E8F);
                      } else if ((widget.status?.processo ==
                              'tratamentoBip') &&
                          (widget.status?.estagio == 'comprarBip')) {
                        return const Color(0xFFB50707);
                      } else if ((widget.status?.processo ==
                              'tratamentoBip') &&
                          (widget.status?.estagio ==
                              'preencherFormularioBip')) {
                        return const Color(0xFF007E8F);
                      } else if ((widget.status?.processo ==
                              'tratamentoBip') &&
                          (widget.status?.estagio == 'recberAjusteBip')) {
                        return const Color(0xFF007E8F);
                      } else if ((widget.status?.processo ==
                              'tratamentoBip') &&
                          (widget.status?.estagio == 'visualizarAjusteBip')) {
                        return const Color(0xFF007E8F);
                      } else {
                        return const Color(0x00000000);
                      }
                    }(),
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.transparent,
                      width: 0.0,
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 18.0,
                        height: 18.0,
                        decoration: BoxDecoration(
                          color: const Color(0x00FFFFFF),
                          image: DecorationImage(
                            fit: BoxFit.contain,
                            image: Image.network(
                              valueOrDefault<String>(
                                () {
                                  if ((widget.status?.processo ==
                                          'consulta') &&
                                      (widget.status?.estagio ==
                                          'agendarConsulta')) {
                                    return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/v-i-v-pacientes-n1581s/assets/ygt09lezwut9/Vector.png';
                                  } else if ((widget.status?.processo ==
                                          'consulta') &&
                                      (widget.status?.estagio ==
                                          'pagarConsulta')) {
                                    return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/v-i-v-pacientes-n1581s/assets/4bypz0n1pdtw/Vector-2.png';
                                  } else if ((widget.status?.processo ==
                                          'consulta') &&
                                      (widget.status?.estagio ==
                                          'formularioPreConsulta')) {
                                    return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/v-i-v-pacientes-n1581s/assets/bcvt8ip5q060/Vector-1.png';
                                  } else if ((widget.status?.processo ==
                                          'planoTerapeutico') &&
                                      (widget.status?.estagio ==
                                          'confirmarRecebimento')) {
                                    return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/v-i-v-pacientes-n1581s/assets/hyhu19qkrql8/Vector.png';
                                  } else {
                                    return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/v-i-v-pacientes-n1581s/assets/fk6x8w7euodv/Vector.png';
                                  }
                                }(),
                                'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/v-i-v-pacientes-n1581s/assets/fk6x8w7euodv/Vector.png',
                              ),
                            ).image,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        valueOrDefault<String>(
                          () {
                            if ((widget.status?.processo ==
                                    'planoTerapeutico') &&
                                (widget.status?.estagio ==
                                    'formularioPreConsulta')) {
                              return 'Preencha o Formulário de Saúde para te conhecer melhor';
                            } else if ((widget.status?.processo ==
                                    'planoTerapeutico') &&
                                (widget.status?.estagio ==
                                    'visualizarPlano')) {
                              return 'Confira aqui o seu Plano Terapêutico, e comece já o seu tratamento.';
                            } else if ((widget.status?.processo ==
                                    'planoTerapeutico') &&
                                (widget.status?.estagio ==
                                    'confirmarRecebimento')) {
                              return 'Confirmar recebimento do remédio para iniciar o tratamento.';
                            } else if ((widget.status?.processo ==
                                    'tratamentoBip') &&
                                (widget.status?.estagio == 'comprarBip')) {
                              return 'Você precisa de Ajuste de Dose para seu atual tratamento? Toque aqui para conhecer.';
                            } else if ((widget.status?.processo ==
                                    'tratamentoBip') &&
                                (widget.status?.estagio ==
                                    'preencherFormularioBip')) {
                              return 'Você precisa de Ajuste de Dose para seu atual tratamento? Faça aqui.';
                            } else if ((widget.status?.processo ==
                                    'tratamentoBip') &&
                                (widget.status?.estagio ==
                                    'visualizarAjusteBip')) {
                              return 'Nova dosagem disponível para continuar seu tratamento.';
                            } else {
                              return 'd';
                            }
                          }(),
                          'd',
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Mulish',
                              color: Colors.white,
                              fontSize: 16.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ],
                  ),
                ),
              ].divide(const SizedBox(width: 12.0)),
            ),
          ),
        ),
      ),
    );
  }
}
