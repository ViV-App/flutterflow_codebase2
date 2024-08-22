import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_charts.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'new_evolucao_model.dart';
export 'new_evolucao_model.dart';

class NewEvolucaoWidget extends StatefulWidget {
  const NewEvolucaoWidget({super.key});

  @override
  State<NewEvolucaoWidget> createState() => _NewEvolucaoWidgetState();
}

class _NewEvolucaoWidgetState extends State<NewEvolucaoWidget> {
  late NewEvolucaoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NewEvolucaoModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.dataInicio = functions.subDaysToDate(getCurrentTimestamp, 6);
      _model.dataFinal = getCurrentTimestamp;
      setState(() {});
      setState(() => _model.apiRequestCompleter = null);
      await _model.waitForApiRequestCompleted();
      _model.queix = await StaticQueixasSaudeTable().queryRows(
        queryFn: (q) => q.eq(
          'nome',
          FFAppState().paciente.queixas.first,
        ),
      );
      _model.queixa = _model.queix!.first.id;
      setState(() {});
      await _model.getSintomas(context);
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

    return FutureBuilder<List<PacienteRow>>(
      future: PacienteTable().querySingleRow(
        queryFn: (q) => q.eq(
          'uuid',
          currentUserUid,
        ),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        List<PacienteRow> newEvolucaoPacienteRowList = snapshot.data!;

        final newEvolucaoPacienteRow = newEvolucaoPacienteRowList.isNotEmpty
            ? newEvolucaoPacienteRowList.first
            : null;

        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: SafeArea(
              top: true,
              child: FutureBuilder<ApiCallResponse>(
                future:
                    (_model.apiRequestCompleter ??= Completer<ApiCallResponse>()
                          ..complete(GetLatestBemViverScoreCall.call(
                            dataInit: dateTimeFormat(
                              "y-M-d",
                              _model.dataInicio,
                              locale: FFLocalizations.of(context).languageCode,
                            ),
                            dataEnd: dateTimeFormat(
                              "y-M-d",
                              _model.dataFinal,
                              locale: FFLocalizations.of(context).languageCode,
                            ),
                            paciente: FFAppState().paciente.id,
                          )))
                        .future,
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
                  final mainGetLatestBemViverScoreResponse = snapshot.data!;

                  return Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.transparent,
                    ),
                    child: Column(
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
                                  },
                                  child: Icon(
                                    Icons.arrow_back_ios_new,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 32.0,
                                  ),
                                ),
                                Text(
                                  'Evolução',
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
                                  width: 32.0,
                                  height: 32.0,
                                  decoration: const BoxDecoration(
                                    color: Color(0x006E78FF),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Image.asset(
                                          'assets/images/Group_(1).png',
                                          width: 18.0,
                                          height: 18.0,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            decoration: const BoxDecoration(),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Align(
                                    alignment: const AlignmentDirectional(-1.0, -1.0),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          24.0, 12.0, 24.0, 0.0),
                                      child: Text(
                                        'Aqui você pode acompanhar todos os dados que são preenchidos.',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Mulish',
                                              color: const Color(0xFF8798B5),
                                              fontSize: 16.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        18.0, 24.0, 18.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            _model.dataInicio =
                                                functions.subDaysToDate(
                                                    _model.dataInicio!, 1);
                                            setState(() {});
                                            await _model.getSintomas(context);
                                            setState(() {});
                                          },
                                          child: Icon(
                                            Icons.arrow_back_ios_new,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 18.0,
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
                                                    final datePicked1CupertinoTheme =
                                                        CupertinoTheme.of(
                                                            context);
                                                    return ScrollConfiguration(
                                                      behavior:
                                                          const MaterialScrollBehavior()
                                                              .copyWith(
                                                        dragDevices: {
                                                          PointerDeviceKind
                                                              .mouse,
                                                          PointerDeviceKind
                                                              .touch,
                                                          PointerDeviceKind
                                                              .stylus,
                                                          PointerDeviceKind
                                                              .unknown
                                                        },
                                                      ),
                                                      child: Container(
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height /
                                                            3,
                                                        width: MediaQuery.of(
                                                                context)
                                                            .size
                                                            .width,
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        child: CupertinoTheme(
                                                          data:
                                                              datePicked1CupertinoTheme
                                                                  .copyWith(
                                                            textTheme:
                                                                datePicked1CupertinoTheme
                                                                    .textTheme
                                                                    .copyWith(
                                                              dateTimePickerTextStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Mulish',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                            ),
                                                          ),
                                                          child:
                                                              CupertinoDatePicker(
                                                            mode:
                                                                CupertinoDatePickerMode
                                                                    .date,
                                                            minimumDate:
                                                                DateTime(1900),
                                                            initialDateTime:
                                                                (_model.dataInicio ??
                                                                    DateTime
                                                                        .now()),
                                                            maximumDate:
                                                                DateTime(2050),
                                                            backgroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                            use24hFormat: false,
                                                            onDateTimeChanged:
                                                                (newDateTime) =>
                                                                    safeSetState(
                                                                        () {
                                                              _model.datePicked1 =
                                                                  newDateTime;
                                                            }),
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  });
                                              if (!(_model.datePicked1 ==
                                                  null)) {
                                                _model.dataInicio =
                                                    _model.datePicked1;
                                                setState(() {});
                                                setState(() =>
                                                    _model.apiRequestCompleter =
                                                        null);
                                                await _model
                                                    .waitForApiRequestCompleted();
                                                await _model
                                                    .getSintomas(context);
                                                setState(() {});
                                              }
                                            },
                                            child: Container(
                                              height: 37.0,
                                              decoration: BoxDecoration(
                                                color: const Color(0xFFF7FAFE),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        18.0, 0.0, 18.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      dateTimeFormat(
                                                        "MMM d",
                                                        _model.dataInicio,
                                                        locale:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .languageCode,
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Mulish',
                                                            fontSize: 14.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Text(
                                          'a',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Mulish',
                                                fontSize: 16.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.bold,
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
                                                    final datePicked2CupertinoTheme =
                                                        CupertinoTheme.of(
                                                            context);
                                                    return ScrollConfiguration(
                                                      behavior:
                                                          const MaterialScrollBehavior()
                                                              .copyWith(
                                                        dragDevices: {
                                                          PointerDeviceKind
                                                              .mouse,
                                                          PointerDeviceKind
                                                              .touch,
                                                          PointerDeviceKind
                                                              .stylus,
                                                          PointerDeviceKind
                                                              .unknown
                                                        },
                                                      ),
                                                      child: Container(
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height /
                                                            3,
                                                        width: MediaQuery.of(
                                                                context)
                                                            .size
                                                            .width,
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        child: CupertinoTheme(
                                                          data:
                                                              datePicked2CupertinoTheme
                                                                  .copyWith(
                                                            textTheme:
                                                                datePicked2CupertinoTheme
                                                                    .textTheme
                                                                    .copyWith(
                                                              dateTimePickerTextStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Mulish',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                            ),
                                                          ),
                                                          child:
                                                              CupertinoDatePicker(
                                                            mode:
                                                                CupertinoDatePickerMode
                                                                    .date,
                                                            minimumDate:
                                                                DateTime(1900),
                                                            initialDateTime:
                                                                (_model.dataFinal ??
                                                                    DateTime
                                                                        .now()),
                                                            maximumDate: (functions
                                                                    .addDaysToDate(
                                                                        _model
                                                                            .dataInicio!,
                                                                        6) ??
                                                                DateTime(2050)),
                                                            backgroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                            use24hFormat: false,
                                                            onDateTimeChanged:
                                                                (newDateTime) =>
                                                                    safeSetState(
                                                                        () {
                                                              _model.datePicked2 =
                                                                  newDateTime;
                                                            }),
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  });
                                              if (!(_model.datePicked2 ==
                                                  null)) {
                                                _model.dataFinal =
                                                    _model.datePicked2;
                                                setState(() {});
                                                setState(() =>
                                                    _model.apiRequestCompleter =
                                                        null);
                                                await _model
                                                    .waitForApiRequestCompleted();
                                                await _model
                                                    .getSintomas(context);
                                                setState(() {});
                                              }
                                            },
                                            child: Container(
                                              height: 37.0,
                                              decoration: BoxDecoration(
                                                color: const Color(0xFFF7FAFE),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        18.0, 0.0, 18.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      dateTimeFormat(
                                                        "MMM d",
                                                        _model.dataFinal,
                                                        locale:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .languageCode,
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Mulish',
                                                            fontSize: 14.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            _model.dataFinal =
                                                functions.addDaysToDate(
                                                    _model.dataFinal!, 1);
                                            setState(() {});
                                            await _model.getSintomas(context);
                                            setState(() {});
                                          },
                                          child: Icon(
                                            Icons.arrow_forward_ios,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 18.0,
                                          ),
                                        ),
                                      ].divide(const SizedBox(width: 24.0)),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 32.0, 0.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 0.0, 24.0, 0.0),
                                          child: Container(
                                            width: double.infinity,
                                            height: 322.0,
                                            decoration: BoxDecoration(
                                              color: const Color(0xFFF7FAFE),
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(18.0, 18.0,
                                                          18.0, 0.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Humor',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Mulish',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  fontSize:
                                                                      24.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w800,
                                                                ),
                                                      ),
                                                      Align(
                                                        alignment:
                                                            const AlignmentDirectional(
                                                                -1.0, -1.0),
                                                        child: Text(
                                                          'Como você avaliou seu humor',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Mulish',
                                                                color: const Color(
                                                                    0xFF8798B5),
                                                                fontSize: 14.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                        ),
                                                      ),
                                                    ].divide(
                                                        const SizedBox(height: 4.0)),
                                                  ),
                                                ),
                                                if (GetLatestBemViverScoreCall
                                                            .id(
                                                      mainGetLatestBemViverScoreResponse
                                                          .jsonBody,
                                                    )!
                                                        .length >
                                                    1)
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  18.0,
                                                                  24.0,
                                                                  18.0,
                                                                  24.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                    child: Image
                                                                        .asset(
                                                                      'assets/images/beaming-face-with-smiling-eyes_1f601_(1).png',
                                                                      width:
                                                                          20.0,
                                                                      height:
                                                                          20.0,
                                                                      fit: BoxFit
                                                                          .cover,
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    '4',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Mulish',
                                                                          fontSize:
                                                                              16.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                  ),
                                                                ].divide(const SizedBox(
                                                                    width:
                                                                        4.0)),
                                                              ),
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                    child: Image
                                                                        .asset(
                                                                      'assets/images/lnkkg_.png',
                                                                      width:
                                                                          20.0,
                                                                      height:
                                                                          20.0,
                                                                      fit: BoxFit
                                                                          .cover,
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    '3',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Mulish',
                                                                          fontSize:
                                                                              16.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                  ),
                                                                ].divide(const SizedBox(
                                                                    width:
                                                                        4.0)),
                                                              ),
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                    child: Image
                                                                        .asset(
                                                                      'assets/images/suksn_.png',
                                                                      width:
                                                                          20.0,
                                                                      height:
                                                                          20.0,
                                                                      fit: BoxFit
                                                                          .cover,
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    '2',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Mulish',
                                                                          fontSize:
                                                                              16.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                  ),
                                                                ].divide(const SizedBox(
                                                                    width:
                                                                        4.0)),
                                                              ),
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                    child: Image
                                                                        .asset(
                                                                      'assets/images/kzeqx_.png',
                                                                      width:
                                                                          20.0,
                                                                      height:
                                                                          20.0,
                                                                      fit: BoxFit
                                                                          .cover,
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    '1',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Mulish',
                                                                          fontSize:
                                                                              16.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                  ),
                                                                ].divide(const SizedBox(
                                                                    width:
                                                                        4.0)),
                                                              ),
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                    child: Image
                                                                        .asset(
                                                                      'assets/images/crying-face_1f622_(1).png',
                                                                      width:
                                                                          20.0,
                                                                      height:
                                                                          20.0,
                                                                      fit: BoxFit
                                                                          .cover,
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    '0',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Mulish',
                                                                          fontSize:
                                                                              16.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                  ),
                                                                ].divide(const SizedBox(
                                                                    width:
                                                                        4.0)),
                                                              ),
                                                            ].divide(const SizedBox(
                                                                height: 16.0)),
                                                          ),
                                                          Expanded(
                                                            child: Container(
                                                              decoration:
                                                                  const BoxDecoration(),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Expanded(
                                                                      child:
                                                                          SizedBox(
                                                                        width: double
                                                                            .infinity,
                                                                        height:
                                                                            230.0,
                                                                        child:
                                                                            FlutterFlowLineChart(
                                                                          data: [
                                                                            FFLineChartData(
                                                                              xData: GetLatestBemViverScoreCall.createdAt(
                                                                                mainGetLatestBemViverScoreResponse.jsonBody,
                                                                              )!,
                                                                              yData: GetLatestBemViverScoreCall.humor(
                                                                                mainGetLatestBemViverScoreResponse.jsonBody,
                                                                              )!,
                                                                              settings: LineChartBarData(
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                barWidth: 2.0,
                                                                                belowBarData: BarAreaData(
                                                                                  show: true,
                                                                                  color: FlutterFlowTheme.of(context).accent1,
                                                                                ),
                                                                              ),
                                                                            )
                                                                          ],
                                                                          chartStylingInfo:
                                                                              const ChartStylingInfo(
                                                                            enableTooltip:
                                                                                true,
                                                                            tooltipBackgroundColor:
                                                                                Colors.white,
                                                                            backgroundColor:
                                                                                Color(0x00FFFFFF),
                                                                            showGrid:
                                                                                true,
                                                                            showBorder:
                                                                                false,
                                                                          ),
                                                                          axisBounds:
                                                                              const AxisBounds(),
                                                                          xAxisLabelInfo:
                                                                              const AxisLabelInfo(
                                                                            reservedSize:
                                                                                7.0,
                                                                          ),
                                                                          yAxisLabelInfo:
                                                                              const AxisLabelInfo(
                                                                            reservedSize:
                                                                                40.0,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          8.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Builder(
                                                                        builder:
                                                                            (context) {
                                                                          final list = GetLatestBemViverScoreCall.createdAt(
                                                                                mainGetLatestBemViverScoreResponse.jsonBody,
                                                                              )?.toList() ??
                                                                              [];

                                                                          return Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            children:
                                                                                List.generate(list.length, (listIndex) {
                                                                              final listItem = list[listIndex];
                                                                              return Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                children: [
                                                                                  Text(
                                                                                    dateTimeFormat(
                                                                                      "d",
                                                                                      functions.convertStringToDateTime(listItem),
                                                                                      locale: FFLocalizations.of(context).languageCode,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Mulish',
                                                                                          color: const Color(0xFF434854),
                                                                                          fontSize: 14.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w600,
                                                                                        ),
                                                                                  ),
                                                                                  Text(
                                                                                    dateTimeFormat(
                                                                                      "EE",
                                                                                      functions.convertStringToDateTime(listItem),
                                                                                      locale: FFLocalizations.of(context).languageCode,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Mulish',
                                                                                          color: const Color(0xFF434854),
                                                                                          fontSize: 14.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w600,
                                                                                        ),
                                                                                  ),
                                                                                ],
                                                                              );
                                                                            }),
                                                                          );
                                                                        },
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ].divide(const SizedBox(
                                                            width: 12.0)),
                                                      ),
                                                    ),
                                                  ),
                                                if (GetLatestBemViverScoreCall
                                                            .id(
                                                      mainGetLatestBemViverScoreResponse
                                                          .jsonBody,
                                                    )!
                                                        .length <
                                                    2)
                                                  Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  114.0,
                                                                  0.0,
                                                                  24.0),
                                                      child: Text(
                                                        'Registros insuficientes.',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Mulish',
                                                              color: const Color(
                                                                  0xA25D67E2),
                                                              fontSize: 16.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
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
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 0.0, 24.0, 0.0),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                            child: Container(
                                              width: double.infinity,
                                              height: 322.0,
                                              decoration: BoxDecoration(
                                                color: const Color(0xFFF7FAFE),
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                              ),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                18.0,
                                                                18.0,
                                                                18.0,
                                                                0.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          'Score ViV',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Mulish',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                fontSize: 24.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w800,
                                                              ),
                                                        ),
                                                        Align(
                                                          alignment:
                                                              const AlignmentDirectional(
                                                                  -1.0, -1.0),
                                                          child: Text(
                                                            'Esta é sua evolução dentro do VIV Score.',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Mulish',
                                                                  color: const Color(
                                                                      0xFF8798B5),
                                                                  fontSize:
                                                                      14.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                ),
                                                          ),
                                                        ),
                                                      ].divide(const SizedBox(
                                                          height: 4.0)),
                                                    ),
                                                  ),
                                                  if (GetLatestBemViverScoreCall
                                                              .id(
                                                        mainGetLatestBemViverScoreResponse
                                                            .jsonBody,
                                                      )!
                                                          .length >
                                                      1)
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    18.0,
                                                                    24.0,
                                                                    18.0,
                                                                    24.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          42.0),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceAround,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    '👏',
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
                                                                  Text(
                                                                    '👍',
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
                                                                  Text(
                                                                    '👎',
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
                                                                ].divide(const SizedBox(
                                                                    height:
                                                                        16.0)),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child: Container(
                                                                decoration:
                                                                    const BoxDecoration(),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Expanded(
                                                                      child:
                                                                          Stack(
                                                                        children: [
                                                                          Container(
                                                                            width:
                                                                                double.infinity,
                                                                            height:
                                                                                double.infinity,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                            ),
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Expanded(
                                                                                  flex: 1,
                                                                                  child: Container(
                                                                                    width: double.infinity,
                                                                                    height: 100.0,
                                                                                    decoration: const BoxDecoration(
                                                                                      color: Color(0xFFE9EDFE),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Expanded(
                                                                                  flex: 3,
                                                                                  child: Container(
                                                                                    width: double.infinity,
                                                                                    height: 100.0,
                                                                                    decoration: const BoxDecoration(
                                                                                      color: Color(0xFFDEE3F9),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Expanded(
                                                                                  flex: 1,
                                                                                  child: Container(
                                                                                    width: double.infinity,
                                                                                    height: 100.0,
                                                                                    decoration: const BoxDecoration(
                                                                                      color: Color(0xFFCCD1EB),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                          SizedBox(
                                                                            width:
                                                                                double.infinity,
                                                                            height:
                                                                                230.0,
                                                                            child:
                                                                                FlutterFlowLineChart(
                                                                              data: [
                                                                                FFLineChartData(
                                                                                  xData: GetLatestBemViverScoreCall.createdAt(
                                                                                    mainGetLatestBemViverScoreResponse.jsonBody,
                                                                                  )!,
                                                                                  yData: GetLatestBemViverScoreCall.scoreViV(
                                                                                    mainGetLatestBemViverScoreResponse.jsonBody,
                                                                                  )!,
                                                                                  settings: LineChartBarData(
                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                    barWidth: 2.0,
                                                                                  ),
                                                                                )
                                                                              ],
                                                                              chartStylingInfo: const ChartStylingInfo(
                                                                                enableTooltip: true,
                                                                                tooltipBackgroundColor: Colors.white,
                                                                                backgroundColor: Color(0x00FFFFFF),
                                                                                showBorder: false,
                                                                              ),
                                                                              axisBounds: const AxisBounds(),
                                                                              xAxisLabelInfo: const AxisLabelInfo(
                                                                                reservedSize: 32.0,
                                                                              ),
                                                                              yAxisLabelInfo: const AxisLabelInfo(
                                                                                reservedSize: 40.0,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          8.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Builder(
                                                                        builder:
                                                                            (context) {
                                                                          final list = GetLatestBemViverScoreCall.createdAt(
                                                                                mainGetLatestBemViverScoreResponse.jsonBody,
                                                                              )?.toList() ??
                                                                              [];

                                                                          return Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            children:
                                                                                List.generate(list.length, (listIndex) {
                                                                              final listItem = list[listIndex];
                                                                              return Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                children: [
                                                                                  Text(
                                                                                    dateTimeFormat(
                                                                                      "d",
                                                                                      functions.convertStringToDateTime(listItem),
                                                                                      locale: FFLocalizations.of(context).languageCode,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Mulish',
                                                                                          color: const Color(0xFF434854),
                                                                                          fontSize: 14.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w600,
                                                                                        ),
                                                                                  ),
                                                                                  Text(
                                                                                    dateTimeFormat(
                                                                                      "EE",
                                                                                      functions.convertStringToDateTime(listItem),
                                                                                      locale: FFLocalizations.of(context).languageCode,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Mulish',
                                                                                          color: const Color(0xFF434854),
                                                                                          fontSize: 14.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w600,
                                                                                        ),
                                                                                  ),
                                                                                ],
                                                                              );
                                                                            }),
                                                                          );
                                                                        },
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ].divide(const SizedBox(
                                                              width: 12.0)),
                                                        ),
                                                      ),
                                                    ),
                                                  if (GetLatestBemViverScoreCall
                                                              .id(
                                                        mainGetLatestBemViverScoreResponse
                                                            .jsonBody,
                                                      )!
                                                          .length <
                                                      2)
                                                    Align(
                                                      alignment:
                                                          const AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    114.0,
                                                                    0.0,
                                                                    24.0),
                                                        child: Text(
                                                          'Registros insuficientes.',
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Mulish',
                                                                color: const Color(
                                                                    0xA25D67E2),
                                                                fontSize: 16.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 0.0, 24.0, 0.0),
                                          child: Material(
                                            color: Colors.transparent,
                                            elevation: 0.0,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                            ),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                              child: Container(
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  color: const Color(0xFFF7FAFE),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                ),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  18.0,
                                                                  18.0,
                                                                  18.0,
                                                                  0.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            'Detalhe',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Mulish',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  fontSize:
                                                                      24.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w800,
                                                                ),
                                                          ),
                                                          Align(
                                                            alignment:
                                                                const AlignmentDirectional(
                                                                    -1.0, -1.0),
                                                            child: Text(
                                                              'Entenda o histórico de cada Queixa ou Condição para saber onde atuar no seu Bem-viver.',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Mulish',
                                                                    color: const Color(
                                                                        0xFF8798B5),
                                                                    fontSize:
                                                                        14.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  ),
                                                            ),
                                                          ),
                                                        ].divide(const SizedBox(
                                                            height: 4.0)),
                                                      ),
                                                    ),
                                                    if (GetLatestBemViverScoreCall
                                                                .id(
                                                          mainGetLatestBemViverScoreResponse
                                                              .jsonBody,
                                                        )!
                                                            .length >
                                                        1)
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    18.0,
                                                                    18.0,
                                                                    18.0,
                                                                    18.0),
                                                        child: Container(
                                                          width:
                                                              double.infinity,
                                                          height: 90.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: const Color(
                                                                0xFFEFF4F9),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.0),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        12.0,
                                                                        12.0,
                                                                        12.0,
                                                                        12.0),
                                                            child: FutureBuilder<
                                                                List<
                                                                    ViewQueixasPacienteRow>>(
                                                              future:
                                                                  ViewQueixasPacienteTable()
                                                                      .queryRows(
                                                                queryFn: (q) =>
                                                                    q,
                                                                limit: 3,
                                                              ),
                                                              builder: (context,
                                                                  snapshot) {
                                                                // Customize what your widget looks like when it's loading.
                                                                if (!snapshot
                                                                    .hasData) {
                                                                  return Center(
                                                                    child:
                                                                        SizedBox(
                                                                      width:
                                                                          50.0,
                                                                      height:
                                                                          50.0,
                                                                      child:
                                                                          CircularProgressIndicator(
                                                                        valueColor:
                                                                            AlwaysStoppedAnimation<Color>(
                                                                          FlutterFlowTheme.of(context)
                                                                              .primary,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  );
                                                                }
                                                                List<ViewQueixasPacienteRow>
                                                                    rowViewQueixasPacienteRowList =
                                                                    snapshot
                                                                        .data!;

                                                                return Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: List.generate(
                                                                      rowViewQueixasPacienteRowList
                                                                          .length,
                                                                      (rowIndex) {
                                                                    final rowViewQueixasPacienteRow =
                                                                        rowViewQueixasPacienteRowList[
                                                                            rowIndex];
                                                                    return Expanded(
                                                                      child:
                                                                          InkWell(
                                                                        splashColor:
                                                                            Colors.transparent,
                                                                        focusColor:
                                                                            Colors.transparent,
                                                                        hoverColor:
                                                                            Colors.transparent,
                                                                        highlightColor:
                                                                            Colors.transparent,
                                                                        onTap:
                                                                            () async {
                                                                          _model.queixa =
                                                                              rowViewQueixasPacienteRow.queixaId!;
                                                                          setState(
                                                                              () {});
                                                                        },
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              100.0,
                                                                          height:
                                                                              100.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color: _model.queixa == rowViewQueixasPacienteRow.queixaId
                                                                                ? Colors.white
                                                                                : const Color(0x007E5F5F),
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                          ),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.center,
                                                                            children:
                                                                                [
                                                                              Stack(
                                                                                children: [
                                                                                  ClipRRect(
                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                    child: Image.network(
                                                                                      rowViewQueixasPacienteRow.queixaLogo!,
                                                                                      width: 24.0,
                                                                                      height: 24.0,
                                                                                      fit: BoxFit.cover,
                                                                                    ),
                                                                                  ),
                                                                                  if (_model.queixa != rowViewQueixasPacienteRow.queixaId)
                                                                                    Container(
                                                                                      width: 24.0,
                                                                                      height: 24.0,
                                                                                      decoration: BoxDecoration(
                                                                                        color: const Color(0x7FB5C0D3),
                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                      ),
                                                                                    ),
                                                                                ],
                                                                              ),
                                                                              Padding(
                                                                                padding: const EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 4.0, 0.0),
                                                                                child: Text(
                                                                                  valueOrDefault<String>(
                                                                                    rowViewQueixasPacienteRow.queixaNome,
                                                                                    'd',
                                                                                  ).maybeHandleOverflow(
                                                                                    maxChars: 12,
                                                                                    replacement: '…',
                                                                                  ),
                                                                                  textAlign: TextAlign.center,
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Mulish',
                                                                                        fontSize: 10.0,
                                                                                        letterSpacing: 0.0,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ].divide(const SizedBox(height: 3.0)),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    );
                                                                  }).divide(
                                                                      const SizedBox(
                                                                          width:
                                                                              12.0)),
                                                                );
                                                              },
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    if (GetLatestBemViverScoreCall
                                                                .id(
                                                          mainGetLatestBemViverScoreResponse
                                                              .jsonBody,
                                                        )!
                                                            .length >
                                                        1)
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    18.0,
                                                                    0.0,
                                                                    18.0,
                                                                    24.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceAround,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  '👏',
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
                                                                Text(
                                                                  '👍',
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
                                                                Text(
                                                                  '👎',
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
                                                              ].divide(const SizedBox(
                                                                  height:
                                                                      52.0)),
                                                            ),
                                                            Expanded(
                                                              child: Container(
                                                                decoration:
                                                                    const BoxDecoration(),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    FutureBuilder<
                                                                        ApiCallResponse>(
                                                                      future: GetQueixaValuesCall
                                                                          .call(
                                                                        dateInit:
                                                                            dateTimeFormat(
                                                                          "y-M-d",
                                                                          _model
                                                                              .dataInicio,
                                                                          locale:
                                                                              FFLocalizations.of(context).languageCode,
                                                                        ),
                                                                        dateEnd:
                                                                            dateTimeFormat(
                                                                          "y-M-d",
                                                                          _model
                                                                              .dataFinal,
                                                                          locale:
                                                                              FFLocalizations.of(context).languageCode,
                                                                        ),
                                                                        paciente: FFAppState()
                                                                            .paciente
                                                                            .id,
                                                                        queixa:
                                                                            _model.queixa,
                                                                      ),
                                                                      builder:
                                                                          (context,
                                                                              snapshot) {
                                                                        // Customize what your widget looks like when it's loading.
                                                                        if (!snapshot
                                                                            .hasData) {
                                                                          return Center(
                                                                            child:
                                                                                SizedBox(
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
                                                                        final chartGetQueixaValuesResponse =
                                                                            snapshot.data!;

                                                                        return SizedBox(
                                                                          width:
                                                                              double.infinity,
                                                                          height:
                                                                              150.0,
                                                                          child:
                                                                              FlutterFlowLineChart(
                                                                            data: [
                                                                              FFLineChartData(
                                                                                xData: GetQueixaValuesCall.createdA6(
                                                                                  chartGetQueixaValuesResponse.jsonBody,
                                                                                )!,
                                                                                yData: GetQueixaValuesCall.score(
                                                                                  chartGetQueixaValuesResponse.jsonBody,
                                                                                )!,
                                                                                settings: LineChartBarData(
                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                  barWidth: 2.0,
                                                                                  belowBarData: BarAreaData(
                                                                                    show: true,
                                                                                    color: FlutterFlowTheme.of(context).accent1,
                                                                                  ),
                                                                                ),
                                                                              )
                                                                            ],
                                                                            chartStylingInfo:
                                                                                const ChartStylingInfo(
                                                                              enableTooltip: true,
                                                                              tooltipBackgroundColor: Colors.white,
                                                                              backgroundColor: Color(0x00FFFFFF),
                                                                              showGrid: true,
                                                                              showBorder: false,
                                                                            ),
                                                                            axisBounds:
                                                                                const AxisBounds(),
                                                                            xAxisLabelInfo:
                                                                                const AxisLabelInfo(
                                                                              reservedSize: 7.0,
                                                                            ),
                                                                            yAxisLabelInfo:
                                                                                const AxisLabelInfo(
                                                                              reservedSize: 40.0,
                                                                            ),
                                                                          ),
                                                                        );
                                                                      },
                                                                    ),
                                                                    Padding(
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          8.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Builder(
                                                                        builder:
                                                                            (context) {
                                                                          final list = GetLatestBemViverScoreCall.createdAt(
                                                                                mainGetLatestBemViverScoreResponse.jsonBody,
                                                                              )?.toList() ??
                                                                              [];

                                                                          return Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            children:
                                                                                List.generate(list.length, (listIndex) {
                                                                              final listItem = list[listIndex];
                                                                              return Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                children: [
                                                                                  Text(
                                                                                    dateTimeFormat(
                                                                                      "d",
                                                                                      functions.convertStringToDateTime(listItem),
                                                                                      locale: FFLocalizations.of(context).languageCode,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Mulish',
                                                                                          color: const Color(0xFF434854),
                                                                                          fontSize: 14.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w600,
                                                                                        ),
                                                                                  ),
                                                                                  Text(
                                                                                    dateTimeFormat(
                                                                                      "EE",
                                                                                      functions.convertStringToDateTime(listItem),
                                                                                      locale: FFLocalizations.of(context).languageCode,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Mulish',
                                                                                          color: const Color(0xFF434854),
                                                                                          fontSize: 14.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w600,
                                                                                        ),
                                                                                  ),
                                                                                ],
                                                                              );
                                                                            }),
                                                                          );
                                                                        },
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ].divide(const SizedBox(
                                                              width: 12.0)),
                                                        ),
                                                      ),
                                                    if (GetLatestBemViverScoreCall
                                                                .id(
                                                          mainGetLatestBemViverScoreResponse
                                                              .jsonBody,
                                                        )!
                                                            .length <
                                                        2)
                                                      Align(
                                                        alignment:
                                                            const AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      114.0,
                                                                      0.0,
                                                                      114.0),
                                                          child: Text(
                                                            'Registros insuficientes.',
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Mulish',
                                                                  color: const Color(
                                                                      0xA25D67E2),
                                                                  fontSize:
                                                                      16.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 0.0, 24.0, 0.0),
                                          child: Container(
                                            width: double.infinity,
                                            height: 370.0,
                                            decoration: BoxDecoration(
                                              color: const Color(0xFFF7FAFE),
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(18.0, 18.0,
                                                          18.0, 0.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Efeitos colaterais',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Mulish',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  fontSize:
                                                                      24.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w800,
                                                                ),
                                                      ),
                                                      Align(
                                                        alignment:
                                                            const AlignmentDirectional(
                                                                -1.0, -1.0),
                                                        child: Text(
                                                          'Dados de efeitos colaterais',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Mulish',
                                                                color: const Color(
                                                                    0xFF8798B5),
                                                                fontSize: 14.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                        ),
                                                      ),
                                                    ].divide(
                                                        const SizedBox(height: 4.0)),
                                                  ),
                                                ),
                                                if (GetLatestBemViverScoreCall
                                                            .id(
                                                      mainGetLatestBemViverScoreResponse
                                                          .jsonBody,
                                                    )!
                                                        .length >
                                                    1)
                                                  Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            -1.0, 0.0),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  18.0,
                                                                  0.0,
                                                                  18.0,
                                                                  18.0),
                                                      child: SizedBox(
                                                        width: double.infinity,
                                                        height: 300.0,
                                                        child: custom_widgets
                                                            .NewBarChart(
                                                          width:
                                                              double.infinity,
                                                          height: 300.0,
                                                          chartData:
                                                              _model.sintData,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                if (GetLatestBemViverScoreCall
                                                            .id(
                                                      mainGetLatestBemViverScoreResponse
                                                          .jsonBody,
                                                    )!
                                                        .length <
                                                    2)
                                                  Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  114.0,
                                                                  0.0,
                                                                  24.0),
                                                      child: Text(
                                                        'Registros insuficientes.',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Mulish',
                                                              color: const Color(
                                                                  0xA25D67E2),
                                                              fontSize: 16.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                      ),
                                                    ),
                                                  ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ].divide(const SizedBox(height: 18.0)),
                                    ),
                                  ),
                                ].addToEnd(const SizedBox(height: 24.0)),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}