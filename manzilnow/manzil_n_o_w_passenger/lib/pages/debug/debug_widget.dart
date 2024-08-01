import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'debug_model.dart';
export 'debug_model.dart';

class DebugWidget extends StatefulWidget {
  const DebugWidget({super.key});

  @override
  State<DebugWidget> createState() => _DebugWidgetState();
}

class _DebugWidgetState extends State<DebugWidget> {
  late DebugModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DebugModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          title: Text(
            'Debug',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Outfit',
                  color: Colors.white,
                  fontSize: 22.0,
                ),
          ),
          actions: const [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Align(
            alignment: const AlignmentDirectional(0.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  valueOrDefault<String>(
                    FFAppState().pickup?.toString(),
                    'nill',
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium,
                ),
                Text(
                  valueOrDefault<String>(
                    functions.latLntToString(FFAppState().pickup),
                    '0,0',
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium,
                ),
                Text(
                  valueOrDefault<String>(
                    FFAppState().destination?.toString(),
                    'nill',
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium,
                ),
                Text(
                  valueOrDefault<String>(
                    functions.latLntToString(FFAppState().destination),
                    '0,0',
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium,
                ),
                Text(
                  valueOrDefault<String>(
                    FFAppState().fare.toString(),
                    'nill',
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium,
                ),
                Text(
                  FFAppState().payment,
                  style: FlutterFlowTheme.of(context).bodyMedium,
                ),
                Text(
                  FFAppState().additionalReq,
                  style: FlutterFlowTheme.of(context).bodyMedium,
                ),
                Text(
                  FFAppState().femaleReq.toString(),
                  style: FlutterFlowTheme.of(context).bodyMedium,
                ),
                Text(
                  FFAppState().pickupName,
                  style: FlutterFlowTheme.of(context).bodyMedium,
                ),
                Text(
                  FFAppState().distText,
                  style: FlutterFlowTheme.of(context).bodyMedium,
                ),
                Text(
                  valueOrDefault<String>(
                    FFAppState().distVal.toString(),
                    'nill',
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium,
                ),
                Text(
                  FFAppState().timeText,
                  style: FlutterFlowTheme.of(context).bodyMedium,
                ),
                Text(
                  FFAppState().timeVal.toString(),
                  style: FlutterFlowTheme.of(context).bodyMedium,
                ),
                Text(
                  FFAppState().destName,
                  style: FlutterFlowTheme.of(context).bodyMedium,
                ),
                Divider(
                  thickness: 1.0,
                  color: FlutterFlowTheme.of(context).secondary,
                ),
                Text(
                  FFAppState().fuelPrice.toString(),
                  style: FlutterFlowTheme.of(context).bodyMedium,
                ),
                Text(
                  FFAppState().carBaseFare.toString(),
                  style: FlutterFlowTheme.of(context).bodyMedium,
                ),
                Text(
                  FFAppState().carFuelConsumption.toString(),
                  style: FlutterFlowTheme.of(context).bodyMedium,
                ),
                Text(
                  FFAppState().bikeBaseFare.toString(),
                  style: FlutterFlowTheme.of(context).bodyMedium,
                ),
                Text(
                  FFAppState().carFuelConsumption.toString(),
                  style: FlutterFlowTheme.of(context).bodyMedium,
                ),
                Text(
                  FFAppState().rickshawBaseFare.toString(),
                  style: FlutterFlowTheme.of(context).bodyMedium,
                ),
                Text(
                  FFAppState().rickshawFuelConsumption.toString(),
                  style: FlutterFlowTheme.of(context).bodyMedium,
                ),
                Divider(
                  thickness: 1.0,
                  color: FlutterFlowTheme.of(context).secondary,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      _model.tempFareReference = await queryFareRecordOnce(
                        singleRecord: true,
                      ).then((s) => s.firstOrNull);
                      _model.tempFareValues = await FareRecord.getDocumentOnce(
                          _model.tempFareReference!.reference);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            _model.tempFareValues!.hasCarBaseFare().toString(),
                            style: TextStyle(
                              color: FlutterFlowTheme.of(context).primaryText,
                            ),
                          ),
                          duration: const Duration(milliseconds: 4000),
                          backgroundColor:
                              FlutterFlowTheme.of(context).secondary,
                        ),
                      );

                      setState(() {});
                    },
                    text: 'Firebase connection',
                    options: FFButtonOptions(
                      height: 40.0,
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      iconPadding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Readex Pro',
                                color: Colors.white,
                              ),
                      elevation: 3.0,
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
                FFButtonWidget(
                  onPressed: () async {
                    context.safePop();
                  },
                  text: 'Back',
                  options: FFButtonOptions(
                    height: 40.0,
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                    iconPadding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Readex Pro',
                          color: Colors.white,
                        ),
                    elevation: 3.0,
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
