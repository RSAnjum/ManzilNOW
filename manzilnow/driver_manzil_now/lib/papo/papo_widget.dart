import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'papo_model.dart';
export 'papo_model.dart';

class PapoWidget extends StatefulWidget {
  const PapoWidget({super.key});

  @override
  State<PapoWidget> createState() => _PapoWidgetState();
}

class _PapoWidgetState extends State<PapoWidget> {
  late PapoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PapoModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: StreamBuilder<List<CompleteRideRecord>>(
            stream: queryCompleteRideRecord(
              queryBuilder: (completeRideRecord) => completeRideRecord.where(
                'driver_uid',
                isEqualTo: currentUserUid,
              ),
            ),
            builder: (context, snapshot) {
              // Customize what your widget looks like when it's loading.
              if (!snapshot.hasData) {
                return Center(
                  child: SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        FlutterFlowTheme.of(context).primary,
                      ),
                    ),
                  ),
                );
              }
              List<CompleteRideRecord> listViewCompleteRideRecordList =
                  snapshot.data!;
              return ListView.builder(
                padding: EdgeInsets.zero,
                scrollDirection: Axis.vertical,
                itemCount: listViewCompleteRideRecordList.length,
                itemBuilder: (context, listViewIndex) {
                  final listViewCompleteRideRecord =
                      listViewCompleteRideRecordList[listViewIndex];
                  return Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                    child: Container(
                      width: 100.0,
                      height: 121.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primaryText,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 12.0, 16.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        StreamBuilder<List<PassengerRecord>>(
                                          stream: queryPassengerRecord(
                                            queryBuilder: (passengerRecord) =>
                                                passengerRecord.where(
                                              'uid',
                                              isEqualTo:
                                                  listViewCompleteRideRecord
                                                      .passengerUid,
                                            ),
                                            singleRecord: true,
                                          ),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 50.0,
                                                  height: 50.0,
                                                  child:
                                                      CircularProgressIndicator(
                                                    valueColor:
                                                        AlwaysStoppedAnimation<
                                                            Color>(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }
                                            List<PassengerRecord>
                                                textPassengerRecordList =
                                                snapshot.data!;
                                            // Return an empty Container when the item does not exist.
                                            if (snapshot.data!.isEmpty) {
                                              return Container();
                                            }
                                            final textPassengerRecord =
                                                textPassengerRecordList
                                                        .isNotEmpty
                                                    ? textPassengerRecordList
                                                        .first
                                                    : null;
                                            return Text(
                                              valueOrDefault<String>(
                                                textPassengerRecord
                                                    ?.displayName,
                                                'Ali',
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .titleLarge
                                                  .override(
                                                    fontFamily: 'Outfit',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    fontSize: 22.0,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                            );
                                          },
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 4.0, 0.0, 4.0),
                                          child: StreamBuilder<
                                              List<CompleteRideRecord>>(
                                            stream: queryCompleteRideRecord(
                                              queryBuilder:
                                                  (completeRideRecord) =>
                                                      completeRideRecord.where(
                                                'driver_uid',
                                                isEqualTo: currentUserUid,
                                              ),
                                              singleRecord: true,
                                            ),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: SizedBox(
                                                    width: 50.0,
                                                    height: 50.0,
                                                    child:
                                                        CircularProgressIndicator(
                                                      valueColor:
                                                          AlwaysStoppedAnimation<
                                                              Color>(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }
                                              List<CompleteRideRecord>
                                                  ratingBarCompleteRideRecordList =
                                                  snapshot.data!;
                                              // Return an empty Container when the item does not exist.
                                              if (snapshot.data!.isEmpty) {
                                                return Container();
                                              }
                                              final ratingBarCompleteRideRecord =
                                                  ratingBarCompleteRideRecordList
                                                          .isNotEmpty
                                                      ? ratingBarCompleteRideRecordList
                                                          .first
                                                      : null;
                                              return RatingBarIndicator(
                                                itemBuilder: (context, index) =>
                                                    const Icon(
                                                  Icons.star_rounded,
                                                  color: Color(0xFFF3A743),
                                                ),
                                                direction: Axis.horizontal,
                                                rating:
                                                    listViewCompleteRideRecord
                                                        .rating
                                                        .toDouble(),
                                                unratedColor: const Color(0xFF95A1AC),
                                                itemCount: 5,
                                                itemSize: 24.0,
                                              );
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                    Card(
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      color: const Color(0xFFE0E3E7),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(40.0),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(2.0),
                                        child: StreamBuilder<
                                            List<PassengerRecord>>(
                                          stream: queryPassengerRecord(
                                            queryBuilder: (passengerRecord) =>
                                                passengerRecord.where(
                                              'uid',
                                              isEqualTo:
                                                  listViewCompleteRideRecord
                                                      .passengerUid,
                                            ),
                                            singleRecord: true,
                                          ),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 50.0,
                                                  height: 50.0,
                                                  child:
                                                      CircularProgressIndicator(
                                                    valueColor:
                                                        AlwaysStoppedAnimation<
                                                            Color>(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }
                                            List<PassengerRecord>
                                                circleImagePassengerRecordList =
                                                snapshot.data!;
                                            // Return an empty Container when the item does not exist.
                                            if (snapshot.data!.isEmpty) {
                                              return Container();
                                            }
                                            final circleImagePassengerRecord =
                                                circleImagePassengerRecordList
                                                        .isNotEmpty
                                                    ? circleImagePassengerRecordList
                                                        .first
                                                    : null;
                                            return Container(
                                              width: 50.0,
                                              height: 50.0,
                                              clipBehavior: Clip.antiAlias,
                                              decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                              ),
                                              child: Image.network(
                                                circleImagePassengerRecord!
                                                    .photoUrl,
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              StreamBuilder<List<PassengerRecord>>(
                                stream: queryPassengerRecord(
                                  queryBuilder: (passengerRecord) =>
                                      passengerRecord.where(
                                    'uid',
                                    isEqualTo:
                                        listViewCompleteRideRecord.passengerUid,
                                  ),
                                  singleRecord: true,
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 50.0,
                                        height: 50.0,
                                        child: CircularProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                  List<PassengerRecord>
                                      textPassengerRecordList = snapshot.data!;
                                  // Return an empty Container when the item does not exist.
                                  if (snapshot.data!.isEmpty) {
                                    return Container();
                                  }
                                  final textPassengerRecord =
                                      textPassengerRecordList.isNotEmpty
                                          ? textPassengerRecordList.first
                                          : null;
                                  return Text(
                                    valueOrDefault<String>(
                                      textPassengerRecord?.displayName,
                                      'Ali',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .override(
                                          fontFamily: 'Outfit',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          fontSize: 0.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  );
                                },
                              ),
                              StreamBuilder<List<PassengerRecord>>(
                                stream: queryPassengerRecord(
                                  queryBuilder: (passengerRecord) =>
                                      passengerRecord.where(
                                    'uid',
                                    isEqualTo:
                                        listViewCompleteRideRecord.passengerUid,
                                  ),
                                  singleRecord: true,
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 50.0,
                                        height: 50.0,
                                        child: CircularProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                  List<PassengerRecord>
                                      textPassengerRecordList = snapshot.data!;
                                  // Return an empty Container when the item does not exist.
                                  if (snapshot.data!.isEmpty) {
                                    return Container();
                                  }
                                  final textPassengerRecord =
                                      textPassengerRecordList.isNotEmpty
                                          ? textPassengerRecordList.first
                                          : null;
                                  return Text(
                                    valueOrDefault<String>(
                                      textPassengerRecord?.uid,
                                      'Ali',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .override(
                                          fontFamily: 'Outfit',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          fontSize: 10.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  );
                                },
                              ),
                              StreamBuilder<List<PassengerRecord>>(
                                stream: queryPassengerRecord(
                                  queryBuilder: (passengerRecord) =>
                                      passengerRecord.where(
                                    'uid',
                                    isEqualTo:
                                        listViewCompleteRideRecord.passengerUid,
                                  ),
                                  singleRecord: true,
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 50.0,
                                        height: 50.0,
                                        child: CircularProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                  List<PassengerRecord>
                                      textPassengerRecordList = snapshot.data!;
                                  // Return an empty Container when the item does not exist.
                                  if (snapshot.data!.isEmpty) {
                                    return Container();
                                  }
                                  final textPassengerRecord =
                                      textPassengerRecordList.isNotEmpty
                                          ? textPassengerRecordList.first
                                          : null;
                                  return Text(
                                    listViewCompleteRideRecord.passengerUid,
                                    style: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .override(
                                          fontFamily: 'Outfit',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          fontSize: 10.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
