import '/flutter_flow/flutter_flow_util.dart';
import 'fare_widget.dart' show FareWidget;
import 'package:flutter/material.dart';

class FareModel extends FlutterFlowModel<FareWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for fareRate widget.
  FocusNode? fareRateFocusNode;
  TextEditingController? fareRateController;
  String? Function(BuildContext, String?)? fareRateControllerValidator;
  String? _fareRateControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 2) {
      return 'Fare too low!';
    }
    if (val.length > 4) {
      return 'Fare too high!';
    }

    return null;
  }

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    fareRateControllerValidator = _fareRateControllerValidator;
  }

  @override
  void dispose() {
    fareRateFocusNode?.dispose();
    fareRateController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
