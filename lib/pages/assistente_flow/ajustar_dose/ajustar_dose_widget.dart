import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/components/bip_geral_infos/bip_geral_infos_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'ajustar_dose_model.dart';
export 'ajustar_dose_model.dart';

class AjustarDoseWidget extends StatefulWidget {
  const AjustarDoseWidget({
    super.key,
    this.page,
  });

  final String? page;

  @override
  State<AjustarDoseWidget> createState() => _AjustarDoseWidgetState();
}

class _AjustarDoseWidgetState extends State<AjustarDoseWidget> {
  late AjustarDoseModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AjustarDoseModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget.page == 'verDose') {
        await StatusPacientTable().update(
          data: {
            'processo': 'tratamentoBip',
            'estagio': 'emTratamento',
          },
          matchingRows: (rows) => rows.eq(
            'paciente',
            FFAppState().paciente.id,
          ),
        );
      } else {
        _model.reqs2 = await AjusteDoseRequisicaoTable().queryRows(
          queryFn: (q) => q.eq(
            'paciente',
            FFAppState().paciente.id,
          ),
        );
        if ((_model.reqs2 != null && (_model.reqs2)!.isNotEmpty) == false) {
          _model.bipV = await BipVigenteTable().queryRows(
            queryFn: (q) => q.eq(
              'paciente',
              FFAppState().paciente.id,
            ),
          );
          _model.cUser = await PacienteTable().queryRows(
            queryFn: (q) => q.eq(
              'uuid',
              currentUserUid,
            ),
          );
          _model.reCreat = await AjusteDoseRequisicaoTable().insert({
            'paciente': FFAppState().paciente.id,
            'bipVIgente': _model.bipV?.first.id,
            'requisicao_data': supaSerialize<DateTime>(getCurrentTimestamp),
            'queixasNaoRespondidas': functions.addItemToList(
                _model.cUser!.first.queixas.toList(),
                _model.cUser!.first.queixaPrincipal!),
          });
          _model.reqAtual = _model.reCreat;
          safeSetState(() {});
        } else {
          _model.reqAt = await AjusteDoseRequisicaoTable().queryRows(
            queryFn: (q) => q.eq(
              'paciente',
              FFAppState().paciente.id,
            ),
          );
          _model.reqAtual = _model.reqAt?.first;
          safeSetState(() {});
        }
      }
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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(),
            child: Stack(
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Align(
                      alignment: const AlignmentDirectional(0.0, -1.0),
                      child: Container(
                        decoration: const BoxDecoration(
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
                                'Assistente ViV',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Mulish',
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      fontSize: 18.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w800,
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
                    ),
                    if (widget.page == 'preencher')
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  32.0, 0.0, 32.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Ajuste de Dose (BIP)',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Mulish',
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          fontSize: 28.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                  Text(
                                    'Para realizarmos o Ajustes de Dose, precisamos de algumas informações. Em até 5 dias após o preenchimento, trarei aqui qual deve ser o seu Ajuste de Dose.',
                                    textAlign: TextAlign.start,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Mulish',
                                          color: const Color(0xFF8798B5),
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                          lineHeight: 1.5,
                                        ),
                                  ),
                                ].divide(const SizedBox(height: 8.0)),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  32.0, 0.0, 32.0, 52.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  if (_model.reqAtual?.pam == false)
                                    Align(
                                      alignment: const AlignmentDirectional(0.0, 0.0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          var shouldSetState = false;
                                          _model.qst1 =
                                              await QuestionarioTable()
                                                  .queryRows(
                                            queryFn: (q) => q.eq(
                                              'nome',
                                              'BIP Geral',
                                            ),
                                          );
                                          shouldSetState = true;
                                          _model.res1 =
                                              await RespostasQuestionarioTable()
                                                  .queryRows(
                                            queryFn: (q) => q
                                                .eq(
                                                  'bipRequisicao',
                                                  _model.reqAtual?.id,
                                                )
                                                .eq(
                                                  'questionario',
                                                  _model.qst1?.first.id,
                                                ),
                                          );
                                          shouldSetState = true;
                                          if ((_model.res1 != null &&
                                                  (_model.res1)!.isNotEmpty) ==
                                              true) {
                                            context.pushNamed(
                                              'questionarioBip',
                                              queryParameters: {
                                                'questionario': serializeParam(
                                                  _model.qst1?.first,
                                                  ParamType.SupabaseRow,
                                                ),
                                                'bipRequisicao': serializeParam(
                                                  _model.reqAtual?.id,
                                                  ParamType.int,
                                                ),
                                              }.withoutNulls,
                                              extra: <String, dynamic>{
                                                kTransitionInfoKey:
                                                    const TransitionInfo(
                                                  hasTransition: true,
                                                  transitionType:
                                                      PageTransitionType.fade,
                                                  duration:
                                                      Duration(milliseconds: 0),
                                                ),
                                              },
                                            );

                                            if (shouldSetState) {
                                              safeSetState(() {});
                                            }
                                            return;
                                          } else {
                                            _model.apiResulte7s =
                                                await GenerateBipResponsesCall
                                                    .call(
                                              bipReq: _model.reqAtual?.id,
                                              paciente:
                                                  FFAppState().paciente.id,
                                              questionario:
                                                  _model.qst1?.first.id,
                                            );

                                            shouldSetState = true;

                                            context.pushNamed(
                                              'questionarioBip',
                                              queryParameters: {
                                                'questionario': serializeParam(
                                                  _model.qst1?.first,
                                                  ParamType.SupabaseRow,
                                                ),
                                                'bipRequisicao': serializeParam(
                                                  _model.reqAtual?.id,
                                                  ParamType.int,
                                                ),
                                              }.withoutNulls,
                                              extra: <String, dynamic>{
                                                kTransitionInfoKey:
                                                    const TransitionInfo(
                                                  hasTransition: true,
                                                  transitionType:
                                                      PageTransitionType.fade,
                                                  duration:
                                                      Duration(milliseconds: 0),
                                                ),
                                              },
                                            );

                                            if (shouldSetState) {
                                              safeSetState(() {});
                                            }
                                            return;
                                          }

                                          if (shouldSetState) {
                                            safeSetState(() {});
                                          }
                                        },
                                        text: 'Preencher Formulário Geral',
                                        options: FFButtonOptions(
                                          height: 48.0,
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  32.0, 0.0, 32.0, 0.0),
                                          iconPadding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily: 'Mulish',
                                                    color: Colors.white,
                                                    fontSize: 14.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                          elevation: 3.0,
                                          borderSide: const BorderSide(
                                            color: Colors.transparent,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(60.0),
                                        ),
                                      ),
                                    ),
                                  if (_model.reqAtual?.pam == true)
                                    Align(
                                      alignment: const AlignmentDirectional(0.0, 0.0),
                                      child: FFButtonWidget(
                                        onPressed: () {
                                          print('Button pressed ...');
                                        },
                                        text: 'Formulário Geral',
                                        icon: const Icon(
                                          Icons.check_circle,
                                          size: 24.0,
                                        ),
                                        options: FFButtonOptions(
                                          height: 48.0,
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  32.0, 0.0, 32.0, 0.0),
                                          iconPadding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: const Color(0x5E6E78FF),
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily: 'Mulish',
                                                    color: Colors.white,
                                                    fontSize: 14.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                          elevation: 0.0,
                                          borderSide: const BorderSide(
                                            color: Colors.transparent,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(60.0),
                                        ),
                                      ),
                                    ),
                                  if ((_model.reqAtual?.queixasNaoRespondidas !=
                                              null &&
                                          (_model.reqAtual
                                                  ?.queixasNaoRespondidas)!
                                              .isNotEmpty) ==
                                      true)
                                    Align(
                                      alignment: const AlignmentDirectional(0.0, 0.0),
                                      child: FFButtonWidget(
                                        onPressed:
                                            (_model.reqAtual?.pam == false)
                                                ? null
                                                : () async {
                                                    await showModalBottomSheet(
                                                      isScrollControlled: true,
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      context: context,
                                                      builder: (context) {
                                                        return WebViewAware(
                                                          child:
                                                              GestureDetector(
                                                            onTap: () =>
                                                                FocusScope.of(
                                                                        context)
                                                                    .unfocus(),
                                                            child: Padding(
                                                              padding: MediaQuery
                                                                  .viewInsetsOf(
                                                                      context),
                                                              child: SizedBox(
                                                                height: MediaQuery.sizeOf(
                                                                            context)
                                                                        .height *
                                                                    0.8,
                                                                child:
                                                                    BipGeralInfosWidget(
                                                                  reqBip: _model
                                                                      .reqAtual,
                                                                  bip:
                                                                      'especifico',
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ).then((value) =>
                                                        safeSetState(() {}));
                                                  },
                                        text: 'Preencher Formulário Específico',
                                        options: FFButtonOptions(
                                          height: 48.0,
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  32.0, 0.0, 32.0, 0.0),
                                          iconPadding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily: 'Mulish',
                                                    color: Colors.white,
                                                    fontSize: 14.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                          elevation: 3.0,
                                          borderSide: const BorderSide(
                                            color: Colors.transparent,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(60.0),
                                          disabledColor:
                                              FlutterFlowTheme.of(context)
                                                  .alternate,
                                          disabledTextColor: Colors.white,
                                        ),
                                      ),
                                    ),
                                  if ((_model.reqAtual?.queixasNaoRespondidas !=
                                              null &&
                                          (_model.reqAtual
                                                  ?.queixasNaoRespondidas)!
                                              .isNotEmpty) ==
                                      false)
                                    Align(
                                      alignment: const AlignmentDirectional(0.0, 0.0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          context.pushNamed(
                                            'ajustarDose',
                                            queryParameters: {
                                              'page': serializeParam(
                                                'preenchido',
                                                ParamType.String,
                                              ),
                                            }.withoutNulls,
                                            extra: <String, dynamic>{
                                              kTransitionInfoKey:
                                                  const TransitionInfo(
                                                hasTransition: true,
                                                transitionType:
                                                    PageTransitionType.fade,
                                                duration:
                                                    Duration(milliseconds: 0),
                                              ),
                                            },
                                          );

                                          await StatusPacientTable().update(
                                            data: {
                                              'estagio': 'receberAjusteBip',
                                              'processo': 'tratamentoBip',
                                            },
                                            matchingRows: (rows) => rows.eq(
                                              'paciente',
                                              FFAppState().paciente.id,
                                            ),
                                          );

                                          safeSetState(() {});
                                        },
                                        text: 'Formulário Específico',
                                        icon: const Icon(
                                          Icons.check_circle,
                                          size: 24.0,
                                        ),
                                        options: FFButtonOptions(
                                          height: 48.0,
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  32.0, 0.0, 32.0, 0.0),
                                          iconPadding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: const Color(0x5E6E78FF),
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily: 'Mulish',
                                                    color: Colors.white,
                                                    fontSize: 14.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                          elevation: 0.0,
                                          borderSide: const BorderSide(
                                            color: Colors.transparent,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(60.0),
                                        ),
                                      ),
                                    ),
                                ].divide(const SizedBox(height: 18.0)),
                              ),
                            ),
                          ].divide(const SizedBox(height: 42.0)),
                        ),
                      ),
                    if (widget.page == 'preenchido')
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Tudo preenchido!\nAgora é só aguardar.',
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Mulish',
                                    color: FlutterFlowTheme.of(context).primary,
                                    fontSize: 28.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            Align(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  context.goNamed(
                                    'homePage',
                                    extra: <String, dynamic>{
                                      kTransitionInfoKey: const TransitionInfo(
                                        hasTransition: true,
                                        transitionType: PageTransitionType.fade,
                                        duration: Duration(milliseconds: 0),
                                      ),
                                    },
                                  );
                                },
                                text: 'Voltar para o inicio',
                                options: FFButtonOptions(
                                  height: 48.0,
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      32.0, 0.0, 32.0, 0.0),
                                  iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context).primary,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Mulish',
                                        color: Colors.white,
                                        fontSize: 14.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                  elevation: 3.0,
                                  borderSide: const BorderSide(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(60.0),
                                ),
                              ),
                            ),
                          ].divide(const SizedBox(height: 42.0)),
                        ),
                      ),
                    if (widget.page == 'verDose')
                      Expanded(
                        child: FutureBuilder<List<AjusteDeDoseRow>>(
                          future: AjusteDeDoseTable().querySingleRow(
                            queryFn: (q) => q
                                .eq(
                                  'paciente',
                                  FFAppState().paciente.id,
                                )
                                .order('created_at'),
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
                            List<AjusteDeDoseRow> columnAjusteDeDoseRowList =
                                snapshot.data!;

                            final columnAjusteDeDoseRow =
                                columnAjusteDeDoseRowList.isNotEmpty
                                    ? columnAjusteDeDoseRowList.first
                                    : null;

                            return Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      32.0, 0.0, 32.0, 24.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Nova Dosagem',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Mulish',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              fontSize: 28.0,
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
                                          await launchURL(columnAjusteDeDoseRow!
                                              .propostaT!);
                                        },
                                        child: Text(
                                          'Acesse o arquivo para validar qual a dosagem ideal deve ser utilizada pelos próximos dias.',
                                          textAlign: TextAlign.start,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Mulish',
                                                color: const Color(0xFF8798B5),
                                                fontSize: 16.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                      ),
                                    ].divide(const SizedBox(height: 8.0)),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 24.0, 24.0),
                                  child: Container(
                                    width: double.infinity,
                                    height: 62.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(18.0),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          18.0, 0.0, 18.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Container(
                                                width: 32.0,
                                                height: 32.0,
                                                decoration: BoxDecoration(
                                                  color: const Color(0x3D6D98F4),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          200.0),
                                                ),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              0.0),
                                                      child: Image.asset(
                                                        'assets/images/Vector.png',
                                                        width: 16.0,
                                                        height: 16.0,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        12.0, 0.0, 0.0, 0.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Proposta de Dosagem',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Mulish',
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                    ),
                                                    Text(
                                                      valueOrDefault<String>(
                                                        columnAjusteDeDoseRow
                                                            ?.profissionalUploader,
                                                        'ViV - Assistente',
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Mulish',
                                                            color: const Color(
                                                                0xFF8798B5),
                                                            fontSize: 12.0,
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              await launchURL(
                                                  columnAjusteDeDoseRow!
                                                      .propostaT!);
                                            },
                                            child: const Icon(
                                              Icons.arrow_forward_ios_sharp,
                                              color: Color(0xFF8798B5),
                                              size: 24.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 24.0, 72.0),
                                  child: Container(
                                    width: double.infinity,
                                    height: 62.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(18.0),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          18.0, 0.0, 18.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Container(
                                                width: 32.0,
                                                height: 32.0,
                                                decoration: BoxDecoration(
                                                  color: const Color(0x3D6D98F4),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          200.0),
                                                ),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              0.0),
                                                      child: Image.asset(
                                                        'assets/images/Vector.png',
                                                        width: 16.0,
                                                        height: 16.0,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        12.0, 0.0, 0.0, 0.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Proposta de Receita',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Mulish',
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                    ),
                                                    Text(
                                                      valueOrDefault<String>(
                                                        columnAjusteDeDoseRow
                                                            ?.profissionalUploader,
                                                        'ViV - Assistente',
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Mulish',
                                                            color: const Color(
                                                                0xFF8798B5),
                                                            fontSize: 12.0,
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              await launchURL(
                                                  columnAjusteDeDoseRow!
                                                      .planoT!);
                                            },
                                            child: const Icon(
                                              Icons.arrow_forward_ios_sharp,
                                              color: Color(0xFF8798B5),
                                              size: 24.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
