import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components/choose_med/choose_med_widget.dart';
import '/components/create_med/create_med_widget.dart';
import '/flutter_flow/flutter_flow_autocomplete_options_list.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:easy_debounce/easy_debounce.dart';
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
  bool inpCannabisFocusListenerRegistered = false;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Prescricao01Model());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().prescricao = PrescricaoStruct();
      safeSetState(() {});
      FFAppState().prescricao = PrescricaoStruct(
        categoria: _model.dropDownValue1,
      );
      safeSetState(() {});
      _model.apiResultwcv = await SegmentGroup.trackingCall.call(
        userId: currentUserUid,
        eventName: 'new-medicine screen viewed',
        propertyOne: 'step 1',
      );
    });

    _model.inpCannabisTextController ??= TextEditingController();

    _model.inpMedcTextController ??= TextEditingController();
    _model.inpMedcFocusNode ??= FocusNode();

    _model.inpVolumeTextController ??= TextEditingController();
    _model.inpVolumeFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
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
      onTap: () => FocusScope.of(context).unfocus(),
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
                                safeSetState(() {});
                              },
                              child: Icon(
                                Icons.arrow_back_ios_new,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 24.0,
                              ),
                            ),
                            Text(
                              'Adicionar remédios',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Mulish',
                                    fontSize: 18.0,
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
                          Stack(
                            children: [
                              FlutterFlowDropDown<String>(
                                controller: _model.dropDownValueController1 ??=
                                    FormFieldController<String>(null),
                                options: const [
                                  'Medicamento',
                                  'Produto derivado de Cannabis',
                                  'Suplemento'
                                ],
                                onChanged: (val) async {
                                  safeSetState(
                                      () => _model.dropDownValue1 = val);
                                  FFAppState().updatePrescricaoStruct(
                                    (e) => e..categoria = _model.dropDownValue1,
                                  );
                                  safeSetState(() {});
                                  safeSetState(() {
                                    _model.inpCannabisTextController?.clear();
                                  });
                                },
                                width: double.infinity,
                                height: 48.0,
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Mulish',
                                      color: Colors.black,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                icon: Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
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
                                isOverButton: false,
                                isSearchable: false,
                                isMultiSelect: false,
                                labelText: 'Selecione uma categoria',
                                labelTextStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'Mulish',
                                      color: const Color(0xFFB5C0D3),
                                      letterSpacing: 0.0,
                                    ),
                              ),
                              if (_model.dropDownValue1 == null ||
                                  _model.dropDownValue1 == '')
                                Align(
                                  alignment: const AlignmentDirectional(-1.0, 1.0),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        12.0, 14.0, 0.0, 0.0),
                                    child: Text(
                                      'Seleciona uma categoria',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Mulish',
                                            color: const Color(0xFFB5C0D3),
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ),
                                ),
                            ],
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
                          if (responsiveVisibility(
                            context: context,
                            phone: false,
                            tablet: false,
                            tabletLandscape: false,
                            desktop: false,
                          ))
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
                                        onTap: () =>
                                            FocusScope.of(context).unfocus(),
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
                                      if (FFAppState().prescricao.remedNome ==
                                              '')
                                        Text(
                                          'Digite o nome do remédio',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Mulish',
                                                color: const Color(0xFFB5C0D3),
                                                fontSize: 14.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      if (FFAppState().prescricao.remedNome !=
                                              '')
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
                          if ((_model.dropDownValue1 ==
                                  'Produto derivado de Cannabis') &&
                              responsiveVisibility(
                                context: context,
                                tabletLandscape: false,
                                desktop: false,
                              ))
                            FutureBuilder<List<StaticMedicamentosRow>>(
                              future: StaticMedicamentosTable().queryRows(
                                queryFn: (q) => q
                                    .eq(
                                      'categoria',
                                      'Produto derivado de Cannabis',
                                    )
                                    .eq(
                                      'createdByUser',
                                      false,
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
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                List<StaticMedicamentosRow>
                                    inpCannabisStaticMedicamentosRowList =
                                    snapshot.data!;

                                return Autocomplete<String>(
                                  initialValue: const TextEditingValue(),
                                  optionsBuilder: (textEditingValue) {
                                    if (textEditingValue.text == '') {
                                      return const Iterable<String>.empty();
                                    }
                                    return inpCannabisStaticMedicamentosRowList
                                        .map((e) => e.nome)
                                        .withoutNulls
                                        .toList()
                                        .where((option) {
                                      final lowercaseOption =
                                          option.toLowerCase();
                                      return lowercaseOption.contains(
                                          textEditingValue.text.toLowerCase());
                                    });
                                  },
                                  optionsViewBuilder:
                                      (context, onSelected, options) {
                                    return AutocompleteOptionsList(
                                      textFieldKey: _model.inpCannabisKey,
                                      textController:
                                          _model.inpCannabisTextController!,
                                      options: options.toList(),
                                      onSelected: onSelected,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Mulish',
                                            letterSpacing: 0.0,
                                          ),
                                      textHighlightStyle: const TextStyle(),
                                      elevation: 4.0,
                                      optionBackgroundColor:
                                          FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                      optionHighlightColor:
                                          FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                      maxHeight: 200.0,
                                    );
                                  },
                                  onSelected: (String selection) {
                                    safeSetState(() => _model
                                        .inpCannabisSelectedOption = selection);
                                    FocusScope.of(context).unfocus();
                                  },
                                  fieldViewBuilder: (
                                    context,
                                    textEditingController,
                                    focusNode,
                                    onEditingComplete,
                                  ) {
                                    _model.inpCannabisFocusNode = focusNode;
                                    if (!inpCannabisFocusListenerRegistered) {
                                      inpCannabisFocusListenerRegistered = true;
                                      _model.inpCannabisFocusNode!.addListener(
                                        () async {
                                          _model.medCopyCopy =
                                              await StaticMedicamentosTable()
                                                  .queryRows(
                                            queryFn: (q) => q.eq(
                                              'nome',
                                              _model.inpCannabisTextController
                                                  .text,
                                            ),
                                          );
                                          if (!(_model.medCopyCopy != null &&
                                              (_model.medCopyCopy)!
                                                  .isNotEmpty)) {
                                            safeSetState(() {
                                              _model.inpCannabisTextController
                                                  ?.clear();
                                            });
                                          }
                                          FFAppState().updatePrescricaoStruct(
                                            (e) => e
                                              ..remedio =
                                                  _model.medCopyCopy?.first.id
                                              ..remedNome = _model
                                                  .medCopyCopy?.first.nome,
                                          );
                                          safeSetState(() {});

                                          safeSetState(() {});
                                        },
                                      );
                                    }
                                    _model.inpCannabisTextController =
                                        textEditingController;
                                    return TextFormField(
                                      key: _model.inpCannabisKey,
                                      controller: textEditingController,
                                      focusNode: focusNode,
                                      onEditingComplete: onEditingComplete,
                                      onChanged: (_) => EasyDebounce.debounce(
                                        '_model.inpCannabisTextController',
                                        const Duration(milliseconds: 500),
                                        () => safeSetState(() {}),
                                      ),
                                      autofocus: false,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        hintText: 'Remédio',
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Mulish',
                                              color: const Color(0xA457636C),
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
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
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
                                                18.0, 0.0, 0.0, 0.0),
                                        suffixIcon: const Icon(
                                          Icons.search_rounded,
                                          color: Color(0x7057636C),
                                        ),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Mulish',
                                            letterSpacing: 0.0,
                                          ),
                                      validator: _model
                                          .inpCannabisTextControllerValidator
                                          .asValidator(context),
                                    );
                                  },
                                );
                              },
                            ),
                          if (_model.dropDownValue1 ==
                              'Produto derivado de Cannabis')
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  8.0, 0.0, 0.0, 0.0),
                              child: Text(
                                '* Se você não encontrar o Produto derivado de Cannabis na listagem é por que ainda não fazemos o tratamento com o seu produto.',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Mulish',
                                      color: const Color(0xFF878787),
                                      fontSize: 10.0,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                          if (_model.dropDownValue1 !=
                              'Produto derivado de Cannabis')
                            TextFormField(
                              controller: _model.inpMedcTextController,
                              focusNode: _model.inpMedcFocusNode,
                              onChanged: (_) => EasyDebounce.debounce(
                                '_model.inpMedcTextController',
                                const Duration(milliseconds: 0),
                                () => safeSetState(() {}),
                              ),
                              autofocus: false,
                              obscureText: false,
                              decoration: InputDecoration(
                                hintText: 'Remédio',
                                hintStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'Mulish',
                                      color: const Color(0xA457636C),
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
                                contentPadding: const EdgeInsetsDirectional.fromSTEB(
                                    18.0, 0.0, 0.0, 0.0),
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Mulish',
                                    letterSpacing: 0.0,
                                  ),
                              validator: _model.inpMedcTextControllerValidator
                                  .asValidator(context),
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
                            if (responsiveVisibility(
                              context: context,
                              phone: false,
                              tablet: false,
                            ))
                              FlutterFlowDropDown<int>(
                                controller: _model.dropDownValueController2 ??=
                                    FormFieldController<int>(
                                  _model.dropDownValue2 ??= 100,
                                ),
                                options: List<int>.from([100, 125, 150, 200]),
                                optionLabels: const ['100', '125', '150', '200'],
                                onChanged: (val) async {
                                  safeSetState(
                                      () => _model.dropDownValue2 = val);
                                  FFAppState().updatePrescricaoStruct(
                                    (e) =>
                                        e..volumeFrasco = _model.dropDownValue2,
                                  );
                                  safeSetState(() {});
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
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
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
                                isOverButton: false,
                                isSearchable: false,
                                isMultiSelect: false,
                              ),
                            TextFormField(
                              controller: _model.inpVolumeTextController,
                              focusNode: _model.inpVolumeFocusNode,
                              autofocus: false,
                              obscureText: false,
                              decoration: InputDecoration(
                                hintText: 'Volume do frasco',
                                hintStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'Mulish',
                                      color: const Color(0xA457636C),
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
                                contentPadding: const EdgeInsetsDirectional.fromSTEB(
                                    18.0, 0.0, 0.0, 0.0),
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Mulish',
                                    letterSpacing: 0.0,
                                  ),
                              validator: _model.inpVolumeTextControllerValidator
                                  .asValidator(context),
                            ),
                          ].divide(const SizedBox(height: 6.0)),
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
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            24.0, 32.0, 24.0, 0.0),
                        child: Container(
                          width: double.infinity,
                          height: 3.0,
                          decoration: const BoxDecoration(
                            color: Color(0x91E0E3E7),
                          ),
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
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            32.0, 24.0, 32.0, 0.0),
                        child: Text(
                          'Não encontrou o medicamento? Sem problemas, adicione o seu medicamento abaixo.',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Mulish',
                                    color: const Color(0xFF8798B5),
                                    fontSize: 12.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
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
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            32.0, 32.0, 32.0, 0.0),
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
                                        FocusScope.of(context).unfocus(),
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
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Mulish',
                                  color: const Color(0xB7BCBCBC),
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                ),
                            elevation: 0.0,
                            borderSide: const BorderSide(
                              color: Color(0xB7BCBCBC),
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
                      onPressed: ((_model.dropDownValue1 == null ||
                                  _model.dropDownValue1 == '') ||
                              ((_model.dropDownValue1 ==
                                      'Produto derivado de Cannabis') &&
                                  ((_model.inpCannabisTextController
                                                  .text ==
                                              '') ||
                                      (_model.inpCannabisFocusNode?.hasFocus ??
                                          false))) ||
                              ((_model.dropDownValue1 !=
                                      'Produto derivado de Cannabis') &&
                                  (_model.inpMedcTextController.text == '')))
                          ? null
                          : () async {
                              context.pushNamed('prescricao02');

                              if (_model.dropDownValue1 ==
                                  'Produto derivado de Cannabis') {
                                _model.medc1 =
                                    await StaticMedicamentosTable().queryRows(
                                  queryFn: (q) => q.eq(
                                    'nome',
                                    _model.inpCannabisSelectedOption,
                                  ),
                                );
                                if (_model.medc1 != null &&
                                    (_model.medc1)!.isNotEmpty) {
                                  FFAppState().updatePrescricaoStruct(
                                    (e) => e
                                      ..remedio = _model.medc1?.first.id
                                      ..remedNome = _model.medc1?.first.nome,
                                  );
                                  safeSetState(() {});
                                } else {
                                  safeSetState(() {
                                    _model.inpCannabisTextController?.clear();
                                  });
                                }
                              } else {
                                FFAppState().updatePrescricaoStruct(
                                  (e) => e
                                    ..remedNome =
                                        _model.inpMedcTextController.text,
                                );
                                safeSetState(() {});
                              }

                              _model.apiResultwcvb =
                                  await SegmentGroup.trackingCall.call(
                                userId: currentUserUid,
                                eventName: 'next new-medicine clicked',
                                propertyOne: 'step 1',
                              );

                              safeSetState(() {});
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
                        disabledColor: FlutterFlowTheme.of(context).alternate,
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
