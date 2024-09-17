import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:easy_debounce/easy_debounce.dart';
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

    _model.textController ??= TextEditingController(text: () {
      if (widget.horario?.dosagem != 0.0) {
        return widget.horario?.dosagem.toString();
      } else if (widget.horario?.dosagem == 0.0) {
        return '';
      } else {
        return '';
      }
    }());
    _model.textFieldFocusNode ??= FocusNode();

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
      alignment: const AlignmentDirectional(0.0, 0.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            () {
              if (widget.index == 0) {
                return '1ª dose';
              } else if (widget.index == 1) {
                return '2ª dose';
              } else if (widget.index == 2) {
                return '3ª dose';
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
          Expanded(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: SizedBox(
                    width: 100.0,
                    child: TextFormField(
                      controller: _model.textController,
                      focusNode: _model.textFieldFocusNode,
                      onChanged: (_) => EasyDebounce.debounce(
                        '_model.textController',
                        const Duration(milliseconds: 0),
                        () async {
                          FFAppState().updateHorariosAtIndex(
                            widget.index!,
                            (e) => e
                              ..dosagem =
                                  double.tryParse(_model.textController.text),
                          );
                          FFAppState().update(() {});
                        },
                      ),
                      autofocus: false,
                      obscureText: false,
                      decoration: InputDecoration(
                        hintText: 'Dose',
                        hintStyle:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  fontFamily: 'Mulish',
                                  color: const Color(0xFF8798B5),
                                  letterSpacing: 0.0,
                                ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0x0E294B0D),
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).primary,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).error,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).error,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        filled: true,
                        fillColor: const Color(0xFFF7FAFE),
                        contentPadding:
                            const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Mulish',
                            color: widget.horario?.dosagem == null
                                ? const Color(0xFF8798B5)
                                : FlutterFlowTheme.of(context).primaryText,
                            letterSpacing: 0.0,
                          ),
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      validator:
                          _model.textControllerValidator.asValidator(context),
                    ),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    height: 48.0,
                    child: Stack(
                      children: [
                        FlutterFlowDropDown<String>(
                          controller: _model.dropDownValueController ??=
                              FormFieldController<String>(
                            _model.dropDownValue ??= valueOrDefault<String>(
                              widget.horario?.medida,
                              'Med.',
                            ),
                          ),
                          options: const [
                            'g',
                            'mg',
                            'mcg',
                            'mL',
                            '%',
                            'UI',
                            'Gotas',
                            'Comprimidos',
                            'Puff nasal'
                          ],
                          onChanged: (val) async {
                            safeSetState(() => _model.dropDownValue = val);
                            FFAppState().updateHorariosAtIndex(
                              widget.index!,
                              (e) => e..medida = _model.dropDownValue,
                            );
                            FFAppState().update(() {});
                          },
                          width: 125.0,
                          height: 48.0,
                          textStyle: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Mulish',
                                color: widget.horario?.medida == null ||
                                        widget.horario?.medida == ''
                                    ? const Color(0xFF8798B5)
                                    : FlutterFlowTheme.of(context).primaryText,
                                letterSpacing: 0.0,
                              ),
                          icon: Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 24.0,
                          ),
                          fillColor: const Color(0xFFF7FAFE),
                          elevation: 2.0,
                          borderColor: const Color(0x0E294B0D),
                          borderWidth: 2.0,
                          borderRadius: 8.0,
                          margin: const EdgeInsetsDirectional.fromSTEB(
                              12.0, 0.0, 16.0, 0.0),
                          hidesUnderline: true,
                          isOverButton: true,
                          isSearchable: false,
                          isMultiSelect: false,
                        ),
                        if (widget.horario?.medida == null ||
                            widget.horario?.medida == '')
                          Align(
                            alignment: const AlignmentDirectional(-1.0, 0.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  8.0, 0.0, 0.0, 0.0),
                              child: Text(
                                'Med.',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Mulish',
                                      color: const Color(0xFF8798B5),
                                      fontSize: 14.0,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
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
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                child: CupertinoTheme(
                                  data: datePickedCupertinoTheme.copyWith(
                                    textTheme: datePickedCupertinoTheme
                                        .textTheme
                                        .copyWith(
                                      dateTimePickerTextStyle:
                                          FlutterFlowTheme.of(context)
                                              .headlineMedium
                                              .override(
                                                fontFamily: 'Mulish',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                letterSpacing: 0.0,
                                              ),
                                    ),
                                  ),
                                  child: CupertinoDatePicker(
                                    mode: CupertinoDatePickerMode.time,
                                    minimumDate: DateTime(1900),
                                    initialDateTime:
                                        (widget.horario?.horario ??
                                            DateTime.now()),
                                    maximumDate: DateTime(2050),
                                    backgroundColor:
                                        FlutterFlowTheme.of(context)
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
                        FFAppState().update(() {});
                        _model.time = _model.datePicked;
                        _model.updatePage(() {});
                        await actions.hideKeyboard();
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
                                locale:
                                    FFLocalizations.of(context).languageCode,
                              ),
                              '00:00',
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Mulish',
                                  color: widget.horario?.horario == null
                                      ? const Color(0xFF8798B5)
                                      : FlutterFlowTheme.of(context)
                                          .primaryText,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ].divide(const SizedBox(width: 12.0)),
            ),
          ),
        ].divide(const SizedBox(width: 24.0)),
      ),
    );
  }
}
