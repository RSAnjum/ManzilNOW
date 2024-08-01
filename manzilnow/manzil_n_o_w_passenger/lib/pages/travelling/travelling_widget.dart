import '/backend/backend.dart';
import '/components/help_main/help_main_widget.dart';
import '/components/panic/panic_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'travelling_model.dart';
export 'travelling_model.dart';

class TravellingWidget extends StatefulWidget {
  const TravellingWidget({
    super.key,
    required this.rideDetailsReference,
  });

  final DocumentReference? rideDetailsReference;

  @override
  State<TravellingWidget> createState() => _TravellingWidgetState();
}

class _TravellingWidgetState extends State<TravellingWidget> {
  late TravellingModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TravellingModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<RideRequestRecord>(
      stream: RideRequestRecord.getDocument(widget.rideDetailsReference!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: SpinKitFadingFour(
                  color: FlutterFlowTheme.of(context).primary,
                  size: 50.0,
                ),
              ),
            ),
          );
        }
        final travellingRideRequestRecord = snapshot.data!;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: SafeArea(
              top: true,
              child: Stack(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: double.infinity,
                    child: custom_widgets.RouteViewStatic(
                      width: double.infinity,
                      height: double.infinity,
                      lineColor: FlutterFlowTheme.of(context).secondary,
                      iOSGoogleMapsApiKey:
                          'AIzaSyDUodZiLczWSlpfGMzRcDuLkX_SkLD1-Fo',
                      androidGoogleMapsApiKey:
                          'AIzaSyCFwWBkpzTTQBdeky5GBJiIk8b04zozds8',
                      webGoogleMapsApiKey:
                          'AIzaSyDtpoYWqDri34pG_aAcjrOyGVGAN4W0IVw',
                      startAddress: travellingRideRequestRecord.pickupAdd,
                      destinationAddress:
                          travellingRideRequestRecord.destinationAdd,
                      startCoordinate: travellingRideRequestRecord.pickup!,
                      endCoordinate: travellingRideRequestRecord.destination!,
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Align(
                        alignment: const AlignmentDirectional(1.0, 1.0),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: FlutterFlowIconButton(
                            borderColor: FlutterFlowTheme.of(context).secondary,
                            borderRadius: 50.0,
                            borderWidth: 1.0,
                            buttonSize: 60.0,
                            fillColor: FlutterFlowTheme.of(context).secondary,
                            icon: Icon(
                              Icons.check,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 42.0,
                            ),
                            onPressed: () async {
                              if (travellingRideRequestRecord.status ==
                                  'completed') {
                                context.goNamed(
                                  'completed',
                                  queryParameters: {
                                    'rideReference': serializeParam(
                                      widget.rideDetailsReference,
                                      ParamType.DocumentReference,
                                    ),
                                  }.withoutNulls,
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Ride not completed yet',
                                      style: TextStyle(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                    ),
                                    duration: const Duration(milliseconds: 4000),
                                    backgroundColor:
                                        FlutterFlowTheme.of(context).secondary,
                                  ),
                                );
                              }
                            },
                          ),
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(1.0, 1.0),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: FlutterFlowIconButton(
                            borderColor: FlutterFlowTheme.of(context).secondary,
                            borderRadius: 50.0,
                            borderWidth: 1.0,
                            buttonSize: 60.0,
                            fillColor: FlutterFlowTheme.of(context).secondary,
                            icon: Icon(
                              Icons.question_mark,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 42.0,
                            ),
                            onPressed: () async {
                              await showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                context: context,
                                builder: (context) {
                                  return GestureDetector(
                                    onTap: () => _model
                                            .unfocusNode.canRequestFocus
                                        ? FocusScope.of(context)
                                            .requestFocus(_model.unfocusNode)
                                        : FocusScope.of(context).unfocus(),
                                    child: Padding(
                                      padding: MediaQuery.viewInsetsOf(context),
                                      child: HelpMainWidget(
                                        driverId: travellingRideRequestRecord
                                            .driverUid,
                                        rideId: travellingRideRequestRecord
                                            .reference.id,
                                        rideReference:
                                            travellingRideRequestRecord
                                                .reference,
                                      ),
                                    ),
                                  );
                                },
                              ).then((value) => safeSetState(() {}));
                            },
                          ),
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(1.0, 1.0),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: FlutterFlowIconButton(
                            borderColor: FlutterFlowTheme.of(context).error,
                            borderRadius: 50.0,
                            borderWidth: 1.0,
                            buttonSize: 60.0,
                            fillColor: FlutterFlowTheme.of(context).error,
                            icon: Icon(
                              Icons.report,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 42.0,
                            ),
                            onPressed: () async {
                              await showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                context: context,
                                builder: (context) {
                                  return GestureDetector(
                                    onTap: () => _model
                                            .unfocusNode.canRequestFocus
                                        ? FocusScope.of(context)
                                            .requestFocus(_model.unfocusNode)
                                        : FocusScope.of(context).unfocus(),
                                    child: Padding(
                                      padding: MediaQuery.viewInsetsOf(context),
                                      child: PanicWidget(
                                        driverId: travellingRideRequestRecord
                                            .driverUid,
                                        rideId: widget.rideDetailsReference!.id,
                                      ),
                                    ),
                                  );
                                },
                              ).then((value) => safeSetState(() {}));
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
