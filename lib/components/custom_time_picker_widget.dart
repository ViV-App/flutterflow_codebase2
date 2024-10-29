import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'custom_time_picker_model.dart';
export 'custom_time_picker_model.dart';

class CustomTimePickerWidget extends StatefulWidget {
  const CustomTimePickerWidget({
    super.key,
    this.callback,
  });

  final Future Function(DateTime timeSet)? callback;

  @override
  State<CustomTimePickerWidget> createState() => _CustomTimePickerWidgetState();
}

class _CustomTimePickerWidgetState extends State<CustomTimePickerWidget> {
  late CustomTimePickerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CustomTimePickerModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.initHour = functions.getCurrentHour(getCurrentTimestamp);
      _model.initMin = functions.getCurrentMin(getCurrentTimestamp);
      safeSetState(() {});
      await Future.wait([
        Future(() async {
          await _model.carouselController1?.animateToPage(
            _model.initHour,
            duration: const Duration(milliseconds: 500),
            curve: Curves.ease,
          );
        }),
        Future(() async {
          await _model.carouselController2?.animateToPage(
            _model.initMin,
            duration: const Duration(milliseconds: 500),
            curve: Curves.ease,
          );
        }),
      ]);
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: const AlignmentDirectional(0.0, 1.0),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(0.0),
                bottomRight: Radius.circular(0.0),
                topLeft: Radius.circular(32.0),
                topRight: Radius.circular(32.0),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Align(
                  alignment: const AlignmentDirectional(0.0, -1.0),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                    child: Container(
                      width: 100.0,
                      height: 4.0,
                      decoration: BoxDecoration(
                        color: const Color(0xFFDBE4F1),
                        borderRadius: BorderRadius.circular(32.0),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 18.0, 0.0, 18.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Container(
                            decoration: const BoxDecoration(),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Builder(
                                    builder: (context) {
                                      final hours =
                                          functions.listOfHours().toList();

                                      return SizedBox(
                                        width: 200.0,
                                        height: double.infinity,
                                        child: CarouselSlider.builder(
                                          itemCount: hours.length,
                                          itemBuilder:
                                              (context, hoursIndex, _) {
                                            final hoursItem = hours[hoursIndex];
                                            return Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                if (hoursItem < 10)
                                                  Text(
                                                    '0',
                                                    textAlign: TextAlign.center,
                                                    maxLines: 1,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Mulish',
                                                          color: _model
                                                                      .carouselCurrentIndex1 ==
                                                                  hoursIndex
                                                              ? FlutterFlowTheme
                                                                      .of(
                                                                          context)
                                                                  .primary
                                                              : const Color(
                                                                  0x4B000000),
                                                          fontSize: 42.0,
                                                          letterSpacing: 1.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          lineHeight: 1.0,
                                                        ),
                                                  ),
                                                Text(
                                                  valueOrDefault<String>(
                                                    hoursItem.toString(),
                                                    '00',
                                                  ),
                                                  textAlign: TextAlign.center,
                                                  maxLines: 1,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Mulish',
                                                        color: _model
                                                                    .carouselCurrentIndex1 ==
                                                                hoursIndex
                                                            ? FlutterFlowTheme
                                                                    .of(context)
                                                                .primary
                                                            : const Color(0x4A000000),
                                                        fontSize: 42.0,
                                                        letterSpacing: 1.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        lineHeight: 1.0,
                                                      ),
                                                ),
                                              ],
                                            );
                                          },
                                          carouselController:
                                              _model.carouselController1 ??=
                                                  CarouselSliderController(),
                                          options: CarouselOptions(
                                            initialPage: max(
                                                0,
                                                min(
                                                    valueOrDefault<int>(
                                                      _model.initHour,
                                                      0,
                                                    ),
                                                    hours.length - 1)),
                                            viewportFraction: 0.2,
                                            disableCenter: false,
                                            enlargeCenterPage: true,
                                            enlargeFactor: 0.5,
                                            enableInfiniteScroll: false,
                                            scrollDirection: Axis.vertical,
                                            autoPlay: false,
                                            onPageChanged: (index, _) async {
                                              _model.carouselCurrentIndex1 =
                                                  index;
                                              _model.swtc = !_model.swtc;
                                              safeSetState(() {});
                                            },
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                Align(
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: Text(
                                    ':',
                                    maxLines: 1,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Mulish',
                                          fontSize: 42.0,
                                          letterSpacing: 1.0,
                                          fontWeight: FontWeight.bold,
                                          lineHeight: 1.0,
                                        ),
                                  ),
                                ),
                                Expanded(
                                  child: Builder(
                                    builder: (context) {
                                      final hourst =
                                          functions.listOfMinutes().toList();

                                      return SizedBox(
                                        width: 200.0,
                                        height: double.infinity,
                                        child: CarouselSlider.builder(
                                          itemCount: hourst.length,
                                          itemBuilder:
                                              (context, hourstIndex, _) {
                                            final hourstItem =
                                                hourst[hourstIndex];
                                            return Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                if (hourstItem < 10)
                                                  Text(
                                                    '0',
                                                    textAlign: TextAlign.center,
                                                    maxLines: 1,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Mulish',
                                                          color: _model
                                                                      .carouselCurrentIndex2 ==
                                                                  hourstIndex
                                                              ? FlutterFlowTheme
                                                                      .of(
                                                                          context)
                                                                  .primary
                                                              : const Color(
                                                                  0x4B000000),
                                                          fontSize: 42.0,
                                                          letterSpacing: 1.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          lineHeight: 1.0,
                                                        ),
                                                  ),
                                                Text(
                                                  valueOrDefault<String>(
                                                    hourstItem.toString(),
                                                    '00',
                                                  ),
                                                  textAlign: TextAlign.center,
                                                  maxLines: 1,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Mulish',
                                                        color: _model
                                                                    .carouselCurrentIndex2 ==
                                                                hourstIndex
                                                            ? FlutterFlowTheme
                                                                    .of(context)
                                                                .primary
                                                            : const Color(0x4B000000),
                                                        fontSize: 42.0,
                                                        letterSpacing: 1.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        lineHeight: 1.0,
                                                      ),
                                                ),
                                              ],
                                            );
                                          },
                                          carouselController:
                                              _model.carouselController2 ??=
                                                  CarouselSliderController(),
                                          options: CarouselOptions(
                                            initialPage: max(
                                                0,
                                                min(
                                                    valueOrDefault<int>(
                                                      _model.initMin,
                                                      0,
                                                    ),
                                                    hourst.length - 1)),
                                            viewportFraction: 0.2,
                                            disableCenter: false,
                                            enlargeCenterPage: true,
                                            enlargeFactor: 0.5,
                                            enableInfiniteScroll: false,
                                            scrollDirection: Axis.vertical,
                                            autoPlay: false,
                                            onPageChanged: (index, _) async {
                                              _model.carouselCurrentIndex2 =
                                                  index;
                                              _model.swtc = !_model.swtc;
                                              safeSetState(() {});
                                            },
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 18.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: FFButtonWidget(
                          onPressed: () async {
                            Navigator.pop(context);
                          },
                          text: 'Cancelar',
                          options: FFButtonOptions(
                            height: 48.0,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: Colors.white,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Mulish',
                                  color: FlutterFlowTheme.of(context).primary,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                ),
                            elevation: 3.0,
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).primary,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                      Expanded(
                        child: FFButtonWidget(
                          onPressed: () async {
                            await widget.callback?.call(
                              functions.hourDate(
                                  '${functions.listOfHours()[_model.carouselCurrentIndex1].toString()}:${functions.listOfMinutes()[_model.carouselCurrentIndex2].toString()}'),
                            );
                            Navigator.pop(context);
                            await actions.hideKeyboard();
                          },
                          text: 'Confirmar',
                          options: FFButtonOptions(
                            height: 48.0,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Mulish',
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                ),
                            elevation: 0.0,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                    ].divide(const SizedBox(width: 18.0)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
