import '/backend/api_requests/api_manager.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

Future<List<PacienteRow>?> returnCurrentUser(
  BuildContext context, {
  String? uid,
}) async {
  List<PacienteRow>? returned;

  returned = await PacienteTable().queryRows(
    queryFn: (q) => q.eq(
      'uuid',
      uid,
    ),
  );

  return null;
}
