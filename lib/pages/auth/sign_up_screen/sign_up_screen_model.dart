import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/app_bg_new/app_bg_new_widget.dart';
import '/components/app_button/app_button_widget.dart';
import '/components/app_logo_new/app_logo_new_widget.dart';
import '/components/app_textfield/app_textfield_widget.dart';
import '/components/app_textfield_pass/app_textfield_pass_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'sign_up_screen_widget.dart' show SignUpScreenWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SignUpScreenModel extends FlutterFlowModel<SignUpScreenWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // Model for app_bg_new component.
  late AppBgNewModel appBgNewModel;
  // Model for app_logo_new component.
  late AppLogoNewModel appLogoNewModel;
  // Model for FirstName.
  late AppTextfieldModel firstNameModel;
  // Model for LastName.
  late AppTextfieldModel lastNameModel;
  // Model for PhoneNumber.
  late AppTextfieldModel phoneNumberModel;
  // Model for EmailTexfield.
  late AppTextfieldModel emailTexfieldModel;
  // Model for app_textfield_pass component.
  late AppTextfieldPassModel appTextfieldPassModel;
  // Model for app_button component.
  late AppButtonModel appButtonModel;
  // Stores action output result for [Backend Call - API (sign up)] action in app_button widget.
  ApiCallResponse? signUpResponse;

  @override
  void initState(BuildContext context) {
    appBgNewModel = createModel(context, () => AppBgNewModel());
    appLogoNewModel = createModel(context, () => AppLogoNewModel());
    firstNameModel = createModel(context, () => AppTextfieldModel());
    lastNameModel = createModel(context, () => AppTextfieldModel());
    phoneNumberModel = createModel(context, () => AppTextfieldModel());
    emailTexfieldModel = createModel(context, () => AppTextfieldModel());
    appTextfieldPassModel = createModel(context, () => AppTextfieldPassModel());
    appButtonModel = createModel(context, () => AppButtonModel());

    firstNameModel.textfieldControllerValidator = _formTextFieldValidator1;
    lastNameModel.textfieldControllerValidator = _formTextFieldValidator2;
    phoneNumberModel.textfieldControllerValidator = _formTextFieldValidator3;
    emailTexfieldModel.textfieldControllerValidator = _formTextFieldValidator4;
    appTextfieldPassModel.textfieldControllerValidator =
        _formTextFieldValidator5;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    appBgNewModel.dispose();
    appLogoNewModel.dispose();
    firstNameModel.dispose();
    lastNameModel.dispose();
    phoneNumberModel.dispose();
    emailTexfieldModel.dispose();
    appTextfieldPassModel.dispose();
    appButtonModel.dispose();
  }

  /// Additional helper methods.

  String? _formTextFieldValidator1(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '2e5vnbfe' /* Enter firstname. */,
      );
    }

    return null;
  }

  String? _formTextFieldValidator2(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '306h25ij' /* Enter lastname. */,
      );
    }

    return null;
  }

  String? _formTextFieldValidator3(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'pa9d3nd7' /* Enter phone number. */,
      );
    }

    return null;
  }

  String? _formTextFieldValidator4(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'df09m6ag' /* Enter email. */,
      );
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Has to be a valid email address.';
    }
    return null;
  }

  String? _formTextFieldValidator5(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'ohidru6f' /* Enter password. */,
      );
    }

    return null;
  }
}
