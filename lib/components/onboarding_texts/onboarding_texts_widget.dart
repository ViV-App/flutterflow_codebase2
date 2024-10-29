import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'onboarding_texts_model.dart';
export 'onboarding_texts_model.dart';

class OnboardingTextsWidget extends StatefulWidget {
  const OnboardingTextsWidget({
    super.key,
    this.title,
    this.description,
  });

  final String? title;
  final String? description;

  @override
  State<OnboardingTextsWidget> createState() => _OnboardingTextsWidgetState();
}

class _OnboardingTextsWidgetState extends State<OnboardingTextsWidget> {
  late OnboardingTextsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OnboardingTextsModel());

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
      padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (widget!.title != 'kapa')
                Text(
                  valueOrDefault<String>(
                    widget!.title,
                    '-',
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Mulish',
                        color: Colors.white,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              if (widget!.title == 'kapa')
                Text(
                  'Olá, ${valueOrDefault<String>(
                    FFAppState().paciente.nome,
                    '-',
                  )}!',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Mulish',
                        color: Colors.white,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              Text(
                valueOrDefault<String>(
                  widget!.description,
                  '-',
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Mulish',
                      color: Colors.white,
                      letterSpacing: 0.0,
                    ),
              ),
            ].divide(SizedBox(height: 12.0)),
          ),
        ].divide(SizedBox(height: 30.0)),
      ),
    );
  }
}
