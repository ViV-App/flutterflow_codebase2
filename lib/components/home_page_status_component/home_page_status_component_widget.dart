import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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

    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        var _shouldSetState = false;
        if (widget!.status?.processo == 'planoTerapeutico') {
          if (widget!.status?.estagio == 'visualizarPlano') {
            context.pushNamed('planoTerapeutico');

            _model.apiResult38yzd = await SegmentGroup.trackingCall.call(
              userId: currentUserUid,
              eventName: 'therapeutic-plan started',
            );

            _shouldSetState = true;
          } else if (widget!.status?.estagio == 'confirmarRecebimento') {
            context.pushNamed('confirmarRecebimento');
          } else if (widget!.status?.estagio == 'formularioDeSaude') {
            context.pushNamed('formPreConsulta');

            _model.apiResult38yfv = await SegmentGroup.trackingCall.call(
              userId: currentUserUid,
              eventName: 'health-form started',
            );

            _shouldSetState = true;
          } else if (widget!.status?.estagio == 'assinarPlano') {
            context.pushNamed('planos');

            _model.apiResult38yzfvg = await SegmentGroup.trackingCall.call(
              userId: currentUserUid,
              eventName: 'bip started',
              propertiesJson: <String, String?>{
                'page': 'home',
                'stage': 'unsubscribed',
              },
            );

            _shouldSetState = true;
          } else {
            if (_shouldSetState) safeSetState(() {});
            return;
          }

          if (_shouldSetState) safeSetState(() {});
          return;
        } else if (widget!.status?.processo == 'tratamentoBip') {
          if (widget!.status?.estagio == 'comprarBip') {
            if (FFAppState().paciente.assinatura.plano != 1) {
              context.pushNamed('comprarBip');

              _model.apiResult38y = await SegmentGroup.trackingCall.call(
                userId: currentUserUid,
                eventName: 'bip started',
                propertiesJson: <String, String?>{
                  'page': 'home',
                  'stage': 'subscribed',
                },
              );

              _shouldSetState = true;
            } else {
              context.pushNamed('planos');

              _model.apiResult38yz = await SegmentGroup.trackingCall.call(
                userId: currentUserUid,
                eventName: 'bip started',
                propertiesJson: <String, String?>{
                  'page': 'home',
                  'stage': 'unsubscribed',
                },
              );

              _shouldSetState = true;
            }

            if (_shouldSetState) safeSetState(() {});
            return;
          } else if (widget!.status?.estagio == 'preencherFormularioBip') {
            context.pushNamed(
              'ajustarDose',
              queryParameters: {
                'page': serializeParam(
                  'preencher',
                  ParamType.String,
                ),
              }.withoutNulls,
            );

            _model.apiResult38yzgfdv = await SegmentGroup.trackingCall.call(
              userId: currentUserUid,
              eventName: 'bip started',
            );

            _shouldSetState = true;
            if (_shouldSetState) safeSetState(() {});
            return;
          } else if (widget!.status?.estagio == 'visualizarAjusteBip') {
            context.pushNamed(
              'ajustarDose',
              queryParameters: {
                'page': serializeParam(
                  'verDose',
                  ParamType.String,
                ),
              }.withoutNulls,
            );

            _model.apiResult38yzrg = await SegmentGroup.trackingCall.call(
              userId: currentUserUid,
              eventName: 'new-posology started',
              propertiesJson: <String, String?>{
                'page': 'home',
                'stage': 'unsubscribed',
              },
            );

            _shouldSetState = true;
            if (_shouldSetState) safeSetState(() {});
            return;
          } else {
            if (_shouldSetState) safeSetState(() {});
            return;
          }
        } else {
          if (_shouldSetState) safeSetState(() {});
          return;
        }

        if (_shouldSetState) safeSetState(() {});
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
              if ((widget!.status?.processo == 'tratamentoBip') &&
                  (widget!.status?.estagio == 'comprarBip')) {
                return Color(0xFFF17373);
              } else if ((widget!.status?.processo == 'planoTerapeutico') &&
                  (widget!.status?.estagio == 'formularioDeSaude')) {
                return Color(0xFFFFA438);
              } else if ((widget!.status?.processo == 'planoTerapeutico') &&
                  (widget!.status?.estagio == 'visualizarPlano')) {
                return Color(0xFF00BFD9);
              } else if ((widget!.status?.processo == 'planoTerapeutico') &&
                  (widget!.status?.estagio == 'confirmarRecebimento')) {
                return Color(0xFF00BFD9);
              } else if ((widget!.status?.processo == 'planoTerapeutico') &&
                  (widget!.status?.estagio == 'assinarPlano')) {
                return Color(0xFFF17373);
              } else if ((widget!.status?.processo == 'tratamentoBip') &&
                  (widget!.status?.estagio == 'preencherFormularioBip')) {
                return Color(0xFF00BFD9);
              } else if ((widget!.status?.processo == 'tratamentoBip') &&
                  (widget!.status?.estagio == 'recberAjusteBip')) {
                return Color(0xFF00BFD9);
              } else if ((widget!.status?.processo == 'tratamentoBip') &&
                  (widget!.status?.estagio == 'visualizarAjusteBip')) {
                return Color(0xFF00BFD9);
              } else {
                return Color(0x00000000);
              }
            }(),
            borderRadius: BorderRadius.circular(9.0),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(18.0, 0.0, 18.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: 32.0,
                  height: 32.0,
                  decoration: BoxDecoration(
                    color: () {
                      if ((widget!.status?.processo == 'planoTerapeutico') &&
                          (widget!.status?.estagio == 'assinarPlano')) {
                        return Color(0xFF7C0000);
                      } else if ((widget!.status?.processo ==
                              'planoTerapeutico') &&
                          (widget!.status?.estagio == 'formularioDeSaude')) {
                        return Color(0xFFC16A02);
                      } else if ((widget!.status?.processo ==
                              'planoTerapeutico') &&
                          (widget!.status?.estagio == 'visualizarPlano')) {
                        return Color(0xFF007E8F);
                      } else if ((widget!.status?.processo ==
                              'planoTerapeutico') &&
                          (widget!.status?.estagio == 'confirmarRecebimento')) {
                        return Color(0xFF007E8F);
                      } else if ((widget!.status?.processo ==
                              'tratamentoBip') &&
                          (widget!.status?.estagio == 'comprarBip')) {
                        return Color(0xFFB50707);
                      } else if ((widget!.status?.processo ==
                              'tratamentoBip') &&
                          (widget!.status?.estagio ==
                              'preencherFormularioBip')) {
                        return Color(0xFF007E8F);
                      } else if ((widget!.status?.processo ==
                              'tratamentoBip') &&
                          (widget!.status?.estagio == 'recberAjusteBip')) {
                        return Color(0xFF007E8F);
                      } else if ((widget!.status?.processo ==
                              'tratamentoBip') &&
                          (widget!.status?.estagio == 'visualizarAjusteBip')) {
                        return Color(0xFF007E8F);
                      } else {
                        return Color(0x00000000);
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
                          color: Color(0x00FFFFFF),
                          image: DecorationImage(
                            fit: BoxFit.contain,
                            image: Image.network(
                              valueOrDefault<String>(
                                () {
                                  if ((widget!.status?.processo ==
                                          'consulta') &&
                                      (widget!.status?.estagio ==
                                          'agendarConsulta')) {
                                    return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/v-i-v-pacientes-n1581s/assets/ygt09lezwut9/Vector.png';
                                  } else if ((widget!.status?.processo ==
                                          'consulta') &&
                                      (widget!.status?.estagio ==
                                          'pagarConsulta')) {
                                    return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/v-i-v-pacientes-n1581s/assets/4bypz0n1pdtw/Vector-2.png';
                                  } else if ((widget!.status?.processo ==
                                          'consulta') &&
                                      (widget!.status?.estagio ==
                                          'formularioPreConsulta')) {
                                    return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/v-i-v-pacientes-n1581s/assets/bcvt8ip5q060/Vector-1.png';
                                  } else if ((widget!.status?.processo ==
                                          'planoTerapeutico') &&
                                      (widget!.status?.estagio ==
                                          'confirmarRecebimento')) {
                                    return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/v-i-v-pacientes-n1581s/assets/hyhu19qkrql8/Vector.png';
                                  } else if ((widget!.status?.processo ==
                                          'planoTerapeutico') &&
                                      (widget!.status?.estagio ==
                                          'assinarPlano')) {
                                    return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/v-i-v-pacientes-n1581s/assets/4bypz0n1pdtw/Vector-2.png';
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
                            if ((widget!.status?.processo ==
                                    'planoTerapeutico') &&
                                (widget!.status?.estagio == 'assinarPlano')) {
                              return 'Assine o BIP, Ajustes de Dose, para seu tratamento';
                            } else if ((widget!.status?.processo ==
                                    'planoTerapeutico') &&
                                (widget!.status?.estagio ==
                                    'formularioDeSaude')) {
                              return 'Preencha aqui as suas informações de saúde para te conhecermos melhor';
                            } else if ((widget!.status?.processo ==
                                    'planoTerapeutico') &&
                                (widget!.status?.estagio ==
                                    'visualizarPlano')) {
                              return 'Confira aqui o seu Plano Terapêutico, e comece já o seu tratamento.';
                            } else if ((widget!.status?.processo ==
                                    'planoTerapeutico') &&
                                (widget!.status?.estagio ==
                                    'confirmarRecebimento')) {
                              return 'Confirmar recebimento do remédio para iniciar o tratamento.';
                            } else if ((widget!.status?.processo ==
                                    'tratamentoBip') &&
                                (widget!.status?.estagio == 'comprarBip')) {
                              return 'Você precisa de Ajuste de Dose para seu atual tratamento? Toque aqui para conhecer.';
                            } else if ((widget!.status?.processo ==
                                    'tratamentoBip') &&
                                (widget!.status?.estagio ==
                                    'preencherFormularioBip')) {
                              return 'Você precisa de Ajuste de Dose para seu atual tratamento? Faça aqui.';
                            } else if ((widget!.status?.processo ==
                                    'tratamentoBip') &&
                                (widget!.status?.estagio ==
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
              ].divide(SizedBox(width: 12.0)),
            ),
          ),
        ),
      ),
    );
  }
}
