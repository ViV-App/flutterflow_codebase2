import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/well_being_diary/queixa_question/queixa_question_widget.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'new_well_being_model.dart';
export 'new_well_being_model.dart';

class NewWellBeingWidget extends StatefulWidget {
  const NewWellBeingWidget({
    super.key,
    this.paciente,
    this.pacient,
  });

  final int? paciente;
  final PacienteRow? pacient;

  @override
  State<NewWellBeingWidget> createState() => _NewWellBeingWidgetState();
}

class _NewWellBeingWidgetState extends State<NewWellBeingWidget> {
  late NewWellBeingModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NewWellBeingModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(const Duration(milliseconds: 2000));
      await _model.setComponent(context);
      safeSetState(() {});
      _model.apiResultgd4 = await SegmentGroup.trackingCall.call(
        userId: currentUserUid,
        eventName: 'well-being screen viewed',
      );
    });

    _model.efeitoCustomTextController ??= TextEditingController();
    _model.efeitoCustomFocusNode ??= FocusNode();

    _model.textController2 ??= TextEditingController();
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
      alignment: AlignmentDirectional(0.0, 1.0),
      child: FutureBuilder<List<PacienteRow>>(
        future: PacienteTable().querySingleRow(
          queryFn: (q) => q.eq(
            'uuid',
            currentUserUid,
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
          List<PacienteRow> containerPacienteRowList = snapshot.data!;

          final containerPacienteRow = containerPacienteRowList.isNotEmpty
              ? containerPacienteRowList.first
              : null;

          return Material(
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
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(0.0),
                bottomRight: Radius.circular(0.0),
                topLeft: Radius.circular(24.0),
                topRight: Radius.circular(24.0),
              ),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(0.0),
                    bottomRight: Radius.circular(0.0),
                    topLeft: Radius.circular(24.0),
                    topRight: Radius.circular(24.0),
                  ),
                  border: Border.all(
                    color: FlutterFlowTheme.of(context).alternate,
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: FlutterFlowTheme.of(context).alternate,
                        ),
                      ),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0.0, -1.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 12.0, 0.0, 0.0),
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
                            Align(
                              alignment: AlignmentDirectional(0.0, -1.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 20.0, 0.0, 8.0),
                                child: Text(
                                  'Meu diário de bem estar',
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
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        decoration: BoxDecoration(),
                        child: SingleChildScrollView(
                          primary: false,
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24.0, 32.0, 24.0, 0.0),
                                child: Container(
                                  width: double.infinity,
                                  height: 147.0,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFEFF4F9),
                                    borderRadius: BorderRadius.circular(9.0),
                                    border: Border.all(
                                      color: Color(0x00D11F1F),
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12.0, 12.0, 0.0, 0.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Como você está se sentindo hoje?',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Mulish',
                                                    color: Color(0xFF434854),
                                                    fontSize: 16.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w800,
                                                  ),
                                            ),
                                            Text(
                                              'Como você avalia seu humor no geral?',
                                              textAlign: TextAlign.center,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Mulish',
                                                        color:
                                                            Color(0xFF434854),
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ].divide(SizedBox(height: 4.0)),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12.0, 0.0, 12.0, 12.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  _model.mood = 4;
                                                  safeSetState(() {});
                                                  _model.apiResultgd4v =
                                                      await SegmentGroup
                                                          .trackingCall
                                                          .call(
                                                    userId: currentUserUid,
                                                    eventName: 'humor selected',
                                                  );

                                                  safeSetState(() {});
                                                },
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  child: Container(
                                                    width: 75.0,
                                                    height: 60.0,
                                                    decoration: BoxDecoration(
                                                      color: _model.mood == 4
                                                          ? Color(0xFF75C3FB)
                                                          : Color(0xFFB5C0D3),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          child: Image.asset(
                                                            'assets/images/beaming-face-with-smiling-eyes_1f601_(1).png',
                                                            width: 35.0,
                                                            height: 35.0,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  _model.mood = 3;
                                                  safeSetState(() {});
                                                  _model.apiResultgd4vv =
                                                      await SegmentGroup
                                                          .trackingCall
                                                          .call(
                                                    userId: currentUserUid,
                                                    eventName: 'humor selected',
                                                  );

                                                  safeSetState(() {});
                                                },
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  child: Container(
                                                    width: 75.0,
                                                    height: 60.0,
                                                    decoration: BoxDecoration(
                                                      color: _model.mood == 3
                                                          ? Color(0xFFB9EEB0)
                                                          : Color(0xFFB5C0D3),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          child: Image.asset(
                                                            'assets/images/lnkkg_.png',
                                                            width: 35.0,
                                                            height: 35.0,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  _model.mood = 2;
                                                  safeSetState(() {});
                                                  _model.apiResultgd4vzs =
                                                      await SegmentGroup
                                                          .trackingCall
                                                          .call(
                                                    userId: currentUserUid,
                                                    eventName: 'humor selected',
                                                  );

                                                  safeSetState(() {});
                                                },
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  child: Container(
                                                    width: 75.0,
                                                    height: 60.0,
                                                    decoration: BoxDecoration(
                                                      color: _model.mood == 2
                                                          ? Color(0xFFEEE8B0)
                                                          : Color(0xFFB5C0D3),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          child: Image.asset(
                                                            'assets/images/suksn_.png',
                                                            width: 35.0,
                                                            height: 35.0,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  _model.mood = 1;
                                                  safeSetState(() {});
                                                  _model.apiResultgd4vnr =
                                                      await SegmentGroup
                                                          .trackingCall
                                                          .call(
                                                    userId: currentUserUid,
                                                    eventName: 'humor selected',
                                                  );

                                                  safeSetState(() {});
                                                },
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  child: Container(
                                                    width: 75.0,
                                                    height: 60.0,
                                                    decoration: BoxDecoration(
                                                      color: _model.mood == 1
                                                          ? Color(0xFFFFCFA4)
                                                          : Color(0xFFB5C0D3),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          child: Image.asset(
                                                            'assets/images/kzeqx_.png',
                                                            width: 35.0,
                                                            height: 35.0,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  _model.mood = 0;
                                                  safeSetState(() {});
                                                  _model.apiResultgd4vrefg =
                                                      await SegmentGroup
                                                          .trackingCall
                                                          .call(
                                                    userId: currentUserUid,
                                                    eventName: 'humor selected',
                                                  );

                                                  safeSetState(() {});
                                                },
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  child: Container(
                                                    width: 75.0,
                                                    height: 60.0,
                                                    decoration: BoxDecoration(
                                                      color: _model.mood == 0
                                                          ? Color(0xFFFFA4A4)
                                                          : Color(0xFFB5C0D3),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          child: Image.asset(
                                                            'assets/images/crying-face_1f622_(2).png',
                                                            width: 35.0,
                                                            height: 35.0,
                                                            fit: BoxFit.cover,
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
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24.0, 24.0, 24.0, 0.0),
                                child:
                                    FutureBuilder<List<StaticQueixasSaudeRow>>(
                                  future:
                                      StaticQueixasSaudeTable().querySingleRow(
                                    queryFn: (q) => q.eq(
                                      'nome',
                                      containerPacienteRow?.queixaPrincipal,
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
                                    List<StaticQueixasSaudeRow>
                                        queixaQuestionStaticQueixasSaudeRowList =
                                        snapshot.data!;

                                    final queixaQuestionStaticQueixasSaudeRow =
                                        queixaQuestionStaticQueixasSaudeRowList
                                                .isNotEmpty
                                            ? queixaQuestionStaticQueixasSaudeRowList
                                                .first
                                            : null;

                                    return wrapWithModel(
                                      model: _model.queixaQuestionModel,
                                      updateCallback: () => safeSetState(() {}),
                                      child: QueixaQuestionWidget(
                                        queixaName:
                                            queixaQuestionStaticQueixasSaudeRow
                                                ?.nome,
                                        principal: true,
                                        queixa:
                                            queixaQuestionStaticQueixasSaudeRow,
                                        setReturn: (response, periodo,
                                            frequencia) async {
                                          _model
                                              .addToRespostas(<String, dynamic>{
                                            'queixa':
                                                queixaQuestionStaticQueixasSaudeRow
                                                    ?.id,
                                            'queixa_peso': getJsonField(
                                              _model.pesoQ.first,
                                              r'''$.peso''',
                                            ),
                                            'pergunta_pergunta': getJsonField(
                                              response,
                                              r'''$.pergunta''',
                                            ),
                                            'pergunta_resposta': getJsonField(
                                              response,
                                              r'''$.resposta.resposta''',
                                            ),
                                            'resposta_rank': getJsonField(
                                              response,
                                              r'''$.resposta.peso''',
                                            ),
                                            'pergunta_index': getJsonField(
                                              response,
                                              r'''$.pergunta_index''',
                                            ),
                                            'time': getCurrentTimestamp
                                                .secondsSinceEpoch,
                                            'pergunta_index': getJsonField(
                                              response,
                                              r'''$.pergunta_index''',
                                            ),
                                            'paciente':
                                                containerPacienteRow?.id,
                                            'periodo': periodo,
                                            'frequencia': frequencia,
                                          });
                                          safeSetState(() {});
                                        },
                                      ),
                                    );
                                  },
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 24.0, 0.0, 0.0),
                                child: Container(
                                  decoration: BoxDecoration(),
                                  child: FutureBuilder<
                                      List<StaticQueixasSaudeRow>>(
                                    future: StaticQueixasSaudeTable().queryRows(
                                      queryFn: (q) => q.in_(
                                        'nome',
                                        containerPacienteRow!.queixas,
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
                                      List<StaticQueixasSaudeRow>
                                          columnStaticQueixasSaudeRowList =
                                          snapshot.data!;

                                      return Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: List.generate(
                                                columnStaticQueixasSaudeRowList
                                                    .length, (columnIndex) {
                                          final columnStaticQueixasSaudeRow =
                                              columnStaticQueixasSaudeRowList[
                                                  columnIndex];
                                          return Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    24.0, 0.0, 24.0, 0.0),
                                            child: QueixaQuestionWidget(
                                              key: Key(
                                                  'Keyc22_${columnIndex}_of_${columnStaticQueixasSaudeRowList.length}'),
                                              queixaName:
                                                  columnStaticQueixasSaudeRow
                                                      .nome,
                                              queixa:
                                                  columnStaticQueixasSaudeRow,
                                              principal: false,
                                              setReturn: (response, periodo,
                                                  frequencia) async {
                                                _model.addToRespostas(<String,
                                                    dynamic>{
                                                  'queixa':
                                                      columnStaticQueixasSaudeRow
                                                          .id,
                                                  'queixa_peso': getJsonField(
                                                    _model.pesoQ
                                                        .where((e) =>
                                                            columnStaticQueixasSaudeRow
                                                                .nome ==
                                                            getJsonField(
                                                              e,
                                                              r'''$.string''',
                                                            ).toString())
                                                        .toList()
                                                        .first,
                                                    r'''$.peso''',
                                                  ),
                                                  'pergunta_pergunta':
                                                      getJsonField(
                                                    response,
                                                    r'''$.pergunta''',
                                                  ),
                                                  'pergunta_resposta':
                                                      getJsonField(
                                                    response,
                                                    r'''$.resposta.resposta''',
                                                  ),
                                                  'resposta_rank': getJsonField(
                                                    response,
                                                    r'''$.resposta.peso''',
                                                  ),
                                                  'pergunta_index':
                                                      getJsonField(
                                                    response,
                                                    r'''$.pergunta_index''',
                                                  ),
                                                  'time': getCurrentTimestamp
                                                      .secondsSinceEpoch,
                                                  'pergunta_index':
                                                      getJsonField(
                                                    response,
                                                    r'''$.pergunta_index''',
                                                  ),
                                                  'paciente':
                                                      containerPacienteRow?.id,
                                                  'periodo': periodo,
                                                });
                                                safeSetState(() {});
                                              },
                                            ),
                                          );
                                        })
                                            .divide(SizedBox(height: 24.0))
                                            .addToEnd(SizedBox(height: 24.0)),
                                      );
                                    },
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 24.0, 0.0),
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFEFF4F9),
                                    borderRadius: BorderRadius.circular(9.0),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 18.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12.0, 12.0, 0.0, 0.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                width: 32.0,
                                                height: 32.0,
                                                decoration: BoxDecoration(
                                                  color: Color(0xFF75C3FB),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Icon(
                                                      Icons.water,
                                                      color: Color(0x9AF7F9FA),
                                                      size: 24.0,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 12.0, 0.0, 0.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Efeitos adversos',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Mulish',
                                                            color: Color(
                                                                0xFF434854),
                                                            fontSize: 16.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w800,
                                                          ),
                                                    ),
                                                    Text(
                                                      'Você teve algum efeito colateral hoje?',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Mulish',
                                                            color: Color(
                                                                0xFF434854),
                                                            fontSize: 14.0,
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ].divide(
                                                      SizedBox(height: 4.0)),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Container(
                                              width: double.infinity,
                                              decoration: BoxDecoration(),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        12.0, 24.0, 12.0, 0.0),
                                                child: FutureBuilder<
                                                    List<
                                                        StaticEfeitosAdversosRow>>(
                                                  future:
                                                      StaticEfeitosAdversosTable()
                                                          .queryRows(
                                                    queryFn: (q) => q,
                                                  ),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return Center(
                                                        child: SizedBox(
                                                          width: 50.0,
                                                          height: 50.0,
                                                          child:
                                                              CircularProgressIndicator(
                                                            valueColor:
                                                                AlwaysStoppedAnimation<
                                                                    Color>(
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primary,
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    List<StaticEfeitosAdversosRow>
                                                        wrapStaticEfeitosAdversosRowList =
                                                        snapshot.data!;

                                                    return Wrap(
                                                      spacing: 12.0,
                                                      runSpacing: 12.0,
                                                      alignment:
                                                          WrapAlignment.start,
                                                      crossAxisAlignment:
                                                          WrapCrossAlignment
                                                              .start,
                                                      direction:
                                                          Axis.horizontal,
                                                      runAlignment:
                                                          WrapAlignment.start,
                                                      verticalDirection:
                                                          VerticalDirection
                                                              .down,
                                                      clipBehavior: Clip.none,
                                                      children: List.generate(
                                                          wrapStaticEfeitosAdversosRowList
                                                              .length,
                                                          (wrapIndex) {
                                                        final wrapStaticEfeitosAdversosRow =
                                                            wrapStaticEfeitosAdversosRowList[
                                                                wrapIndex];
                                                        return InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            if (_model.effects.contains(
                                                                    wrapStaticEfeitosAdversosRow
                                                                        .efeito) ==
                                                                true) {
                                                              _model.removeFromEffects(
                                                                  wrapStaticEfeitosAdversosRow
                                                                      .efeito!);
                                                              safeSetState(
                                                                  () {});
                                                            } else {
                                                              _model.addToEffects(
                                                                  wrapStaticEfeitosAdversosRow
                                                                      .efeito!);
                                                              safeSetState(
                                                                  () {});
                                                            }

                                                            _model.apiResultgd4verg =
                                                                await SegmentGroup
                                                                    .trackingCall
                                                                    .call(
                                                              userId:
                                                                  currentUserUid,
                                                              eventName:
                                                                  'side-effect selected',
                                                              propertyOne:
                                                                  wrapStaticEfeitosAdversosRow
                                                                      .efeito,
                                                            );

                                                            safeSetState(() {});
                                                          },
                                                          child: Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              color: _model
                                                                          .effects
                                                                          .contains(wrapStaticEfeitosAdversosRow
                                                                              .efeito) ==
                                                                      true
                                                                  ? Color(
                                                                      0xFF6E78FF)
                                                                  : Color(
                                                                      0xFFDBE4F1),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          25.0),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          12.0,
                                                                          8.0,
                                                                          12.0,
                                                                          8.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Text(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      wrapStaticEfeitosAdversosRow
                                                                          .efeito,
                                                                      'effect',
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Mulish',
                                                                          color: _model.effects.contains(wrapStaticEfeitosAdversosRow.efeito) == true
                                                                              ? Colors.white
                                                                              : Color(0xFF8798B5),
                                                                          fontSize:
                                                                              12.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                        ),
                                                                  ),
                                                                  if (_model
                                                                          .effects
                                                                          .contains(
                                                                              wrapStaticEfeitosAdversosRow.efeito) ==
                                                                      true)
                                                                    Icon(
                                                                      Icons
                                                                          .close_sharp,
                                                                      color: Colors
                                                                          .white,
                                                                      size:
                                                                          14.0,
                                                                    ),
                                                                ].divide(SizedBox(
                                                                    width:
                                                                        8.0)),
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      }),
                                                    );
                                                  },
                                                ),
                                              ),
                                            ),
                                            if ((_model.effectsCustom
                                                    .isNotEmpty) ==
                                                true)
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 12.0, 0.0, 0.0),
                                                child: Container(
                                                  width: double.infinity,
                                                  decoration: BoxDecoration(),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(12.0, 0.0,
                                                                12.0, 24.0),
                                                    child: Builder(
                                                      builder: (context) {
                                                        final effecstCustom =
                                                            _model.effectsCustom
                                                                .toList();

                                                        return Wrap(
                                                          spacing: 12.0,
                                                          runSpacing: 12.0,
                                                          alignment:
                                                              WrapAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              WrapCrossAlignment
                                                                  .start,
                                                          direction:
                                                              Axis.horizontal,
                                                          runAlignment:
                                                              WrapAlignment
                                                                  .start,
                                                          verticalDirection:
                                                              VerticalDirection
                                                                  .down,
                                                          clipBehavior:
                                                              Clip.none,
                                                          children: List.generate(
                                                              effecstCustom
                                                                  .length,
                                                              (effecstCustomIndex) {
                                                            final effecstCustomItem =
                                                                effecstCustom[
                                                                    effecstCustomIndex];
                                                            return InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                if (_model
                                                                        .effects
                                                                        .contains(
                                                                            effecstCustomItem) ==
                                                                    true) {
                                                                  _model.removeFromEffects(
                                                                      effecstCustomItem);
                                                                  safeSetState(
                                                                      () {});
                                                                } else {
                                                                  _model.addToEffects(
                                                                      effecstCustomItem);
                                                                  safeSetState(
                                                                      () {});
                                                                }

                                                                _model.apiResultgd4vergfrv =
                                                                    await SegmentGroup
                                                                        .trackingCall
                                                                        .call(
                                                                  userId:
                                                                      currentUserUid,
                                                                  eventName:
                                                                      'side-effect selected',
                                                                  propertyOne:
                                                                      effecstCustomItem,
                                                                );

                                                                safeSetState(
                                                                    () {});
                                                              },
                                                              child: Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: _model.effects.contains(
                                                                              effecstCustomItem) ==
                                                                          true
                                                                      ? Color(
                                                                          0xFF6E78FF)
                                                                      : Color(
                                                                          0xFFDBE4F1),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              25.0),
                                                                ),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          12.0,
                                                                          8.0,
                                                                          12.0,
                                                                          8.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .min,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Text(
                                                                        effecstCustomItem,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Mulish',
                                                                              color: _model.effects.contains(effecstCustomItem) == true ? Colors.white : Color(0xFF8798B5),
                                                                              fontSize: 12.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w600,
                                                                            ),
                                                                      ),
                                                                      if (_model
                                                                              .effects
                                                                              .contains(effecstCustomItem) ==
                                                                          true)
                                                                        Icon(
                                                                          Icons
                                                                              .close_sharp,
                                                                          color:
                                                                              Colors.white,
                                                                          size:
                                                                              14.0,
                                                                        ),
                                                                    ].divide(SizedBox(
                                                                        width:
                                                                            8.0)),
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                          }),
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ),
                                          ],
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12.0, 0.0, 12.0, 0.0),
                                          child: Container(
                                            width: double.infinity,
                                            height: 3.0,
                                            decoration: BoxDecoration(
                                              color: Color(0x41E0E3E7),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12.0, 12.0, 0.0, 0.0),
                                          child: Text(
                                            'Outros efeitos',
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Mulish',
                                                  color: Color(0xFF434854),
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w800,
                                                ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12.0, 12.0, 12.0, 0.0),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Container(
                                              width: double.infinity,
                                              height: 48.0,
                                              decoration: BoxDecoration(
                                                color: Color(0xFFF7FAFE),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                border: Border.all(
                                                  color: (_model.efeitoCustomFocusNode
                                                                  ?.hasFocus ??
                                                              false) ==
                                                          true
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .primary
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .alternate,
                                                ),
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Expanded(
                                                    child: TextFormField(
                                                      controller: _model
                                                          .efeitoCustomTextController,
                                                      focusNode: _model
                                                          .efeitoCustomFocusNode,
                                                      autofocus: false,
                                                      obscureText: false,
                                                      decoration:
                                                          InputDecoration(
                                                        hintText: 'Outro',
                                                        hintStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Mulish',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: Color(
                                                                0x00000000),
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: Color(
                                                                0x00000000),
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        errorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        focusedErrorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        contentPadding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    18.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Mulish',
                                                            letterSpacing: 0.0,
                                                          ),
                                                      validator: _model
                                                          .efeitoCustomTextControllerValidator
                                                          .asValidator(context),
                                                    ),
                                                  ),
                                                  FlutterFlowIconButton(
                                                    buttonSize: 52.0,
                                                    fillColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                    icon: Icon(
                                                      Icons.add,
                                                      color: Colors.white,
                                                      size: 24.0,
                                                    ),
                                                    onPressed: () async {
                                                      _model.addToEffectsCustom(
                                                          _model
                                                              .efeitoCustomTextController
                                                              .text);
                                                      safeSetState(() {});
                                                      safeSetState(() {
                                                        _model
                                                            .efeitoCustomTextController
                                                            ?.clear();
                                                      });
                                                      _model.apiResultgd4vergwh =
                                                          await SegmentGroup
                                                              .trackingCall
                                                              .call(
                                                        userId: currentUserUid,
                                                        eventName:
                                                            'new- side-effect added',
                                                      );

                                                      safeSetState(() {});
                                                    },
                                                  ),
                                                ],
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
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24.0, 12.0, 24.0, 24.0),
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFEFF4F9),
                                    borderRadius: BorderRadius.circular(9.0),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 18.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12.0, 12.0, 0.0, 0.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                width: 32.0,
                                                height: 32.0,
                                                decoration: BoxDecoration(
                                                  color: Color(0xFF8798B5),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Icon(
                                                      Icons.chat_outlined,
                                                      color: Color(0x9AF7F9FA),
                                                      size: 24.0,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 12.0, 8.0, 0.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Observações',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Mulish',
                                                            color: Color(
                                                                0xFF434854),
                                                            fontSize: 16.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w800,
                                                          ),
                                                    ),
                                                    Text(
                                                      'Você tem alguma observação sobre saúde que gostaria de compartilhar hoje?',
                                                      textAlign:
                                                          TextAlign.start,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Mulish',
                                                            color: Color(
                                                                0xFF434854),
                                                            fontSize: 14.0,
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ].divide(
                                                      SizedBox(height: 4.0)),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, -1.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 24.0, 8.0, 0.0),
                                            child: TextFormField(
                                              controller:
                                                  _model.textController2,
                                              focusNode:
                                                  _model.textFieldFocusNode,
                                              onChanged: (_) =>
                                                  EasyDebounce.debounce(
                                                '_model.textController2',
                                                Duration(milliseconds: 2000),
                                                () async {
                                                  _model.apiResultgd4vergCopy =
                                                      await SegmentGroup
                                                          .trackingCall
                                                          .call(
                                                    userId: currentUserUid,
                                                    eventName:
                                                        'observation tiped',
                                                  );

                                                  safeSetState(() {});
                                                },
                                              ),
                                              autofocus: false,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                isDense: false,
                                                hintText: 'Escreva..',
                                                hintStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily: 'Mulish',
                                                          color:
                                                              Color(0xFF8798B5),
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
                                                fillColor: Color(0xFFF7FAFE),
                                                contentPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(18.0, 32.0,
                                                            18.0, 0.0),
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Mulish',
                                                        letterSpacing: 0.0,
                                                      ),
                                              maxLines: 10,
                                              minLines: 5,
                                              validator: _model
                                                  .textController2Validator
                                                  .asValidator(context),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
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
                          onPressed: ((_model.mood == null) ||
                                  ((_model.effects.isNotEmpty) == false))
                              ? null
                              : () async {
                                  if (!((_model.mood == null) ||
                                      ((_model.effects.isNotEmpty) == false))) {
                                    _model.apiResult7x9 =
                                        await SendBemViverResponseCall.call(
                                      responseJson: _model.respostas,
                                      humor: _model.mood,
                                      adversosList: _model.effects,
                                      observacoes: _model.textController2.text,
                                    );

                                    Navigator.pop(context);
                                  }

                                  safeSetState(() {});
                                },
                          text: 'Salvar',
                          options: FFButtonOptions(
                            width: double.infinity,
                            height: 48.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: (_model.mood == null) ||
                                    ((_model.effects.isNotEmpty) == false)
                                ? FlutterFlowTheme.of(context).alternate
                                : FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Mulish',
                                  color: (_model.mood == null) ||
                                          ((_model.effects.isNotEmpty) == false)
                                      ? Color(0x6414181B)
                                      : Colors.white,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                ),
                            elevation: 3.0,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                            disabledColor:
                                FlutterFlowTheme.of(context).alternate,
                            disabledTextColor: Color(0x6414181B),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
