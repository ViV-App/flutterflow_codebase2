import 'dart:convert';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class AdicionarPrescricaoCall {
  static Future<ApiCallResponse> call({
    int? medicamento,
    int? posologia,
    int? concentracao,
    String? formaDose = '',
    String? dateStart = '',
    int? duracaoDias,
    List<String>? horariosList,
    String? dataAtual = '',
    int? indice,
    bool? loop,
  }) async {
    final horarios = _serializeList(horariosList);

    final ffApiRequestBody = '''
{
  "medicamento": $medicamento,
  "posologia": $posologia,
  "concentracao": $concentracao,
  "forma_dose": "$formaDose",
  "date_start": "$dateStart",
  "duracao_dias": $duracaoDias,
  "horarios": $horarios,
  "data_atual": "$dataAtual",
  "indice": $indice,
  "loop": $loop
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Adicionar prescricao',
      apiUrl:
          'https://primary-production-52d3.up.railway.app/webhook-test/3bf32d6e-7e77-4935-9bfb-3151ac69325c',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetCall {
  static Future<ApiCallResponse> call({
    String? date = '',
    int? periodo,
    int? cliente,
  }) async {
    final ffApiRequestBody = '''
{
  "currentdate": "$date",
  "periodo": 1,
  "userid": $cliente
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'get',
      apiUrl: 'https://obrniidkryzgroeudrsj.supabase.co/rest/v1/rpc/get_agenda',
      callType: ApiCallType.POST,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im9icm5paWRrcnl6Z3JvZXVkcnNqIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTQzOTg0MjksImV4cCI6MjAyOTk3NDQyOX0.XczFr7OwtAY2U06zTYWsFHKDwoDzdY10ZeO9hlevcAk',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im9icm5paWRrcnl6Z3JvZXVkcnNqIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTQzOTg0MjksImV4cCI6MjAyOTk3NDQyOX0.XczFr7OwtAY2U06zTYWsFHKDwoDzdY10ZeO9hlevcAk',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<int>? medicamentoId(dynamic response) => (getJsonField(
        response,
        r'''$[:].medicamento_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<String>? medicamentoNome(dynamic response) => (getJsonField(
        response,
        r'''$[:].medicamento_nome''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<int>? prescricaoId(dynamic response) => (getJsonField(
        response,
        r'''$[:].prescricao_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<String>? dateStart(dynamic response) => (getJsonField(
        response,
        r'''$[:].date_start''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? dateEnd(dynamic response) => (getJsonField(
        response,
        r'''$[:].date_end''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? horario(dynamic response) => (getJsonField(
        response,
        r'''$[:].horario''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? turno(dynamic response) => (getJsonField(
        response,
        r'''$[:].turno''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<bool>? consumido(dynamic response) => (getJsonField(
        response,
        r'''$[:].consumido''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<bool>(x))
          .withoutNulls
          .toList();
  static List<int>? consumoId(dynamic response) => (getJsonField(
        response,
        r'''$[:].consumo_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<int>? first(dynamic response) => (getJsonField(
        response,
        r'''$[:].first''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<String>? categoria(dynamic response) => (getJsonField(
        response,
        r'''$[:].categoria''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? formadose(dynamic response) => (getJsonField(
        response,
        r'''$[:].forma_dose''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<int>? posologia(dynamic response) => (getJsonField(
        response,
        r'''$[:].posologia''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
}

class GetMedicamentosByNameCall {
  static Future<ApiCallResponse> call({
    String? medicamento = '',
  }) async {
    final ffApiRequestBody = '''
{
  "name": "$medicamento"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Get Medicamentos By Name',
      apiUrl:
          'https://obrniidkryzgroeudrsj.supabase.co/rest/v1/rpc/get_medicamentos_by_name',
      callType: ApiCallType.POST,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im9icm5paWRrcnl6Z3JvZXVkcnNqIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTQzOTg0MjksImV4cCI6MjAyOTk3NDQyOX0.XczFr7OwtAY2U06zTYWsFHKDwoDzdY10ZeO9hlevcAk',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im9icm5paWRrcnl6Z3JvZXVkcnNqIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTQzOTg0MjksImV4cCI6MjAyOTk3NDQyOX0.XczFr7OwtAY2U06zTYWsFHKDwoDzdY10ZeO9hlevcAk',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? id(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$[:].id''',
      ));
  static String? nome(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].nome''',
      ));
  static String? categ(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].categoria''',
      ));
}

class SendMessageToVivCall {
  static Future<ApiCallResponse> call({
    int? chat,
    String? message = '',
  }) async {
    final ffApiRequestBody = '''
{
  "Chat": $chat,
  "Message": "$message"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'sendMessageToViv',
      apiUrl:
          'https://primary-production-52d3.up.railway.app/webhook/5b1f2525-d444-4aa6-b66a-05baf3dc1a75',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CreatePacienteFromGoogleCall {
  static Future<ApiCallResponse> call({
    String? uid = '',
  }) async {
    final ffApiRequestBody = '''
{
  "uid": "$uid"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'createPacienteFromGoogle',
      apiUrl:
          'https://obrniidkryzgroeudrsj.supabase.co/rest/v1/rpc/create_paciente',
      callType: ApiCallType.POST,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im9icm5paWRrcnl6Z3JvZXVkcnNqIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTQzOTg0MjksImV4cCI6MjAyOTk3NDQyOX0.XczFr7OwtAY2U06zTYWsFHKDwoDzdY10ZeO9hlevcAk',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im9icm5paWRrcnl6Z3JvZXVkcnNqIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTQzOTg0MjksImV4cCI6MjAyOTk3NDQyOX0.XczFr7OwtAY2U06zTYWsFHKDwoDzdY10ZeO9hlevcAk',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CallChatCall {
  static Future<ApiCallResponse> call({
    String? nome = '',
    String? uid = '',
    String? pacid = '',
    String? threadid = '',
    int? chat,
    String? message = '',
  }) async {
    final ffApiRequestBody = '''
{
  "User": {
    "Name": "$nome",
    "uuid": "$uid",
    "paciente_id": "$pacid",
    "thread_id": "$threadid"
  },
  "Chat": $chat,
  "Message": "$message"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'callChat',
      apiUrl:
          'https://primary-production-52d3.up.railway.app/webhook/5b1f2525-d444-4aa6-b66a-05baf3dc1a75',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class EditUserCall {
  static Future<ApiCallResponse> call({
    String? userToken = '',
    String? userEmail = '',
    String? newPass = '',
  }) async {
    final ffApiRequestBody = '''
{
  "email": "$userEmail",
  "password": "$newPass"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'editUser',
      apiUrl: 'https://obrniidkryzgroeudrsj.supabase.co/auth/v1/user',
      callType: ApiCallType.POST,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im9icm5paWRrcnl6Z3JvZXVkcnNqIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTQzOTg0MjksImV4cCI6MjAyOTk3NDQyOX0.XczFr7OwtAY2U06zTYWsFHKDwoDzdY10ZeO9hlevcAk',
        'Authorization': 'Bearer $userToken',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class AnaliseEvolucaoCall {
  static Future<ApiCallResponse> call({
    int? userid,
    String? dateinit = '',
    String? dateend = '',
  }) async {
    final ffApiRequestBody = '''
{
  "UserId": $userid,
  "Init_Date": "$dateinit",
  "End_Date": "$dateend"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'analiseEvolucao',
      apiUrl:
          'https://primary-production-52d3.up.railway.app/webhook/3bf32d6e-7e77-4935-9bfb-3151ac69325c',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? tittle(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.obj.title''',
      ));
  static String? level(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.obj.level''',
      ));
  static String? analise(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.obj.analise''',
      ));
}

class NewGetAgendaCall {
  static Future<ApiCallResponse> call({
    String? date = '',
    int? cliente,
  }) async {
    final ffApiRequestBody = '''
{
  "currentdate": "$date",
  "periodo": 1,
  "userid": $cliente
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'newGetAgenda',
      apiUrl:
          'https://obrniidkryzgroeudrsj.supabase.co/rest/v1/rpc/get_agenda12',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im9icm5paWRrcnl6Z3JvZXVkcnNqIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTQzOTg0MjksImV4cCI6MjAyOTk3NDQyOX0.XczFr7OwtAY2U06zTYWsFHKDwoDzdY10ZeO9hlevcAk',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im9icm5paWRrcnl6Z3JvZXVkcnNqIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTQzOTg0MjksImV4cCI6MjAyOTk3NDQyOX0.XczFr7OwtAY2U06zTYWsFHKDwoDzdY10ZeO9hlevcAk',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetUserCall {
  static Future<ApiCallResponse> call({
    String? uid = '9c85c1bc-876d-45b5-9dac-6cb35d4f6914',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getUser',
      apiUrl:
          'https://obrniidkryzgroeudrsj.supabase.co/rest/v1/paciente?uuid=eq.$uid',
      callType: ApiCallType.GET,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im9icm5paWRrcnl6Z3JvZXVkcnNqIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTQzOTg0MjksImV4cCI6MjAyOTk3NDQyOX0.XczFr7OwtAY2U06zTYWsFHKDwoDzdY10ZeO9hlevcAk',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im9icm5paWRrcnl6Z3JvZXVkcnNqIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTQzOTg0MjksImV4cCI6MjAyOTk3NDQyOX0.XczFr7OwtAY2U06zTYWsFHKDwoDzdY10ZeO9hlevcAk',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetSintomasPlotCall {
  static Future<ApiCallResponse> call({
    String? initDate = '',
    String? endDate = '',
    int? pId,
  }) async {
    final ffApiRequestBody = '''
{
  "end_date": "$endDate",
  "start_date": "$initDate",
  "user_id": $pId
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'getSintomasPlot',
      apiUrl:
          'https://obrniidkryzgroeudrsj.supabase.co/rest/v1/rpc/count_symptoms',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im9icm5paWRrcnl6Z3JvZXVkcnNqIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTQzOTg0MjksImV4cCI6MjAyOTk3NDQyOX0.XczFr7OwtAY2U06zTYWsFHKDwoDzdY10ZeO9hlevcAk',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im9icm5paWRrcnl6Z3JvZXVkcnNqIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTQzOTg0MjksImV4cCI6MjAyOTk3NDQyOX0.XczFr7OwtAY2U06zTYWsFHKDwoDzdY10ZeO9hlevcAk',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? sintoma(dynamic response) => (getJsonField(
        response,
        r'''$[:].sintoma''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<int>? count(dynamic response) => (getJsonField(
        response,
        r'''$[:].count''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
