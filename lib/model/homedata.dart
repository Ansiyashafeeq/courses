

class HomePageData {
  final List<String> imageUrls;

  HomePageData({required this.imageUrls});

  factory HomePageData.fromJson(Map<String, dynamic> json) {
    return HomePageData(
      imageUrls: List<String>.from(json['data'].map((item) => item['image_url'])),
    );
  }
}
