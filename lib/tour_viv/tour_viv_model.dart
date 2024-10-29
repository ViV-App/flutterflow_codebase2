import '/flutter_flow/flutter_flow_util.dart';
import 'tour_viv_widget.dart' show TourVivWidget;
import 'package:flutter/material.dart';

class TourVivModel extends FlutterFlowModel<TourVivWidget> {
  ///  Local state fields for this page.

  bool arrow = true;

  ///  State fields for stateful widgets in this page.

  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
