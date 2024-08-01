import '/flutter_flow/flutter_flow_util.dart';
import 'user_location_page_widget.dart' show UserLocationPageWidget;
import 'package:flutter/material.dart';

class UserLocationPageModel extends FlutterFlowModel<UserLocationPageWidget> {
  ///  Local state fields for this page.

  String routeDistance = 'routeDistance';

  String routeDuration = 'routeDuration';

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
