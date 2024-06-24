import '/backend/supabase/supabase.dart';
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
