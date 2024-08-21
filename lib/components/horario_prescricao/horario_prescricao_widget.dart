import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'horario_prescricao_model.dart';
export 'horario_prescricao_model.dart';

class HorarioPrescricaoWidget extends StatefulWidget {
  const HorarioPrescricaoWidget({
    super.key,
    this.horario,
    this.index,
  });

  final HorariosStruct? horario;
  final int? index;

  @override
  State<HorarioPrescricaoWidget> createState() =>
      _HorarioPrescricaoWidgetState();
}

class _HorarioPrescricaoWidgetState extends State<HorarioPrescricaoWidget> {
  late HorarioPrescricaoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HorarioPrescricaoModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(0.0, 0.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            () {
              if (widget.index == 0) {
                return 'Primeira dose';
              } else if (widget.index == 1) {
                return 'Segunda dose';
              } else if (widget.index == 2) {
                return 'Terceira dose';
              } else {
                return 'Dose';
              }
            }(),
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Mulish',
                  color: const Color(0xFF8798B5),
                  fontSize: 16.0,
                  letterSpacing: 0.0,
                ),
          ),
          InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              await showModalBottomSheet<bool>(
                  context: context,
                  builder: (context) {
                    final datePickedCupertinoTheme =
                        CupertinoTheme.of(context);
                    return ScrollConfiguration(
                      behavior: const MaterialScrollBehavior().copyWith(
                        dragDevices: {
                          PointerDeviceKind.mouse,
                          PointerDeviceKind.touch,
                          PointerDeviceKind.stylus,
                          PointerDeviceKind.unknown
                        },
                      ),
                      child: Container(
                        height: MediaQuery.of(context).size.height / 3,
                        width: MediaQuery.of(context).size.width,
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        child: CupertinoTheme(
                          data: datePickedCupertinoTheme.copyWith(
                            textTheme:
                                datePickedCupertinoTheme.textTheme.copyWith(
                              dateTimePickerTextStyle:
                                  FlutterFlowTheme.of(context)
                                      .headlineMedium
                                      .override(
                                        fontFamily: 'Mulish',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        letterSpacing: 0.0,
                                      ),
                            ),
                          ),
                          child: CupertinoDatePicker(
                            mode: CupertinoDatePickerMode.time,
                            minimumDate: DateTime(1900),
                            initialDateTime:
                                (widget.horario?.horario ?? DateTime.now()),
                            maximumDate: DateTime(2050),
                            backgroundColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            use24hFormat: false,
                            onDateTimeChanged: (newDateTime) =>
                                safeSetState(() {
                              _model.datePicked = newDateTime;
                            }),
                          ),
                        ),
                      ),
                    );
                  });
              if (_model.datePicked != null) {
                FFAppState().updateHorariosAtIndex(
                  widget.index!,
                  (e) => e..horario = _model.datePicked,
                );
                setState(() {});
                _model.time = _model.datePicked;
                setState(() {});
              } else {
                return;
              }
            },
            child: Container(
              width: 150.0,
              height: 48.0,
              decoration: BoxDecoration(
                color: const Color(0xFFF7FAFE),
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(
                  color: const Color(0x13294B0D),
                  width: 2.0,
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    valueOrDefault<String>(
                      dateTimeFormat(
                        "Hm",
                        widget.horario?.horario,
                        locale: FFLocalizations.of(context).languageCode,
                      ),
                      '00:00',
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Mulish',
                          letterSpacing: 0.0,
                        ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
