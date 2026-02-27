import 'package:flutter/material.dart';
import '../../../widgets/info_item.dart';
import '../../../models/property.dart';

class ContentSection extends StatelessWidget {
  final Property? property;
  
  const ContentSection({this.property});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          // Title Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                property?.name ?? "Naples Villa",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  Icon(Icons.star, color: Colors.orange, size: 18),
                  SizedBox(width: 4),
                  Text("4.8 (100 reviews)"),
                ],
              )
            ],
          ),

          SizedBox(height: 8),

          Text(
            property?.location ?? "#123, street name, old goa, Panjim, Goa.",
            style: TextStyle(color: Colors.grey),
          ),

          SizedBox(height: 16),

          // About / Review Tabs
          Row(
            children: [
              Text(
                "About",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue),
              ),
              SizedBox(width: 20),
              Text("Review"),
            ],
          ),

          Divider(),

          SizedBox(height: 10),

          // Info Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InfoItem(icon: Icons.bed, text: "4 Bedroom"),
              InfoItem(icon: Icons.bathtub, text: "5 Bathroom"),
              InfoItem(icon: Icons.square_foot, text: "4000 sqft"),
            ],
          ),

          SizedBox(height: 20),
        ],
      ),
    );
  }
}