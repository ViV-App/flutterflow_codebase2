import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components/duracao_dias/duracao_dias_widget.dart';
import '/components/horario_prescricao/horario_prescricao_widget.dart';
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
        remedio: widget.prescricao?.medicamento,
        duracaoDias: widget.prescricao?.duracaoDias,
      );
      setState(() {});
      while (widget.prescricao!.horarios.length > _model.timeslots.length) {
        _model.addToTimeslots(HorariosStruct(
          horario: widget.prescricao?.horarios[_model.nvar],
        ));
        setState(() {});
        _model.nvar = _model.nvar + 1;
        setState(() {});
      }
      FFAppState().horarios = _model.timeslots.toList().cast<HorariosStruct>();
      setState(() {});
    });

    _model.textController1 ??=
        TextEditingController(text: widget.prescricao?.posologia?.toString());
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController2 ??= TextEditingController(
        text: widget.prescricao?.concentracao?.toString());
    _model.textFieldFocusNode2 ??= FocusNode();

    _model.switchValue = widget.prescricao!.continuo!;
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
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
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(0.0, 92.0, 0.0, 0.0),
        child: Material(
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
                        Expanded(
                          child: Padding(
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
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          await PrescricaoTable().delete(
                                            matchingRows: (rows) => rows.eq(
                                              'id',
                                              widget.prescricao?.id,
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
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        18.0, 32.0, 18.0, 0.0),
                                    child: FutureBuilder<
                                        List<MeusMedicamentosRow>>(
                                      future: MeusMedicamentosTable()
                                          .querySingleRow(
                                        queryFn: (q) => q.eq(
                                          'id',
                                          widget.prescricao?.medicamento,
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
                                                    AlwaysStoppedAnimation<
                                                        Color>(
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
                                          updateCallback: () => setState(() {}),
                                          child: RemedioCardWidget(
                                            medicamentoFiltered:
                                                remedioCardMeusMedicamentosRow,
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
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
                                            const Icon(
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
                                                  const Duration(milliseconds: 0),
                                                  () => setState(() {}),
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
                                                            const Color(0xFF8798B5),
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: const BorderSide(
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
                                                  fillColor: const Color(0xFFF7FAFE),
                                                  contentPadding:
                                                      const EdgeInsetsDirectional
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
                                                _model.dropDownValue ??= widget
                                                    .prescricao?.formaDose,
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
                                                setState(() =>
                                                    _model.dropDownValue = val);
                                                FFAppState()
                                                    .updatePrescricaoStruct(
                                                  (e) => e
                                                    ..categoria =
                                                        _model.dropDownValue,
                                                );
                                                setState(() {});
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
                                              fillColor: const Color(0xFFF7FAFE),
                                              elevation: 2.0,
                                              borderColor: const Color(0x0E294B0D),
                                              borderWidth: 2.0,
                                              borderRadius: 8.0,
                                              margin: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 16.0, 0.0),
                                              hidesUnderline: true,
                                              isOverButton: true,
                                              isSearchable: false,
                                              isMultiSelect: false,
                                            ),
                                          ].divide(const SizedBox(width: 14.0)),
                                        ),
                                      ].divide(const SizedBox(height: 6.0)),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
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
                                          onChanged: (_) =>
                                              EasyDebounce.debounce(
                                            '_model.textController2',
                                            const Duration(milliseconds: 0),
                                            () => setState(() {}),
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
                                          keyboardType: TextInputType.number,
                                          validator: _model
                                              .textController2Validator
                                              .asValidator(context),
                                        ),
                                      ].divide(const SizedBox(height: 6.0)),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
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
                                                const AlignmentDirectional(0.0, -1.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Data de início',
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
                                                    final datePickedDate =
                                                        await showDatePicker(
                                                      context: context,
                                                      initialDate:
                                                          (_model.datePicked ??
                                                              DateTime.now()),
                                                      firstDate: DateTime(1900),
                                                      lastDate: DateTime(2050),
                                                    );

                                                    if (datePickedDate !=
                                                        null) {
                                                      safeSetState(() {
                                                        _model.datePicked =
                                                            DateTime(
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
                                                          BorderRadius.circular(
                                                              8.0),
                                                      border: Border.all(
                                                        color:
                                                            const Color(0x13294B0D),
                                                        width: 2.0,
                                                      ),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
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
                                                          Text(
                                                            _model.datePicked !=
                                                                    null
                                                                ? dateTimeFormat(
                                                                    'd/M/y',
                                                                    _model
                                                                        .datePicked,
                                                                    locale: FFLocalizations.of(
                                                                            context)
                                                                        .languageCode,
                                                                  )
                                                                : dateTimeFormat(
                                                                    'd/M/y',
                                                                    widget
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
                                                          const Icon(
                                                            Icons
                                                                .calendar_today_outlined,
                                                            color: Color(
                                                                0xFF8798B5),
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
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Duração',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Mulish',
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
                                                              Colors
                                                                  .transparent,
                                                          context: context,
                                                          builder: (context) {
                                                            return WebViewAware(
                                                              child: Padding(
                                                                padding: MediaQuery
                                                                    .viewInsetsOf(
                                                                        context),
                                                                child:
                                                                    const DuracaoDiasWidget(),
                                                              ),
                                                            );
                                                          },
                                                        ).then((value) =>
                                                            safeSetState(
                                                                () {}));
                                                      },
                                                      child: Container(
                                                        width: double.infinity,
                                                        height: 48.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              const Color(0xFFF7FAFE),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          border: Border.all(
                                                            color: const Color(
                                                                0x13294B0D),
                                                            width: 2.0,
                                                          ),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      12.0,
                                                                      0.0,
                                                                      12.0,
                                                                      0.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
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
                                                                style: FlutterFlowTheme.of(
                                                                        context)
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
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ].divide(
                                                      const SizedBox(height: 6.0)),
                                                ),
                                              Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Switch.adaptive(
                                                    value: _model.switchValue!,
                                                    onChanged:
                                                        (newValue) async {
                                                      setState(() =>
                                                          _model.switchValue =
                                                              newValue);
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
                                                        const Color(0xFFDBE4F1),
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
                                                              const Color(0xFF262B37),
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ].divide(const SizedBox(width: 8.0)),
                                              ),
                                            ].divide(const SizedBox(height: 6.0)),
                                          ),
                                        ),
                                      ].divide(const SizedBox(width: 14.0)),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
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
                                                    color: const Color(0xFFF7FAFE),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    border: Border.all(
                                                      color: const Color(0x13294B0D),
                                                      width: 2.0,
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(12.0, 0.0,
                                                                0.0, 0.0),
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
                                                            const FaIcon(
                                                              FontAwesomeIcons
                                                                  .clock,
                                                              color: Color(
                                                                  0xFF8798B5),
                                                              size: 18.0,
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
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
                                                                style: FlutterFlowTheme.of(
                                                                        context)
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
                                                                    color: const Color(
                                                                        0xFF8798B5),
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                          ].divide(const SizedBox(
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
                                                                const BorderRadius
                                                                    .only(
                                                              bottomLeft: Radius
                                                                  .circular(
                                                                      0.0),
                                                              bottomRight:
                                                                  Radius
                                                                      .circular(
                                                                          6.0),
                                                              topLeft: Radius
                                                                  .circular(
                                                                      0.0),
                                                              topRight: Radius
                                                                  .circular(
                                                                      6.0),
                                                            ),
                                                          ),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceEvenly,
                                                            children: [
                                                              Expanded(
                                                                child:
                                                                    Container(
                                                                  width: double
                                                                      .infinity,
                                                                  decoration:
                                                                      const BoxDecoration(),
                                                                  child:
                                                                      InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
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
                                                                            .addToHorarios(HorariosStruct());
                                                                        setState(
                                                                            () {});
                                                                      }
                                                                    },
                                                                    child: Icon(
                                                                      Icons
                                                                          .arrow_drop_up,
                                                                      color: FFAppState().horarios.length < 3
                                                                          ? Colors
                                                                              .white
                                                                          : const Color(
                                                                              0x4DFFFFFF),
                                                                      size:
                                                                          18.0,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Expanded(
                                                                child:
                                                                    Container(
                                                                  width: double
                                                                      .infinity,
                                                                  decoration:
                                                                      const BoxDecoration(),
                                                                  child:
                                                                      InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
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
                                                                        setState(
                                                                            () {});
                                                                      }
                                                                    },
                                                                    child: Icon(
                                                                      Icons
                                                                          .arrow_drop_down,
                                                                      color: FFAppState().horarios.length > 1
                                                                          ? Colors
                                                                              .white
                                                                          : const Color(
                                                                              0x4DFFFFFF),
                                                                      size:
                                                                          18.0,
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
                                          ].divide(const SizedBox(width: 12.0)),
                                        ),
                                      ].divide(const SizedBox(height: 6.0)),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
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
                                    padding: const EdgeInsetsDirectional.fromSTEB(
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
                                          }).divide(const SizedBox(height: 18.0)),
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
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              18.0, 12.0, 18.0, 24.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    var confirmDialogResponse =
                                        await showDialog<bool>(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return WebViewAware(
                                                  child: AlertDialog(
                                                    title: const Text('Cuidado!'),
                                                    content: const Text(
                                                        'Ao confirmar essa ação, voce concorda que sua prescrição e todos os registros relacionados a ela sejam removidos. Prossiga apenas se tiver certeza.'),
                                                    actions: [
                                                      TextButton(
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                alertDialogContext,
                                                                false),
                                                        child: const Text(
                                                            'Cancelar e voltar'),
                                                      ),
                                                      TextButton(
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                alertDialogContext,
                                                                true),
                                                        child: const Text(
                                                            'Confirmar e deletar'),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              },
                                            ) ??
                                            false;
                                    if (confirmDialogResponse) {
                                      await PrescricaoTable().delete(
                                        matchingRows: (rows) => rows.eq(
                                          'id',
                                          valueOrDefault<int>(
                                            widget.prescricao?.id,
                                            5,
                                          ),
                                        ),
                                      );
                                      FFAppState().clearRemediosCache();
                                      Navigator.pop(context);
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return WebViewAware(
                                            child: AlertDialog(
                                              title: const Text('Sucesso!'),
                                              content: const Text(
                                                  'Sua prescrição foi deletada com sucesso.'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext),
                                                  child: const Text('Ok'),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      );
                                    }

                                    setState(() {});
                                  },
                                  text: 'Deletar',
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
                                          color: const Color(0xFFE25D5D),
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                    elevation: 3.0,
                                    borderSide: const BorderSide(
                                      color: Color(0xFFE25D5D),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: FFButtonWidget(
                                  onPressed: ((_model.textController1.text ==
                                                  '') ||
                                          (_model.dropDownValue == null ||
                                              _model.dropDownValue == '') ||
                                          (_model.textController2.text ==
                                                  ''))
                                      ? null
                                      : () async {
                                          if (_model.switchValue == true) {
                                            await PrescricaoTable().update(
                                              data: {
                                                'horarios': supaSerializeList<
                                                        DateTime>(
                                                    FFAppState()
                                                        .horarios
                                                        .map((e) => e.horario)
                                                        .withoutNulls
                                                        .toList()),
                                                'posologia': int.tryParse(_model
                                                    .textController1.text),
                                                'forma_dose':
                                                    _model.dropDownValue,
                                                'duracao_dias': FFAppState()
                                                    .prescricao
                                                    .duracaoDias,
                                                'date_start': supaSerialize<
                                                        DateTime>(
                                                    _model.datePicked ?? widget.prescricao
                                                            ?.dateStart),
                                                'concentracao': int.tryParse(
                                                    _model
                                                        .textController2.text),
                                                'continuo': true,
                                              },
                                              matchingRows: (rows) => rows.eq(
                                                'id',
                                                widget.prescricao?.id,
                                              ),
                                            );
                                            Navigator.pop(context);
                                            FFAppState().prescricao =
                                                PrescricaoStruct();
                                            FFAppState().horarios = [];
                                            setState(() {});
                                            await showDialog(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return WebViewAware(
                                                  child: AlertDialog(
                                                    title: const Text('Sucesso!'),
                                                    content: const Text(
                                                        'Sua prescrição foi editada com sucesso.'),
                                                    actions: [
                                                      TextButton(
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                alertDialogContext),
                                                        child: const Text('Ok'),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              },
                                            );
                                          } else {
                                            await PrescricaoTable().update(
                                              data: {
                                                'horarios': supaSerializeList<
                                                        DateTime>(
                                                    FFAppState()
                                                        .horarios
                                                        .map((e) => e.horario)
                                                        .withoutNulls
                                                        .toList()),
                                                'posologia': int.tryParse(_model
                                                    .textController1.text),
                                                'forma_dose':
                                                    _model.dropDownValue,
                                                'duracao_dias': FFAppState()
                                                    .prescricao
                                                    .duracaoDias,
                                                'date_start': supaSerialize<
                                                        DateTime>(
                                                    _model.datePicked ?? widget.prescricao
                                                            ?.dateStart),
                                                'concentracao': int.tryParse(
                                                    _model
                                                        .textController2.text),
                                                'continuo': false,
                                                'date_end': supaSerialize<
                                                    DateTime>(_model.datePicked ==
                                                        null
                                                    ? functions.getFinalDate(
                                                        widget.prescricao!
                                                            .dateStart!,
                                                        FFAppState()
                                                                .prescricao
                                                                .duracaoDias -
                                                            1)
                                                    : functions.getFinalDate(
                                                        _model.datePicked!,
                                                        FFAppState()
                                                                .prescricao
                                                                .duracaoDias -
                                                            1)),
                                              },
                                              matchingRows: (rows) => rows.eq(
                                                'id',
                                                widget.prescricao?.id,
                                              ),
                                            );
                                            Navigator.pop(context);
                                            FFAppState().prescricao =
                                                PrescricaoStruct();
                                            FFAppState().horarios = [];
                                            setState(() {});
                                            await showDialog(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return WebViewAware(
                                                  child: AlertDialog(
                                                    title: const Text('Sucesso!'),
                                                    content: const Text(
                                                        'Sua prescrição foi editada com sucesso.'),
                                                    actions: [
                                                      TextButton(
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                alertDialogContext),
                                                        child: const Text('Ok'),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              },
                                            );
                                          }
                                        },
                                  text: 'Salvar',
                                  options: FFButtonOptions(
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
                                    disabledColor:
                                        FlutterFlowTheme.of(context).alternate,
                                    disabledTextColor: Colors.white,
                                  ),
                                ),
                              ),
                            ].divide(const SizedBox(width: 12.0)),
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
      ),
    );
  }
}
