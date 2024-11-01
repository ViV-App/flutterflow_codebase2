// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:segment_analytics/client.dart';
import 'package:segment_analytics/state.dart';

Future segmentScreen(String screenName, dynamic properties) async {
  // Check for App update from play store using the package
  // Check for available update
  final analytics =
      createClient(Configuration('gqiFdg31y2rg5AZ8qVCIF2xzgoihx1Rj'));

  analytics.screen(screenName, properties: properties);
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
