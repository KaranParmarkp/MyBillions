import '/backend/api_requests/api_calls.dart';
import '/components/app_bg_new/app_bg_new_widget.dart';
import '/components/app_button/app_button_widget.dart';
import '/components/app_logo_new/app_logo_new_widget.dart';
import '/components/app_textfield/app_textfield_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'forgot_password_screen_widget.dart' show ForgotPasswordScreenWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ForgotPasswordScreenModel
    extends FlutterFlowModel<ForgotPasswordScreenWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // Model for app_bg_new component.
  late AppBgNewModel appBgNewModel;
  // Model for app_logo_new component.
  late AppLogoNewModel appLogoNewModel;
  // Model for EmailTexfield.
  late AppTextfieldModel emailTexfieldModel;
  // Model for app_button component.
  late AppButtonModel appButtonModel1;
  // Model for app_button component.
  late AppButtonModel appButtonModel2;
  // Stores action output result for [Backend Call - API (forgot password)] action in app_button widget.
  ApiCallResponse? forgotResponse;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    appBgNewModel = createModel(context, () => AppBgNewModel());
    appLogoNewModel = createModel(context, () => AppLogoNewModel());
    emailTexfieldModel = createModel(context, () => AppTextfieldModel());
    appButtonModel1 = createModel(context, () => AppButtonModel());
    appButtonModel2 = createModel(context, () => AppButtonModel());

    emailTexfieldModel.textfieldControllerValidator = _formTextFieldValidator;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    appBgNewModel.dispose();
    appLogoNewModel.dispose();
    emailTexfieldModel.dispose();
    appButtonModel1.dispose();
    appButtonModel2.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

  String? _formTextFieldValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '4rvkm36l' /* Enter email. */,
      );
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Has to be a valid email address.';
    }
    return null;
  }
}
