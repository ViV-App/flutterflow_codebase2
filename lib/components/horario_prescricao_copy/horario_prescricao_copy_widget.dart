import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'horario_prescricao_copy_model.dart';
export 'horario_prescricao_copy_model.dart';

class HorarioPrescricaoCopyWidget extends StatefulWidget {
  const HorarioPrescricaoCopyWidget({
    super.key,
    this.horario,
    this.index,
  });

  final HorariosStruct? horario;
  final int? index;

  @override
  State<HorarioPrescricaoCopyWidget> createState() =>
      _HorarioPrescricaoCopyWidgetState();
}

class _HorarioPrescricaoCopyWidgetState
    extends State<HorarioPrescricaoCopyWidget> {
  late HorarioPrescricaoCopyModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HorarioPrescricaoCopyModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            () {
              if (widget!.index == 0) {
                return 'Primeira dose';
              } else if (widget!.index == 1) {
                return 'Segunda dose';
              } else if (widget!.index == 2) {
                return 'Terceira dose';
              } else {
                return 'Dose';
              }
            }(),
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Mulish',
                  color: Color(0xFF8798B5),
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
              final _datePickedTime = await showTimePicker(
                context: context,
                initialTime: TimeOfDay.fromDateTime(
                    (widget!.horario?.horario ?? DateTime.now())),
              );
              if (_datePickedTime != null) {
                safeSetState(() {
                  _model.datePicked = DateTime(
                    (widget!.horario?.horario ?? DateTime.now()).year,
                    (widget!.horario?.horario ?? DateTime.now()).month,
                    (widget!.horario?.horario ?? DateTime.now()).day,
                    _datePickedTime.hour,
                    _datePickedTime.minute,
                  );
                });
              }
              if (_model.datePicked != null) {
                FFAppState().updatePrescricaoStruct(
                  (e) => e
                    ..updateTimeslots(
                      (e) => e[widget!.index!]..horario = _model.datePicked,
                    )
                    ..updateHorarios(
                      (e) => e.add(_model.datePicked!),
                    ),
                );
                safeSetState(() {});
                _model.time = _model.datePicked;
                safeSetState(() {});
              } else {
                return;
              }
            },
            child: Container(
              width: 150.0,
              height: 48.0,
              decoration: BoxDecoration(
                color: Color(0xFFF7FAFE),
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(
                  color: Color(0x13294B0D),
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
                        widget!.horario?.horario,
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
