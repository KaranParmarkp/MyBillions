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
import 'dart:ui';
import '/index.dart';
import 'sign_in_screen_widget.dart' show SignInScreenWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SignInScreenModel extends FlutterFlowModel<SignInScreenWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for app_bg_new component.
  late AppBgNewModel appBgNewModel;
  // Model for app_logo_new component.
  late AppLogoNewModel appLogoNewModel;
  // Model for EmailTexfield.
  late AppTextfieldModel emailTexfieldModel;
  // Model for app_textfield_pass component.
  late AppTextfieldPassModel appTextfieldPassModel;
  // Model for app_button component.
  late AppButtonModel appButtonModel;
  // Stores action output result for [Backend Call - API (sign in)] action in app_button widget.
  ApiCallResponse? signInResponse;

  @override
  void initState(BuildContext context) {
    appBgNewModel = createModel(context, () => AppBgNewModel());
    appLogoNewModel = createModel(context, () => AppLogoNewModel());
    emailTexfieldModel = createModel(context, () => AppTextfieldModel());
    appTextfieldPassModel = createModel(context, () => AppTextfieldPassModel());
    appButtonModel = createModel(context, () => AppButtonModel());
    emailTexfieldModel.textfieldTextControllerValidator =
        _formTextFieldValidator1;
    appTextfieldPassModel.textfieldTextControllerValidator =
        _formTextFieldValidator2;
  }

  @override
  void dispose() {
    appBgNewModel.dispose();
    appLogoNewModel.dispose();
    emailTexfieldModel.dispose();
    appTextfieldPassModel.dispose();
    appButtonModel.dispose();
  }

  /// Additional helper methods.

  String? _formTextFieldValidator1(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'ud9msca3' /* Enter email. */,
      );
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Has to be a valid email address.';
    }
    return null;
  }

  String? _formTextFieldValidator2(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'b4jjjhib' /* Enter password. */,
      );
    }

    return null;
  }
}
