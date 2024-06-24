import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'planos_premium_model.dart';
export 'planos_premium_model.dart';

class PlanosPremiumWidget extends StatefulWidget {
  const PlanosPremiumWidget({super.key});

  @override
  State<PlanosPremiumWidget> createState() => _PlanosPremiumWidgetState();
}

class _PlanosPremiumWidgetState extends State<PlanosPremiumWidget> {
  late PlanosPremiumModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PlanosPremiumModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
              crossAxisAlignment: CrossAxisAlignment.start,
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
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 32.0,
                          ),
                        ),
                        Text(
                          'Planos de assinatura',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Mulish',
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        const Icon(
                          Icons.add,
                          color: Color(0x005D67E2),
                          size: 32.0,
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              24.0, 32.0, 24.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Seja premium e garanta várias vantagens! ⭐',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Mulish',
                                      fontSize: 24.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w800,
                                      lineHeight: 1.5,
                                    ),
                              ),
                              Text(
                                'Entenda as vantagens que você pode garantir assinando um dos nossos planos!',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Mulish',
                                      color: const Color(0xFF42526D),
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ].divide(const SizedBox(height: 8.0)),
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(0.0, -1.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                24.0, 42.0, 24.0, 0.0),
                            child: Material(
                              color: Colors.transparent,
                              elevation: 2.0,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(8.0),
                                  bottomRight: Radius.circular(8.0),
                                  topLeft: Radius.circular(8.0),
                                  topRight: Radius.circular(8.0),
                                ),
                              ),
                              child: ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(8.0),
                                  bottomRight: Radius.circular(8.0),
                                  topLeft: Radius.circular(8.0),
                                  topRight: Radius.circular(8.0),
                                ),
                                child: Container(
                                  width: double.infinity,
                                  height: 420.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(8.0),
                                      bottomRight: Radius.circular(8.0),
                                      topLeft: Radius.circular(8.0),
                                      topRight: Radius.circular(8.0),
                                    ),
                                    border: Border.all(
                                      color: const Color(0xFFEFF4F9),
                                      width: 2.0,
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    18.0, 12.0, 1.0, 12.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  '🔰',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Mulish',
                                                        fontSize: 24.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                                Text(
                                                  'Básico',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Mulish',
                                                        color:
                                                            const Color(0xFF434854),
                                                        fontSize: 18.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w800,
                                                      ),
                                                ),
                                                Text(
                                                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut et massa mi.',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Mulish',
                                                        color:
                                                            const Color(0xFF434854),
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Container(
                                          width: double.infinity,
                                          height: 100.0,
                                          decoration: const BoxDecoration(
                                            color: Color(0xFFEFF4F9),
                                          ),
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    18.0, 18.0, 18.0, 10.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'R\$89',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Mulish',
                                                        color:
                                                            const Color(0xFF434854),
                                                        fontSize: 28.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w800,
                                                      ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 12.0, 0.0, 0.0),
                                                  child: Text(
                                                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut et massa mi.',
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
                                                ),
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 14.0, 0.0, 0.0),
                                                  child: FFButtonWidget(
                                                    onPressed: () {
                                                      print(
                                                          'Button pressed ...');
                                                    },
                                                    text: 'Assinar agora',
                                                    options: FFButtonOptions(
                                                      width: double.infinity,
                                                      height: 48.0,
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  24.0,
                                                                  0.0,
                                                                  24.0,
                                                                  0.0),
                                                      iconPadding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                fontFamily:
                                                                    'Mulish',
                                                                color: Colors
                                                                    .white,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                      elevation: 0.0,
                                                      borderSide: const BorderSide(
                                                        color:
                                                            Colors.transparent,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 12.0,
                                                                0.0, 0.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: [
                                                            const Icon(
                                                              Icons
                                                                  .check_rounded,
                                                              color: Color(
                                                                  0xFF6E78FF),
                                                              size: 20.0,
                                                            ),
                                                            Text(
                                                              'Vantagem',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Mulish',
                                                                    color: const Color(
                                                                        0xFF434854),
                                                                    fontSize:
                                                                        16.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                          ].divide(const SizedBox(
                                                              width: 8.0)),
                                                        ),
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: [
                                                            const Icon(
                                                              Icons
                                                                  .check_rounded,
                                                              color: Color(
                                                                  0xFF6E78FF),
                                                              size: 20.0,
                                                            ),
                                                            Text(
                                                              'Vantagem',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Mulish',
                                                                    color: const Color(
                                                                        0xFF434854),
                                                                    fontSize:
                                                                        16.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                          ].divide(const SizedBox(
                                                              width: 8.0)),
                                                        ),
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: [
                                                            const Icon(
                                                              Icons
                                                                  .check_rounded,
                                                              color: Color(
                                                                  0xFF6E78FF),
                                                              size: 20.0,
                                                            ),
                                                            Text(
                                                              'Vantagem',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Mulish',
                                                                    color: const Color(
                                                                        0xFF434854),
                                                                    fontSize:
                                                                        16.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                          ].divide(const SizedBox(
                                                              width: 8.0)),
                                                        ),
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: [
                                                            const Icon(
                                                              Icons
                                                                  .check_rounded,
                                                              color: Color(
                                                                  0xFF6E78FF),
                                                              size: 20.0,
                                                            ),
                                                            Text(
                                                              'Vantagem',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Mulish',
                                                                    color: const Color(
                                                                        0xFF434854),
                                                                    fontSize:
                                                                        16.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                          ].divide(const SizedBox(
                                                              width: 8.0)),
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
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(0.0, -1.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                24.0, 42.0, 24.0, 0.0),
                            child: Material(
                              color: Colors.transparent,
                              elevation: 2.0,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(8.0),
                                  bottomRight: Radius.circular(8.0),
                                  topLeft: Radius.circular(8.0),
                                  topRight: Radius.circular(8.0),
                                ),
                              ),
                              child: ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(8.0),
                                  bottomRight: Radius.circular(8.0),
                                  topLeft: Radius.circular(8.0),
                                  topRight: Radius.circular(8.0),
                                ),
                                child: Container(
                                  width: double.infinity,
                                  height: 420.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(8.0),
                                      bottomRight: Radius.circular(8.0),
                                      topLeft: Radius.circular(8.0),
                                      topRight: Radius.circular(8.0),
                                    ),
                                    border: Border.all(
                                      color: const Color(0xFFEFF4F9),
                                      width: 2.0,
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    18.0, 12.0, 1.0, 12.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  '⭐️',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Mulish',
                                                        fontSize: 24.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                                Text(
                                                  'Pro',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Mulish',
                                                        color:
                                                            const Color(0xFF434854),
                                                        fontSize: 18.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w800,
                                                      ),
                                                ),
                                                Text(
                                                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut et massa mi.',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Mulish',
                                                        color:
                                                            const Color(0xFF434854),
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Container(
                                          width: double.infinity,
                                          height: 100.0,
                                          decoration: const BoxDecoration(
                                            color: Color(0xFFEFF4F9),
                                          ),
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    18.0, 18.0, 18.0, 10.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'R\$159',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Mulish',
                                                        color:
                                                            const Color(0xFF434854),
                                                        fontSize: 28.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w800,
                                                      ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 12.0, 0.0, 0.0),
                                                  child: Text(
                                                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut et massa mi.',
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
                                                ),
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 14.0, 0.0, 0.0),
                                                  child: FFButtonWidget(
                                                    onPressed: () {
                                                      print(
                                                          'Button pressed ...');
                                                    },
                                                    text: 'Assinar agora',
                                                    options: FFButtonOptions(
                                                      width: double.infinity,
                                                      height: 48.0,
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  24.0,
                                                                  0.0,
                                                                  24.0,
                                                                  0.0),
                                                      iconPadding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                fontFamily:
                                                                    'Mulish',
                                                                color: Colors
                                                                    .white,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                      elevation: 0.0,
                                                      borderSide: const BorderSide(
                                                        color:
                                                            Colors.transparent,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 12.0,
                                                                0.0, 0.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: [
                                                            const Icon(
                                                              Icons
                                                                  .check_rounded,
                                                              color: Color(
                                                                  0xFF6E78FF),
                                                              size: 20.0,
                                                            ),
                                                            Text(
                                                              'Vantagem',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Mulish',
                                                                    color: const Color(
                                                                        0xFF434854),
                                                                    fontSize:
                                                                        16.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                          ].divide(const SizedBox(
                                                              width: 8.0)),
                                                        ),
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: [
                                                            const Icon(
                                                              Icons
                                                                  .check_rounded,
                                                              color: Color(
                                                                  0xFF6E78FF),
                                                              size: 20.0,
                                                            ),
                                                            Text(
                                                              'Vantagem',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Mulish',
                                                                    color: const Color(
                                                                        0xFF434854),
                                                                    fontSize:
                                                                        16.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                          ].divide(const SizedBox(
                                                              width: 8.0)),
                                                        ),
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: [
                                                            const Icon(
                                                              Icons
                                                                  .check_rounded,
                                                              color: Color(
                                                                  0xFF6E78FF),
                                                              size: 20.0,
                                                            ),
                                                            Text(
                                                              'Vantagem',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Mulish',
                                                                    color: const Color(
                                                                        0xFF434854),
                                                                    fontSize:
                                                                        16.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                          ].divide(const SizedBox(
                                                              width: 8.0)),
                                                        ),
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: [
                                                            const Icon(
                                                              Icons
                                                                  .check_rounded,
                                                              color: Color(
                                                                  0xFF6E78FF),
                                                              size: 20.0,
                                                            ),
                                                            Text(
                                                              'Vantagem',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Mulish',
                                                                    color: const Color(
                                                                        0xFF434854),
                                                                    fontSize:
                                                                        16.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                          ].divide(const SizedBox(
                                                              width: 8.0)),
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
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(0.0, -1.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                24.0, 42.0, 24.0, 0.0),
                            child: Material(
                              color: Colors.transparent,
                              elevation: 2.0,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(8.0),
                                  bottomRight: Radius.circular(8.0),
                                  topLeft: Radius.circular(8.0),
                                  topRight: Radius.circular(8.0),
                                ),
                              ),
                              child: ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(8.0),
                                  bottomRight: Radius.circular(8.0),
                                  topLeft: Radius.circular(8.0),
                                  topRight: Radius.circular(8.0),
                                ),
                                child: Container(
                                  width: double.infinity,
                                  height: 420.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(8.0),
                                      bottomRight: Radius.circular(8.0),
                                      topLeft: Radius.circular(8.0),
                                      topRight: Radius.circular(8.0),
                                    ),
                                    border: Border.all(
                                      color: const Color(0xFFEFF4F9),
                                      width: 2.0,
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    18.0, 12.0, 1.0, 12.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  '👑',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Mulish',
                                                        fontSize: 24.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                                Text(
                                                  'Premium',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Mulish',
                                                        color:
                                                            const Color(0xFF434854),
                                                        fontSize: 18.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w800,
                                                      ),
                                                ),
                                                Text(
                                                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut et massa mi.',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Mulish',
                                                        color:
                                                            const Color(0xFF434854),
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Container(
                                          width: double.infinity,
                                          height: 100.0,
                                          decoration: const BoxDecoration(
                                            color: Color(0xFFEFF4F9),
                                          ),
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    18.0, 18.0, 18.0, 10.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'R\$299',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Mulish',
                                                        color:
                                                            const Color(0xFF434854),
                                                        fontSize: 28.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w800,
                                                      ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 12.0, 0.0, 0.0),
                                                  child: Text(
                                                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut et massa mi.',
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
                                                ),
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 14.0, 0.0, 0.0),
                                                  child: FFButtonWidget(
                                                    onPressed: () {
                                                      print(
                                                          'Button pressed ...');
                                                    },
                                                    text: 'Assinar agora',
                                                    options: FFButtonOptions(
                                                      width: double.infinity,
                                                      height: 48.0,
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  24.0,
                                                                  0.0,
                                                                  24.0,
                                                                  0.0),
                                                      iconPadding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                fontFamily:
                                                                    'Mulish',
                                                                color: Colors
                                                                    .white,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                      elevation: 0.0,
                                                      borderSide: const BorderSide(
                                                        color:
                                                            Colors.transparent,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 12.0,
                                                                0.0, 0.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: [
                                                            const Icon(
                                                              Icons
                                                                  .check_rounded,
                                                              color: Color(
                                                                  0xFF6E78FF),
                                                              size: 20.0,
                                                            ),
                                                            Text(
                                                              'Vantagem',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Mulish',
                                                                    color: const Color(
                                                                        0xFF434854),
                                                                    fontSize:
                                                                        16.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                          ].divide(const SizedBox(
                                                              width: 8.0)),
                                                        ),
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: [
                                                            const Icon(
                                                              Icons
                                                                  .check_rounded,
                                                              color: Color(
                                                                  0xFF6E78FF),
                                                              size: 20.0,
                                                            ),
                                                            Text(
                                                              'Vantagem',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Mulish',
                                                                    color: const Color(
                                                                        0xFF434854),
                                                                    fontSize:
                                                                        16.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                          ].divide(const SizedBox(
                                                              width: 8.0)),
                                                        ),
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: [
                                                            const Icon(
                                                              Icons
                                                                  .check_rounded,
                                                              color: Color(
                                                                  0xFF6E78FF),
                                                              size: 20.0,
                                                            ),
                                                            Text(
                                                              'Vantagem',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Mulish',
                                                                    color: const Color(
                                                                        0xFF434854),
                                                                    fontSize:
                                                                        16.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                          ].divide(const SizedBox(
                                                              width: 8.0)),
                                                        ),
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: [
                                                            const Icon(
                                                              Icons
                                                                  .check_rounded,
                                                              color: Color(
                                                                  0xFF6E78FF),
                                                              size: 20.0,
                                                            ),
                                                            Text(
                                                              'Vantagem',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Mulish',
                                                                    color: const Color(
                                                                        0xFF434854),
                                                                    fontSize:
                                                                        16.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                          ].divide(const SizedBox(
                                                              width: 8.0)),
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
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ]
                          .addToStart(const SizedBox(height: 4.0))
                          .addToEnd(const SizedBox(height: 32.0)),
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
