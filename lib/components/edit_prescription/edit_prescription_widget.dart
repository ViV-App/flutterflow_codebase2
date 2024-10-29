import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components/custom_date_picker_widget.dart';
import '/components/delete_prescription/delete_prescription_widget.dart';
import '/components/duracao_dias/duracao_dias_widget.dart';
import '/components/horario_prescricao/horario_prescricao_widget.dart';
import '/components/prescription_edited/prescription_edited_widget.dart';
import '/components/remedio_card/remedio_card_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'edit_prescription_model.dart';
export 'edit_prescription_model.dart';

class EditPrescriptionWidget extends StatefulWidget {
  const EditPrescriptionWidget({
    super.key,
    this.prescricao,
    this.medicamento,
  });

  final PrescricaoRow? prescricao;
  final MeusMedicamentosRow? medicamento;

  @override
  State<EditPrescriptionWidget> createState() => _EditPrescriptionWidgetState();
}

class _EditPrescriptionWidgetState extends State<EditPrescriptionWidget> {
  late EditPrescriptionModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditPrescriptionModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().prescricao = PrescricaoStruct(
        remedio: widget!.prescricao?.medicamento,
        duracaoDias: widget!.prescricao?.duracaoDias,
      );
      safeSetState(() {});
      while (
          widget!.prescricao!.horarios.length > FFAppState().horarios.length) {
        FFAppState().addToHorarios(HorariosStruct(
          dosagem: getJsonField(
            widget!.prescricao?.doses?[_model.nvar],
            r'''$.dosagem''',
          ),
          medida: getJsonField(
            widget!.prescricao?.doses?[_model.nvar],
            r'''$.medida''',
          ).toString().toString(),
          horario: widget!.prescricao?.horarios?[_model.nvar],
        ));
        safeSetState(() {});
        _model.nvar = _model.nvar + 1;
        safeSetState(() {});
      }
      _model.dats = widget!.prescricao!.doses.toList().cast<dynamic>();
      safeSetState(() {});
      _model.apiResultnh7 = await SegmentGroup.trackingCall.call(
        userId: currentUserUid,
        eventName: 'medicine-detail screen viewed',
      );
    });

    _model.textController1 ??=
        TextEditingController(text: widget!.prescricao?.posologia?.toString());
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController2 ??= TextEditingController(
        text: widget!.prescricao?.concentracao?.toString());
    _model.textFieldFocusNode2 ??= FocusNode();

    _model.switchValue = widget!.prescricao!.continuo!;
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
      alignment: AlignmentDirectional(0.0, 1.0),
      child: Material(
        color: Colors.transparent,
        elevation: 3.0,
        shape: RoundedRectangleBorder(
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
            borderRadius: BorderRadius.only(
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
                alignment: AlignmentDirectional(0.0, -1.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                  child: Container(
                    width: 100.0,
                    height: 4.0,
                    decoration: BoxDecoration(
                      color: Color(0xFFDBE4F1),
                      borderRadius: BorderRadius.circular(32.0),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 12.0, 0.0, 0.0),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0.0, -1.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 20.0, 0.0, 0.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        await PrescricaoTable().delete(
                                          matchingRows: (rows) => rows.eq(
                                            'id',
                                            widget!.prescricao?.id,
                                          ),
                                        );
                                      },
                                      child: Text(
                                        'Visualizar Prescrição',
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
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      18.0, 32.0, 18.0, 0.0),
                                  child:
                                      FutureBuilder<List<MeusMedicamentosRow>>(
                                    future:
                                        MeusMedicamentosTable().querySingleRow(
                                      queryFn: (q) => q.eq(
                                        'id',
                                        widget!.prescricao?.medicamento,
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
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                      List<MeusMedicamentosRow>
                                          remedioCardMeusMedicamentosRowList =
                                          snapshot.data!;

                                      final remedioCardMeusMedicamentosRow =
                                          remedioCardMeusMedicamentosRowList
                                                  .isNotEmpty
                                              ? remedioCardMeusMedicamentosRowList
                                                  .first
                                              : null;

                                      return wrapWithModel(
                                        model: _model.remedioCardModel,
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        child: RemedioCardWidget(
                                          medicamentoFiltered:
                                              remedioCardMeusMedicamentosRow,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                if (responsiveVisibility(
                                  context: context,
                                  phone: false,
                                  tablet: false,
                                  tabletLandscape: false,
                                  desktop: false,
                                ))
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        18.0, 24.0, 18.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Dose diária total',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Mulish',
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                            ),
                                            Icon(
                                              Icons.info_outlined,
                                              color: Color(0xFF8798B5),
                                              size: 18.0,
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Flexible(
                                              child: TextFormField(
                                                controller:
                                                    _model.textController1,
                                                focusNode:
                                                    _model.textFieldFocusNode1,
                                                onChanged: (_) =>
                                                    EasyDebounce.debounce(
                                                  '_model.textController1',
                                                  Duration(milliseconds: 0),
                                                  () => safeSetState(() {}),
                                                ),
                                                autofocus: false,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  hintText: 'Quantidade',
                                                  hintStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Mulish',
                                                        color:
                                                            Color(0xFF8798B5),
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0x0E294B0D),
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
                                                  fillColor: Color(0xFFF7FAFE),
                                                  contentPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(12.0, 0.0,
                                                              0.0, 0.0),
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Mulish',
                                                          letterSpacing: 0.0,
                                                        ),
                                                keyboardType:
                                                    TextInputType.number,
                                                validator: _model
                                                    .textController1Validator
                                                    .asValidator(context),
                                              ),
                                            ),
                                            FlutterFlowDropDown<String>(
                                              controller: _model
                                                      .dropDownValueController ??=
                                                  FormFieldController<String>(
                                                _model.dropDownValue ??= widget!
                                                    .prescricao?.formaDose,
                                              ),
                                              options: [
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
                                                safeSetState(() =>
                                                    _model.dropDownValue = val);
                                                FFAppState()
                                                    .updatePrescricaoStruct(
                                                  (e) => e
                                                    ..categoria =
                                                        _model.dropDownValue,
                                                );
                                                safeSetState(() {});
                                              },
                                              width: 125.0,
                                              height: 48.0,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Mulish',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        letterSpacing: 0.0,
                                                      ),
                                              hintText: 'vol',
                                              icon: Icon(
                                                Icons
                                                    .keyboard_arrow_down_rounded,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                size: 24.0,
                                              ),
                                              fillColor: Color(0xFFF7FAFE),
                                              elevation: 2.0,
                                              borderColor: Color(0x0E294B0D),
                                              borderWidth: 2.0,
                                              borderRadius: 8.0,
                                              margin: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 16.0, 0.0),
                                              hidesUnderline: true,
                                              isOverButton: true,
                                              isSearchable: false,
                                              isMultiSelect: false,
                                            ),
                                          ].divide(SizedBox(width: 14.0)),
                                        ),
                                      ].divide(SizedBox(height: 6.0)),
                                    ),
                                  ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      18.0, 24.0, 18.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Concentração',
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
                                        controller: _model.textController2,
                                        focusNode: _model.textFieldFocusNode2,
                                        onChanged: (_) => EasyDebounce.debounce(
                                          '_model.textController2',
                                          Duration(milliseconds: 0),
                                          () async {
                                            _model.alterado = true;
                                            safeSetState(() {});
                                          },
                                        ),
                                        autofocus: false,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          hintText: 'Concentração',
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Mulish',
                                                    color: Color(0xFF8798B5),
                                                    fontSize: 16.0,
                                                    letterSpacing: 0.0,
                                                  ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
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
                                          fillColor: Color(0xFFF7FAFE),
                                          contentPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12.0, 0.0, 0.0, 0.0),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Mulish',
                                              letterSpacing: 0.0,
                                            ),
                                        keyboardType: TextInputType.number,
                                        validator: _model
                                            .textController2Validator
                                            .asValidator(context),
                                      ),
                                    ].divide(SizedBox(height: 6.0)),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      18.0, 24.0, 18.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(0.0, -1.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Data de início',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Mulish',
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                              ),
                                              InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  await showModalBottomSheet(
                                                    isScrollControlled: true,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    context: context,
                                                    builder: (context) {
                                                      return WebViewAware(
                                                        child: Padding(
                                                          padding: MediaQuery
                                                              .viewInsetsOf(
                                                                  context),
                                                          child: Container(
                                                            height: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .height *
                                                                0.4,
                                                            child:
                                                                CustomDatePickerWidget(
                                                              callback:
                                                                  (dateSet) async {
                                                                _model.newDate =
                                                                    dateSet;
                                                                safeSetState(
                                                                    () {});
                                                              },
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ).then((value) =>
                                                      safeSetState(() {}));
                                                },
                                                child: Container(
                                                  width: double.infinity,
                                                  height: 48.0,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFFF7FAFE),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    border: Border.all(
                                                      color: Color(0x13294B0D),
                                                      width: 2.0,
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(12.0, 0.0,
                                                                12.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          _model.newDate != null
                                                              ? dateTimeFormat(
                                                                  "d/M/y",
                                                                  _model
                                                                      .newDate,
                                                                  locale: FFLocalizations.of(
                                                                          context)
                                                                      .languageCode,
                                                                )
                                                              : dateTimeFormat(
                                                                  "d/M/y",
                                                                  widget!
                                                                      .prescricao!
                                                                      .dateStart!,
                                                                  locale: FFLocalizations.of(
                                                                          context)
                                                                      .languageCode,
                                                                ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Mulish',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                        Icon(
                                                          Icons
                                                              .calendar_today_outlined,
                                                          color:
                                                              Color(0xFF8798B5),
                                                          size: 18.0,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ].divide(SizedBox(height: 6.0)),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            if (_model.switchValue == false)
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Duração',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Mulish',
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                  ),
                                                  InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      await showModalBottomSheet(
                                                        isScrollControlled:
                                                            true,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        context: context,
                                                        builder: (context) {
                                                          return WebViewAware(
                                                            child: Padding(
                                                              padding: MediaQuery
                                                                  .viewInsetsOf(
                                                                      context),
                                                              child: Container(
                                                                height: MediaQuery.sizeOf(
                                                                            context)
                                                                        .height *
                                                                    0.5,
                                                                child:
                                                                    DuracaoDiasWidget(),
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      ).then((value) =>
                                                          safeSetState(() {}));
                                                    },
                                                    child: Container(
                                                      width: double.infinity,
                                                      height: 48.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xFFF7FAFE),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        border: Border.all(
                                                          color:
                                                              Color(0x13294B0D),
                                                          width: 2.0,
                                                        ),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    12.0,
                                                                    0.0,
                                                                    12.0,
                                                                    0.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Text(
                                                                valueOrDefault<
                                                                    String>(
                                                                  FFAppState()
                                                                      .prescricao
                                                                      .duracaoDias
                                                                      .toString(),
                                                                  '0',
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Mulish',
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              ),
                                                            ),
                                                            Text(
                                                              'dias',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Mulish',
                                                                    color: Color(
                                                                        0xFF8798B5),
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ].divide(SizedBox(height: 6.0)),
                                              ),
                                            Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Switch.adaptive(
                                                  value: _model.switchValue!,
                                                  onChanged: (newValue) async {
                                                    safeSetState(() =>
                                                        _model.switchValue =
                                                            newValue!);
                                                  },
                                                  activeColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                  activeTrackColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                  inactiveTrackColor:
                                                      Color(0xFFDBE4F1),
                                                  inactiveThumbColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primaryBackground,
                                                ),
                                                Text(
                                                  'Uso contínuo',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Mulish',
                                                        color:
                                                            Color(0xFF262B37),
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ].divide(SizedBox(width: 8.0)),
                                            ),
                                          ].divide(SizedBox(height: 6.0)),
                                        ),
                                      ),
                                    ].divide(SizedBox(width: 14.0)),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      18.0, 24.0, 18.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Frequência',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Mulish',
                                              fontSize: 16.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              child: Container(
                                                width: 250.0,
                                                height: 48.0,
                                                decoration: BoxDecoration(
                                                  color: Color(0xFFF7FAFE),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  border: Border.all(
                                                    color: Color(0x13294B0D),
                                                    width: 2.0,
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 0.0, 0.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          FaIcon(
                                                            FontAwesomeIcons
                                                                .clock,
                                                            color: Color(
                                                                0xFF8798B5),
                                                            size: 18.0,
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        12.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              FFAppState()
                                                                  .horarios
                                                                  .length
                                                                  .toString(),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Mulish',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                  ),
                                                            ),
                                                          ),
                                                          Text(
                                                            'x ao dia',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Mulish',
                                                                  color: Color(
                                                                      0xFF8798B5),
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                        ].divide(SizedBox(
                                                            width: 6.0)),
                                                      ),
                                                      Container(
                                                        width: 50.0,
                                                        height: 48.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          borderRadius:
                                                              BorderRadius.only(
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    0.0),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    6.0),
                                                            topLeft:
                                                                Radius.circular(
                                                                    0.0),
                                                            topRight:
                                                                Radius.circular(
                                                                    6.0),
                                                          ),
                                                        ),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceEvenly,
                                                          children: [
                                                            Expanded(
                                                              child: Container(
                                                                width: double
                                                                    .infinity,
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child: InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    if (FFAppState()
                                                                            .horarios
                                                                            .length <
                                                                        3) {
                                                                      FFAppState()
                                                                          .addToHorarios(
                                                                              HorariosStruct());
                                                                      safeSetState(
                                                                          () {});
                                                                      _model.alterado =
                                                                          true;
                                                                      safeSetState(
                                                                          () {});
                                                                    }
                                                                  },
                                                                  child: Icon(
                                                                    Icons
                                                                        .arrow_drop_up,
                                                                    color: FFAppState().horarios.length <
                                                                            3
                                                                        ? Colors
                                                                            .white
                                                                        : Color(
                                                                            0x4DFFFFFF),
                                                                    size: 18.0,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child: Container(
                                                                width: double
                                                                    .infinity,
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child: InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    if (FFAppState()
                                                                            .horarios
                                                                            .length >
                                                                        1) {
                                                                      FFAppState().removeFromHorarios(FFAppState()
                                                                          .horarios
                                                                          .last);
                                                                      safeSetState(
                                                                          () {});
                                                                      _model.alterado =
                                                                          true;
                                                                      safeSetState(
                                                                          () {});
                                                                    }
                                                                  },
                                                                  child: Icon(
                                                                    Icons
                                                                        .arrow_drop_down,
                                                                    color: FFAppState().horarios.length >
                                                                            1
                                                                        ? Colors
                                                                            .white
                                                                        : Color(
                                                                            0x4DFFFFFF),
                                                                    size: 18.0,
                                                                  ),
                                                                ),
                                                              ),
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
                                        ].divide(SizedBox(width: 12.0)),
                                      ),
                                    ].divide(SizedBox(height: 6.0)),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24.0, 32.0, 0.0, 0.0),
                                  child: Text(
                                    'Agenda de lembretes',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Mulish',
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24.0, 12.0, 24.0, 0.0),
                                  child: Builder(
                                    builder: (context) {
                                      final times2 =
                                          FFAppState().horarios.toList();

                                      return Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: List.generate(times2.length,
                                            (times2Index) {
                                          final times2Item =
                                              times2[times2Index];
                                          return HorarioPrescricaoWidget(
                                            key: Key(
                                                'Key2j2_${times2Index}_of_${times2.length}'),
                                            horario: times2Item,
                                            index: times2Index,
                                          );
                                        }).divide(SizedBox(height: 18.0)),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            18.0, 12.0, 18.0, 24.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Builder(
                                builder: (context) => FFButtonWidget(
                                  onPressed: () async {
                                    await showDialog(
                                      context: context,
                                      builder: (dialogContext) {
                                        return Dialog(
                                          elevation: 0,
                                          insetPadding: EdgeInsets.zero,
                                          backgroundColor: Colors.transparent,
                                          alignment: AlignmentDirectional(
                                                  0.0, 0.0)
                                              .resolve(
                                                  Directionality.of(context)),
                                          child: WebViewAware(
                                            child: DeletePrescriptionWidget(
                                              prescricao: widget!.prescricao,
                                            ),
                                          ),
                                        );
                                      },
                                    );

                                    _model.apiResult23o =
                                        await SegmentGroup.trackingCall.call(
                                      userId: currentUserUid,
                                      eventName: 'medicine delete started',
                                    );

                                    safeSetState(() {});
                                  },
                                  text: 'Deletar',
                                  options: FFButtonOptions(
                                    height: 48.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        24.0, 0.0, 24.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: Colors.white,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Mulish',
                                          color: Color(0xFFE25D5D),
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                    elevation: 3.0,
                                    borderSide: BorderSide(
                                      color: Color(0xFFE25D5D),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Builder(
                                builder: (context) => FFButtonWidget(
                                  onPressed: () async {
                                    if (_model.switchValue == true) {
                                      await PrescricaoTable().update(
                                        data: {
                                          'horarios':
                                              supaSerializeList<DateTime>(
                                                  FFAppState()
                                                      .horarios
                                                      .map((e) => e.horario)
                                                      .withoutNulls
                                                      .toList()),
                                          'duracao_dias': FFAppState()
                                              .prescricao
                                              .duracaoDias,
                                          'date_start': supaSerialize<DateTime>(
                                              _model.newDate == null
                                                  ? widget!
                                                      .prescricao?.dateStart
                                                  : _model.newDate),
                                          'concentracao': int.tryParse(
                                              _model.textController2.text),
                                          'continuo': true,
                                          'doses': functions
                                              .convertHorarioToJson(FFAppState()
                                                  .horarios
                                                  .toList()),
                                        },
                                        matchingRows: (rows) => rows.eq(
                                          'id',
                                          widget!.prescricao?.id,
                                        ),
                                      );
                                      Navigator.pop(context);
                                      FFAppState().prescricao =
                                          PrescricaoStruct();
                                      FFAppState().horarios = [];
                                      safeSetState(() {});
                                      await showDialog(
                                        context: context,
                                        builder: (dialogContext) {
                                          return Dialog(
                                            elevation: 0,
                                            insetPadding: EdgeInsets.zero,
                                            backgroundColor: Colors.transparent,
                                            alignment: AlignmentDirectional(
                                                    0.0, 0.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                            child: WebViewAware(
                                              child: PrescriptionEditedWidget(),
                                            ),
                                          );
                                        },
                                      );
                                    } else {
                                      await PrescricaoTable().update(
                                        data: {
                                          'horarios':
                                              supaSerializeList<DateTime>(
                                                  FFAppState()
                                                      .horarios
                                                      .map((e) => e.horario)
                                                      .withoutNulls
                                                      .toList()),
                                          'duracao_dias': FFAppState()
                                              .prescricao
                                              .duracaoDias,
                                          'date_start': supaSerialize<DateTime>(
                                              _model.newDate == null
                                                  ? widget!
                                                      .prescricao?.dateStart
                                                  : _model.newDate),
                                          'concentracao': int.tryParse(
                                              _model.textController2.text),
                                          'continuo': false,
                                          'date_end': supaSerialize<DateTime>(
                                              _model.newDate == null
                                                  ? functions.getFinalDate(
                                                      widget!.prescricao!
                                                          .dateStart!,
                                                      FFAppState()
                                                              .prescricao
                                                              .duracaoDias -
                                                          1)
                                                  : functions.getFinalDate(
                                                      _model.newDate!,
                                                      FFAppState()
                                                              .prescricao
                                                              .duracaoDias -
                                                          1)),
                                          'doses': functions
                                              .convertHorarioToJson(FFAppState()
                                                  .horarios
                                                  .toList()),
                                        },
                                        matchingRows: (rows) => rows.eq(
                                          'id',
                                          widget!.prescricao?.id,
                                        ),
                                      );
                                      Navigator.pop(context);
                                      FFAppState().prescricao =
                                          PrescricaoStruct();
                                      FFAppState().horarios = [];
                                      safeSetState(() {});
                                      await showDialog(
                                        context: context,
                                        builder: (dialogContext) {
                                          return Dialog(
                                            elevation: 0,
                                            insetPadding: EdgeInsets.zero,
                                            backgroundColor: Colors.transparent,
                                            alignment: AlignmentDirectional(
                                                    0.0, 0.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                            child: WebViewAware(
                                              child: PrescriptionEditedWidget(),
                                            ),
                                          );
                                        },
                                      );
                                    }

                                    _model.apiResult5h9 =
                                        await SegmentGroup.trackingCall.call(
                                      userId: currentUserUid,
                                      eventName: 'medicine edited',
                                    );

                                    safeSetState(() {});
                                  },
                                  text: 'Salvar',
                                  options: FFButtonOptions(
                                    height: 48.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        24.0, 0.0, 24.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
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
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ),
                            ),
                          ].divide(SizedBox(width: 12.0)),
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
    );
  }
}
