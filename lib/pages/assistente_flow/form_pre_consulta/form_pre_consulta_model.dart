import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/assistente_flow/dados_cadastrais_form/dados_cadastrais_form_widget.dart';
import '/pages/assistente_flow/historico_saude_form/historico_saude_form_widget.dart';
import 'form_pre_consulta_widget.dart' show FormPreConsultaWidget;
import 'package:flutter/material.dart';

class FormPreConsultaModel extends FlutterFlowModel<FormPreConsultaWidget> {
  ///  Local state fields for this page.

  int? currentForm = 0;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in formPreConsulta widget.
  List<PacienteRow>? cUSER;
  // Model for dadosCadastraisForm component.
  late DadosCadastraisFormModel dadosCadastraisFormModel1;
  // Model for dadosCadastraisForm component.
  late DadosCadastraisFormModel dadosCadastraisFormModel2;
  // Model for historicoSaudeForm component.
  late HistoricoSaudeFormModel historicoSaudeFormModel;

  @override
  void initState(BuildContext context) {
    dadosCadastraisFormModel1 =
        createModel(context, () => DadosCadastraisFormModel());
    dadosCadastraisFormModel2 =
        createModel(context, () => DadosCadastraisFormModel());
    historicoSaudeFormModel =
        createModel(context, () => HistoricoSaudeFormModel());
  }

  @override
  void dispose() {
    dadosCadastraisFormModel1.dispose();
    dadosCadastraisFormModel2.dispose();
    historicoSaudeFormModel.dispose();
  }

  /// Action blocks.
  Future goToForm(
    BuildContext context, {
    PacienteRow? paciente,
  }) async {
    List<QuestionarioRow>? funcnCopy;
    List<QuestionarioRow>? lifestCopy;
    List<QuestionarioRow>? famscCopy;
    List<QuestionarioRow>? histsCopy;

    if (paciente?.dadosCadPreenchidos == true) {
      if (paciente?.histMedicoPreenchido == true) {
        if (paciente?.famSocialHistPreenchido == true) {
          if (paciente?.lifestylePreenchido == true) {
            if (paciente?.funcionalidadePreenchida != true) {
              funcnCopy = await QuestionarioTable().queryRows(
                queryFn: (q) => q.eq(
                  'nome',
                  'Funcionalidade',
                ),
              );

              context.pushNamed(
                'questionario',
                queryParameters: {
                  'questionario': serializeParam(
                    funcnCopy.first,
                    ParamType.SupabaseRow,
                  ),
                }.withoutNulls,
              );
            }
          } else {
            lifestCopy = await QuestionarioTable().queryRows(
              queryFn: (q) => q.eq(
                'nome',
                'Estilo de Vida',
              ),
            );

            context.pushNamed(
              'questionario',
              queryParameters: {
                'questionario': serializeParam(
                  lifestCopy.first,
                  ParamType.SupabaseRow,
                ),
              }.withoutNulls,
            );
          }
        } else {
          famscCopy = await QuestionarioTable().queryRows(
            queryFn: (q) => q.eq(
              'nome',
              'História Familiar e Social',
            ),
          );

          context.pushNamed(
            'questionario',
            queryParameters: {
              'questionario': serializeParam(
                famscCopy.first,
                ParamType.SupabaseRow,
              ),
            }.withoutNulls,
          );
        }
      } else {
        histsCopy = await QuestionarioTable().queryRows(
          queryFn: (q) => q.eq(
            'nome',
            'Histórico de Saúde',
          ),
        );

        context.pushNamed(
          'questionario',
          queryParameters: {
            'questionario': serializeParam(
              histsCopy.first,
              ParamType.SupabaseRow,
            ),
          }.withoutNulls,
        );
      }
    } else {
      currentForm = 1;
    }
  }
}
