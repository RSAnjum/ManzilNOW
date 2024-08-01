import '/flutter_flow/flutter_flow_util.dart';
import 'my_earnings_widget.dart' show MyEarningsWidget;
import 'package:flutter/material.dart';

class MyEarningsModel extends FlutterFlowModel<MyEarningsWidget> {
  ///  Local state fields for this page.

  int? avgRating = 0;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
