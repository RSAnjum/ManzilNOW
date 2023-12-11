
import 'package:flutter/material.dart';

class DriverDetailsPage extends StatelessWidget {
  final String driverName;
  final String rideID;
  final double fare;
  final String destination;
  final String departure;
  final String time;
  final String date;
  final String status;

  DriverDetailsPage({
    required this.driverName,
    required this.rideID,
    required this.fare,
    required this.destination,
    required this.departure,
    required this.time,
    required this.date,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Driver Details'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 16),
          // Profile photo
          CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage('assets/driver_photo.png'),
          ),
          SizedBox(height: 16),
          // Driver name
          Text(
            driverName,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16),
          // Ride ID
          ListTile(
            leading: Icon(Icons.confirmation_number),
            title: Text('Ride ID'),
            subtitle: Text(rideID),
          ),
          // Fare
          ListTile(
            leading: Icon(Icons.attach_money),
            title: Text('Fare'),
            subtitle: Text('\$$fare'),
          ),
          // Destination
          ListTile(
            leading: Icon(Icons.location_on),
            title: Text('Destination'),
            subtitle: Text(destination),
          ),
          // Departure
          ListTile(
            leading: Icon(Icons.location_on),
            title: Text('Departure'),
            subtitle: Text(departure),
          ),
          // Time
          ListTile(
            leading: Icon(Icons.access_time),
            title: Text('Time'),
            subtitle: Text(time),
          ),
          // Date
          ListTile(
            leading: Icon(Icons.calendar_today),
            title: Text('Date'),
            subtitle: Text(date),
          ),
          // Status
          ListTile(
            leading: Icon(Icons.info),
            title: Text('Status'),
            subtitle: Text(status),
          ),
        ],
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(top: 16),
        child: FloatingActionButton.extended(
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  title: Text('Report an issue'),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          filled: true,
                          fillColor: Colors.grey[200],
                        ),
                        items: const [
                          DropdownMenuItem<String>(
                            value: 'driver_not_on_time',
                            child: Text('Driver didn\'t arrive on time'),
                          ),
                          DropdownMenuItem<String>(
                            value: 'driver_harassed',
                            child: Text('Driver harassed'),
                          ),
                          DropdownMenuItem<String>(
                            value: 'driver_cancelled',
                            child: Text('Driver cancelled the ride'),
                          ),
                          DropdownMenuItem<String>(
                            value: 'wrong_route',
                            child: Text('Driver took wrong route'),
                          ),
                          DropdownMenuItem<String>(
                            value: 'poor_service',
                            child: Text('Poor service from the driver'),
                          ),
                        ],
                        onChanged: (String? value) {
                          // Handle dropdown selection
                        },
                      
                        
                        hint: const Text('Select an issue'),
                      ),
                      const SizedBox(height: 16),
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Additional Info',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        maxLines: 5, // Increase the value to make it larger
                      ),
                    ],
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        // Handle submit button press
                      },
                      child: const Text('Submit'),
                    ),
                  ],
                );
              },
            );
          },
          icon: const Icon(Icons.report),
          label: const Text('Report an issue'),
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
        ),
      ),
    );
  }
}
    
