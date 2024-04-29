import 'package:flutter/material.dart';

class DriverProfilePage extends StatelessWidget {
  // Mock driver information
  String fullName = 'John Doe';
  String email = 'johndoe@example.com';
  String phoneNumber = '+1234567890';
  String driverLicense = 'DL-123456';

  // Assume driver's license expiry date
  final DateTime driverLicenseExpiryDate = DateTime(2025, 12, 31);

  @override
  Widget build(BuildContext context) {
    // Check if driver's license is expired
    bool isExpired = DateTime.now().isAfter(driverLicenseExpiryDate);

    return Scaffold(
      appBar: AppBar(
        title: Text('Driver Profile'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.yellow, // Setting the background color to yellow
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Center(
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage('assets/driver_profile_picture.png'),
                      ),
                    ),
                    SizedBox(height: 16),
                    Center(
                      child: Text(
                        fullName,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 16),
                  // Display driver information
                  Text(
                    'Email: $email',
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    'Phone Number: $phoneNumber',
                    style: TextStyle(fontSize: 18),
                  ),
                  Row(
                    children: [
                      Text(
                        'Driver License: $driverLicense',
                        style: TextStyle(fontSize: 18),
                      ),
                      if (isExpired)
                        Icon(
                          Icons.error,
                          color: Colors.red,
                        ),
                    ],
                  ),
                  SizedBox(height: 16),
                  // Remaining content...
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        // Navigate to update profile page
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => UpdateProfilePage()),
                        );
                      },
                      child: ElevatedButton.icon(
                        onPressed: () {
                          // Navigate to update profile page
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => UpdateProfilePage()),
                          );
                        },
                        icon: Icon(Icons.edit),
                        label: Text('Update Information'),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Divider(),
                  SizedBox(height: 16),
                  // Vehicle Information Text Widgets
                  Text(
                    'Vehicle Information',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text('Make: Toyota', style: TextStyle(fontSize: 18)),
                  Text('Model: Camry', style: TextStyle(fontSize: 18)),
                  Text('Year: 2020', style: TextStyle(fontSize: 18)),
                  Text('License Plate: XXX-1234', style: TextStyle(fontSize: 18)),
                  SizedBox(height: 16),
                  Divider(),
                  SizedBox(height: 16),
                  // Driver Rating Text Widgets
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Driver Rating: ',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(Icons.star, color: Colors.yellow),
                      Icon(Icons.star, color: Colors.yellow),
                      Icon(Icons.star, color: Colors.yellow),
                      Icon(Icons.star_half, color: Colors.yellow),
                      Icon(Icons.star_border, color: Colors.yellow),
                    ],
                  ),
                  SizedBox(height: 16),
                  Divider(),
                  SizedBox(height: 16),
                  // Ride History and Earnings Summary Text Widgets
                  GestureDetector(
                    onTap: () {
                      // Navigate to ride history page
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RideHistoryPage()),
                      );
                    },
                    child: Text(
                      'Ride History',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Click here to view ride history',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 16),
                  Divider(),
                  SizedBox(height: 16),
                  GestureDetector(
                    onTap: () {
                      // Navigate to earnings summary page
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => EarningsSummaryPage()),
                      );
                    },
                    child: Text(
                      'Earnings Summary',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Click here to view earnings by date, month, and year',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 16),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class UpdateProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Update Information',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Full Name',
                hintText: 'Enter your full name',
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Email',
                hintText: 'Enter your email address',
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Phone Number',
                hintText: 'Enter your phone number',
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Driver License',
                hintText: 'Enter your driver license number',
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Add functionality to save/update the driver information
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}

class RideHistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ride History'),
      ),
      body: Center(
        child: Text('This is the ride history page'),
      ),
    );
  }
}

class EarningsSummaryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text('Earnings Summary'),
    ),
    body:Center(
      child: Text('This is the earnings summary page'),
    ),
    );
  }
}
