import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'app_logo_new2_model.dart';
export 'app_logo_new2_model.dart';

class AppLogoNew2Widget extends StatefulWidget {
  const AppLogoNew2Widget({
    super.key,
    bool? showPadding,
  }) : this.showPadding = showPadding ?? false;

  final bool showPadding;

  @override
  State<AppLogoNew2Widget> createState() => _AppLogoNew2WidgetState();
}

class _AppLogoNew2WidgetState extends State<AppLogoNew2Widget> {
  late AppLogoNew2Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AppLogoNew2Model());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: SvgPicture.asset(
        'assets/images/logo_primary_color.svg',
        height: 40.0,
        fit: BoxFit.contain,
      ),
    );
  }
}
