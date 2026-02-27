import 'package:flutter/material.dart';

class ReviewsScreen extends StatelessWidget {
  const ReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(context),
              const SizedBox(height: 20),
              _buildOverallRating(),
              const SizedBox(height: 25),
              _buildRatingBreakdown(),
              const SizedBox(height: 25),
              _buildUserReviews(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "Reviews",
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.blueAccent),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.blueAccent,
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Text(
            "Write Review",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  Widget _buildOverallRating() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(15),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "4.8",
                style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold, color: Colors.blueAccent),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: List.generate(5, (index) => 
                      Icon(Icons.star, color: index < 4 ? Colors.orange : Colors.grey, size: 20)
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text("Based on 256 reviews", style: TextStyle(color: Colors.grey[600])),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRatingBreakdown() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Rating Breakdown", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 15),
          _buildRatingRow(5, 180),
          _buildRatingRow(4, 60),
          _buildRatingRow(3, 12),
          _buildRatingRow(2, 3),
          _buildRatingRow(1, 1),
        ],
      ),
    );
  }

  Widget _buildRatingRow(int stars, int count) {
    final percentage = (count / 256) * 100;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Row(
            children: List.generate(5, (index) => 
              Icon(Icons.star, color: index < stars ? Colors.orange : Colors.grey, size: 16)
            ),
          ),
          const SizedBox(width: 10),
          SizedBox(
            width: 100,
            child: LinearProgressIndicator(
              value: percentage / 100,
              backgroundColor: Colors.grey[200],
              valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),
            ),
          ),
          const SizedBox(width: 10),
          Text("$count", style: TextStyle(color: Colors.grey[600])),
        ],
      ),
    );
  }

  Widget _buildUserReviews() {
    final reviews = [
      {
        'name': 'Sarah Johnson',
        'rating': 5,
        'date': '2 days ago',
        'comment': 'Amazing property! The host was very responsive and the place was exactly as described. Would definitely book again.',
        'image': 'https://images.unsplash.com/photo-1494790108755-2616b612b786?w=100'
      },
      {
        'name': 'Mike Chen',
        'rating': 4,
        'date': '1 week ago',
        'comment': 'Great location and clean space. The only issue was the WiFi was a bit slow, but everything else was perfect.',
        'image': 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=100'
      },
      {
        'name': 'Emily Davis',
        'rating': 5,
        'date': '2 weeks ago',
        'comment': 'Beautiful property with stunning views. The photos don\'t do it justice! Highly recommend for a relaxing getaway.',
        'image': 'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=100'
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("User Reviews", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 15),
        ...reviews.map((review) => _buildReviewCard(review)).toList(),
      ],
    );
  }

  Widget _buildReviewCard(Map<String, dynamic> review) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey[200]!),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 3)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 25,
                backgroundImage: NetworkImage(review['image']),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(review['name'], style: TextStyle(fontWeight: FontWeight.bold)),
                    Row(
                      children: [
                        ...List.generate(5, (index) => 
                          Icon(Icons.star, color: index < review['rating'] ? Colors.orange : Colors.grey, size: 14)
                        ),
                        const SizedBox(width: 5),
                        Text(review['date'], style: TextStyle(color: Colors.grey[600], fontSize: 12)),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(review['comment'], style: TextStyle(color: Colors.grey[700])),
        ],
      ),
    );
  }
}
