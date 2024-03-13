import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'app_logo_model.dart';
export 'app_logo_model.dart';

class AppLogoWidget extends StatefulWidget {
  const AppLogoWidget({
    super.key,
    this.height,
    this.width,
  });

  final int? height;
  final int? width;

  @override
  State<AppLogoWidget> createState() => _AppLogoWidgetState();
}

class _AppLogoWidgetState extends State<AppLogoWidget> {
  late AppLogoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AppLogoModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(0.0),
      child: SvgPicture.asset(
        'assets/images/logo_primary_color.svg',
        width: widget.width?.toDouble(),
        height: widget.height?.toDouble(),
        fit: BoxFit.contain,
      ),
    );
  }
}
