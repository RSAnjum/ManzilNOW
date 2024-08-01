import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'sign_up_personal_widget.dart' show SignUpPersonalWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class SignUpPersonalModel extends FlutterFlowModel<SignUpPersonalWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for fullName widget.
  FocusNode? fullNameFocusNode;
  TextEditingController? fullNameController;
  String? Function(BuildContext, String?)? fullNameControllerValidator;
  String? _fullNameControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 3) {
      return 'Enter Full Name';
    }

    return null;
  }

  // State field(s) for age widget.
  FocusNode? ageFocusNode;
  TextEditingController? ageController;
  String? Function(BuildContext, String?)? ageControllerValidator;
  String? _ageControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 2) {
      return 'Enter your age';
    }

    if (!RegExp('^(1[8-9]|[2-7][0-9]|80)\$').hasMatch(val)) {
      return 'Enter a Valid Age';
    }
    return null;
  }

  // State field(s) for cnic widget.
  FocusNode? cnicFocusNode;
  TextEditingController? cnicController;
  String? Function(BuildContext, String?)? cnicControllerValidator;
  String? _cnicControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 13) {
      return 'Enter a Valid CNIC';
    }

    if (!RegExp('^\\d{13}\$').hasMatch(val)) {
      return 'Enter a Valid CNIC';
    }
    return null;
  }

  // State field(s) for phoneNumber widget.
  FocusNode? phoneNumberFocusNode;
  TextEditingController? phoneNumberController;
  String? Function(BuildContext, String?)? phoneNumberControllerValidator;
  String? _phoneNumberControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 11) {
      return 'Enter a Valid Number';
    }

    if (!RegExp('^\\d{11}\$').hasMatch(val)) {
      return 'Enter Your 11 Digit Number';
    }
    return null;
  }

  // State field(s) for dateOfBirth widget.
  FocusNode? dateOfBirthFocusNode;
  TextEditingController? dateOfBirthController;
  final dateOfBirthMask = MaskTextInputFormatter(mask: '##/##/####');
  String? Function(BuildContext, String?)? dateOfBirthControllerValidator;
  String? _dateOfBirthControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 4) {
      return 'Please enter Your date of birth ';
    }

    return null;
  }

  DateTime? datePicked;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    fullNameControllerValidator = _fullNameControllerValidator;
    ageControllerValidator = _ageControllerValidator;
    cnicControllerValidator = _cnicControllerValidator;
    phoneNumberControllerValidator = _phoneNumberControllerValidator;
    dateOfBirthControllerValidator = _dateOfBirthControllerValidator;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    fullNameFocusNode?.dispose();
    fullNameController?.dispose();

    ageFocusNode?.dispose();
    ageController?.dispose();

    cnicFocusNode?.dispose();
    cnicController?.dispose();

    phoneNumberFocusNode?.dispose();
    phoneNumberController?.dispose();

    dateOfBirthFocusNode?.dispose();
    dateOfBirthController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
