import '/backend/schema/structs/index.dart';
import '/components/choose_med/choose_med_widget.dart';
import '/components/create_med/create_med_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'prescricao01_model.dart';
export 'prescricao01_model.dart';

class Prescricao01Widget extends StatefulWidget {
  const Prescricao01Widget({super.key});

  @override
  State<Prescricao01Widget> createState() => _Prescricao01WidgetState();
}

class _Prescricao01WidgetState extends State<Prescricao01Widget> {
  late Prescricao01Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Prescricao01Model());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().prescricao = PrescricaoStruct();
      setState(() {});
      FFAppState().prescricao = PrescricaoStruct(
        categoria: _model.dropDownValue1,
      );
      setState(() {});
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: SafeArea(
          top: true,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              color: Color(0x00FFFFFF),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: FlutterFlowTheme.of(context).alternate,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.safePop();
                                FFAppState().prescricao = PrescricaoStruct();
                                FFAppState().horarios = [];
                                setState(() {});
                              },
                              child: Icon(
                                Icons.arrow_back_ios_new,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 24.0,
                              ),
                            ),
                            Text(
                              'Adicionar prescrição',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Mulish',
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            const Icon(
                              Icons.add,
                              color: Color(0x015D67E2),
                              size: 32.0,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(24.0, 12.0, 24.0, 0.0),
                      child: Text(
                        'Preencha primeiro as informações básicas sobre o seu remédio.',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Mulish',
                              color: const Color(0xFF8798B5),
                              fontSize: 16.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Categoria do remédio',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Mulish',
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          FlutterFlowDropDown<String>(
                            controller: _model.dropDownValueController1 ??=
                                FormFieldController<String>(
                              _model.dropDownValue1 ??= 'Medicamento',
                            ),
                            options: const [
                              'Medicamento',
                              'Produto derivado de Cannabis',
                              'Suplemento'
                            ],
                            onChanged: (val) async {
                              setState(() => _model.dropDownValue1 = val);
                              FFAppState().updatePrescricaoStruct(
                                (e) => e..categoria = _model.dropDownValue1,
                              );
                              setState(() {});
                            },
                            width: double.infinity,
                            height: 48.0,
                            textStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Mulish',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  letterSpacing: 0.0,
                                ),
                            hintText: 'Categoria',
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
                                16.0, 0.0, 16.0, 0.0),
                            hidesUnderline: true,
                            isOverButton: true,
                            isSearchable: false,
                            isMultiSelect: false,
                          ),
                        ].divide(const SizedBox(height: 6.0)),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Nome do remédio',
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
                              await showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                context: context,
                                builder: (context) {
                                  return WebViewAware(
                                    child: GestureDetector(
                                      onTap: () => _model
                                              .unfocusNode.canRequestFocus
                                          ? FocusScope.of(context)
                                              .requestFocus(_model.unfocusNode)
                                          : FocusScope.of(context).unfocus(),
                                      child: Padding(
                                        padding:
                                            MediaQuery.viewInsetsOf(context),
                                        child: ChooseMedWidget(
                                          categoria: _model.dropDownValue1!,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ).then((value) => safeSetState(() {}));
                            },
                            child: Container(
                              width: double.infinity,
                              height: 48.0,
                              decoration: BoxDecoration(
                                color: const Color(0xFFF7FAFE),
                                borderRadius: BorderRadius.circular(8.0),
                                border: Border.all(
                                  color: const Color(0x13294B0D),
                                  width: 2.0,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    12.0, 0.0, 12.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    if (FFAppState().prescricao.remedNome == '')
                                      Text(
                                        'Nome do remédio',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Mulish',
                                              color: const Color(0xFF8798B5),
                                              fontSize: 14.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    if (FFAppState().prescricao.remedNome != '')
                                      Text(
                                        valueOrDefault<String>(
                                          FFAppState().prescricao.remedNome,
                                          'Nome do remédio',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Mulish',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontSize: 14.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ].divide(const SizedBox(height: 6.0)),
                      ),
                    ),
                    Container(
                      decoration: const BoxDecoration(),
                    ),
                    if (_model.dropDownValue1 == 'Produto derivado de Cannabis')
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            24.0, 24.0, 24.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Volume do frasco',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Mulish',
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            FlutterFlowDropDown<int>(
                              controller: _model.dropDownValueController2 ??=
                                  FormFieldController<int>(
                                _model.dropDownValue2 ??= 100,
                              ),
                              options: List<int>.from([100, 125, 150, 200]),
                              optionLabels: const ['100', '125', '150', '200'],
                              onChanged: (val) async {
                                setState(() => _model.dropDownValue2 = val);
                                FFAppState().updatePrescricaoStruct(
                                  (e) =>
                                      e..volumeFrasco = _model.dropDownValue2,
                                );
                                setState(() {});
                              },
                              width: double.infinity,
                              height: 48.0,
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Mulish',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    letterSpacing: 0.0,
                                  ),
                              hintText: 'Volume do Frasco',
                              icon: Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 24.0,
                              ),
                              fillColor: const Color(0xFFF7FAFE),
                              elevation: 2.0,
                              borderColor: const Color(0x0E294B0D),
                              borderWidth: 2.0,
                              borderRadius: 8.0,
                              margin: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              hidesUnderline: true,
                              isOverButton: true,
                              isSearchable: false,
                              isMultiSelect: false,
                            ),
                          ].divide(const SizedBox(height: 6.0)),
                        ),
                      ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(24.0, 32.0, 24.0, 0.0),
                      child: Container(
                        width: double.infinity,
                        height: 3.0,
                        decoration: const BoxDecoration(
                          color: Color(0x91E0E3E7),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(32.0, 24.0, 32.0, 0.0),
                      child: Text(
                        'Não encontrou o medicamento? Sem problemas, adicione o seu medicamento abaixo!',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Mulish',
                              color: const Color(0xFF8798B5),
                              fontSize: 12.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(24.0, 32.0, 24.0, 0.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          await showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            context: context,
                            builder: (context) {
                              return WebViewAware(
                                child: GestureDetector(
                                  onTap: () =>
                                      _model.unfocusNode.canRequestFocus
                                          ? FocusScope.of(context)
                                              .requestFocus(_model.unfocusNode)
                                          : FocusScope.of(context).unfocus(),
                                  child: Padding(
                                    padding: MediaQuery.viewInsetsOf(context),
                                    child: const CreateMedWidget(),
                                  ),
                                ),
                              );
                            },
                          ).then((value) => safeSetState(() {}));
                        },
                        text: 'Adicionar medicamento',
                        options: FFButtonOptions(
                          width: double.infinity,
                          height: 48.0,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: const Color(0x015D67E2),
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Mulish',
                                    color: FlutterFlowTheme.of(context).primary,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                          elevation: 0.0,
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).primary,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: FlutterFlowTheme.of(context).alternate,
                    ),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(24.0, 12.0, 24.0, 24.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        context.pushNamed(
                          'prescricao02',
                          extra: <String, dynamic>{
                            kTransitionInfoKey: const TransitionInfo(
                              hasTransition: true,
                              transitionType: PageTransitionType.fade,
                              duration: Duration(milliseconds: 0),
                            ),
                          },
                        );
                      },
                      text: 'Avançar',
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 48.0,
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
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
      ),
    );
  }
}
