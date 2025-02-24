import '/backend/api_requests/api_calls.dart';
import '/components/app_bg_new/app_bg_new_widget.dart';
import '/components/app_button/app_button_widget.dart';
import '/components/app_logo_new/app_logo_new_widget.dart';
import '/components/app_textfield/app_textfield_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'reset_password_screen_widget.dart' show ResetPasswordScreenWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ResetPasswordScreenModel
    extends FlutterFlowModel<ResetPasswordScreenWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for app_bg_new component.
  late AppBgNewModel appBgNewModel;
  // Model for app_logo_new component.
  late AppLogoNewModel appLogoNewModel;
  // Model for SecurityCode.
  late AppTextfieldModel securityCodeModel;
  // Model for NewPassword.
  late AppTextfieldModel newPasswordModel;
  // Model for ConfNewPassword.
  late AppTextfieldModel confNewPasswordModel;
  // Model for app_button component.
  late AppButtonModel appButtonModel1;
  // Model for app_button component.
  late AppButtonModel appButtonModel2;
  // Stores action output result for [Backend Call - API (reset password)] action in app_button widget.
  ApiCallResponse? resetApiResponse;

  @override
  void initState(BuildContext context) {
    appBgNewModel = createModel(context, () => AppBgNewModel());
    appLogoNewModel = createModel(context, () => AppLogoNewModel());
    securityCodeModel = createModel(context, () => AppTextfieldModel());
    newPasswordModel = createModel(context, () => AppTextfieldModel());
    confNewPasswordModel = createModel(context, () => AppTextfieldModel());
    appButtonModel1 = createModel(context, () => AppButtonModel());
    appButtonModel2 = createModel(context, () => AppButtonModel());
    securityCodeModel.textfieldTextControllerValidator =
        _formTextFieldValidator1;
    newPasswordModel.textfieldTextControllerValidator =
        _formTextFieldValidator2;
    confNewPasswordModel.textfieldTextControllerValidator =
        _formTextFieldValidator3;
  }

  @override
  void dispose() {
    appBgNewModel.dispose();
    appLogoNewModel.dispose();
    securityCodeModel.dispose();
    newPasswordModel.dispose();
    confNewPasswordModel.dispose();
    appButtonModel1.dispose();
    appButtonModel2.dispose();
  }

  /// Additional helper methods.

  String? _formTextFieldValidator1(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '52fvmaed' /* Enter security code. */,
      );
    }

    return null;
  }

  String? _formTextFieldValidator2(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'g498p9hj' /* Enter new password. */,
      );
    }

    return null;
  }

  String? _formTextFieldValidator3(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '4beq4mvg' /* Enter confirm new password. */,
      );
    }

    return null;
  }
}
