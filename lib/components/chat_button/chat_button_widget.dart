import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'chat_button_model.dart';
export 'chat_button_model.dart';

class ChatButtonWidget extends StatefulWidget {
  const ChatButtonWidget({super.key});

  @override
  State<ChatButtonWidget> createState() => _ChatButtonWidgetState();
}

class _ChatButtonWidgetState extends State<ChatButtonWidget>
    with TickerProviderStateMixin {
  late ChatButtonModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatButtonModel());

    animationsMap.addAll({
      'containerOnActionTriggerAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          MoveEffect(
            curve: Curves.linear,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 48.0),
            end: Offset(0.0, 0.0),
          ),
          BlurEffect(
            curve: Curves.easeInOut,
            delay: 200.0.ms,
            duration: 400.0.ms,
            begin: Offset(2.0, 2.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'containerOnActionTriggerAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          MoveEffect(
            curve: Curves.linear,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 32.0),
            end: Offset(0.0, 0.0),
          ),
          BlurEffect(
            curve: Curves.easeInOut,
            delay: 200.0.ms,
            duration: 300.0.ms,
            begin: Offset(2.0, 2.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'containerOnActionTriggerAnimation3': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
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
    context.watch<FFAppState>();

    return Align(
      alignment: AlignmentDirectional(-1.0, 1.0),
      child: Container(
        width: MediaQuery.sizeOf(context).width * 1.0,
        decoration: BoxDecoration(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (FFAppState().menuChatOpen == true)
              Align(
                alignment: AlignmentDirectional(0.0, 1.0),
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 32.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
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
                                'Tenho sintomas',
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
                      ).animateOnActionTrigger(
                        animationsMap['containerOnActionTriggerAnimation1']!,
                      ),
                      Container(
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
                                'Ajustar minha dose',
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
                      ).animateOnActionTrigger(
                        animationsMap['containerOnActionTriggerAnimation2']!,
                      ),
                      Container(
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
                                'Dúvidas sobre Cannabis',
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
                      ).animateOnActionTrigger(
                        animationsMap['containerOnActionTriggerAnimation3']!,
                      ),
                    ].divide(SizedBox(height: 12.0)),
                  ),
                ),
              ),
            Align(
              alignment: AlignmentDirectional(-1.0, 1.0),
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  if (FFAppState().menuChatOpen == true) {
                    if (animationsMap['containerOnActionTriggerAnimation1'] !=
                        null) {
                      animationsMap['containerOnActionTriggerAnimation1']!
                          .controller
                          .reverse();
                    }
                    if (animationsMap['containerOnActionTriggerAnimation2'] !=
                        null) {
                      animationsMap['containerOnActionTriggerAnimation2']!
                          .controller
                          .reverse();
                    }
                    if (animationsMap['containerOnActionTriggerAnimation3'] !=
                        null) {
                      animationsMap['containerOnActionTriggerAnimation3']!
                          .controller
                          .reverse();
                    }
                    FFAppState().menuChatOpen = false;
                    FFAppState().update(() {});
                  } else {
                    if (animationsMap['containerOnActionTriggerAnimation1'] !=
                        null) {
                      animationsMap['containerOnActionTriggerAnimation1']!
                          .controller
                          .forward(from: 0.0);
                    }
                    if (animationsMap['containerOnActionTriggerAnimation2'] !=
                        null) {
                      animationsMap['containerOnActionTriggerAnimation2']!
                          .controller
                          .forward(from: 0.0);
                    }
                    if (animationsMap['containerOnActionTriggerAnimation3'] !=
                        null) {
                      animationsMap['containerOnActionTriggerAnimation3']!
                          .controller
                          .forward(from: 0.0);
                    }
                    FFAppState().menuChatOpen = true;
                    FFAppState().update(() {});
                  }
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100.0),
                  child: Container(
                    width: 50.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                      color: () {
                        if (FFAppState().menuChatOpen == false) {
                          return FlutterFlowTheme.of(context).primary;
                        } else if (FFAppState().menuChatOpen == true) {
                          return Color(0xFFB5C0D3);
                        } else {
                          return Color(0xFFC9B1B1);
                        }
                      }(),
                      borderRadius: BorderRadius.circular(100.0),
                    ),
                    child: Stack(
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              if (FFAppState().menuChatOpen == false)
                                Icon(
                                  Icons.menu_sharp,
                                  color: Colors.white,
                                  size: 24.0,
                                ),
                              if (FFAppState().menuChatOpen == true)
                                Icon(
                                  Icons.close_rounded,
                                  color: Colors.white,
                                  size: 24.0,
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
