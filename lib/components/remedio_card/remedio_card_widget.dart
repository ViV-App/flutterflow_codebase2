import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'remedio_card_model.dart';
export 'remedio_card_model.dart';

class RemedioCardWidget extends StatefulWidget {
  const RemedioCardWidget({
    super.key,
    this.medicamentoFiltered,
  });

  final MeusMedicamentosRow? medicamentoFiltered;

  @override
  State<RemedioCardWidget> createState() => _RemedioCardWidgetState();
}

class _RemedioCardWidgetState extends State<RemedioCardWidget> {
  late RemedioCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RemedioCardModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(0.0, 0.0),
      child: FutureBuilder<List<PrescricaoRow>>(
        future: PrescricaoTable().querySingleRow(
          queryFn: (q) => q.eq(
            'id',
            widget.medicamentoFiltered?.prescricao,
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
          List<PrescricaoRow> containerPrescricaoRowList = snapshot.data!;
          final containerPrescricaoRow = containerPrescricaoRowList.isNotEmpty
              ? containerPrescricaoRowList.first
              : null;
          return Material(
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
                height: 72.0,
                decoration: const BoxDecoration(
                  color: Color(0xFFF7FAFE),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(8.0),
                    bottomRight: Radius.circular(8.0),
                    topLeft: Radius.circular(8.0),
                    topRight: Radius.circular(8.0),
                  ),
                ),
                child: Stack(
                  children: [
                    Container(
                      width: 7.0,
                      height: 100.0,
                      decoration: BoxDecoration(
                        color: () {
                          if (widget.medicamentoFiltered?.categoria ==
                              'Medicamento') {
                            return const Color(0xFF8DADFE);
                          } else if (widget.medicamentoFiltered?.categoria ==
                              'Produto derivado de Cannabis') {
                            return const Color(0xFF0FA26D);
                          } else if (widget.medicamentoFiltered?.categoria ==
                              'Suplemento') {
                            return const Color(0xFFFFA438);
                          } else {
                            return const Color(0x00000000);
                          }
                        }(),
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(12.0),
                          bottomRight: Radius.circular(12.0),
                          topLeft: Radius.circular(12.0),
                          topRight: Radius.circular(12.0),
                        ),
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            18.0, 12.0, 12.0, 12.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                if (widget.medicamentoFiltered?.categoria ==
                                    'Medicamento')
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: SvgPicture.asset(
                                      'assets/images/cone_aloptico.svg',
                                      width: 32.0,
                                      height: 32.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                if (widget.medicamentoFiltered?.categoria ==
                                    'Produto derivado de Cannabis')
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: SvgPicture.asset(
                                      'assets/images/cone_derivado_de_cannabis.svg',
                                      width: 25.0,
                                      height: 32.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                if (widget.medicamentoFiltered?.categoria ==
                                    'Suplemento')
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: SvgPicture.asset(
                                      'assets/images/cone_manipulado.svg',
                                      width: 25.0,
                                      height: 32.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      valueOrDefault<String>(
                                        widget.medicamentoFiltered?.nome,
                                        '-',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Mulish',
                                            color: const Color(0xFF434854),
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w800,
                                          ),
                                    ),
                                    Text(
                                      '${containerPrescricaoRow?.posologia?.toString()}comprimidos - ${containerPrescricaoRow?.horarios.length.toString()}x ao dia',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Mulish',
                                            color: const Color(0xFF434854),
                                            fontSize: 12.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                  ].divide(const SizedBox(height: 4.0)),
                                ),
                              ].divide(const SizedBox(width: 12.0)),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).primary,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    18.0, 8.0, 18.0, 8.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Ativo',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Mulish',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
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
          );
        },
      ),
    );
  }
}
