import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'app_logo_new_model.dart';
export 'app_logo_new_model.dart';

class AppLogoNewWidget extends StatefulWidget {
  const AppLogoNewWidget({
    super.key,
    bool? showPadding,
  }) : this.showPadding = showPadding ?? false;

  final bool showPadding;

  @override
  State<AppLogoNewWidget> createState() => _AppLogoNewWidgetState();
}

class _AppLogoNewWidgetState extends State<AppLogoNewWidget> {
  late AppLogoNewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AppLogoNewModel());

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
      child: Padding(
        padding: EdgeInsets.all(valueOrDefault<double>(
          widget.showPadding ? 50.0 : 10.0,
          0.0,
        )),
        child: SvgPicture.asset(
          'assets/images/logo_primary_color.svg',
          height: 61.0,
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}
