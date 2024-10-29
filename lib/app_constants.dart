import 'package:flutter/material.dart';
import 'flutter_flow/flutter_flow_util.dart';

abstract class FFAppConstants {
  static const List<bool> triagemBool = [true, false];
  static const List<String> triagemMedDiagnosticos = [
    'Insônia',
    'Ansiedade',
    'Depressão',
    'Episódios de Pânico',
    'Transtorno Obsessivo Compulsivo',
    'Transtorno Afetivo Bipolar',
    'Transtorno do Espectro Autista (TEA)',
    'Doença de Alzheimer ou outras síndromes demenciais',
    'Doença de Parkinson',
    'Epilepsia/ crises convulsivas',
    'Dor crônica - em articulações',
    'Dor crônica - Fibromialgia',
    'Doença Autoimune (Tireoidite de Hashimoto, Esclerose Múltipla, Atrite Reumatóide, Psoríase, Vitiligo, Doença de Crohn, etc.)',
    'Outros'
  ];
  static const List<String> triagemSensibilidadeAlimento = [
    'Não tenho intolerância/sensibilidade a nenhum alimento',
    'Tenho intolerância/sensibilidade ao glúten',
    'Tenho intolerância/sensibilidade a um alimento que não está listado',
    'Tenho intolerância/sensibilidade à lactose',
    'Outros'
  ];
  static const List<String> triagemRecurrentInfection = [
    'Urinária ( infecção da bexiga, uretra, rins, etc)',
    'Ginecológica ( candidíase, vaginose bacteriana, etc)',
    'Dermatológica (pele/cabelos/unhas)',
    'Pulmonar ( pneumonia, bronquite, etc)',
    'Cardíaca ( infecção do miocárdio, endocárdio, etc)'
  ];
  static const List<String> triagemRegularFollowupProfessional = [
    'Médico generalista',
    'Psicoterapeuta (psicólogo, médico ou outro profissional)',
    'Nutricionista',
    'Fisioterapeuta',
    'Cuidador',
    'Educador Físico',
    'Fonoaudiólogo',
    'Terapeuta Ocupacional',
    'Terapeuta Alternativo ou Holístico',
    'Não sou acompanhado por nenhum profissional da saúde'
  ];
  static const List<String> triagemHadUsedCannabis = [
    'Sim, faço uso',
    'Não, nunca usei',
    'Usei no passado'
  ];
  static const List<String> triagemMainGoalAtViv = [
    'Desejo apenas renovar a prescrição, pois estou satisfeito(a) com o tratamento atual',
    'Estou insatisfeito (a) com o produto em uso',
    'Desejo realizar ajuste de dose do produto que estou em uso',
    'Outros'
  ];
  static const List<String> triagemHadSideEffUsingCannabis = [
    'Já me senti mal com produtos com Cannabis',
    'Nunca me senti mal com produtos com Cannabis'
  ];
  static const List<String> triagemConditions = [
    'Arritmia cardíaca',
    'Histórico de Psicose',
    'Diagnóstico de Esquizofrenia',
    'Ideação Suicida',
    'Paciente é menor de 5 anos',
    'Sou atleta profissional',
    'Nesse momento desejo NÃO utilizar THC no meu tratamento',
    'Nenhuma',
    'Outros'
  ];
  static const List<String> triagemProfissoes = [
    '(Sou) Publicitário há 10 anos ',
    'Fui engenheiro por 20 anos, atualmente trabalho com investimentos ',
    'Sempre trabalhei no lar ',
    'Nunca trabalhei'
  ];
  static const List<String> triagemEstrangeiro = [
    'Sou estrangeira(o), mas possuo documentos brasileiros',
    'Sou estrangeira(o), não possuo documentos brasileiro',
    'Não sou estrangeiro(a)'
  ];
  static const List<String> triagemBoolStr = ['Sim', 'Não'];
  static const List<String> categoriaPergunta = [
    'number input',
    'text input',
    'double number input',
    'double text input',
    'single selector',
    'multi selector',
    'create remedio',
    'enrich queixa',
    'single image',
    'double image',
    'multi image'
  ];
  static const List<String> perguntatype = ['principal', 'secundario'];
}
