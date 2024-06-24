import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'card_consulta_model.dart';
export 'card_consulta_model.dart';

class CardConsultaWidget extends StatefulWidget {
  const CardConsultaWidget({super.key});

  @override
  State<CardConsultaWidget> createState() => _CardConsultaWidgetState();
}

class _CardConsultaWidgetState extends State<CardConsultaWidget> {
  late CardConsultaModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CardConsultaModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFFF7FAFE),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: 52.0,
                  height: 52.0,
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Image.network(
                    'https://picsum.photos/seed/724/600',
                    fit: BoxFit.cover,
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Dr. Gabriel Meneses',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Mulish',
                            fontSize: 16.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    Text(
                      'Psiquiatra',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Mulish',
                            color: const Color(0xFF8798B5),
                            letterSpacing: 0.0,
                          ),
                    ),
                  ],
                ),
              ].divide(const SizedBox(width: 12.0)),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 18.0, 0.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      const Icon(
                        Icons.calendar_today,
                        color: Color(0xFF8798B5),
                        size: 18.0,
                      ),
                      Text(
                        '00/00/2024',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Mulish',
                              color: const Color(0xFF8798B5),
                              letterSpacing: 0.0,
                            ),
                      ),
                    ].divide(const SizedBox(width: 4.0)),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      const FaIcon(
                        FontAwesomeIcons.clock,
                        color: Color(0xFF8798B5),
                        size: 18.0,
                      ),
                      Text(
                        '10:00am',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Mulish',
                              color: const Color(0xFF8798B5),
                              letterSpacing: 0.0,
                            ),
                      ),
                    ].divide(const SizedBox(width: 4.0)),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Icon(
                        Icons.circle_rounded,
                        color: FlutterFlowTheme.of(context).success,
                        size: 8.0,
                      ),
                      Text(
                        '10:00am',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Mulish',
                              color: const Color(0xFF8798B5),
                              letterSpacing: 0.0,
                            ),
                      ),
                    ].divide(const SizedBox(width: 4.0)),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 18.0, 0.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: FFButtonWidget(
                      onPressed: () {
                        print('Button pressed ...');
                      },
                      text: 'Cancelar',
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 32.0,
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: const Color(0xFFEFF4F9),
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Mulish',
                                  color: const Color(0xFF262B37),
                                  fontSize: 14.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                ),
                        elevation: 0.0,
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                  Expanded(
                    child: FFButtonWidget(
                      onPressed: () {
                        print('Button pressed ...');
                      },
                      text: 'Reagendar',
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 32.0,
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Mulish',
                                  color: Colors.white,
                                  fontSize: 14.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                ),
                        elevation: 0.0,
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ].divide(const SizedBox(width: 14.0)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
