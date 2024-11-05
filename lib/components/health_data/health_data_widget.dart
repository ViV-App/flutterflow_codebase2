import '/auth/supabase_auth/auth_util.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/components/toast/toast_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'health_data_model.dart';
export 'health_data_model.dart';

class HealthDataWidget extends StatefulWidget {
  const HealthDataWidget({super.key});

  @override
  State<HealthDataWidget> createState() => _HealthDataWidgetState();
}

class _HealthDataWidgetState extends State<HealthDataWidget> {
  late HealthDataModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HealthDataModel());

    _model.nomeMedFocusNode ??= FocusNode();

    _model.crmFocusNode ??= FocusNode();

    _model.textController3 ??= TextEditingController(text: () {
      if ((FFAppState().paciente.altura != null) &&
          (FFAppState().paciente.altura != 0.0)) {
        return FFAppState().paciente.altura.toString();
      } else if ((FFAppState().paciente.altura == null) &&
          (FFAppState().paciente.altura == 0.0)) {
        return '';
      } else {
        return '';
      }
    }());
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController4 ??= TextEditingController(text: () {
      if ((FFAppState().paciente.peso != null) &&
          (FFAppState().paciente.peso != 0.0)) {
        return FFAppState().paciente.peso.toString();
      } else if ((FFAppState().paciente.peso == null) &&
          (FFAppState().paciente.peso == 0.0)) {
        return '';
      } else {
        return '';
      }
    }());
    _model.textFieldFocusNode2 ??= FocusNode();

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
      alignment: const AlignmentDirectional(0.0, 1.0),
      child: FutureBuilder<List<MedicoRow>>(
        future: MedicoTable().querySingleRow(
          queryFn: (q) => q.eq(
            'id',
            FFAppState().paciente.medico,
          ),
        ),
        builder: (context, snapshot) {
          // Customize what your widget looks like when it's loading.
          if (!snapshot.hasData) {
            return Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            );
          }
          List<MedicoRow> containerMedicoRowList = snapshot.data!;

          final containerMedicoRow = containerMedicoRowList.isNotEmpty
              ? containerMedicoRowList.first
              : null;

          return Material(
            color: Colors.transparent,
            elevation: 3.0,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(0.0),
                bottomRight: Radius.circular(0.0),
                topLeft: Radius.circular(24.0),
                topRight: Radius.circular(24.0),
              ),
            ),
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(0.0),
                  bottomRight: Radius.circular(0.0),
                  topLeft: Radius.circular(24.0),
                  topRight: Radius.circular(24.0),
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
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: const BoxDecoration(),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 12.0, 0.0, 0.0),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Align(
                                    alignment: const AlignmentDirectional(0.0, -1.0),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 20.0, 0.0, 0.0),
                                      child: Text(
                                        'Informações de saúde',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Mulish',
                                              fontSize: 24.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        24.0, 32.0, 24.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Medico prescritor',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Mulish',
                                                fontSize: 16.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                        Container(
                                          child: TextFormField(
                                            controller:
                                                _model.nomeMedTextController ??=
                                                    TextEditingController(
                                              text: () {
                                                if (containerMedicoRow?.nome !=
                                                        null &&
                                                    containerMedicoRow?.nome !=
                                                        '') {
                                                  return containerMedicoRow
                                                      ?.nome;
                                                } else if (containerMedicoRow
                                                            ?.nome ==
                                                        null ||
                                                    containerMedicoRow?.nome ==
                                                        '') {
                                                  return '';
                                                } else {
                                                  return '';
                                                }
                                              }(),
                                            ),
                                            focusNode: _model.nomeMedFocusNode,
                                            autofocus: false,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              hintText: 'Prescritor',
                                              hintStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Mulish',
                                                        color:
                                                            const Color(0xFF8798B5),
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                  color: Color(0x0E294B0D),
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              filled: true,
                                              fillColor: const Color(0xFFF7FAFE),
                                              contentPadding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 0.0, 0.0, 0.0),
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Mulish',
                                                  letterSpacing: 0.0,
                                                ),
                                            validator: _model
                                                .nomeMedTextControllerValidator
                                                .asValidator(context),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 8.0, 0.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                flex: 1,
                                                child: TextFormField(
                                                  controller: _model
                                                          .crmTextController ??=
                                                      TextEditingController(
                                                    text: () {
                                                      if (containerMedicoRow
                                                                  ?.crm !=
                                                              null &&
                                                          containerMedicoRow
                                                                  ?.crm !=
                                                              '') {
                                                        return containerMedicoRow
                                                            ?.crm;
                                                      } else if (containerMedicoRow
                                                                  ?.crm ==
                                                              null ||
                                                          containerMedicoRow
                                                                  ?.crm ==
                                                              '') {
                                                        return '';
                                                      } else {
                                                        return '';
                                                      }
                                                    }(),
                                                  ),
                                                  focusNode:
                                                      _model.crmFocusNode,
                                                  autofocus: false,
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    hintText: 'CRM',
                                                    hintStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Mulish',
                                                          color:
                                                              const Color(0xFF8798B5),
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: const BorderSide(
                                                        color:
                                                            Color(0x0E294B0D),
                                                        width: 2.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        width: 2.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    errorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        width: 2.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    focusedErrorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        width: 2.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    filled: true,
                                                    fillColor:
                                                        const Color(0xFFF7FAFE),
                                                    contentPadding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(12.0, 0.0,
                                                                0.0, 0.0),
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Mulish',
                                                        letterSpacing: 0.0,
                                                      ),
                                                  validator: _model
                                                      .crmTextControllerValidator
                                                      .asValidator(context),
                                                ),
                                              ),
                                              Expanded(
                                                child: SizedBox(
                                                  height: 48.0,
                                                  child: Stack(
                                                    children: [
                                                      FlutterFlowDropDown<
                                                          String>(
                                                        controller: _model
                                                                .ufValueController ??=
                                                            FormFieldController<
                                                                String>(
                                                          _model.ufValue ??=
                                                              () {
                                                            if (containerMedicoRow
                                                                        ?.uf !=
                                                                    null &&
                                                                containerMedicoRow
                                                                        ?.uf !=
                                                                    '') {
                                                              return containerMedicoRow
                                                                  ?.uf;
                                                            } else if (containerMedicoRow
                                                                        ?.uf ==
                                                                    null ||
                                                                containerMedicoRow
                                                                        ?.uf ==
                                                                    '') {
                                                              return '';
                                                            } else {
                                                              return '';
                                                            }
                                                          }(),
                                                        ),
                                                        options: functions
                                                            .brazilUfs(),
                                                        onChanged: (val) =>
                                                            safeSetState(() =>
                                                                _model.ufValue =
                                                                    val),
                                                        width: 300.0,
                                                        height: 48.0,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Mulish',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                        icon: Icon(
                                                          Icons
                                                              .keyboard_arrow_down_rounded,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          size: 24.0,
                                                        ),
                                                        fillColor:
                                                            const Color(0xFFF7FAFE),
                                                        elevation: 2.0,
                                                        borderColor:
                                                            const Color(0x0E294B0D),
                                                        borderWidth: 2.0,
                                                        borderRadius: 8.0,
                                                        margin:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    4.0,
                                                                    16.0,
                                                                    4.0),
                                                        hidesUnderline: true,
                                                        isOverButton: false,
                                                        isSearchable: false,
                                                        isMultiSelect: false,
                                                        labelText: 'aaa',
                                                        labelTextStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Mulish',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                      if (_model.ufValue ==
                                                              null ||
                                                          _model.ufValue == '')
                                                        Align(
                                                          alignment:
                                                              const AlignmentDirectional(
                                                                  -1.0, 0.0),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        12.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              'Estado UF',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Mulish',
                                                                    color: const Color(
                                                                        0xFF8798B5),
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ].divide(const SizedBox(width: 8.0)),
                                          ),
                                        ),
                                      ].divide(const SizedBox(height: 6.0)),
                                    ),
                                  ),
                                  if (responsiveVisibility(
                                    context: context,
                                    phone: false,
                                    tablet: false,
                                  ))
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          24.0, 24.0, 24.0, 0.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Data da prescrição',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Mulish',
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              final datePickedDate =
                                                  await showDatePicker(
                                                context: context,
                                                initialDate:
                                                    (_model.datePicked ??
                                                        DateTime.now()),
                                                firstDate: DateTime(1900),
                                                lastDate: DateTime(2050),
                                              );

                                              if (datePickedDate != null) {
                                                safeSetState(() {
                                                  _model.datePicked = DateTime(
                                                    datePickedDate.year,
                                                    datePickedDate.month,
                                                    datePickedDate.day,
                                                  );
                                                });
                                              }
                                            },
                                            child: Container(
                                              width: double.infinity,
                                              height: 48.0,
                                              decoration: BoxDecoration(
                                                color: const Color(0xFFF7FAFE),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                border: Border.all(
                                                  color: const Color(0x13294B0D),
                                                  width: 2.0,
                                                ),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        12.0, 0.0, 12.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      _model.datePicked != null
                                                          ? dateTimeFormat(
                                                              "d/M/y",
                                                              _model.datePicked,
                                                              locale: FFLocalizations
                                                                      .of(context)
                                                                  .languageCode,
                                                            )
                                                          : 'Selecione uma data',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Mulish',
                                                            color: _model
                                                                        .datePicked ==
                                                                    null
                                                                ? const Color(
                                                                    0xFF8798B5)
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                    const Icon(
                                                      Icons
                                                          .calendar_today_outlined,
                                                      color: Color(0xFF8798B5),
                                                      size: 18.0,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ].divide(const SizedBox(height: 6.0)),
                                      ),
                                    ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        24.0, 24.0, 24.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Altura',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Mulish',
                                                fontSize: 16.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                        TextFormField(
                                          controller: _model.textController3,
                                          focusNode: _model.textFieldFocusNode1,
                                          autofocus: false,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            hintText: 'Altura',
                                            hintStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Mulish',
                                                      color: const Color(0xFF8798B5),
                                                      fontSize: 16.0,
                                                      letterSpacing: 0.0,
                                                    ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                color: Color(0x0E294B0D),
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            filled: true,
                                            fillColor: const Color(0xFFF7FAFE),
                                            contentPadding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 0.0, 0.0, 0.0),
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Mulish',
                                                letterSpacing: 0.0,
                                              ),
                                          keyboardType: const TextInputType
                                              .numberWithOptions(decimal: true),
                                          validator: _model
                                              .textController3Validator
                                              .asValidator(context),
                                          inputFormatters: [
                                            _model.textFieldMask1
                                          ],
                                        ),
                                      ].divide(const SizedBox(height: 6.0)),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        24.0, 24.0, 24.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Peso',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Mulish',
                                                fontSize: 16.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                        TextFormField(
                                          controller: _model.textController4,
                                          focusNode: _model.textFieldFocusNode2,
                                          autofocus: false,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            hintText: '00kg',
                                            hintStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Mulish',
                                                      color: const Color(0xFF8798B5),
                                                      fontSize: 16.0,
                                                      letterSpacing: 0.0,
                                                    ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                color: Color(0x0E294B0D),
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            filled: true,
                                            fillColor: const Color(0xFFF7FAFE),
                                            contentPadding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 0.0, 0.0, 0.0),
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Mulish',
                                                letterSpacing: 0.0,
                                              ),
                                          validator: _model
                                              .textController4Validator
                                              .asValidator(context),
                                          inputFormatters: [
                                            _model.textFieldMask2
                                          ],
                                        ),
                                      ].divide(const SizedBox(height: 6.0)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Builder(
                            builder: (context) => Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  24.0, 32.0, 24.0, 24.0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  _model.cUSer =
                                      await PacienteTable().queryRows(
                                    queryFn: (q) => q.eq(
                                      'uuid',
                                      currentUserUid,
                                    ),
                                  );
                                  if (_model.cUSer?.first.medicoPrescritor ==
                                      null) {
                                    _model.cMed = await MedicoTable().insert({
                                      'nome': _model.nomeMedTextController.text,
                                      'crm': _model.crmTextController.text,
                                      'uf': _model.ufValue,
                                    });
                                    await PacienteTable().update(
                                      data: {
                                        'altura': double.tryParse(
                                            _model.textController3.text),
                                        'medico_prescritor': _model.cMed?.id,
                                        'peso': double.tryParse(
                                            _model.textController4.text),
                                      },
                                      matchingRows: (rows) => rows.eq(
                                        'uuid',
                                        currentUserUid,
                                      ),
                                    );
                                    FFAppState().updatePacienteStruct(
                                      (e) => e
                                        ..peso = double.tryParse(
                                            _model.textController4.text)
                                        ..altura = double.tryParse(
                                            _model.textController3.text)
                                        ..medico = _model.cMed?.id,
                                    );
                                    safeSetState(() {});
                                    Navigator.pop(context);
                                    await showDialog(
                                      barrierColor: Colors.transparent,
                                      barrierDismissible: false,
                                      context: context,
                                      builder: (dialogContext) {
                                        return Dialog(
                                          elevation: 0,
                                          insetPadding: EdgeInsets.zero,
                                          backgroundColor: Colors.transparent,
                                          alignment: const AlignmentDirectional(
                                                  0.0, -1.0)
                                              .resolve(
                                                  Directionality.of(context)),
                                          child: const WebViewAware(
                                            child: SizedBox(
                                              width: double.infinity,
                                              child: ToastWidget(
                                                type: ToastTypes.puprle,
                                                title: 'Editado com sucesso',
                                                message:
                                                    'As informações do seu perfil foram atualizadas.',
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  } else {
                                    await MedicoTable().update(
                                      data: {
                                        'nome':
                                            _model.nomeMedTextController.text,
                                        'crm': _model.crmTextController.text,
                                        'uf': _model.ufValue,
                                      },
                                      matchingRows: (rows) => rows.eq(
                                        'id',
                                        _model.cUSer?.first.medicoPrescritor,
                                      ),
                                    );
                                    await PacienteTable().update(
                                      data: {
                                        'altura': double.tryParse(
                                            _model.textController3.text),
                                        'peso': double.tryParse(
                                            _model.textController4.text),
                                      },
                                      matchingRows: (rows) => rows.eq(
                                        'uuid',
                                        currentUserUid,
                                      ),
                                    );
                                    FFAppState().updatePacienteStruct(
                                      (e) => e
                                        ..peso = double.tryParse(
                                            _model.textController4.text)
                                        ..altura = double.tryParse(
                                            _model.textController3.text)
                                        ..medico = containerMedicoRow?.id,
                                    );
                                    safeSetState(() {});
                                    Navigator.pop(context);
                                    await showDialog(
                                      barrierColor: Colors.transparent,
                                      barrierDismissible: false,
                                      context: context,
                                      builder: (dialogContext) {
                                        return Dialog(
                                          elevation: 0,
                                          insetPadding: EdgeInsets.zero,
                                          backgroundColor: Colors.transparent,
                                          alignment: const AlignmentDirectional(
                                                  0.0, -1.0)
                                              .resolve(
                                                  Directionality.of(context)),
                                          child: const WebViewAware(
                                            child: SizedBox(
                                              width: double.infinity,
                                              child: ToastWidget(
                                                type: ToastTypes.puprle,
                                                title: 'Editado com sucesso',
                                                message:
                                                    'As informações do seu perfil foram atualizadas.',
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  }

                                  safeSetState(() {});
                                },
                                text: 'Salvar',
                                options: FFButtonOptions(
                                  width: double.infinity,
                                  height: 48.0,
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 24.0, 0.0),
                                  iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context).primary,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Mulish',
                                        color: Colors.white,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                  elevation: 3.0,
                                  borderSide: const BorderSide(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
