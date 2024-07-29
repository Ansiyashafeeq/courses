import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> carouselImages = [];
  List<dynamic> courseData = [];

  @override
  void initState() {
    super.initState();
    fetchHomePageData();
  }

  Future<void> fetchHomePageData() async {
    try {
      final response = await http.get(Uri.parse('https://trogon.info/tutorpro/lms_demo/api/home_page_data?auth_token=YOUR_AUTH_TOKEN'));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        setState(() {
          carouselImages = data['carousel'] ?? []; // Check for null and assign empty list if null
          courseData = data['courses'] ?? []; // Check for null and assign empty list if null
        });
      } else {
        // Handle the error case when the response status is not 200
        print('Failed to load data');
      }
    } catch (e) {
      // Handle the error case when there's an exception
      print('Error occurred: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: RefreshIndicator(
        onRefresh: fetchHomePageData,
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Carousel Slider
              Container(
                height: 200,
                child: PageView.builder(
                  itemCount: carouselImages.length,
                  itemBuilder: (context, index) {
                    return Image.network(carouselImages[index]);
                  },
                ),
              ),
              // Course List
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Our Courses', style: TextStyle(fontSize: 24)),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: courseData.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(courseData[index]['name']),
                    leading: Image.network(courseData[index]['image']),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: 'My Course'),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: 'Notifications'),
          BottomNavigationBarItem(icon: Icon(Icons.feed), label: 'Feed'),
        ],
      ),
    );
  }
}
