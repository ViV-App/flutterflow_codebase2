import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'wb_diary_model.dart';
export 'wb_diary_model.dart';

class WbDiaryWidget extends StatefulWidget {
  const WbDiaryWidget({
    super.key,
    this.paciente,
  });

  final int? paciente;

  @override
  State<WbDiaryWidget> createState() => _WbDiaryWidgetState();
}

class _WbDiaryWidgetState extends State<WbDiaryWidget> {
  late WbDiaryModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WbDiaryModel());

    _model.efeitoCustomTextController ??= TextEditingController();
    _model.efeitoCustomFocusNode ??= FocusNode();

    _model.textController2 ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

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
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(0.0),
              bottomRight: Radius.circular(0.0),
              topLeft: Radius.circular(24.0),
              topRight: Radius.circular(24.0),
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
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Align(
                            alignment: const AlignmentDirectional(0.0, -1.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 12.0, 0.0, 0.0),
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
                          Align(
                            alignment: const AlignmentDirectional(0.0, -1.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 20.0, 0.0, 0.0),
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
                          Align(
                            alignment: const AlignmentDirectional(0.0, -1.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 8.0, 0.0, 0.0),
                              child: Text(
                                'É importante que você responda com sinceridade.',
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Mulish',
                                      color: const Color(0xFF42526D),
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
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: const BoxDecoration(),
                      child: SingleChildScrollView(
                        primary: false,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  24.0, 32.0, 24.0, 0.0),
                              child: Container(
                                width: double.infinity,
                                height: 147.0,
                                decoration: BoxDecoration(
                                  color: const Color(0xFFEFF4F9),
                                  borderRadius: BorderRadius.circular(9.0),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          12.0, 12.0, 0.0, 0.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Como você está se sentindo hoje?',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Mulish',
                                                  color: const Color(0xFF434854),
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w800,
                                                ),
                                          ),
                                          Text(
                                            'Como você avalia seu humor no geral?',
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Mulish',
                                                  color: const Color(0xFF434854),
                                                  fontSize: 14.0,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ].divide(const SizedBox(height: 4.0)),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
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
                                                _model.mood = 0;
                                                setState(() {});
                                              },
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                child: Container(
                                                  width: 75.0,
                                                  height: 60.0,
                                                  decoration: BoxDecoration(
                                                    color: _model.mood == 0
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
                                                            .center,
                                                    children: [
                                                      ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
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
                                          Expanded(
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                _model.mood = 1;
                                                setState(() {});
                                              },
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                child: Container(
                                                  width: 75.0,
                                                  height: 60.0,
                                                  decoration: BoxDecoration(
                                                    color: _model.mood == 1
                                                        ? FlutterFlowTheme.of(
                                                                context)
                                                            .primary
                                                        : Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    border: Border.all(
                                                      color: _model.mood == 1
                                                          ? const Color(0xFFFFCFA4)
                                                          : const Color(0x00FFA4A4),
                                                    ),
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
                                                                .circular(8.0),
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
                                                _model.mood = 2;
                                                setState(() {});
                                              },
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                child: Container(
                                                  width: 75.0,
                                                  height: 60.0,
                                                  decoration: BoxDecoration(
                                                    color: _model.mood == 2
                                                        ? FlutterFlowTheme.of(
                                                                context)
                                                            .primary
                                                        : Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    border: Border.all(
                                                      color: _model.mood == 2
                                                          ? const Color(0xFFEEE8B0)
                                                          : const Color(0x00EEE8B0),
                                                    ),
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
                                                                .circular(8.0),
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
                                                _model.mood = 3;
                                                setState(() {});
                                              },
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                child: Container(
                                                  width: 75.0,
                                                  height: 60.0,
                                                  decoration: BoxDecoration(
                                                    color: _model.mood == 3
                                                        ? FlutterFlowTheme.of(
                                                                context)
                                                            .primary
                                                        : Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    border: Border.all(
                                                      color: _model.mood == 3
                                                          ? const Color(0xFFB9EEB0)
                                                          : const Color(0x01FFA4A4),
                                                    ),
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
                                                                .circular(8.0),
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
                                                _model.mood = 4;
                                                setState(() {});
                                              },
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                child: Container(
                                                  width: 75.0,
                                                  height: 60.0,
                                                  decoration: BoxDecoration(
                                                    color: _model.mood == 4
                                                        ? FlutterFlowTheme.of(
                                                                context)
                                                            .primary
                                                        : Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    border: Border.all(
                                                      color: _model.mood == 4
                                                          ? const Color(0xFF75C3FB)
                                                          : const Color(0x01FFA4A4),
                                                    ),
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
                                                                .circular(8.0),
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
                                        ].divide(const SizedBox(width: 12.0)),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  24.0, 12.0, 24.0, 0.0),
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: const Color(0xFFEFF4F9),
                                  borderRadius: BorderRadius.circular(9.0),
                                ),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 18.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
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
                                                color: const Color(0xFFFFA29F),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              child: const Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                    Icons.tag_faces_outlined,
                                                    color: Color(0x9AF7F9FA),
                                                    size: 24.0,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 12.0, 0.0, 0.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Ansiedade',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Mulish',
                                                          color:
                                                              const Color(0xFF434854),
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w800,
                                                        ),
                                                  ),
                                                  Text(
                                                    'Como você avalia sua ansiedade de 0 a 4?',
                                                    textAlign: TextAlign.center,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Mulish',
                                                          color:
                                                              const Color(0xFF434854),
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ].divide(const SizedBox(height: 4.0)),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            12.0, 24.0, 12.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Sem \nansiedade',
                                              textAlign: TextAlign.center,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Mulish',
                                                    color: const Color(0xFF434854),
                                                    fontSize: 11.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                            ),
                                            Builder(
                                              builder: (context) {
                                                final opt01 =
                                                    _model.intOptions.toList();
                                                return Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: List.generate(
                                                      opt01.length,
                                                      (opt01Index) {
                                                    final opt01Item =
                                                        opt01[opt01Index];
                                                    return InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        _model.ansiedade =
                                                            opt01Item;
                                                        setState(() {});
                                                      },
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Text(
                                                            opt01Item
                                                                .toString(),
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
                                                          if (_model
                                                                  .ansiedade ==
                                                              opt01Item)
                                                            Icon(
                                                              Icons
                                                                  .check_circle,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                              size: 24.0,
                                                            ),
                                                          if (_model
                                                                  .ansiedade !=
                                                              opt01Item)
                                                            const Icon(
                                                              Icons
                                                                  .circle_outlined,
                                                              color: Color(
                                                                  0xFF8798B5),
                                                              size: 24.0,
                                                            ),
                                                        ],
                                                      ),
                                                    );
                                                  }).divide(
                                                      const SizedBox(width: 8.0)),
                                                );
                                              },
                                            ),
                                            Text(
                                              'Muita \nansiedade',
                                              textAlign: TextAlign.center,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Mulish',
                                                    color: const Color(0xFF434854),
                                                    fontSize: 11.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
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
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  24.0, 12.0, 24.0, 0.0),
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: const Color(0xFFEFF4F9),
                                  borderRadius: BorderRadius.circular(9.0),
                                ),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 18.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
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
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              child: const Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                    Icons.bed_sharp,
                                                    color: Color(0xFCF7F9FA),
                                                    size: 24.0,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 12.0, 0.0, 0.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Sono',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Mulish',
                                                          color:
                                                              const Color(0xFF434854),
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w800,
                                                        ),
                                                  ),
                                                  Text(
                                                    'Como você avalia seu sono de 0 a 4?',
                                                    textAlign: TextAlign.center,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Mulish',
                                                          color:
                                                              const Color(0xFF434854),
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ].divide(const SizedBox(height: 4.0)),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            12.0, 24.0, 12.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Não dormi\nnada',
                                              textAlign: TextAlign.center,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Mulish',
                                                    color: const Color(0xFF434854),
                                                    fontSize: 11.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                            ),
                                            Builder(
                                              builder: (context) {
                                                final opt01 =
                                                    _model.intOptions.toList();
                                                return Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: List.generate(
                                                      opt01.length,
                                                      (opt01Index) {
                                                    final opt01Item =
                                                        opt01[opt01Index];
                                                    return InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        _model.sono = opt01Item;
                                                        setState(() {});
                                                      },
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Text(
                                                            opt01Item
                                                                .toString(),
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
                                                          if (_model.sono ==
                                                              opt01Item)
                                                            Icon(
                                                              Icons
                                                                  .check_circle,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                              size: 24.0,
                                                            ),
                                                          if (_model.sono !=
                                                              opt01Item)
                                                            const Icon(
                                                              Icons
                                                                  .circle_outlined,
                                                              color: Color(
                                                                  0xFF8798B5),
                                                              size: 24.0,
                                                            ),
                                                        ],
                                                      ),
                                                    );
                                                  }).divide(
                                                      const SizedBox(width: 8.0)),
                                                );
                                              },
                                            ),
                                            Text(
                                              'Dormi \nmuito bem',
                                              textAlign: TextAlign.center,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Mulish',
                                                    color: const Color(0xFF434854),
                                                    fontSize: 11.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
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
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  24.0, 12.0, 24.0, 0.0),
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: const Color(0xFFEFF4F9),
                                  borderRadius: BorderRadius.circular(9.0),
                                ),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 18.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
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
                                                color: const Color(0xFFEEE8B0),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              child: const Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                    Icons
                                                        .remove_circle_outline_rounded,
                                                    color: Color(0xFCF7F9FA),
                                                    size: 24.0,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 12.0, 0.0, 0.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Dor',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Mulish',
                                                          color:
                                                              const Color(0xFF434854),
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w800,
                                                        ),
                                                  ),
                                                  Text(
                                                    'Como você avalia sua dor de 0 a 4?',
                                                    textAlign: TextAlign.center,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Mulish',
                                                          color:
                                                              const Color(0xFF434854),
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ].divide(const SizedBox(height: 4.0)),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            12.0, 24.0, 12.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Nenhuma \ndor',
                                              textAlign: TextAlign.center,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Mulish',
                                                    color: const Color(0xFF434854),
                                                    fontSize: 11.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                            ),
                                            Builder(
                                              builder: (context) {
                                                final opt01 =
                                                    _model.intOptions.toList();
                                                return Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: List.generate(
                                                      opt01.length,
                                                      (opt01Index) {
                                                    final opt01Item =
                                                        opt01[opt01Index];
                                                    return InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        _model.dor = opt01Item;
                                                        setState(() {});
                                                      },
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Text(
                                                            opt01Item
                                                                .toString(),
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
                                                          if (_model.dor ==
                                                              opt01Item)
                                                            Icon(
                                                              Icons
                                                                  .check_circle,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                              size: 24.0,
                                                            ),
                                                          if (_model.dor !=
                                                              opt01Item)
                                                            const Icon(
                                                              Icons
                                                                  .circle_outlined,
                                                              color: Color(
                                                                  0xFF8798B5),
                                                              size: 24.0,
                                                            ),
                                                        ],
                                                      ),
                                                    );
                                                  }).divide(
                                                      const SizedBox(width: 8.0)),
                                                );
                                              },
                                            ),
                                            Text(
                                              'Muita dor',
                                              textAlign: TextAlign.center,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Mulish',
                                                    color: const Color(0xFF434854),
                                                    fontSize: 11.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
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
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  24.0, 12.0, 24.0, 0.0),
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: const Color(0xFFEFF4F9),
                                  borderRadius: BorderRadius.circular(9.0),
                                ),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 18.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
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
                                                color: const Color(0xFF75C3FB),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              child: const Column(
                                                mainAxisSize: MainAxisSize.max,
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
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 12.0, 0.0, 0.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Efeitos adversos',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Mulish',
                                                          color:
                                                              const Color(0xFF434854),
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w800,
                                                        ),
                                                  ),
                                                  Text(
                                                    'Você teve algum efeito colateral hoje?',
                                                    textAlign: TextAlign.center,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Mulish',
                                                          color:
                                                              const Color(0xFF434854),
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ].divide(const SizedBox(height: 4.0)),
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
                                            decoration: const BoxDecoration(),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
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
                                                    direction: Axis.horizontal,
                                                    runAlignment:
                                                        WrapAlignment.start,
                                                    verticalDirection:
                                                        VerticalDirection.down,
                                                    clipBehavior: Clip.none,
                                                    children: List.generate(
                                                        wrapStaticEfeitosAdversosRowList
                                                            .length,
                                                        (wrapIndex) {
                                                      final wrapStaticEfeitosAdversosRow =
                                                          wrapStaticEfeitosAdversosRowList[
                                                              wrapIndex];
                                                      return InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          if (_model.effects.contains(
                                                                  wrapStaticEfeitosAdversosRow
                                                                      .efeito) ==
                                                              true) {
                                                            _model.removeFromEffects(
                                                                wrapStaticEfeitosAdversosRow
                                                                    .efeito!);
                                                            setState(() {});
                                                          } else {
                                                            _model.addToEffects(
                                                                wrapStaticEfeitosAdversosRow
                                                                    .efeito!);
                                                            setState(() {});
                                                          }
                                                        },
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: _model
                                                                        .effects
                                                                        .contains(wrapStaticEfeitosAdversosRow
                                                                            .efeito) ==
                                                                    true
                                                                ? const Color(
                                                                    0xFF6E78FF)
                                                                : const Color(
                                                                    0xFFDBE4F1),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        25.0),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
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
                                                                        color: _model.effects.contains(wrapStaticEfeitosAdversosRow.efeito) ==
                                                                                true
                                                                            ? Colors.white
                                                                            : const Color(0xFF8798B5),
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
                                                                  const Icon(
                                                                    Icons
                                                                        .close_sharp,
                                                                    color: Colors
                                                                        .white,
                                                                    size: 14.0,
                                                                  ),
                                                              ].divide(const SizedBox(
                                                                  width: 8.0)),
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
                                          if ((_model
                                                  .effectsCustom.isNotEmpty) ==
                                              true)
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 12.0, 0.0, 0.0),
                                              child: Container(
                                                width: double.infinity,
                                                decoration: const BoxDecoration(),
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(12.0, 0.0, 12.0,
                                                          24.0),
                                                  child: Builder(
                                                    builder: (context) {
                                                      final effecstCustom =
                                                          _model.effectsCustom
                                                              .toList();
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
                                                              if (_model.effects
                                                                      .contains(
                                                                          effecstCustomItem) ==
                                                                  true) {
                                                                _model.removeFromEffects(
                                                                    effecstCustomItem);
                                                                setState(() {});
                                                              } else {
                                                                _model.addToEffects(
                                                                    effecstCustomItem);
                                                                setState(() {});
                                                              }
                                                            },
                                                            child: Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: _model
                                                                            .effects
                                                                            .contains(
                                                                                effecstCustomItem) ==
                                                                        true
                                                                    ? const Color(
                                                                        0xFF6E78FF)
                                                                    : const Color(
                                                                        0xFFDBE4F1),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            25.0),
                                                              ),
                                                              child: Padding(
                                                                padding: const EdgeInsetsDirectional
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
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Mulish',
                                                                            color: _model.effects.contains(effecstCustomItem) == true
                                                                                ? Colors.white
                                                                                : const Color(0xFF8798B5),
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
                                                                            .contains(effecstCustomItem) ==
                                                                        true)
                                                                      const Icon(
                                                                        Icons
                                                                            .close_sharp,
                                                                        color: Colors
                                                                            .white,
                                                                        size:
                                                                            14.0,
                                                                      ),
                                                                  ].divide(const SizedBox(
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
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            12.0, 0.0, 12.0, 0.0),
                                        child: Container(
                                          width: double.infinity,
                                          height: 3.0,
                                          decoration: const BoxDecoration(
                                            color: Color(0x41E0E3E7),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            12.0, 12.0, 0.0, 0.0),
                                        child: Text(
                                          'Outros efeitos',
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Mulish',
                                                color: const Color(0xFF434854),
                                                fontSize: 16.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w800,
                                              ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            12.0, 12.0, 12.0, 0.0),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          child: Container(
                                            width: double.infinity,
                                            height: 48.0,
                                            decoration: BoxDecoration(
                                              color: const Color(0xFFF7FAFE),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              border: Border.all(
                                                color:
                                                    (_model.efeitoCustomFocusNode
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
                                                    decoration: InputDecoration(
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
                                                        borderSide: const BorderSide(
                                                          color:
                                                              Color(0x00000000),
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide: const BorderSide(
                                                          color:
                                                              Color(0x00000000),
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      errorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      focusedErrorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      contentPadding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  18.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Mulish',
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
                                                  icon: const Icon(
                                                    Icons.add,
                                                    color: Colors.white,
                                                    size: 24.0,
                                                  ),
                                                  onPressed: () async {
                                                    _model.addToEffectsCustom(_model
                                                        .efeitoCustomTextController
                                                        .text);
                                                    setState(() {});
                                                    setState(() {
                                                      _model
                                                          .efeitoCustomTextController
                                                          ?.clear();
                                                    });
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
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  24.0, 12.0, 24.0, 24.0),
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: const Color(0xFFEFF4F9),
                                  borderRadius: BorderRadius.circular(9.0),
                                ),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 18.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
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
                                                color: const Color(0xFF8798B5),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              child: const Column(
                                                mainAxisSize: MainAxisSize.max,
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
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 12.0, 8.0, 0.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Observações',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Mulish',
                                                          color:
                                                              const Color(0xFF434854),
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w800,
                                                        ),
                                                  ),
                                                  Text(
                                                    'Você tem alguma observação sobre saúde que gostaria de compartilhar hoje?',
                                                    textAlign: TextAlign.start,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Mulish',
                                                          color:
                                                              const Color(0xFF434854),
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ].divide(const SizedBox(height: 4.0)),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(0.0, -1.0),
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 24.0, 8.0, 0.0),
                                          child: TextFormField(
                                            controller: _model.textController2,
                                            focusNode:
                                                _model.textFieldFocusNode,
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
                                                            const Color(0xFF8798B5),
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
                                                      .fromSTEB(18.0, 32.0,
                                                          18.0, 0.0),
                                            ),
                                            style: FlutterFlowTheme.of(context)
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
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          24.0, 12.0, 24.0, 24.0),
                      child: FFButtonWidget(
                        onPressed: ((_model.mood == null) ||
                                (_model.ansiedade == null) ||
                                (_model.sono == null) ||
                                ((_model.effects.isNotEmpty) == false) ||
                                (_model.dor == null))
                            ? null
                            : () async {
                                await BemEstarTable().insert({
                                  'paciente': FFAppState().paciente.id,
                                  'ansiedade': _model.ansiedade,
                                  'dor': _model.dor,
                                  'humor': _model.mood,
                                  'sono': _model.sono,
                                  'sintomas': _model.effects,
                                  'observacao': _model.textController2.text,
                                });
                                FFAppState().ultimoRegistroDiario =
                                    getCurrentTimestamp;
                                FFAppState().update(() {});
                                Navigator.pop(context);
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
                          disabledTextColor: const Color(0x6414181B),
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
    );
  }
}
