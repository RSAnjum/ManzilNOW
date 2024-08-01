import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'sign_up_vehical_widget.dart' show SignUpVehicalWidget;
import 'package:flutter/material.dart';

class SignUpVehicalModel extends FlutterFlowModel<SignUpVehicalWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // State field(s) for registrationNumber widget.
  FocusNode? registrationNumberFocusNode;
  TextEditingController? registrationNumberController;
  String? Function(BuildContext, String?)?
      registrationNumberControllerValidator;
  String? _registrationNumberControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 4) {
      return 'Enter valid Registration Number';
    }

    if (!RegExp('^[a-zA-Z]{3}[0-9]{1,4}\$').hasMatch(val)) {
      return 'Enter valid Registration Number';
    }
    return null;
  }

  // State field(s) for carModel widget.
  FocusNode? carModelFocusNode;
  TextEditingController? carModelController;
  String? Function(BuildContext, String?)? carModelControllerValidator;
  String? _carModelControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 5) {
      return 'Enter a Valid Model';
    }

    return null;
  }

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    registrationNumberControllerValidator =
        _registrationNumberControllerValidator;
    carModelControllerValidator = _carModelControllerValidator;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    registrationNumberFocusNode?.dispose();
    registrationNumberController?.dispose();

    carModelFocusNode?.dispose();
    carModelController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
