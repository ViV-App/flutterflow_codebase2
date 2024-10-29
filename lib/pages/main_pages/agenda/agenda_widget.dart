import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components/custom_date_picker_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'agenda_model.dart';
export 'agenda_model.dart';

class AgendaWidget extends StatefulWidget {
  const AgendaWidget({super.key});

  @override
  State<AgendaWidget> createState() => _AgendaWidgetState();
}

class _AgendaWidgetState extends State<AgendaWidget> {
  late AgendaModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AgendaModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.pickedDate = getCurrentTimestamp;
      safeSetState(() {});
      await _model.getAgenda(
        context,
        date: dateTimeFormat(
          "y-M-d",
          _model.pickedDate,
          locale: FFLocalizations.of(context).languageCode,
        ),
      );
      safeSetState(() {});
    });

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
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0x00FFFFFF),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
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
                            padding: EdgeInsets.all(18.0),
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
                                  'Agenda',
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
                                    context.pushNamed('remedios');
                                  },
                                  child: Icon(
                                    Icons.add,
                                    color: FlutterFlowTheme.of(context).primary,
                                    size: 32.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(-1.0, -1.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24.0, 12.0, 24.0, 32.0),
                                child: Text(
                                  'Registre se você ja tomou seu remédio hoje.',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Mulish',
                                        color: Color(0xFF8798B5),
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 24.0, 0.0),
                                  child: InkWell(
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
                                                  FocusScope.of(context)
                                                      .unfocus(),
                                              child: Padding(
                                                padding:
                                                    MediaQuery.viewInsetsOf(
                                                        context),
                                                child: Container(
                                                  height:
                                                      MediaQuery.sizeOf(context)
                                                              .height *
                                                          0.4,
                                                  child: CustomDatePickerWidget(
                                                    hasInitDate: true,
                                                    initDate: _model.pickedDate,
                                                    callback: (dateSet) async {
                                                      await _model.getAgenda(
                                                        context,
                                                        date: dateTimeFormat(
                                                          "y-M-d",
                                                          dateSet,
                                                          locale:
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .languageCode,
                                                        ),
                                                      );
                                                      _model.pickedDate =
                                                          dateSet;
                                                      safeSetState(() {});
                                                    },
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ).then((value) => safeSetState(() {}));
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      height: 37.0,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFF7FAFE),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12.0, 0.0, 12.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                _model.pickedDate =
                                                    functions.subDaysToDate(
                                                        _model.pickedDate!, 1);
                                                safeSetState(() {});
                                                await _model.getAgenda(
                                                  context,
                                                  date: dateTimeFormat(
                                                    "y-M-d",
                                                    _model.pickedDate,
                                                    locale: FFLocalizations.of(
                                                            context)
                                                        .languageCode,
                                                  ),
                                                );
                                                safeSetState(() {});
                                              },
                                              child: Icon(
                                                Icons.arrow_back_ios_new,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                size: 16.0,
                                              ),
                                            ),
                                            Text(
                                              dateTimeFormat(
                                                "MMMMEEEEd",
                                                _model.pickedDate,
                                                locale:
                                                    FFLocalizations.of(context)
                                                        .languageCode,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Mulish',
                                                        fontSize: 14.0,
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
                                                _model.pickedDate =
                                                    functions.addDaysToDate(
                                                        _model.pickedDate!, 1);
                                                safeSetState(() {});
                                                await _model.getAgenda(
                                                  context,
                                                  date: dateTimeFormat(
                                                    "y-M-d",
                                                    _model.pickedDate,
                                                    locale: FFLocalizations.of(
                                                            context)
                                                        .languageCode,
                                                  ),
                                                );
                                                safeSetState(() {});
                                              },
                                              child: Icon(
                                                Icons.arrow_forward_ios,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                size: 16.0,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24.0, 12.0, 24.0, 0.0),
                                  child: Builder(
                                    builder: (context) {
                                      final week = functions
                                          .getWeekCalendar(_model.pickedDate!)
                                          .toList();

                                      return Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: List.generate(week.length,
                                            (weekIndex) {
                                          final weekItem = week[weekIndex];
                                          return Expanded(
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                _model.pickedDate = weekItem;
                                                safeSetState(() {});
                                                await _model.getAgenda(
                                                  context,
                                                  date: dateTimeFormat(
                                                    "y-M-d",
                                                    _model.pickedDate,
                                                    locale: FFLocalizations.of(
                                                            context)
                                                        .languageCode,
                                                  ),
                                                );
                                                safeSetState(() {});
                                              },
                                              child: Container(
                                                width: 50.0,
                                                height: 66.0,
                                                decoration: BoxDecoration(
                                                  color: dateTimeFormat(
                                                            "d/M/y",
                                                            _model.pickedDate,
                                                            locale: FFLocalizations
                                                                    .of(context)
                                                                .languageCode,
                                                          ) ==
                                                          dateTimeFormat(
                                                            "d/M/y",
                                                            weekItem,
                                                            locale: FFLocalizations
                                                                    .of(context)
                                                                .languageCode,
                                                          )
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .primary
                                                      : Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    Text(
                                                      valueOrDefault<String>(
                                                        () {
                                                          if (weekIndex == 0) {
                                                            return 'Dom';
                                                          } else if (weekIndex ==
                                                              1) {
                                                            return 'Seg';
                                                          } else if (weekIndex ==
                                                              2) {
                                                            return 'Ter';
                                                          } else if (weekIndex ==
                                                              3) {
                                                            return 'Qua';
                                                          } else if (weekIndex ==
                                                              4) {
                                                            return 'Qui';
                                                          } else if (weekIndex ==
                                                              5) {
                                                            return 'Sex';
                                                          } else if (weekIndex ==
                                                              6) {
                                                            return 'Sab';
                                                          } else {
                                                            return 'Dia';
                                                          }
                                                        }(),
                                                        'Dia',
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Mulish',
                                                                color: dateTimeFormat(
                                                                          "d/M/y",
                                                                          _model
                                                                              .pickedDate,
                                                                          locale:
                                                                              FFLocalizations.of(context).languageCode,
                                                                        ) ==
                                                                        dateTimeFormat(
                                                                          "d/M/y",
                                                                          weekItem,
                                                                          locale:
                                                                              FFLocalizations.of(context).languageCode,
                                                                        )
                                                                    ? Colors.white
                                                                    : FlutterFlowTheme.of(context).primaryText,
                                                                fontSize: 12.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                    ),
                                                    Text(
                                                      valueOrDefault<String>(
                                                        dateTimeFormat(
                                                          "d",
                                                          weekItem,
                                                          locale:
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .languageCode,
                                                        ),
                                                        '00',
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Mulish',
                                                                color: dateTimeFormat(
                                                                          "d/M/y",
                                                                          _model
                                                                              .pickedDate,
                                                                          locale:
                                                                              FFLocalizations.of(context).languageCode,
                                                                        ) ==
                                                                        dateTimeFormat(
                                                                          "d/M/y",
                                                                          weekItem,
                                                                          locale:
                                                                              FFLocalizations.of(context).languageCode,
                                                                        )
                                                                    ? Colors.white
                                                                    : FlutterFlowTheme.of(context).primaryText,
                                                                fontSize: 16.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w900,
                                                              ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        }).divide(SizedBox(width: 12.0)),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                            Builder(
                              builder: (context) {
                                final consumoManham = _model.consumo.toList();
                                if (consumoManham.isEmpty) {
                                  return Center(
                                    child: Image.asset(
                                      'assets/images/Group_12947.png',
                                      width: MediaQuery.sizeOf(context).width *
                                          0.5,
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.5,
                                      fit: BoxFit.contain,
                                    ),
                                  );
                                }

                                return ListView.separated(
                                  padding: EdgeInsets.fromLTRB(
                                    0,
                                    0,
                                    0,
                                    12.0,
                                  ),
                                  primary: false,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: consumoManham.length,
                                  separatorBuilder: (_, __) =>
                                      SizedBox(height: 18.0),
                                  itemBuilder: (context, consumoManhamIndex) {
                                    final consumoManhamItem =
                                        consumoManham[consumoManhamIndex];
                                    return Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        if (consumoManhamItem.first == 1)
                                          Align(
                                            alignment: AlignmentDirectional(
                                                -1.0, -1.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      24.0, 24.0, 0.0, 18.0),
                                              child: Text(
                                                consumoManhamItem.turno,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Mulish',
                                                          color:
                                                              Color(0xFF434854),
                                                          fontSize: 20.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                              ),
                                            ),
                                          ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    24.0, 0.0, 24.0, 0.0),
                                            child: Material(
                                              color: Colors.transparent,
                                              elevation: 2.0,
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(8.0),
                                                  bottomRight:
                                                      Radius.circular(8.0),
                                                  topLeft: Radius.circular(8.0),
                                                  topRight:
                                                      Radius.circular(8.0),
                                                ),
                                              ),
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(8.0),
                                                  bottomRight:
                                                      Radius.circular(8.0),
                                                  topLeft: Radius.circular(8.0),
                                                  topRight:
                                                      Radius.circular(8.0),
                                                ),
                                                child: Container(
                                                  width: double.infinity,
                                                  height: 72.0,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFFF7FAFE),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      bottomLeft:
                                                          Radius.circular(8.0),
                                                      bottomRight:
                                                          Radius.circular(8.0),
                                                      topLeft:
                                                          Radius.circular(8.0),
                                                      topRight:
                                                          Radius.circular(8.0),
                                                    ),
                                                  ),
                                                  child: Stack(
                                                    children: [
                                                      Container(
                                                        width: 7.0,
                                                        height: 100.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: () {
                                                            if (consumoManhamItem
                                                                    .categoria ==
                                                                'Medicamento') {
                                                              return FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary;
                                                            } else if (consumoManhamItem
                                                                    .categoria ==
                                                                'Produto derivado de Cannabis') {
                                                              return Color(
                                                                  0xFF0FA26D);
                                                            } else if (consumoManhamItem
                                                                    .categoria ==
                                                                'Suplemento') {
                                                              return Color(
                                                                  0xFFFFA438);
                                                            } else {
                                                              return Color(
                                                                  0x00000000);
                                                            }
                                                          }(),
                                                          borderRadius:
                                                              BorderRadius.only(
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    12.0),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    12.0),
                                                            topLeft:
                                                                Radius.circular(
                                                                    12.0),
                                                            topRight:
                                                                Radius.circular(
                                                                    12.0),
                                                          ),
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      18.0,
                                                                      12.0,
                                                                      12.0,
                                                                      12.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  if (consumoManhamItem
                                                                          .categoria ==
                                                                      'Medicamento')
                                                                    ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                      child: SvgPicture
                                                                          .asset(
                                                                        'assets/images/cone_aloptico.svg',
                                                                        width:
                                                                            35.0,
                                                                        height:
                                                                            35.0,
                                                                        fit: BoxFit
                                                                            .contain,
                                                                      ),
                                                                    ),
                                                                  if (consumoManhamItem
                                                                          .categoria ==
                                                                      'Produto derivado de Cannabis')
                                                                    ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                      child: SvgPicture
                                                                          .asset(
                                                                        'assets/images/cone_derivado_de_cannabis.svg',
                                                                        width:
                                                                            35.0,
                                                                        height:
                                                                            35.0,
                                                                        fit: BoxFit
                                                                            .contain,
                                                                      ),
                                                                    ),
                                                                  if (consumoManhamItem
                                                                          .categoria ==
                                                                      'Suplemento')
                                                                    ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                      child: SvgPicture
                                                                          .asset(
                                                                        'assets/images/cone_manipulado.svg',
                                                                        width:
                                                                            25.0,
                                                                        height:
                                                                            30.0,
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                                    ),
                                                                  Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .min,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Text(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          consumoManhamItem
                                                                              .medicamentoNome,
                                                                          'Medicamento',
                                                                        ).maybeHandleOverflow(
                                                                          maxChars:
                                                                              25,
                                                                          replacement:
                                                                              '…',
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Mulish',
                                                                              color: Color(0xFF434854),
                                                                              fontSize: 14.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w800,
                                                                            ),
                                                                      ),
                                                                      Text(
                                                                        '${consumoManhamItem.posologia.toString()} ${consumoManhamItem.formaDose} - ${consumoManhamItem.horarioString}',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Mulish',
                                                                              color: Color(0xFF434854),
                                                                              fontSize: 12.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w600,
                                                                            ),
                                                                      ),
                                                                    ].divide(SizedBox(
                                                                        height:
                                                                            4.0)),
                                                                  ),
                                                                ].divide(SizedBox(
                                                                    width:
                                                                        12.0)),
                                                              ),
                                                              if (FFAppState()
                                                                      .paciente ==
                                                                  null)
                                                                Theme(
                                                                  data:
                                                                      ThemeData(
                                                                    checkboxTheme:
                                                                        CheckboxThemeData(
                                                                      visualDensity:
                                                                          VisualDensity
                                                                              .compact,
                                                                      materialTapTargetSize:
                                                                          MaterialTapTargetSize
                                                                              .shrinkWrap,
                                                                      shape:
                                                                          RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(4.0),
                                                                      ),
                                                                    ),
                                                                    unselectedWidgetColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                  ),
                                                                  child:
                                                                      Checkbox(
                                                                    value: _model
                                                                            .checkboxValueMap[
                                                                        consumoManhamItem] ??= consumoManhamItem.consumido ==
                                                                            true
                                                                        ? true
                                                                        : false,
                                                                    onChanged:
                                                                        (newValue) async {
                                                                      safeSetState(() =>
                                                                          _model.checkboxValueMap[consumoManhamItem] =
                                                                              newValue!);
                                                                      if (newValue!) {
                                                                        _model.outputConsumo02amCopy =
                                                                            await ConsumotrackTable().insert({
                                                                          'hour': supaSerialize<DateTime>(functions.combineDateAndTime(
                                                                              _model.pickedDate!.toString(),
                                                                              consumoManhamItem.horario)),
                                                                          'consumido':
                                                                              true,
                                                                          'prescricao':
                                                                              consumoManhamItem.prescricaoId,
                                                                          'medicamento':
                                                                              consumoManhamItem.medicamentoId,
                                                                        });
                                                                        _model
                                                                            .updateConsumoAtIndex(
                                                                          consumoManhamIndex,
                                                                          (e) => e
                                                                            ..consumoId =
                                                                                _model.outputConsumo02amCopy?.id
                                                                            ..consumido = true,
                                                                        );
                                                                        _model.consumoQntd =
                                                                            _model.consumoQntd! +
                                                                                1;
                                                                        safeSetState(
                                                                            () {});
                                                                        await _model
                                                                            .activeLottie(context);
                                                                        safeSetState(
                                                                            () {});

                                                                        safeSetState(
                                                                            () {});
                                                                      } else {
                                                                        await ConsumotrackTable()
                                                                            .delete(
                                                                          matchingRows: (rows) =>
                                                                              rows.eq(
                                                                            'id',
                                                                            consumoManhamItem.consumoId,
                                                                          ),
                                                                        );
                                                                        _model
                                                                            .updateConsumoAtIndex(
                                                                          consumoManhamIndex,
                                                                          (e) => e
                                                                            ..consumido =
                                                                                false
                                                                            ..consumoId = null,
                                                                        );
                                                                        _model.consumoQntd =
                                                                            _model.consumoQntd! +
                                                                                -1;
                                                                        safeSetState(
                                                                            () {});
                                                                      }
                                                                    },
                                                                    side:
                                                                        BorderSide(
                                                                      width: 2,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                    ),
                                                                    activeColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                    checkColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .info,
                                                                  ),
                                                                ),
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  if (consumoManhamItem
                                                                          .consumido ==
                                                                      false)
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
                                                                        _model.outputConsumo02amCopyCopy =
                                                                            await ConsumotrackTable().insert({
                                                                          'hour': supaSerialize<DateTime>(functions.combineDateAndTime(
                                                                              _model.pickedDate!.toString(),
                                                                              consumoManhamItem.horario)),
                                                                          'consumido':
                                                                              true,
                                                                          'prescricao':
                                                                              consumoManhamItem.prescricaoId,
                                                                          'medicamento':
                                                                              consumoManhamItem.medicamentoId,
                                                                        });
                                                                        _model
                                                                            .updateConsumoAtIndex(
                                                                          consumoManhamIndex,
                                                                          (e) => e
                                                                            ..consumoId =
                                                                                consumoManhamItem.consumoId
                                                                            ..consumido = true,
                                                                        );
                                                                        _model.consumoQntd =
                                                                            _model.consumoQntd! +
                                                                                1;
                                                                        safeSetState(
                                                                            () {});

                                                                        safeSetState(
                                                                            () {});
                                                                      },
                                                                      child:
                                                                          Icon(
                                                                        Icons
                                                                            .check_box_outline_blank,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        size:
                                                                            28.0,
                                                                      ),
                                                                    ),
                                                                  if (consumoManhamItem
                                                                          .consumido ==
                                                                      true)
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
                                                                        await ConsumotrackTable()
                                                                            .delete(
                                                                          matchingRows: (rows) =>
                                                                              rows.eq(
                                                                            'id',
                                                                            consumoManhamItem.consumoId,
                                                                          ),
                                                                        );
                                                                        _model
                                                                            .updateConsumoAtIndex(
                                                                          consumoManhamIndex,
                                                                          (e) => e
                                                                            ..consumido =
                                                                                false
                                                                            ..consumoId = null,
                                                                        );
                                                                        _model.consumoQntd =
                                                                            _model.consumoQntd! +
                                                                                -1;
                                                                        safeSetState(
                                                                            () {});
                                                                      },
                                                                      child:
                                                                          Icon(
                                                                        Icons
                                                                            .check_box,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        size:
                                                                            28.0,
                                                                      ),
                                                                    ),
                                                                ],
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
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                            ),
                          ]
                              .addToStart(SizedBox(height: 8.0))
                              .addToEnd(SizedBox(height: 24.0)),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: FlutterFlowTheme.of(context).alternate,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 12.0, 24.0, 24.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            context.pushNamed('prescricao01');
                          },
                          text: 'Adicionar novo',
                          options: FFButtonOptions(
                            width: double.infinity,
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
                  ],
                ),
              ),
              if (_model.lottieOn == true)
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Lottie.network(
                    'https://lottie.host/e32057d4-7626-4bec-bb50-94affc3148e2/Gwm7uJAVIT.json',
                    width: 300.0,
                    height: 300.0,
                    fit: BoxFit.contain,
                    repeat: false,
                    animate: true,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
