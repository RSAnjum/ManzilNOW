
import 'package:flutter/material.dart';
import 'driverdetails.dart';
class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  int selectedCardIndex = -1;

  List<PreviousRide> previousRides = [
    PreviousRide("123456", "John Doe", "10", "New York", "Los Angeles",
      "9:00 AM", "2022-01-01", "Completed"),
    PreviousRide("234567", "Jane Smith", "15", "San Francisco", "Seattle",
      "2:30 PM", "2022-01-02", "Cancelled"),
    PreviousRide("345678", "Mike Johnson", "8", "Chicago", "Miami", "6:45 PM",
      "2022-01-03", "Completed"),
    PreviousRide("456789", "Emily Brown", "12", "Boston", "Washington D.C.",
      "11:15 AM", "2022-01-04", "Completed"),
    PreviousRide("567890", "David Wilson", "7", "Houston", "Dallas", "4:20 PM",
      "2022-01-05", "Cancelled"),
    PreviousRide("678901", "Sarah Davis", "9", "Denver", "Las Vegas", "8:30 AM",
      "2022-01-06", "Completed"),
    PreviousRide("789012", "Michael Thompson", "11", "Atlanta", "Nashville",
      "3:45 PM", "2022-01-07", "Completed"),
    PreviousRide("890123", "Olivia Martinez", "14", "Phoenix", "San Diego",
      "7:00 AM", "2022-01-08", "Cancelled"),
    PreviousRide("901234", "James Taylor", "6", "Seattle", "Portland",
      "5:30 PM", "2022-01-09", "Completed"),
    PreviousRide("012345", "Sophia Anderson", "13", "Miami", "Orlando",
      "10:45 AM", "2022-01-10", "Completed"),
    PreviousRide("123450", "Benjamin Thomas", "8", "Dallas", "Houston",
      "2:00 PM", "2022-01-11", "Cancelled"),
    PreviousRide("234561", "Ava Jackson", "10", "Los Angeles", "San Francisco",
      "6:15 AM", "2022-01-12", "Completed"),
    PreviousRide("345672", "William White", "5", "Las Vegas", "Denver",
      "1:30 PM", "2022-01-13", "Completed"),
    PreviousRide("456783", "Mia Harris", "9", "Nashville", "Atlanta",
      "4:45 PM", "2022-01-14", "Cancelled"),
    PreviousRide("567894", "Liam Martin", "12", "San Diego", "Phoenix",
      "9:30 AM", "2022-01-15", "Completed"),
    PreviousRide("678905", "Charlotte Thompson", "7", "Portland", "Seattle",
      "3:00 PM", "2022-01-16", "Completed"),
    PreviousRide("789016", "Elijah Davis", "11", "Orlando", "Miami", "8:15 AM",
      "2022-01-17", "Cancelled"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("History Page"), // Add a title to the AppBar
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
                                      "Driver: ${previousRides[index].driverName}",
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
                                        foregroundColor: Colors.white, backgroundColor: Colors.green, // Set text color to white
                                      ),
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => DriverDetailsPage(
                                              rideID: previousRides[index].rideID,
                                              driverName: previousRides[index].driverName,
                                              fare: double.parse(previousRides[index].fare),
                                              destination: previousRides[index].destination,
                                              departure: previousRides[index].departure,
                                              time: previousRides[index].time,
                                              date: previousRides[index].date,
                                              status: previousRides[index].status,
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
}

class PreviousRide {
  final String rideID;
  final String driverName;
  final String fare;
  final String destination;
  final String departure;
  final String time;
  final String date;
  final String status;

  PreviousRide(
    this.rideID,
    this.driverName,
    this.fare,
    this.destination,
    this.departure,
    this.time,
    this.date,
    this.status,
  );
}
