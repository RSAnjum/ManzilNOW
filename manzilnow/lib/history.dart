import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'driverdetails.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});
  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class PreviousRide {
  final String rideID;
  final String driverID;
  final String userID;
  final String date;
  final String time;
  final String departure;
  final String destination;
  final String fare;
  final String status;
  final String driverFirstName;
  final String driverLastName;
  final String driverPhoto;

  PreviousRide({
    required this.rideID,
    required this.driverID,
    required this.userID,
    required this.date,
    required this.time,
    required this.departure,
    required this.destination,
    required this.fare,
    required this.status,
    required this.driverFirstName,
    required this.driverLastName,
    required this.driverPhoto,
  });
}

class _HistoryPageState extends State<HistoryPage> {
  int selectedCardIndex = -1;

  Future<void> fetchPreviousRides() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String passengerId = prefs.getString('token') ?? '';
    DatabaseReference rideRef =
        FirebaseDatabase.instance.reference().child('Ride');
    DatabaseReference driverRef =
        FirebaseDatabase.instance.reference().child('driver');

    rideRef
        .orderByChild('userid')
        .equalTo(passengerId)
        .once()
        .then((DataSnapshot snapshot) {
          Map<dynamic, dynamic>? ridesData =
              snapshot.value as Map<dynamic, dynamic>?;

          if (ridesData != null) {
            ridesData.forEach((key, value) async {
              String driverID = value['driverid'];
              await driverRef
                  .child(driverID)
                  .once()
                  .then((DataSnapshot driverSnapshot) {
                    Map<dynamic, dynamic>? driverData =
                        driverSnapshot.value as Map<dynamic, dynamic>?;
                    if (driverData != null) {
                      String firstName = driverData['firstName'];
                      String lastName = driverData['lastName'];
                      String personalPhoto = driverData['personalPhoto'];
                      PreviousRide ride = PreviousRide(
                        rideID: value['rideid'],
                        driverID: driverID,
                        userID: value['userid'],
                        fare: value['fare'],
                        departure: value['departure'],
                        destination: value['destination'],
                        time: value['time'],
                        date: value['date'],
                        status: value['status'],
                        driverFirstName: firstName,
                        driverLastName: lastName,
                        driverPhoto: personalPhoto,
                      );
                      print("check:");
                      print(ride.driverFirstName);

                      previousRides.add(ride);
                    }
                  } as FutureOr Function(DatabaseEvent value));
            });
          }
        } as FutureOr Function(DatabaseEvent value));
  }

  @override
  Widget build(BuildContext context) {
    fetchPreviousRides();
    return Scaffold(
      appBar: AppBar(
        title: const Text("History Page"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16.0),
            Expanded(
              child: ListView.builder(
                itemCount: previousRides.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedCardIndex = index;
                      });
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeOut,
                      margin: const EdgeInsets.only(bottom: 16.0),
                      decoration: BoxDecoration(
                        color: selectedCardIndex == index
                            ? Colors.grey[200]
                            : Colors.white,
                        borderRadius: BorderRadius.circular(8.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                        border: Border.all(
                          color: selectedCardIndex == index
                              ? Colors.green
                              : Colors.transparent,
                          width: 2.0,
                        ),
                      ),
                      child: AnimatedSize(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeOut,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ListTile(
                              title: Row(
                                children: [
                                  Text(
                                    previousRides[index].destination,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const Icon(Icons.arrow_forward,
                                      color: Colors.green),
                                  Text(
                                    previousRides[index].departure,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              trailing: selectedCardIndex == index
                                  ? const Icon(Icons.check_circle,
                                      color: Colors.green)
                                  : null,
                            ),
                            if (selectedCardIndex == index)
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  children: [
                                    const CircleAvatar(
                                      backgroundImage:
                                          AssetImage('assets/driver_photo.png'),
                                      radius: 40.0,
                                    ),
                                    const SizedBox(height: 16.0),
                                    Text(
                                      "Driver: ${previousRides[index].driverFirstName} ${previousRides[index].driverLastName}",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(height: 8.0),
                                    Row(
                                      children: [
                                        const Icon(Icons.attach_money,
                                            color: Colors.green),
                                        const SizedBox(width: 4.0),
                                        Text(previousRides[index].fare),
                                      ],
                                    ),
                                    const SizedBox(height: 8.0),
                                    Row(
                                      children: [
                                        const Icon(Icons.access_time,
                                            color: Colors.green),
                                        const SizedBox(width: 4.0),
                                        Text(previousRides[index].time),
                                      ],
                                    ),
                                    const SizedBox(height: 8.0),
                                    Row(
                                      children: [
                                        const Icon(Icons.calendar_today,
                                            color: Colors.green),
                                        const SizedBox(width: 4.0),
                                        Text(previousRides[index].date),
                                      ],
                                    ),
                                    const SizedBox(height: 8.0),
                                    Row(
                                      children: [
                                        const Icon(Icons.info,
                                            color: Colors.green),
                                        const SizedBox(width: 4.0),
                                        Text(previousRides[index].status),
                                      ],
                                    ),
                                    const SizedBox(height: 16.0),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        foregroundColor: Colors.white,
                                        backgroundColor: Colors
                                            .green, // Set text color to white
                                      ),
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                DriverDetailsPage(
                                              rideID:
                                                  previousRides[index].rideID,
                                              driverName:
                                                  "${previousRides[index].driverFirstName} ${previousRides[index].driverLastName}",
                                              fare: double.parse(
                                                  previousRides[index].fare),
                                              destination: previousRides[index]
                                                  .destination,
                                              departure: previousRides[index]
                                                  .departure,
                                              time: previousRides[index].time,
                                              date: previousRides[index].date,
                                              status:
                                                  previousRides[index].status,
                                            ),
                                          ),
                                        );
                                      },
                                      child: const Text('Details'),
                                    ),
                                  ],
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<PreviousRide> previousRides = [
    PreviousRide(
      rideID: "1",
      driverID: "D001",
      userID: "U001",
      date: "2022-10-01",
      time: "10:00 AM",
      departure: "Location A",
      destination: "Location B",
      fare: "20.00",
      status: "Completed",
      driverFirstName: "John",
      driverLastName: "Doe",
      driverPhoto: "driver1.jpg",
    ),
    PreviousRide(
      rideID: "2",
      driverID: "D002",
      userID: "U002",
      date: "2022-10-02",
      time: "11:00 AM",
      departure: "Location C",
      destination: "Location D",
      fare: "15.00",
      status: "Completed",
      driverFirstName: "Jane",
      driverLastName: "Smith",
      driverPhoto: "driver2.jpg",
    ),
    PreviousRide(
      rideID: "3",
      driverID: "D003",
      userID: "U003",
      date: "2022-10-03",
      time: "12:00 PM",
      departure: "Location E",
      destination: "Location F",
      fare: "25.00",
      status: "Completed",
      driverFirstName: "David",
      driverLastName: "Johnson",
      driverPhoto: "driver3.jpg",
    ),
    PreviousRide(
      rideID: "4",
      driverID: "D004",
      userID: "U004",
      date: "2022-10-04",
      time: "1:00 PM",
      departure: "Location G",
      destination: "Location H",
      fare: "18.00",
      status: "Completed",
      driverFirstName: "Sarah",
      driverLastName: "Williams",
      driverPhoto: "driver4.jpg",
    ),
    PreviousRide(
      rideID: "5",
      driverID: "D005",
      userID: "U005",
      date: "2022-10-05",
      time: "2:00 PM",
      departure: "Location I",
      destination: "Location J",
      fare: "30.00",
      status: "Completed",
      driverFirstName: "Michael",
      driverLastName: "Brown",
      driverPhoto: "driver5.jpg",
    ),
  ];
}
