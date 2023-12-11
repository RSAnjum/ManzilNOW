import 'package:flutter/material.dart';

class FeedbackPage extends StatefulWidget {
  const FeedbackPage({super.key});

  @override
  _FeedbackPageState createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  int selectedCardIndex = -1;

  List<PreviousRide> previousRides = [
    PreviousRide("Ride 1", "John Doe", "10", "New York", "Los Angeles", "9:00 AM"),
    PreviousRide("Ride 2", "Jane Smith", "15", "San Francisco", "Seattle", "2:30 PM"),
    PreviousRide("Ride 3", "Mike Johnson", "8", "Chicago", "Miami", "6:45 PM"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Feedback"),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Select a ride to provide feedback:",
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
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
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                      margin: const EdgeInsets.only(bottom: 16.0),
                      decoration: BoxDecoration(
                        color: selectedCardIndex == index ? Colors.grey[200] : Colors.white,
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
                          color: selectedCardIndex == index ? Colors.green : Colors.transparent,
                          width: 2.0,
                        ),
                      ),
                      child: Column(
                        children: [
                          ListTile(
                            title: Row(
                              children: [
                                Text(
                                  previousRides[index].destination,
                                  style: const TextStyle(fontWeight: FontWeight.bold),
                                ),
                                const Icon(Icons.arrow_forward, color: Colors.green),
                                Text(
                                  previousRides[index].departure,
                                  style: const TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            trailing: selectedCardIndex == index
                                ? const Icon(Icons.check_circle, color: Colors.green)
                                : null,
                          ),
                          if (selectedCardIndex == index)
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const CircleAvatar(
                                    backgroundImage: AssetImage('assets/driver_photo.png'),
                                    radius: 40.0,
                                  ),
                                  const SizedBox(height: 16.0),
                                  Text(
                                    "Driver: ${previousRides[index].driverName}",
                                    style: const TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(height: 8.0),
                                  Row(
                                    children: [
                                      const Icon(Icons.attach_money, color: Colors.green),
                                      const SizedBox(width: 4.0),
                                      Text(previousRides[index].fare),
                                    ],
                                  ),
                                  const SizedBox(height: 8.0),
                                  Row(
                                    children: [
                                      const Icon(Icons.access_time, color: Colors.green),
                                      const SizedBox(width: 4.0),
                                      Text(previousRides[index].time),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16.0),
            const Text(
              "Describe your feedback:",
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: Colors.grey[200],
              ),
              child: const TextField(
                maxLines: 5,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(16.0),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Submit button logic
              },
              child: const Text("Submit"),
            ),
          ],
        ),
      ),
    );
  }
}

class PreviousRide {
  final String rideName;
  final String driverName;
  final String fare;
  final String destination;
  final String departure;
  final String time;

  PreviousRide(
    this.rideName,
    this.driverName,
    this.fare,
    this.destination,
    this.departure,
    this.time,
  );
}
