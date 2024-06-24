import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'agendar_consulta02_model.dart';
export 'agendar_consulta02_model.dart';

class AgendarConsulta02Widget extends StatefulWidget {
  const AgendarConsulta02Widget({super.key});

  @override
  State<AgendarConsulta02Widget> createState() =>
      _AgendarConsulta02WidgetState();
}

class _AgendarConsulta02WidgetState extends State<AgendarConsulta02Widget> {
  late AgendarConsulta02Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AgendarConsulta02Model());

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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          'Agendar consulta',
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
                          color: Color(0x015D67E2),
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
                              24.0, 12.0, 24.0, 0.0),
                          child: Text(
                            'Selecione o método de pagamento da sua preferencia.',
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
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 42.0, 0.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    18.0, 0.0, 18.0, 0.0),
                                child: Container(
                                  width: double.infinity,
                                  height: 64.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(8.0),
                                    border: Border.all(
                                      color: const Color(0xFF6E78FF),
                                      width: 2.0,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        18.0, 12.0, 18.0, 12.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              child: Image.asset(
                                                'assets/images/image_172.png',
                                                width: 24.0,
                                                height: 24.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            Text(
                                              'PIX',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Mulish',
                                                        color:
                                                            const Color(0xFF8798B5),
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ].divide(const SizedBox(width: 12.0)),
                                        ),
                                        const Icon(
                                          Icons.more_vert_rounded,
                                          color: Color(0xFF8798B5),
                                          size: 24.0,
                                        ),
                                      ].divide(const SizedBox(width: 12.0)),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    18.0, 0.0, 18.0, 0.0),
                                child: Container(
                                  width: double.infinity,
                                  height: 64.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(8.0),
                                    border: Border.all(
                                      color: const Color(0xFFDBE4F1),
                                      width: 2.0,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        18.0, 12.0, 18.0, 12.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              child: Image.asset(
                                                'assets/images/image_171.png',
                                                width: 24.0,
                                                height: 14.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Text(
                                                      'Crédito',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Mulish',
                                                            color: const Color(
                                                                0xFF434854),
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                    ),
                                                    Icon(
                                                      Icons.circle,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      size: 8.0,
                                                    ),
                                                    Text(
                                                      'Nubank mãe',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Mulish',
                                                            color: const Color(
                                                                0xFF8798B5),
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                          ),
                                                    ),
                                                  ].divide(
                                                      const SizedBox(width: 6.0)),
                                                ),
                                                Text(
                                                  '**** 5643',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Mulish',
                                                        color:
                                                            const Color(0xFF8798B5),
                                                        fontSize: 12.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ].divide(const SizedBox(height: 4.0)),
                                            ),
                                          ].divide(const SizedBox(width: 12.0)),
                                        ),
                                        const Icon(
                                          Icons.more_vert_rounded,
                                          color: Color(0xFF8798B5),
                                          size: 24.0,
                                        ),
                                      ].divide(const SizedBox(width: 12.0)),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    18.0, 0.0, 18.0, 0.0),
                                child: Container(
                                  width: double.infinity,
                                  height: 64.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(8.0),
                                    border: Border.all(
                                      color: const Color(0xFFDBE4F1),
                                      width: 2.0,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        18.0, 12.0, 18.0, 12.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              child: Image.asset(
                                                'assets/images/image_171.png',
                                                width: 24.0,
                                                height: 14.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Text(
                                                      'Débito',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Mulish',
                                                            color: const Color(
                                                                0xFF434854),
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                    ),
                                                    Icon(
                                                      Icons.circle,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      size: 8.0,
                                                    ),
                                                    Text(
                                                      'C6bank',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Mulish',
                                                            color: const Color(
                                                                0xFF8798B5),
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                          ),
                                                    ),
                                                  ].divide(
                                                      const SizedBox(width: 6.0)),
                                                ),
                                                Text(
                                                  '**** 5643',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Mulish',
                                                        color:
                                                            const Color(0xFF8798B5),
                                                        fontSize: 12.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ].divide(const SizedBox(height: 4.0)),
                                            ),
                                          ].divide(const SizedBox(width: 12.0)),
                                        ),
                                        const Icon(
                                          Icons.more_vert_rounded,
                                          color: Color(0xFF8798B5),
                                          size: 24.0,
                                        ),
                                      ].divide(const SizedBox(width: 12.0)),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    18.0, 0.0, 18.0, 0.0),
                                child: Container(
                                  width: double.infinity,
                                  height: 64.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(8.0),
                                    border: Border.all(
                                      color: const Color(0xFFDBE4F1),
                                      width: 2.0,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        18.0, 12.0, 18.0, 12.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            const Icon(
                                              Icons.add,
                                              color: Color(0xFF8798B5),
                                              size: 24.0,
                                            ),
                                            Text(
                                              'Cadastrar novo cartão',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Mulish',
                                                        color:
                                                            const Color(0xFF8798B5),
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ].divide(const SizedBox(width: 12.0)),
                                        ),
                                        const Icon(
                                          Icons.more_vert_rounded,
                                          color: Color(0xFF8798B5),
                                          size: 24.0,
                                        ),
                                      ].divide(const SizedBox(width: 12.0)),
                                    ),
                                  ),
                                ),
                              ),
                            ].divide(const SizedBox(height: 18.0)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              18.0, 32.0, 18.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Consulta',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Mulish',
                                          color: const Color(0xFF8798B5),
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                  Text(
                                    'R\$ 159,00',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Mulish',
                                          color: const Color(0xFF434854),
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Taxa',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Mulish',
                                          color: const Color(0xFF8798B5),
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                  Text(
                                    'R\$ 6,90',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Mulish',
                                          color: const Color(0xFF434854),
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Cupom de desconto',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Mulish',
                                          color: const Color(0xFF8798B5),
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                  Text(
                                    '-',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Mulish',
                                          color: const Color(0xFF434854),
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Pagamento total',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Mulish',
                                          color: const Color(0xFF8798B5),
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                  Text(
                                    'R\$ 165,90',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Mulish',
                                          color: const Color(0xFF6E78FF),
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 12.0, 0.0, 0.0),
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFEFF4F9),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        12.0, 12.0, 13.0, 12.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Icon(
                                          Icons.info_rounded,
                                          color: Color(0xFF8798B5),
                                          size: 18.0,
                                        ),
                                        Text(
                                          'Ao processar o pagamento da consulta você \nconcorda com os termos e condições de \nserviço da ViV',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Mulish',
                                                color: const Color(0xFF434854),
                                                fontSize: 13.0,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ].divide(const SizedBox(width: 12.0)),
                                    ),
                                  ),
                                ),
                              ),
                            ].divide(const SizedBox(height: 8.0)),
                          ),
                        ),
                      ].addToEnd(const SizedBox(height: 24.0)),
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
                      text: 'Continuar',
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
