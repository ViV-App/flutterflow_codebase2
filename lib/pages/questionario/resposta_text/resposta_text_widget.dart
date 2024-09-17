import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'resposta_text_model.dart';
export 'resposta_text_model.dart';

class RespostaTextWidget extends StatefulWidget {
  const RespostaTextWidget({
    super.key,
    this.index,
    this.resposta,
    this.callback,
  });

  final int? index;
  final RespostasQuestionarioRow? resposta;
  final Future Function(String? response)? callback;

  @override
  State<RespostaTextWidget> createState() => _RespostaTextWidgetState();
}

class _RespostaTextWidgetState extends State<RespostaTextWidget> {
  late RespostaTextModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RespostaTextModel());

    _model.textController ??= TextEditingController();
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
      alignment: const AlignmentDirectional(0.0, -1.0),
      child: TextFormField(
        controller: _model.textController,
        focusNode: _model.textFieldFocusNode,
        onChanged: (_) => EasyDebounce.debounce(
          '_model.textController',
          const Duration(milliseconds: 100),
          () async {
            await widget.callback?.call(
              _model.textController.text,
            );
          },
        ),
        autofocus: false,
        obscureText: false,
        decoration: InputDecoration(
          isDense: false,
          hintText: 'Escreva..',
          hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                fontFamily: 'Mulish',
                color: const Color(0xFF8798B5),
                letterSpacing: 0.0,
              ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color(0x0E294B0D),
              width: 3.0,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: FlutterFlowTheme.of(context).primary,
              width: 3.0,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: FlutterFlowTheme.of(context).error,
              width: 3.0,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: FlutterFlowTheme.of(context).error,
              width: 3.0,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsetsDirectional.fromSTEB(18.0, 32.0, 18.0, 0.0),
        ),
        style: FlutterFlowTheme.of(context).bodyMedium.override(
              fontFamily: 'Mulish',
              letterSpacing: 0.0,
            ),
        maxLines: 10,
        minLines: 5,
        validator: _model.textControllerValidator.asValidator(context),
      ),
    );
  }
}
