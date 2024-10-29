import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'custom_date_picker_model.dart';
export 'custom_date_picker_model.dart';

class CustomDatePickerWidget extends StatefulWidget {
  const CustomDatePickerWidget({
    super.key,
    this.callback,
    bool? hasInitDate,
    this.initDate,
  }) : hasInitDate = hasInitDate ?? false;

  final Future Function(DateTime dateSet)? callback;
  final bool hasInitDate;
  final DateTime? initDate;

  @override
  State<CustomDatePickerWidget> createState() => _CustomDatePickerWidgetState();
}

class _CustomDatePickerWidgetState extends State<CustomDatePickerWidget> {
  late CustomDatePickerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CustomDatePickerModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget.hasInitDate == true) {
        _model.initDay = functions.getDayNumber(widget.initDate!) - 1;
        _model.initMonth = functions.getMonthNumber(widget.initDate!) - 1;
        safeSetState(() {});
        await Future.wait([
          Future(() async {
            await _model.carouselDController?.animateToPage(
              _model.initDay,
              duration: const Duration(milliseconds: 500),
              curve: Curves.ease,
            );
          }),
          Future(() async {
            await _model.carouselMController?.animateToPage(
              _model.initMonth,
              duration: const Duration(milliseconds: 500),
              curve: Curves.ease,
            );
          }),
        ]);
      } else {
        _model.initDay = functions.getDayNumber(getCurrentTimestamp) - 1;
        _model.initMonth = functions.getMonthNumber(getCurrentTimestamp) - 1;
        safeSetState(() {});
        await Future.wait([
          Future(() async {
            await _model.carouselDController?.animateToPage(
              _model.initDay,
              duration: const Duration(milliseconds: 500),
              curve: Curves.ease,
            );
          }),
          Future(() async {
            await _model.carouselMController?.animateToPage(
              _model.initMonth,
              duration: const Duration(milliseconds: 500),
              curve: Curves.ease,
            );
          }),
        ]);
      }
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
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 12.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Builder(
                                      builder: (context) {
                                        final daysM = functions
                                            .diasNoMes(
                                                functions.returnMonths()[_model
                                                    .carouselMCurrentIndex],
                                                functions.yearsList()[_model
                                                    .carouselACurrentIndex])
                                            .toList();

                                        return SizedBox(
                                          width: 200.0,
                                          height: double.infinity,
                                          child: CarouselSlider.builder(
                                            itemCount: daysM.length,
                                            itemBuilder:
                                                (context, daysMIndex, _) {
                                              final daysMItem =
                                                  daysM[daysMIndex];
                                              return Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  if (daysMItem < 10)
                                                    Text(
                                                      '0',
                                                      textAlign:
                                                          TextAlign.center,
                                                      maxLines: 1,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Mulish',
                                                            color: _model
                                                                        .carouselDCurrentIndex ==
                                                                    daysMIndex
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary
                                                                : const Color(
                                                                    0x4A000000),
                                                            fontSize: 34.0,
                                                            letterSpacing: 1.0,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            lineHeight: 1.0,
                                                          ),
                                                    ),
                                                  Text(
                                                    valueOrDefault<String>(
                                                      daysMItem.toString(),
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
                                                                      .carouselDCurrentIndex ==
                                                                  daysMIndex
                                                              ? FlutterFlowTheme
                                                                      .of(
                                                                          context)
                                                                  .primary
                                                              : const Color(
                                                                  0x4A000000),
                                                          fontSize: 34.0,
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
                                                _model.carouselDController ??=
                                                    CarouselSliderController(),
                                            options: CarouselOptions(
                                              initialPage: max(
                                                  0,
                                                  min(
                                                      valueOrDefault<int>(
                                                        _model.initDay,
                                                        0,
                                                      ),
                                                      daysM.length - 1)),
                                              viewportFraction: 0.2,
                                              disableCenter: false,
                                              enlargeCenterPage: true,
                                              enlargeFactor: 0.5,
                                              enableInfiniteScroll: false,
                                              scrollDirection: Axis.vertical,
                                              autoPlay: false,
                                              onPageChanged: (index, _) async {
                                                _model.carouselDCurrentIndex =
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
                                      '/',
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
                                        final months =
                                            functions.returnMonths().toList();

                                        return SizedBox(
                                          width: 200.0,
                                          height: double.infinity,
                                          child: CarouselSlider.builder(
                                            itemCount: months.length,
                                            itemBuilder:
                                                (context, monthsIndex, _) {
                                              final monthsItem =
                                                  months[monthsIndex];
                                              return Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  if (monthsItem < 10)
                                                    Text(
                                                      '0',
                                                      textAlign:
                                                          TextAlign.center,
                                                      maxLines: 1,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Mulish',
                                                            color: _model
                                                                        .carouselMCurrentIndex ==
                                                                    monthsIndex
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary
                                                                : const Color(
                                                                    0x4B000000),
                                                            fontSize: 34.0,
                                                            letterSpacing: 1.0,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            lineHeight: 1.0,
                                                          ),
                                                    ),
                                                  Text(
                                                    valueOrDefault<String>(
                                                      monthsItem.toString(),
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
                                                                      .carouselMCurrentIndex ==
                                                                  monthsIndex
                                                              ? FlutterFlowTheme
                                                                      .of(
                                                                          context)
                                                                  .primary
                                                              : const Color(
                                                                  0x4B000000),
                                                          fontSize: 34.0,
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
                                                _model.carouselMController ??=
                                                    CarouselSliderController(),
                                            options: CarouselOptions(
                                              initialPage: max(
                                                  0,
                                                  min(
                                                      valueOrDefault<int>(
                                                        _model.initMonth,
                                                        0,
                                                      ),
                                                      months.length - 1)),
                                              viewportFraction: 0.2,
                                              disableCenter: false,
                                              enlargeCenterPage: true,
                                              enlargeFactor: 0.5,
                                              enableInfiniteScroll: false,
                                              scrollDirection: Axis.vertical,
                                              autoPlay: false,
                                              onPageChanged: (index, _) async {
                                                _model.carouselMCurrentIndex =
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
                                      '/',
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
                                        final years =
                                            functions.yearsList().toList();

                                        return SizedBox(
                                          width: 200.0,
                                          height: double.infinity,
                                          child: CarouselSlider.builder(
                                            itemCount: years.length,
                                            itemBuilder:
                                                (context, yearsIndex, _) {
                                              final yearsItem =
                                                  years[yearsIndex];
                                              return Text(
                                                valueOrDefault<String>(
                                                  yearsItem.toString(),
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
                                                                  .carouselACurrentIndex ==
                                                              yearsIndex
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .primary
                                                          : const Color(0x4B000000),
                                                      fontSize: 34.0,
                                                      letterSpacing: 1.0,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      lineHeight: 1.0,
                                                    ),
                                              );
                                            },
                                            carouselController:
                                                _model.carouselAController ??=
                                                    CarouselSliderController(),
                                            options: CarouselOptions(
                                              initialPage: max(
                                                  0, min(74, years.length - 1)),
                                              viewportFraction: 0.2,
                                              disableCenter: false,
                                              enlargeCenterPage: true,
                                              enlargeFactor: 0.5,
                                              enableInfiniteScroll: false,
                                              scrollDirection: Axis.vertical,
                                              autoPlay: false,
                                              onPageChanged: (index, _) async {
                                                _model.carouselACurrentIndex =
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
                              functions.newDateCustom(
                                  functions.yearsList()[
                                      _model.carouselACurrentIndex],
                                  functions.returnMonths()[
                                      _model.carouselMCurrentIndex],
                                  functions.diasNoMes(
                                          functions.returnMonths()[
                                              _model.carouselMCurrentIndex],
                                          functions.yearsList()[
                                              _model.carouselACurrentIndex])[
                                      _model.carouselDCurrentIndex]),
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
