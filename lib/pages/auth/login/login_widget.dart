import '/auth/supabase_auth/auth_util.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components/reset_password/reset_password_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'login_model.dart';
export 'login_model.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  late LoginModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoginModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (currentUserUid != '') {
        context.pushNamed('homePage');
      }
    });

    _model.ipEmailTextController ??= TextEditingController();
    _model.ipEmailFocusNode ??= FocusNode();

    _model.ipPassTextController ??= TextEditingController();
    _model.ipPassFocusNode ??= FocusNode();

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
              color: Colors.transparent,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(32.0, 32.0, 32.0, 0.0),
                      child: Text(
                        'Que bom que você está de volta! 👋',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Mulish',
                              fontSize: 24.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(32.0, 8.0, 32.0, 0.0),
                      child: Text(
                        'Faça login com em sua conta ou caso ainda não tenha uma, cadastre-se.',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Mulish',
                              color: const Color(0xFF8798B5),
                              fontSize: 16.0,
                              letterSpacing: 0.0,
                              lineHeight: 1.5,
                            ),
                      ),
                    ),
                    Form(
                      key: _model.formKey,
                      autovalidateMode: AutovalidateMode.disabled,
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            32.0, 64.0, 32.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Email',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Mulish',
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                                TextFormField(
                                  controller: _model.ipEmailTextController,
                                  focusNode: _model.ipEmailFocusNode,
                                  autofocus: false,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    hintText: 'email@gmail.com',
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Mulish',
                                          color: const Color(0xFF8798B5),
                                          fontSize: 16.0,
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
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    filled: true,
                                    fillColor: const Color(0xFFF7FAFE),
                                    contentPadding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            12.0, 0.0, 0.0, 0.0),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Mulish',
                                        letterSpacing: 0.0,
                                      ),
                                  validator: _model
                                      .ipEmailTextControllerValidator
                                      .asValidator(context),
                                ),
                              ].divide(const SizedBox(height: 6.0)),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Senha',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Mulish',
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                                TextFormField(
                                  controller: _model.ipPassTextController,
                                  focusNode: _model.ipPassFocusNode,
                                  autofocus: false,
                                  obscureText: !_model.ipPassVisibility,
                                  decoration: InputDecoration(
                                    hintText: '******',
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Mulish',
                                          color: const Color(0xFF8798B5),
                                          fontSize: 16.0,
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
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    filled: true,
                                    fillColor: const Color(0xFFF7FAFE),
                                    contentPadding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            12.0, 0.0, 0.0, 0.0),
                                    suffixIcon: InkWell(
                                      onTap: () => setState(
                                        () => _model.ipPassVisibility =
                                            !_model.ipPassVisibility,
                                      ),
                                      focusNode: FocusNode(skipTraversal: true),
                                      child: Icon(
                                        _model.ipPassVisibility
                                            ? Icons.visibility_outlined
                                            : Icons.visibility_off_outlined,
                                        size: 24.0,
                                      ),
                                    ),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Mulish',
                                        letterSpacing: 0.0,
                                      ),
                                  validator: _model
                                      .ipPassTextControllerValidator
                                      .asValidator(context),
                                ),
                              ].divide(const SizedBox(height: 6.0)),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 8.0, 0.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Theme(
                                        data: ThemeData(
                                          checkboxTheme: CheckboxThemeData(
                                            visualDensity:
                                                VisualDensity.compact,
                                            materialTapTargetSize:
                                                MaterialTapTargetSize
                                                    .shrinkWrap,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4.0),
                                            ),
                                          ),
                                          unselectedWidgetColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryText,
                                        ),
                                        child: Checkbox(
                                          value: _model.checkboxValue ??= false,
                                          onChanged: (newValue) async {
                                            setState(() => _model
                                                .checkboxValue = newValue!);
                                          },
                                          side: BorderSide(
                                            width: 2,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                          ),
                                          activeColor:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                          checkColor:
                                              FlutterFlowTheme.of(context).info,
                                        ),
                                      ),
                                      Text(
                                        'Lembrar de mim',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Mulish',
                                              fontSize: 14.0,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ],
                                  ),
                                  Builder(
                                    builder: (context) => InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        await showDialog(
                                          context: context,
                                          builder: (dialogContext) {
                                            return Dialog(
                                              elevation: 0,
                                              insetPadding: EdgeInsets.zero,
                                              backgroundColor:
                                                  Colors.transparent,
                                              alignment:
                                                  const AlignmentDirectional(0.0, 0.0)
                                                      .resolve(
                                                          Directionality.of(
                                                              context)),
                                              child: WebViewAware(
                                                child: GestureDetector(
                                                  onTap: () => _model
                                                          .unfocusNode
                                                          .canRequestFocus
                                                      ? FocusScope.of(context)
                                                          .requestFocus(_model
                                                              .unfocusNode)
                                                      : FocusScope.of(context)
                                                          .unfocus(),
                                                  child: const ResetPasswordWidget(),
                                                ),
                                              ),
                                            );
                                          },
                                        ).then((value) => setState(() {}));
                                      },
                                      child: Text(
                                        'Esqueci minha senha',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Mulish',
                                              color: const Color(0xFFD63D3D),
                                              fontSize: 13.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 8.0, 0.0, 0.0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  if (_model.formKey.currentState == null ||
                                      !_model.formKey.currentState!
                                          .validate()) {
                                    return;
                                  }
                                  GoRouter.of(context).prepareAuthEvent();

                                  final user =
                                      await authManager.signInWithEmail(
                                    context,
                                    _model.ipEmailTextController.text,
                                    _model.ipPassTextController.text,
                                  );
                                  if (user == null) {
                                    return;
                                  }

                                  _model.userReturned =
                                      await PacienteTable().queryRows(
                                    queryFn: (q) => q.eq(
                                      'uuid',
                                      currentUserUid,
                                    ),
                                  );
                                  FFAppState().paciente = PacienteStruct(
                                    id: _model.userReturned?.first.id,
                                    uuid: currentUserUid,
                                    createdAt:
                                        _model.userReturned?.first.createdAt,
                                    nome: _model.userReturned?.first.nome,
                                    telefone:
                                        _model.userReturned?.first.telefone,
                                    cpf: _model.userReturned?.first.id
                                        .toString(),
                                    queixas: _model.userReturned
                                        ?.map((e) => e.queixas.first)
                                        .toList(),
                                    contraIndicacoes: _model.userReturned
                                        ?.map((e) => e.contraIndicacoes.first)
                                        .toList(),
                                    foto:
                                        _model.userReturned?.first.profilePic,
                                  );
                                  setState(() {});

                                  context.goNamedAuth(
                                      'homePage', context.mounted);

                                  setState(() {});
                                },
                                text: 'Entrar',
                                options: FFButtonOptions(
                                  width: double.infinity,
                                  height: 48.0,
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 24.0, 0.0),
                                  iconPadding: const EdgeInsetsDirectional.fromSTEB(
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
                                  borderSide: const BorderSide(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Container(
                                    width: 100.0,
                                    height: 1.0,
                                    decoration: const BoxDecoration(
                                      color: Color(0xFF8798B5),
                                    ),
                                  ),
                                ),
                                Text(
                                  'Ou faça login com',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Mulish',
                                        color: const Color(0xFF8798B5),
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                                Expanded(
                                  child: Container(
                                    width: 100.0,
                                    height: 1.0,
                                    decoration: const BoxDecoration(
                                      color: Color(0xFF8798B5),
                                    ),
                                  ),
                                ),
                              ].divide(const SizedBox(width: 18.0)),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      await actions.signInWithGoogle();
                                    },
                                    child: Container(
                                      width: 100.0,
                                      height: 42.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        border: Border.all(
                                          color: const Color(0xFF8798B5),
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.asset(
                                              'assets/images/Google_svg.png',
                                              width: 24.0,
                                              height: 24.0,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Text(
                                            'Google',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Mulish',
                                                  color: const Color(0xFF262B37),
                                                  fontSize: 12.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w800,
                                                ),
                                          ),
                                        ].divide(const SizedBox(width: 4.0)),
                                      ),
                                    ),
                                  ),
                                ),
                              ].divide(const SizedBox(width: 24.0)),
                            ),
                          ].divide(const SizedBox(height: 24.0)),
                        ),
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: const AlignmentDirectional(0.0, -1.0),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 24.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Não tem uma conta?',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Mulish',
                                    color: const Color(0xFF434854),
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                  ),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.pushNamed(
                              'createAccount',
                              extra: <String, dynamic>{
                                kTransitionInfoKey: const TransitionInfo(
                                  hasTransition: true,
                                  transitionType: PageTransitionType.fade,
                                  duration: Duration(milliseconds: 0),
                                ),
                              },
                            );
                          },
                          child: Text(
                            'Crie agora!',
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
                        ),
                      ].divide(const SizedBox(width: 4.0)),
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
