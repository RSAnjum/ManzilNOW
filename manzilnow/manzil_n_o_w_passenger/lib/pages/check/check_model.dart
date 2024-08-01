import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'check_widget.dart' show CheckWidget;
import 'package:flutter/material.dart';

class CheckModel extends FlutterFlowModel<CheckWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in check widget.
  FareRecord? fareReference;
  // Stores action output result for [Backend Call - Read Document] action in check widget.
  FareRecord? fareValues;

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
