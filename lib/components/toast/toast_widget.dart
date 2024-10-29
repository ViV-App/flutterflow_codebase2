import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'toast_model.dart';
export 'toast_model.dart';

class ToastWidget extends StatefulWidget {
  const ToastWidget({
    super.key,
    required this.type,
    required this.title,
    required this.message,
  });

  final ToastTypes? type;
  final String? title;
  final String? message;

  @override
  State<ToastWidget> createState() => _ToastWidgetState();
}

class _ToastWidgetState extends State<ToastWidget>
    with TickerProviderStateMixin {
  late ToastModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ToastModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(const Duration(milliseconds: 5000));
      if (animationsMap['containerOnActionTriggerAnimation'] != null) {
        await animationsMap['containerOnActionTriggerAnimation']!
            .controller
            .forward(from: 0.0);
      }
      Navigator.pop(context);
    });

    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        applyInitialState: true,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, -70.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'containerOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 0.0),
            end: Offset(0.0, -500.0),
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

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
      padding: EdgeInsetsDirectional.fromSTEB(18.0, 18.0, 18.0, 0.0),
      child: Container(
        width: double.infinity,
        constraints: BoxConstraints(
          minHeight: 70.0,
          maxHeight: 80.0,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 4.0,
              color: Color(0x33000000),
              offset: Offset(
                0.0,
                2.0,
              ),
            )
          ],
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(
            color: Color(0xFFE5E7EB),
          ),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 12.0, 8.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 36.0,
                height: 36.0,
                decoration: BoxDecoration(
                  color: () {
                    if (widget!.type == ToastTypes.red) {
                      return FlutterFlowTheme.of(context).error;
                    } else if (widget!.type == ToastTypes.yellow) {
                      return FlutterFlowTheme.of(context).warning;
                    } else if (widget!.type == ToastTypes.puprle) {
                      return FlutterFlowTheme.of(context).primary;
                    } else {
                      return Color(0x00000000);
                    }
                  }(),
                  shape: BoxShape.circle,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (widget!.type == ToastTypes.red)
                      Icon(
                        Icons.block_outlined,
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        size: 24.0,
                      ),
                    if (widget!.type == ToastTypes.yellow)
                      Icon(
                        Icons.info_outline,
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        size: 24.0,
                      ),
                    if (widget!.type == ToastTypes.puprle)
                      FaIcon(
                        FontAwesomeIcons.checkCircle,
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        size: 24.0,
                      ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      valueOrDefault<String>(
                        widget!.title,
                        'Toast Title',
                      ),
                      style: FlutterFlowTheme.of(context).bodyLarge.override(
                            fontFamily: 'Figtree',
                            color: Color(0xFF15161E),
                            fontSize: 16.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                    Text(
                      valueOrDefault<String>(
                        widget!.message,
                        'Toast Message',
                      ),
                      style: FlutterFlowTheme.of(context).labelMedium.override(
                            fontFamily: 'Figtree',
                            color: Color(0xFF606A85),
                            fontSize: 14.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ].divide(SizedBox(height: 4.0)),
                ),
              ),
              FlutterFlowIconButton(
                borderRadius: 20.0,
                borderWidth: 1.0,
                buttonSize: 40.0,
                hoverColor: Color(0xFFF1F4F8),
                icon: Icon(
                  Icons.close_rounded,
                  color: Color(0xFF606A85),
                  size: 24.0,
                ),
                onPressed: () async {
                  if (animationsMap['containerOnActionTriggerAnimation'] !=
                      null) {
                    await animationsMap['containerOnActionTriggerAnimation']!
                        .controller
                        .forward(from: 0.0);
                  }
                  Navigator.pop(context);
                },
              ),
            ].divide(SizedBox(width: 8.0)),
          ),
        ),
      )
          .animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!)
          .animateOnActionTrigger(
            animationsMap['containerOnActionTriggerAnimation']!,
          ),
    );
  }
}
