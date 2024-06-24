import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
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
      await Future.delayed(const Duration(milliseconds: 1000));
      await _model.mainColumn?.animateTo(
        _model.mainColumn!.position.maxScrollExtent,
        duration: const Duration(milliseconds: 100),
        curve: Curves.ease,
      );
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

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
            backgroundColor: const Color(0xFFEFF4F9),
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
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: const Color(0xFFEFF4F9),
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
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
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
                            const Icon(
                              Icons.add,
                              color: Color(0x015D67E2),
                              size: 32.0,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        height: 100.0,
                        decoration: const BoxDecoration(
                          color: Color(0x00FFFFFF),
                        ),
                        child: SingleChildScrollView(
                          controller: _model.mainColumn,
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              FutureBuilder<List<MensagemRow>>(
                                future: (_model.requestCompleter ??=
                                        Completer<List<MensagemRow>>()
                                          ..complete(MensagemTable().queryRows(
                                            queryFn: (q) => q.eq(
                                              'chat',
                                              chatVivChatRow?.id,
                                            ),
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
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                  List<MensagemRow> listViewMensagemRowList =
                                      snapshot.data!;
                                  if (listViewMensagemRowList.isEmpty) {
                                    return Image.asset(
                                      'assets/images/Group_12947.png',
                                      width: double.infinity,
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.8,
                                    );
                                  }
                                  return ListView.separated(
                                    padding: const EdgeInsets.fromLTRB(
                                      0,
                                      24.0,
                                      0,
                                      24.0,
                                    ),
                                    primary: false,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount: listViewMensagemRowList.length,
                                    separatorBuilder: (_, __) =>
                                        const SizedBox(height: 18.0),
                                    itemBuilder: (context, listViewIndex) {
                                      final listViewMensagemRow =
                                          listViewMensagemRowList[
                                              listViewIndex];
                                      return Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            18.0, 0.0, 18.0, 0.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            if (listViewMensagemRow.sender ==
                                                'Assistant')
                                              Align(
                                                alignment: const AlignmentDirectional(
                                                    -1.0, -1.0),
                                                child: Container(
                                                  constraints: const BoxConstraints(
                                                    maxWidth: 350.0,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    borderRadius:
                                                        const BorderRadius.only(
                                                      bottomLeft:
                                                          Radius.circular(0.0),
                                                      bottomRight:
                                                          Radius.circular(18.0),
                                                      topLeft:
                                                          Radius.circular(18.0),
                                                      topRight:
                                                          Radius.circular(18.0),
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                12.0,
                                                                12.0,
                                                                12.0,
                                                                12.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: [
                                                            ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                              child:
                                                                  Image.asset(
                                                                'assets/images/WhatsApp_Image_2024-05-29_at_11.06.19_AM.jpeg',
                                                                width: 32.0,
                                                                height: 32.0,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Text(
                                                                'Assistente',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Mulish',
                                                                      color: const Color(
                                                                          0xFF262B37),
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
                                                          ],
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      12.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Text(
                                                            valueOrDefault<
                                                                String>(
                                                              listViewMensagemRow
                                                                  .message,
                                                              '-',
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Mulish',
                                                                  color: const Color(
                                                                      0xFF434854),
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                        ),
                                                        Align(
                                                          alignment:
                                                              const AlignmentDirectional(
                                                                  1.0, 1.0),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        12.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              dateTimeFormat(
                                                                'Hm',
                                                                listViewMensagemRow
                                                                    .createdAt,
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
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            if (listViewMensagemRow.sender ==
                                                'Pacient')
                                              Align(
                                                alignment: const AlignmentDirectional(
                                                    1.0, -1.0),
                                                child: Container(
                                                  constraints: const BoxConstraints(
                                                    maxWidth: 350.0,
                                                  ),
                                                  decoration: const BoxDecoration(
                                                    color: Color(0xFFDBE4F1),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      bottomLeft:
                                                          Radius.circular(18.0),
                                                      bottomRight:
                                                          Radius.circular(0.0),
                                                      topLeft:
                                                          Radius.circular(18.0),
                                                      topRight:
                                                          Radius.circular(18.0),
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                12.0,
                                                                12.0,
                                                                12.0,
                                                                12.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          valueOrDefault<
                                                              String>(
                                                            listViewMensagemRow
                                                                .message,
                                                            '-',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Mulish',
                                                                color: const Color(
                                                                    0xFF434854),
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                        Align(
                                                          alignment:
                                                              const AlignmentDirectional(
                                                                  1.0, 1.0),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        12.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              dateTimeFormat(
                                                                'Hm',
                                                                listViewMensagemRow
                                                                    .createdAt,
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
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                          ].divide(const SizedBox(height: 18.0)),
                                        ),
                                      );
                                    },
                                    controller: _model.listViewController,
                                  );
                                },
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 0.0, 0.0),
                                child: SingleChildScrollView(
                                  primary: false,
                                  controller: _model.columnController,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      if (_model.typing == true)
                                        Align(
                                          alignment:
                                              const AlignmentDirectional(-1.0, -1.0),
                                          child: Lottie.asset(
                                            'assets/lottie_animations/Animation_-_1718360753366.json',
                                            width: 72.0,
                                            height: 72.0,
                                            fit: BoxFit.contain,
                                            animate: true,
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
                    Container(
                      width: double.infinity,
                      height: 80.0,
                      decoration: BoxDecoration(
                        color: const Color(0x00FFFFFF),
                        border: Border.all(
                          color: const Color(0xFFDBE4F1),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
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
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            12.0, 0.0, 8.0, 0.0),
                                        child: TextFormField(
                                          controller: _model.textController,
                                          focusNode: _model.textFieldFocusNode,
                                          autofocus: false,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            hintText: 'Digite sua mensagem',
                                            hintStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .override(
                                                      fontFamily: 'Mulish',
                                                      color: const Color(0xFF8798B5),
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
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 12.0, 0.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          _model.myMessage =
                                              await MensagemTable().insert({
                                            'chat': chatVivChatRow?.id,
                                            'sender': 'Pacient',
                                            'message':
                                                _model.textController.text,
                                          });
                                          _model.lastM =
                                              _model.textController.text;
                                          _model.typing = true;
                                          setState(() {});
                                          setState(() {
                                            _model.textController?.clear();
                                          });
                                          setState(() =>
                                              _model.requestCompleter = null);
                                          await _model
                                              .waitForRequestCompleted();
                                          await Future.delayed(const Duration(
                                              milliseconds: 500));
                                          await _model.mainColumn?.animateTo(
                                            _model.mainColumn!.position
                                                .maxScrollExtent,
                                            duration:
                                                const Duration(milliseconds: 100),
                                            curve: Curves.ease,
                                          );
                                          _model.apiResultt290 =
                                              await CallChatCall.call(
                                            nome: FFAppState().paciente.nome,
                                            uid: currentUserUid,
                                            pacid: FFAppState()
                                                .paciente
                                                .id
                                                .toString(),
                                            threadid: chatVivChatRow?.threadId,
                                            chat: chatVivChatRow?.id,
                                            message: _model.lastM,
                                          );

                                          await Future.delayed(const Duration(
                                              milliseconds: 1000));
                                          await _model.mainColumn?.animateTo(
                                            _model.mainColumn!.position
                                                .maxScrollExtent,
                                            duration:
                                                const Duration(milliseconds: 100),
                                            curve: Curves.ease,
                                          );
                                          await Future.delayed(const Duration(
                                              milliseconds: 5000));
                                          _model.typing = false;
                                          setState(() {});
                                          setState(() =>
                                              _model.requestCompleter = null);
                                          await _model
                                              .waitForRequestCompleted();
                                          await _model.mainColumn?.animateTo(
                                            _model.mainColumn!.position
                                                .maxScrollExtent,
                                            duration:
                                                const Duration(milliseconds: 100),
                                            curve: Curves.ease,
                                          );

                                          setState(() {});
                                        },
                                        child: const Icon(
                                          Icons.send_outlined,
                                          color: Color(0xFF6E78FF),
                                          size: 32.0,
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
