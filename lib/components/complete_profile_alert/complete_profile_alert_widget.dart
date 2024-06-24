import '/components/complete_perfil/complete_perfil_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'complete_profile_alert_model.dart';
export 'complete_profile_alert_model.dart';

class CompleteProfileAlertWidget extends StatefulWidget {
  const CompleteProfileAlertWidget({super.key});

  @override
  State<CompleteProfileAlertWidget> createState() =>
      _CompleteProfileAlertWidgetState();
}

class _CompleteProfileAlertWidgetState
    extends State<CompleteProfileAlertWidget> {
  late CompleteProfileAlertModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CompleteProfileAlertModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        await showModalBottomSheet(
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          context: context,
          builder: (context) {
            return WebViewAware(
              child: Padding(
                padding: MediaQuery.viewInsetsOf(context),
                child: const CompletePerfilWidget(),
              ),
            );
          },
        ).then((value) => safeSetState(() {}));
      },
      child: Container(
        width: double.infinity,
        height: 48.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).customColor1,
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(12.0, 6.0, 12.0, 6.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Complete seu perfil para ter acesso completo a ViV!',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Mulish',
                      color: Colors.white,
                      fontSize: 15.0,
                      letterSpacing: 0.0,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
