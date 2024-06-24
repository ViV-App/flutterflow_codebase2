import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_web_view.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'pdf_viewer_model.dart';
export 'pdf_viewer_model.dart';

class PdfViewerWidget extends StatefulWidget {
  const PdfViewerWidget({
    super.key,
    required this.pdfPath,
  });

  final String? pdfPath;

  @override
  State<PdfViewerWidget> createState() => _PdfViewerWidgetState();
}

class _PdfViewerWidgetState extends State<PdfViewerWidget>
    with TickerProviderStateMixin {
  late PdfViewerModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PdfViewerModel());

    animationsMap.addAll({
      'columnOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: const Offset(0.0, -72.0),
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
      padding: const EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 24.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Align(
            alignment: const AlignmentDirectional(1.0, -1.0),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
              child: FlutterFlowIconButton(
                borderColor: FlutterFlowTheme.of(context).primary,
                borderRadius: 20.0,
                borderWidth: 1.0,
                buttonSize: 52.0,
                fillColor: FlutterFlowTheme.of(context).primaryBackground,
                icon: Icon(
                  Icons.close,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 24.0,
                ),
                onPressed: () async {
                  Navigator.pop(context);
                },
              ),
            ),
          ),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Container(
                width: double.infinity,
                height: 400.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Stack(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: MediaQuery.sizeOf(context).height * 1.0,
                      child: custom_widgets.Gradients(
                        width: double.infinity,
                        height: MediaQuery.sizeOf(context).height * 1.0,
                        gradientStyle: 'trident',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: FlutterFlowWebView(
                            content: valueOrDefault<String>(
                              widget.pdfPath,
                              'https://drive.google.com/file/d/1jxN1xxWybNB3-ZK_3GNzeP6AT2yTofS9/preview',
                            ),
                            bypass: false,
                            height: MediaQuery.sizeOf(context).height * 1.0,
                            verticalScroll: false,
                            horizontalScroll: false,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ].divide(const SizedBox(height: 12.0)),
      ).animateOnPageLoad(animationsMap['columnOnPageLoadAnimation']!),
    );
  }
}
