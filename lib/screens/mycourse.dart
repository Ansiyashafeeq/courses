import 'package:flutter/material.dart';

class MyCoursePage extends StatelessWidget {
  final String userName = 'User Name'; // Replace with actual user name
  final String profileImageUrl = 'https://via.placeholder.com/100'; // Replace with actual profile image URL

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Good Morning,',
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(profileImageUrl),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Text(
                  userName,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 16),
                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text('Change'),
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
