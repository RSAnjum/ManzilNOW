import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'debug_widget.dart' show DebugWidget;
import 'package:flutter/material.dart';

class DebugModel extends FlutterFlowModel<DebugWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  FareRecord? tempFareReference;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  FareRecord? tempFareValues;

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
