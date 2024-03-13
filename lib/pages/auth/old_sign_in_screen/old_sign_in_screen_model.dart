import '/components/app_bg/app_bg_widget.dart';
import '/components/app_button/app_button_widget.dart';
import '/components/app_logo/app_logo_widget.dart';
import '/components/app_textfield/app_textfield_widget.dart';
import '/components/app_textfield_password/app_textfield_password_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'old_sign_in_screen_widget.dart' show OldSignInScreenWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class OldSignInScreenModel extends FlutterFlowModel<OldSignInScreenWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // Model for app_bg component.
  late AppBgModel appBgModel;
  // Model for app_logo component.
  late AppLogoModel appLogoModel;
  // Model for email.
  late AppTextfieldModel emailModel;
  // Model for app_textfield_password component.
  late AppTextfieldPasswordModel appTextfieldPasswordModel;
  // Model for app_button component.
  late AppButtonModel appButtonModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    appBgModel = createModel(context, () => AppBgModel());
    appLogoModel = createModel(context, () => AppLogoModel());
    emailModel = createModel(context, () => AppTextfieldModel());
    appTextfieldPasswordModel =
        createModel(context, () => AppTextfieldPasswordModel());
    appButtonModel = createModel(context, () => AppButtonModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    appBgModel.dispose();
    appLogoModel.dispose();
    emailModel.dispose();
    appTextfieldPasswordModel.dispose();
    appButtonModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
