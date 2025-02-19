import '/components/app_button/app_button_widget.dart';
import '/components/app_textfield/app_textfield_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'text_saving_screen_widget.dart' show TextSavingScreenWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TextSavingScreenModel extends FlutterFlowModel<TextSavingScreenWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for app_textfield component.
  late AppTextfieldModel appTextfieldModel;
  // Model for app_button component.
  late AppButtonModel appButtonModel;
  // Stores action output result for [Validate Form] action in app_button widget.
  bool? formResult;

  @override
  void initState(BuildContext context) {
    appTextfieldModel = createModel(context, () => AppTextfieldModel());
    appButtonModel = createModel(context, () => AppButtonModel());
    appTextfieldModel.textfieldTextControllerValidator =
        _formTextFieldValidator;
  }

  @override
  void dispose() {
    appTextfieldModel.dispose();
    appButtonModel.dispose();
  }

  /// Additional helper methods.

  String? _formTextFieldValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'n27z5p4r' /* Name is required */,
      );
    }

    return null;
  }
}
