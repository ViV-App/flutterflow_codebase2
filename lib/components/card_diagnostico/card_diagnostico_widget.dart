import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'card_diagnostico_model.dart';
export 'card_diagnostico_model.dart';

class CardDiagnosticoWidget extends StatefulWidget {
  const CardDiagnosticoWidget({
    super.key,
    this.diagnostico,
  });

  final StaticDiagnosticosRow? diagnostico;

  @override
  State<CardDiagnosticoWidget> createState() => _CardDiagnosticoWidgetState();
}

class _CardDiagnosticoWidgetState extends State<CardDiagnosticoWidget> {
  late CardDiagnosticoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CardDiagnosticoModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
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
      constraints: BoxConstraints(
        minHeight: 40.0,
        maxHeight: 1000.0,
      ),
      decoration: BoxDecoration(
        color: Color(0xFFF7FAFE),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 12.0, 8.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              constraints: BoxConstraints(
                maxWidth: 150.0,
              ),
              decoration: BoxDecoration(),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    valueOrDefault<String>(
                      widget!.diagnostico?.nome,
                      '-',
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Mulish',
                          color: Color(0xFF434854),
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w800,
                        ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Theme(
                  data: ThemeData(
                    checkboxTheme: CheckboxThemeData(
                      visualDensity: VisualDensity.compact,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                    ),
                    unselectedWidgetColor:
                        FlutterFlowTheme.of(context).secondaryText,
                  ),
                  child: Checkbox(
                    value: _model.checkboxValue1 ??= false,
                    onChanged: (newValue) async {
                      safeSetState(() => _model.checkboxValue1 = newValue!);
                    },
                    side: BorderSide(
                      width: 2,
                      color: FlutterFlowTheme.of(context).secondaryText,
                    ),
                    activeColor: FlutterFlowTheme.of(context).primary,
                    checkColor: FlutterFlowTheme.of(context).info,
                  ),
                ),
                Theme(
                  data: ThemeData(
                    checkboxTheme: CheckboxThemeData(
                      visualDensity: VisualDensity.compact,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                    ),
                    unselectedWidgetColor:
                        FlutterFlowTheme.of(context).secondaryText,
                  ),
                  child: Checkbox(
                    value: _model.checkboxValue2 ??= false,
                    onChanged: (newValue) async {
                      safeSetState(() => _model.checkboxValue2 = newValue!);
                    },
                    side: BorderSide(
                      width: 2,
                      color: FlutterFlowTheme.of(context).secondaryText,
                    ),
                    activeColor: FlutterFlowTheme.of(context).primary,
                    checkColor: FlutterFlowTheme.of(context).info,
                  ),
                ),
                Theme(
                  data: ThemeData(
                    checkboxTheme: CheckboxThemeData(
                      visualDensity: VisualDensity.compact,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                    ),
                    unselectedWidgetColor:
                        FlutterFlowTheme.of(context).secondaryText,
                  ),
                  child: Checkbox(
                    value: _model.checkboxValue3 ??= false,
                    onChanged: (newValue) async {
                      safeSetState(() => _model.checkboxValue3 = newValue!);
                    },
                    side: BorderSide(
                      width: 2,
                      color: FlutterFlowTheme.of(context).secondaryText,
                    ),
                    activeColor: FlutterFlowTheme.of(context).primary,
                    checkColor: FlutterFlowTheme.of(context).info,
                  ),
                ),
                Theme(
                  data: ThemeData(
                    checkboxTheme: CheckboxThemeData(
                      visualDensity: VisualDensity.compact,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                    ),
                    unselectedWidgetColor:
                        FlutterFlowTheme.of(context).secondaryText,
                  ),
                  child: Checkbox(
                    value: _model.checkboxValue4 ??= false,
                    onChanged: (newValue) async {
                      safeSetState(() => _model.checkboxValue4 = newValue!);
                    },
                    side: BorderSide(
                      width: 2,
                      color: FlutterFlowTheme.of(context).secondaryText,
                    ),
                    activeColor: FlutterFlowTheme.of(context).primary,
                    checkColor: FlutterFlowTheme.of(context).info,
                  ),
                ),
              ].divide(SizedBox(width: 18.0)),
            ),
          ],
        ),
      ),
    );
  }
}
