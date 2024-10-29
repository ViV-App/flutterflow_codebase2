import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/assistente_flow/assistant_menu/assistant_menu_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'chat_viv_model.dart';
export 'chat_viv_model.dart';

class ChatVivWidget extends StatefulWidget {
  const ChatVivWidget({super.key});

  @override
  State<ChatVivWidget> createState() => _ChatVivWidgetState();
}

class _ChatVivWidgetState extends State<ChatVivWidget> {
  late ChatVivModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatVivModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(const Duration(milliseconds: 500));
      _model.chat = await ChatTable().queryRows(
        queryFn: (q) => q.eq(
          'paciente',
          FFAppState().paciente.id,
        ),
      );
      await actions.unsubscribe(
        'mensagem',
      );
      await actions.subscribe(
        'mensagem',
        () async {
          await Future.delayed(const Duration(milliseconds: 500));
          await _model.columnController?.animateTo(
            _model.columnController!.position.maxScrollExtent,
            duration: Duration(milliseconds: 100),
            curve: Curves.ease,
          );
          await Future.delayed(const Duration(milliseconds: 500));
          await _model.columnController?.animateTo(
            _model.columnController!.position.maxScrollExtent,
            duration: Duration(milliseconds: 100),
            curve: Curves.ease,
          );
        },
        _model.chat!.first.id,
      );
      await _model.columnController?.animateTo(
        _model.columnController!.position.maxScrollExtent,
        duration: Duration(milliseconds: 100),
        curve: Curves.ease,
      );
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

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

    return FutureBuilder<List<ChatRow>>(
      future: ChatTable().querySingleRow(
        queryFn: (q) => q.eq(
          'paciente',
          FFAppState().paciente.id,
        ),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: Color(0xFFEFF4F9),
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
        List<ChatRow> chatVivChatRowList = snapshot.data!;

        final chatVivChatRow =
            chatVivChatRowList.isNotEmpty ? chatVivChatRowList.first : null;

        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: Color(0xFFEFF4F9),
            body: SafeArea(
              top: true,
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0x00FFFFFF),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 24.0,
                            color: Color(0x33000000),
                            offset: Offset(
                              0.0,
                              8.0,
                            ),
                          )
                        ],
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
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 32.0,
                              ),
                            ),
                            Text(
                              'Assistente ViV',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Mulish',
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            Icon(
                              Icons.add,
                              color: Color(0x015D67E2),
                              size: 32.0,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: FutureBuilder<List<MensagemRow>>(
                        future: MensagemTable().queryRows(
                          queryFn: (q) => q
                              .eq(
                                'chat',
                                chatVivChatRow?.id,
                              )
                              .order('created_at', ascending: true),
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
                          List<MensagemRow> columnMensagemRowList =
                              snapshot.data!;

                          if (columnMensagemRowList.isEmpty) {
                            return Image.asset(
                              'assets/images/Group_12947.png',
                              width: double.infinity,
                              height: MediaQuery.sizeOf(context).height * 0.8,
                            );
                          }

                          return SingleChildScrollView(
                            controller: _model.columnController,
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children:
                                  List.generate(columnMensagemRowList.length,
                                          (columnIndex) {
                                final columnMensagemRow =
                                    columnMensagemRowList[columnIndex];
                                return Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      18.0, 0.0, 18.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      if (columnMensagemRow.sender ==
                                          'Assistant')
                                        Align(
                                          alignment:
                                              AlignmentDirectional(-1.0, -1.0),
                                          child: Container(
                                            constraints: BoxConstraints(
                                              maxWidth: 350.0,
                                            ),
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              borderRadius: BorderRadius.only(
                                                bottomLeft:
                                                    Radius.circular(0.0),
                                                bottomRight:
                                                    Radius.circular(18.0),
                                                topLeft: Radius.circular(18.0),
                                                topRight: Radius.circular(18.0),
                                              ),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      12.0, 12.0, 12.0, 12.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Text(
                                                        'Assistente',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Mulish',
                                                              color: Color(
                                                                  0xFF262B37),
                                                              fontSize: 16.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                      ),
                                                    ],
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 12.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      valueOrDefault<String>(
                                                        columnMensagemRow
                                                            .message,
                                                        '-',
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Mulish',
                                                            color: Color(
                                                                0xFF434854),
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            1.0, 1.0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  12.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        dateTimeFormat(
                                                          "Hm",
                                                          columnMensagemRow
                                                              .createdAt,
                                                          locale:
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .languageCode,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
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
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      if (columnMensagemRow.sender == 'Pacient')
                                        Align(
                                          alignment:
                                              AlignmentDirectional(1.0, -1.0),
                                          child: Container(
                                            constraints: BoxConstraints(
                                              maxWidth: 350.0,
                                            ),
                                            decoration: BoxDecoration(
                                              color: Color(0xFFDBE4F1),
                                              borderRadius: BorderRadius.only(
                                                bottomLeft:
                                                    Radius.circular(18.0),
                                                bottomRight:
                                                    Radius.circular(0.0),
                                                topLeft: Radius.circular(18.0),
                                                topRight: Radius.circular(18.0),
                                              ),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      12.0, 12.0, 12.0, 12.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    valueOrDefault<String>(
                                                      columnMensagemRow.message,
                                                      '-',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Mulish',
                                                          color:
                                                              Color(0xFF434854),
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            1.0, 1.0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  12.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        dateTimeFormat(
                                                          "Hm",
                                                          columnMensagemRow
                                                              .createdAt,
                                                          locale:
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .languageCode,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
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
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                    ].divide(SizedBox(height: 18.0)),
                                  ),
                                );
                              })
                                      .divide(SizedBox(height: 18.0))
                                      .addToStart(SizedBox(height: 32.0))
                                      .addToEnd(SizedBox(height: 32.0)),
                            ),
                          );
                        },
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 80.0,
                      decoration: BoxDecoration(
                        color: Color(0x00FFFFFF),
                        border: Border.all(
                          color: Color(0xFFDBE4F1),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(14.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            if (responsiveVisibility(
                              context: context,
                              phone: false,
                              tablet: false,
                              tabletLandscape: false,
                              desktop: false,
                            ))
                              Align(
                                alignment: AlignmentDirectional(-1.0, 1.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    await showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      enableDrag: false,
                                      context: context,
                                      builder: (context) {
                                        return WebViewAware(
                                          child: GestureDetector(
                                            onTap: () => FocusScope.of(context)
                                                .unfocus(),
                                            child: Padding(
                                              padding: MediaQuery.viewInsetsOf(
                                                  context),
                                              child: AssistantMenuWidget(),
                                            ),
                                          ),
                                        );
                                      },
                                    ).then((value) => safeSetState(() {}));
                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(100.0),
                                    child: Container(
                                      width: 50.0,
                                      height: 50.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        borderRadius:
                                            BorderRadius.circular(100.0),
                                      ),
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.menu_sharp,
                                              color: Colors.white,
                                              size: 24.0,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            Expanded(
                              child: Container(
                                width: double.infinity,
                                height: double.infinity,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12.0, 0.0, 8.0, 0.0),
                                        child: TextFormField(
                                          controller: _model.textController,
                                          focusNode: _model.textFieldFocusNode,
                                          onChanged: (_) =>
                                              EasyDebounce.debounce(
                                            '_model.textController',
                                            Duration(milliseconds: 100),
                                            () => safeSetState(() {}),
                                          ),
                                          autofocus: false,
                                          textInputAction: TextInputAction.send,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            hintText: 'Digite sua mensagem',
                                            hintStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .override(
                                                      fontFamily: 'Mulish',
                                                      color: Color(0xFF8798B5),
                                                      letterSpacing: 0.0,
                                                    ),
                                            enabledBorder: InputBorder.none,
                                            focusedBorder: InputBorder.none,
                                            errorBorder: InputBorder.none,
                                            focusedErrorBorder:
                                                InputBorder.none,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Mulish',
                                                letterSpacing: 0.0,
                                              ),
                                          validator: _model
                                              .textControllerValidator
                                              .asValidator(context),
                                        ),
                                      ),
                                    ),
                                    if ((_model.textController.text != null &&
                                            _model.textController.text != '') &&
                                        (_model.waiting == false))
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 12.0, 0.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            await MensagemTable().insert({
                                              'message':
                                                  _model.textController.text,
                                              'sender': 'Pacient',
                                              'chat': chatVivChatRow?.id,
                                            });
                                            _model.typing = true;
                                            _model.lastM =
                                                _model.textController.text;
                                            _model.waiting = true;
                                            safeSetState(() {});
                                            safeSetState(() {
                                              _model.textController?.clear();
                                            });
                                            _model.apiResultt290 =
                                                await SenchatbCall.call(
                                              nome: FFAppState().paciente.nome,
                                              uid: currentUserUid,
                                              pacid: FFAppState().paciente.id,
                                              threadid:
                                                  chatVivChatRow?.threadId,
                                              chat: chatVivChatRow?.id,
                                              message: _model.lastM,
                                            );

                                            if (SenchatbCall.response(
                                                  (_model.apiResultt290
                                                          ?.jsonBody ??
                                                      ''),
                                                ) ==
                                                true) {
                                              _model.typing = false;
                                              _model.lastM = null;
                                              _model.waiting = false;
                                              safeSetState(() {});
                                            }

                                            safeSetState(() {});
                                          },
                                          child: Icon(
                                            Icons.send_outlined,
                                            color: Color(0xFF6E78FF),
                                            size: 32.0,
                                          ),
                                        ),
                                      ),
                                    if ((_model.textController.text == null ||
                                            _model.textController.text == '') &&
                                        (_model.typing != true))
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 12.0, 0.0),
                                        child: Icon(
                                          Icons.send_outlined,
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          size: 32.0,
                                        ),
                                      ),
                                    if (_model.typing == true)
                                      Lottie.asset(
                                        'assets/jsons/Animation_-_1718360753366.json',
                                        width: 72.0,
                                        height: 35.0,
                                        fit: BoxFit.contain,
                                        animate: true,
                                      ),
                                  ],
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
      },
    );
  }
}
