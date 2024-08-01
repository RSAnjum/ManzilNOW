import '/flutter_flow/flutter_flow_util.dart';
import 'papo_widget.dart' show PapoWidget;
import 'package:flutter/material.dart';

class PapoModel extends FlutterFlowModel<PapoWidget> {
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
