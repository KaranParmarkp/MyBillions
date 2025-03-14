import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'app_textfield_widget.dart' show AppTextfieldWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AppTextfieldModel extends FlutterFlowModel<AppTextfieldWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for textfield widget.
  FocusNode? textfieldFocusNode;
  TextEditingController? textfieldTextController;
  String? Function(BuildContext, String?)? textfieldTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textfieldFocusNode?.dispose();
    textfieldTextController?.dispose();
  }
}
