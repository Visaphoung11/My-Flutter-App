import 'package:flutter/material.dart';
import '../../../model/property.dart';

class ReviewSection extends StatefulWidget {
  final Property? property;
  
  const ReviewSection({this.property});

  @override
  State<ReviewSection> createState() => _ReviewSectionState();
}

class _ReviewSectionState extends State<ReviewSection> {
  final List<Map<String, dynamic>> _reviews = [
    {
      'name': 'Alex Thompson',
      'rating': 5,
      'date': '3 days ago',
      'comment': 'Absolutely stunning villa! The view was breathtaking and the amenities were top-notch. The host was very responsive and helpful throughout our stay.',
      'image': 'https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?w=100'
    },
    {
      'name': 'Maria Garcia',
      'rating': 4,
      'date': '1 week ago',
      'comment': 'Beautiful property with great location. The villa was clean and well-maintained. Only minor issue was the WiFi connection in some areas.',
      'image': 'https://images.unsplash.com/photo-1494790108755-2616b612b786?w=100'
    },
    {
      'name': 'James Wilson',
      'rating': 5,
      'date': '2 weeks ago',
      'comment': 'Perfect getaway spot! The villa exceeded our expectations. The pool area was amazing and the sunset views were incredible.',
      'image': 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=100'
    },
    {
      'name': 'Sophie Chen',
      'rating': 4,
      'date': '3 weeks ago',
      'comment': 'Lovely villa with beautiful decor. Very comfortable and spacious. Would definitely recommend for families or groups.',
      'image': 'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=100'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Reviews Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Reviews (${_reviews.length})",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              GestureDetector(
                onTap: () => _showAddReviewDialog(context),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text(
                    "Add Review",
                    style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: 15),

          // Reviews List
          ..._reviews.map((review) => _buildReviewCard(review)).toList(),
        ],
      ),
    );
  }

  Widget _buildReviewCard(Map<String, dynamic> review) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[200]!),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 22,
                backgroundImage: NetworkImage(review['image']),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      review['name'],
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        ...List.generate(5, (index) => 
                          Icon(
                            Icons.star, 
                            color: index < review['rating'] ? Colors.orange : Colors.grey, 
                            size: 12
                          )
                        ),
                        const SizedBox(width: 6),
                        Text(
                          review['date'],
                          style: TextStyle(color: Colors.grey[600], fontSize: 11),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            review['comment'],
            style: TextStyle(color: Colors.grey[700], fontSize: 13, height: 1.4),
          ),
        ],
      ),
    );
  }

  void _showAddReviewDialog(BuildContext context) {
    final TextEditingController commentController = TextEditingController();
    int selectedRating = 5;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Dialog(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              child: Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Add Review",
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                          icon: Icon(Icons.close),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ],
                    ),

                    SizedBox(height: 15),

                    // Property Info
                    Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.grey[50],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              widget.property?.image ?? "https://images.unsplash.com/photo-1564013799919-ab600027ffc6",
                              height: 50,
                              width: 50,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.property?.name ?? "Naples Villa",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  widget.property?.location ?? "Panjim, Goa",
                                  style: TextStyle(color: Colors.grey[600], fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 20),

                    // Rating Selection
                    Text(
                      "Your Rating",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(5, (index) {
                        return IconButton(
                          icon: Icon(
                            Icons.star,
                            color: index < selectedRating ? Colors.orange : Colors.grey,
                            size: 30,
                          ),
                          onPressed: () {
                            setState(() {
                              selectedRating = index + 1;
                            });
                          },
                        );
                      }),
                    ),

                    SizedBox(height: 20),

                    // Comment Field
                    Text(
                      "Your Review",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    TextField(
                      controller: commentController,
                      maxLines: 4,
                      decoration: InputDecoration(
                        hintText: "Share your experience...",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.grey[300]!),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.blueAccent),
                        ),
                      ),
                    ),

                    SizedBox(height: 20),

                    // Submit Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueAccent,
                          padding: EdgeInsets.symmetric(vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {
                          if (commentController.text.isNotEmpty) {
                            setState(() {
                              _reviews.insert(0, {
                                'name': 'You',
                                'rating': selectedRating,
                                'date': 'Just now',
                                'comment': commentController.text,
                                'image': 'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?w=100'
                              });
                            });
                            Navigator.pop(context);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("Review added successfully!"),
                                backgroundColor: Colors.green,
                              ),
                            );
                          }
                        },
                        child: Text(
                          "Submit Review",
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
