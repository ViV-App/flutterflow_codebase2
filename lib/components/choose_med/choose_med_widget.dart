import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_autocomplete_options_list.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'choose_med_model.dart';
export 'choose_med_model.dart';

class ChooseMedWidget extends StatefulWidget {
  const ChooseMedWidget({
    super.key,
    required this.categoria,
    this.medicamento,
  });

  final String? categoria;
  final StaticMedicamentosRow? medicamento;

  @override
  State<ChooseMedWidget> createState() => _ChooseMedWidgetState();
}

class _ChooseMedWidgetState extends State<ChooseMedWidget> {
  late ChooseMedModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChooseMedModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.remedioAtual = await StaticMedicamentosTable().queryRows(
        queryFn: (q) => q.eq(
          'id',
          FFAppState().prescricao.remedio,
        ),
      );
      _model.remedio = _model.remedioAtual?.first.id;
      safeSetState(() {});
        });

    _model.textController ??= TextEditingController();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
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
        child: Container(
          width: double.infinity,
          height: 620.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(0.0),
              bottomRight: Radius.circular(0.0),
              topLeft: Radius.circular(24.0),
              topRight: Radius.circular(24.0),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Align(
                alignment: const AlignmentDirectional(0.0, -1.0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
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
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(23.0, 24.0, 23.0, 0.0),
                child: FutureBuilder<List<StaticMedicamentosRow>>(
                  future: StaticMedicamentosTable().queryRows(
                    queryFn: (q) => q,
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
                    List<StaticMedicamentosRow>
                        textFieldStaticMedicamentosRowList = snapshot.data!;

                    return Autocomplete<String>(
                      initialValue: const TextEditingValue(),
                      optionsBuilder: (textEditingValue) {
                        if (textEditingValue.text == '') {
                          return const Iterable<String>.empty();
                        }
                        return textFieldStaticMedicamentosRowList
                            .map((e) => e.nome)
                            .withoutNulls
                            .toList()
                            .where((option) {
                          final lowercaseOption = option.toLowerCase();
                          return lowercaseOption
                              .contains(textEditingValue.text.toLowerCase());
                        });
                      },
                      optionsViewBuilder: (context, onSelected, options) {
                        return AutocompleteOptionsList(
                          textFieldKey: _model.textFieldKey,
                          textController: _model.textController!,
                          options: options.toList(),
                          onSelected: onSelected,
                          textStyle:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Mulish',
                                    letterSpacing: 0.0,
                                  ),
                          textHighlightStyle: const TextStyle(),
                          elevation: 4.0,
                          optionBackgroundColor:
                              FlutterFlowTheme.of(context).primaryBackground,
                          optionHighlightColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          maxHeight: 200.0,
                        );
                      },
                      onSelected: (String selection) {
                        safeSetState(
                            () => _model.textFieldSelectedOption = selection);
                        FocusScope.of(context).unfocus();
                      },
                      fieldViewBuilder: (
                        context,
                        textEditingController,
                        focusNode,
                        onEditingComplete,
                      ) {
                        _model.textFieldFocusNode = focusNode;

                        _model.textController = textEditingController;
                        return TextFormField(
                          key: _model.textFieldKey,
                          controller: textEditingController,
                          focusNode: focusNode,
                          onEditingComplete: onEditingComplete,
                          onChanged: (_) => EasyDebounce.debounce(
                            '_model.textController',
                            const Duration(milliseconds: 0),
                            () => safeSetState(() {}),
                          ),
                          onFieldSubmitted: (_) async {
                            _model.med =
                                await StaticMedicamentosTable().queryRows(
                              queryFn: (q) => q.eq(
                                'nome',
                                _model.textFieldSelectedOption,
                              ),
                            );
                            _model.remedio = _model.med?.first.id;
                            safeSetState(() {});
                            FFAppState().updatePrescricaoStruct(
                              (e) => e
                                ..remedio = _model.med?.first.id
                                ..remedNome = _model.med?.first.nome,
                            );
                            safeSetState(() {});

                            safeSetState(() {});
                          },
                          autofocus: false,
                          textInputAction: TextInputAction.done,
                          obscureText: false,
                          decoration: InputDecoration(
                            hintText: 'Medicamento',
                            hintStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Mulish',
                                  color: const Color(0xA457636C),
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
                            contentPadding: const EdgeInsetsDirectional.fromSTEB(
                                18.0, 0.0, 0.0, 0.0),
                            suffixIcon: const Icon(
                              Icons.search_rounded,
                              color: Color(0x7057636C),
                            ),
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Mulish',
                                    letterSpacing: 0.0,
                                  ),
                          validator: _model.textControllerValidator
                              .asValidator(context),
                        );
                      },
                    );
                  },
                ),
              ),
              Expanded(
                child: FutureBuilder<List<StaticMedicamentosRow>>(
                  future: StaticMedicamentosTable().queryRows(
                    queryFn: (q) => q.eq(
                      'categoria',
                      widget.categoria,
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
                    List<StaticMedicamentosRow>
                        listViewStaticMedicamentosRowList = snapshot.data!;

                    return ListView.separated(
                      padding: const EdgeInsets.fromLTRB(
                        0,
                        24.0,
                        0,
                        8.0,
                      ),
                      scrollDirection: Axis.vertical,
                      itemCount: listViewStaticMedicamentosRowList.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 18.0),
                      itemBuilder: (context, listViewIndex) {
                        final listViewStaticMedicamentosRow =
                            listViewStaticMedicamentosRowList[listViewIndex];
                        return Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              _model.remedio = listViewStaticMedicamentosRow.id;
                              safeSetState(() {});
                              FFAppState().updatePrescricaoStruct(
                                (e) => e
                                  ..remedio = listViewStaticMedicamentosRow.id
                                  ..remedNome =
                                      listViewStaticMedicamentosRow.nome,
                              );
                              safeSetState(() {});
                            },
                            child: Material(
                              color: Colors.transparent,
                              elevation: listViewStaticMedicamentosRow.id ==
                                      _model.remedio
                                  ? 1.0
                                  : 0.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Container(
                                width: double.infinity,
                                height: 45.0,
                                decoration: BoxDecoration(
                                  color: listViewStaticMedicamentosRow.id ==
                                          _model.remedio
                                      ? const Color(0xFFEFF4F9)
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          24.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        valueOrDefault<String>(
                                          listViewStaticMedicamentosRow.nome,
                                          '-',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Mulish',
                                              color:
                                                  listViewStaticMedicamentosRow
                                                              .id ==
                                                          _model.remedio
                                                      ? const Color(0xFF6E78FF)
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .primaryText,
                                              fontSize: 18.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.bold,
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
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(24.0, 12.0, 24.0, 24.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    Navigator.pop(context);
                  },
                  text: valueOrDefault<String>(
                    _model.textFieldSelectedOption,
                    'aa',
                  ),
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 48.0,
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                    iconPadding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
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
            ],
          ),
        ),
      ),
    );
  }
}
