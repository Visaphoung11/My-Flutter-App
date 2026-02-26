import 'package:flutter/material.dart';
class GallerySection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          smallImage("https://images.unsplash.com/photo-1507089947368-19c1da9775ae"),
          smallImage("https://images.unsplash.com/photo-1560448204-e02f11c3d0e2"),
          smallImage("https://images.unsplash.com/photo-1570129477492-45c003edd2be"),
          smallImage("https://images.unsplash.com/photo-1502672260266-1c1ef2d93688"),
        ],
      ),
    );
  }

  Widget smallImage(String url) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.network(
        url,
        height: 60,
        width: 70,
        fit: BoxFit.cover,
      ),
    );
  }
}