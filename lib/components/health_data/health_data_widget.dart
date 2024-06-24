import '/auth/supabase_auth/auth_util.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
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

    _model.textController1 ??=
        TextEditingController(text: FFAppState().paciente.medico.nome);
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController2 ??=
        TextEditingController(text: FFAppState().paciente.medico.crm);
    _model.textFieldFocusNode2 ??= FocusNode();

    _model.textController3 ??=
        TextEditingController(text: FFAppState().paciente.altura.toString());
    _model.textFieldFocusNode3 ??= FocusNode();

    _model.textController4 ??=
        TextEditingController(text: FFAppState().paciente.peso.toString());
    _model.textFieldFocusNode4 ??= FocusNode();

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
        padding: const EdgeInsetsDirectional.fromSTEB(0.0, 72.0, 0.0, 0.0),
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
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            flex: 3,
                                            child: TextFormField(
                                              controller:
                                                  _model.textController1,
                                              focusNode:
                                                  _model.textFieldFocusNode1,
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
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
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
                                                    color: FlutterFlowTheme.of(
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
                                              validator: _model
                                                  .textController1Validator
                                                  .asValidator(context),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 2,
                                            child: TextFormField(
                                              controller:
                                                  _model.textController2,
                                              focusNode:
                                                  _model.textFieldFocusNode2,
                                              autofocus: false,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                hintText: 'CRM',
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
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
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
                                                    color: FlutterFlowTheme.of(
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
                                              validator: _model
                                                  .textController2Validator
                                                  .asValidator(context),
                                            ),
                                          ),
                                        ].divide(const SizedBox(width: 8.0)),
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
                                            initialDate: (_model.datePicked ??
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
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 0.0, 12.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  _model.datePicked != null
                                                      ? dateTimeFormat(
                                                          'd/M/y',
                                                          _model.datePicked,
                                                          locale:
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .languageCode,
                                                        )
                                                      : 'Selecione uma data',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Mulish',
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                                const Icon(
                                                  Icons.calendar_today_outlined,
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
                                        focusNode: _model.textFieldFocusNode3,
                                        autofocus: false,
                                        obscureText: false,
                                        decoration: InputDecoration(
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
                                          _model.textFieldMask3
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
                                        focusNode: _model.textFieldFocusNode4,
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
                                          _model.textFieldMask4
                                        ],
                                      ),
                                    ].divide(const SizedBox(height: 6.0)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              24.0, 32.0, 24.0, 24.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              _model.cUSer = await PacienteTable().queryRows(
                                queryFn: (q) => q.eq(
                                  'uuid',
                                  currentUserUid,
                                ),
                              );
                              if (_model.cUSer?.first.medicoPrescritor ==
                                  null) {
                                _model.cMed = await MedicoTable().insert({
                                  'nome': _model.textController1.text,
                                  'crm': _model.textController2.text,
                                });
                                await PacienteTable().update(
                                  data: {
                                    'altura': double.tryParse(
                                        _model.textController3.text),
                                    'Peso': double.tryParse(
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
                                    ..medico = MedicoStruct(
                                      id: _model.cMed?.id,
                                      createdAt: _model.cMed?.createdAt,
                                      nome: _model.textController1.text,
                                      crm: _model.textController2.text,
                                    )
                                    ..altura = double.tryParse(
                                        _model.textController3.text),
                                );
                                setState(() {});
                                Navigator.pop(context);
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return WebViewAware(
                                      child: AlertDialog(
                                        title: const Text('Tudo certo!'),
                                        content: const Text(
                                            'Suas informações de saude foram atualizadas com sucesso.'),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                alertDialogContext),
                                            child: const Text('Ok'),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                );
                              } else {
                                await MedicoTable().update(
                                  data: {
                                    'nome': _model.textController1.text,
                                    'crm': _model.textController2.text,
                                  },
                                  matchingRows: (rows) => rows.eq(
                                    'crm',
                                    _model.textController2.text,
                                  ),
                                );
                                await PacienteTable().update(
                                  data: {
                                    'altura': double.tryParse(
                                        _model.textController3.text),
                                    'Peso': double.tryParse(
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
                                    ..updateMedico(
                                      (e) => e
                                        ..nome = _model.textController1.text
                                        ..crm = _model.textController2.text,
                                    )
                                    ..altura = double.tryParse(
                                        _model.textController3.text),
                                );
                                setState(() {});
                                Navigator.pop(context);
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return WebViewAware(
                                      child: AlertDialog(
                                        title: const Text('Tudo certo!'),
                                        content: const Text(
                                            'Suas informações de saude foram atualizadas com sucesso.'),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
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
