import '/components/select_contry/select_contry_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'int_phone_number_model.dart';
export 'int_phone_number_model.dart';

class IntPhoneNumberWidget extends StatefulWidget {
  const IntPhoneNumberWidget({
    super.key,
    this.callback,
  });

  final Future Function(String phone)? callback;

  @override
  State<IntPhoneNumberWidget> createState() => _IntPhoneNumberWidgetState();
}

class _IntPhoneNumberWidgetState extends State<IntPhoneNumberWidget> {
  late IntPhoneNumberModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => IntPhoneNumberModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.selectedCountry = <String, String?>{
        'countryName': 'Brazil',
        'countryCode': 'BR',
        'dialCode': '+55',
        'flag': 'https://flagcdn.com/h80/br.png',
      };
      setState(() {});
      await Future.delayed(const Duration(milliseconds: 100));
      setState(() {
        _model.ipEmailTextController1?.text = getJsonField(
          _model.selectedCountry,
          r'''$.dialCode''',
        ).toString().toString();
        _model.ipEmailTextController1?.selection = TextSelection.collapsed(
            offset: _model.ipEmailTextController1!.text.length);
      });
    });

    _model.ipEmailTextController1 ??= TextEditingController(
        text: valueOrDefault<String>(
      getJsonField(
        _model.selectedCountry,
        r'''$.dialCode''',
      )?.toString().toString(),
      '5',
    ));
    _model.ipEmailFocusNode1 ??= FocusNode();

    _model.ipEmailTextController2 ??= TextEditingController();
    _model.ipEmailFocusNode2 ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            flex: 1,
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
                      child: Padding(
                        padding: MediaQuery.viewInsetsOf(context),
                        child: SelectContryWidget(
                          callback: (contrySelected) async {
                            _model.selectedCountry = contrySelected;
                            setState(() {});
                            await Future.delayed(
                                const Duration(milliseconds: 100));
                            setState(() {
                              _model.ipEmailTextController2?.clear();
                            });
                            setState(() {
                              _model.ipEmailTextController1?.text =
                                  getJsonField(
                                contrySelected,
                                r'''$.dialCode''',
                              ).toString();
                              _model.ipEmailTextController1?.selection =
                                  TextSelection.collapsed(
                                      offset: _model
                                          .ipEmailTextController1!.text.length);
                            });
                          },
                        ),
                      ),
                    );
                  },
                ).then((value) => safeSetState(() {}));
              },
              child: Container(
                width: 100.0,
                height: 48.0,
                decoration: BoxDecoration(
                  color: const Color(0xFFF7FAFE),
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(
                    color: const Color(0x13294B0D),
                    width: 2.0,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(4.0, 4.0, 0.0, 4.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(0.0),
                          child: Image.network(
                            getJsonField(
                              _model.selectedCountry,
                              r'''$.flag''',
                            ).toString(),
                            width: 42.0,
                            height: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Icon(
                        Icons.arrow_drop_down_sharp,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 24.0,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: SizedBox(
              width: 100.0,
              child: TextFormField(
                controller: _model.ipEmailTextController1,
                focusNode: _model.ipEmailFocusNode1,
                onChanged: (_) => EasyDebounce.debounce(
                  '_model.ipEmailTextController1',
                  const Duration(milliseconds: 0),
                  () => setState(() {}),
                ),
                autofocus: false,
                readOnly: true,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: '000',
                  hintStyle: FlutterFlowTheme.of(context).bodyMedium.override(
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
                      color: FlutterFlowTheme.of(context).primary,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).error,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).error,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  filled: true,
                  fillColor: const Color(0xFFF7FAFE),
                  contentPadding:
                      const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Mulish',
                      letterSpacing: 0.0,
                    ),
                validator:
                    _model.ipEmailTextController1Validator.asValidator(context),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: SizedBox(
              width: 100.0,
              child: TextFormField(
                controller: _model.ipEmailTextController2,
                focusNode: _model.ipEmailFocusNode2,
                onChanged: (_) => EasyDebounce.debounce(
                  '_model.ipEmailTextController2',
                  const Duration(milliseconds: 0),
                  () async {
                    await widget.callback?.call(
                      functions.concatenString(
                          getJsonField(
                            _model.selectedCountry,
                            r'''$.dialCode''',
                          ).toString(),
                          _model.ipEmailTextController2.text),
                    );
                  },
                ),
                autofocus: false,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: '000',
                  hintStyle: FlutterFlowTheme.of(context).bodyMedium.override(
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
                      color: FlutterFlowTheme.of(context).primary,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).error,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).error,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  filled: true,
                  fillColor: const Color(0xFFF7FAFE),
                  contentPadding:
                      const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Mulish',
                      letterSpacing: 0.0,
                    ),
                validator:
                    _model.ipEmailTextController2Validator.asValidator(context),
              ),
            ),
          ),
        ].divide(const SizedBox(width: 12.0)),
      ),
    );
  }
}
