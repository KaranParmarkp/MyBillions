import '/components/app_logo_new_2/app_logo_new2_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'appbar_logo_model.dart';
export 'appbar_logo_model.dart';

class AppbarLogoWidget extends StatefulWidget {
  const AppbarLogoWidget({super.key});

  @override
  State<AppbarLogoWidget> createState() => _AppbarLogoWidgetState();
}

class _AppbarLogoWidgetState extends State<AppbarLogoWidget> {
  late AppbarLogoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AppbarLogoModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: wrapWithModel(
                  model: _model.appLogoNew2Model,
                  updateCallback: () => setState(() {}),
                  child: AppLogoNew2Widget(
                    showPadding: false,
                  ),
                ),
              ),
            ],
          ),
        ),
        Divider(
          thickness: 1.0,
          color: FlutterFlowTheme.of(context).accent4,
        ),
      ],
    );
  }
}
