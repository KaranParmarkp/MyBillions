import '/components/app_logo_new_2/app_logo_new2_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'appbar_logo_widget.dart' show AppbarLogoWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AppbarLogoModel extends FlutterFlowModel<AppbarLogoWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for app_logo_new_2 component.
  late AppLogoNew2Model appLogoNew2Model;

  @override
  void initState(BuildContext context) {
    appLogoNew2Model = createModel(context, () => AppLogoNew2Model());
  }

  @override
  void dispose() {
    appLogoNew2Model.dispose();
  }
}
