import 'package:flutter/material.dart';
import '../../../models/property.dart';

class BottomSection extends StatelessWidget {
  final Property? property;
  
  const BottomSection({this.property});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.grey.shade300, blurRadius: 5)
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Total Price"),
              SizedBox(height: 4),
              Text(
                "\$${property?.price ?? "25,000"} / month",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                    fontSize: 16),
              ),
            ],
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
            ),
            onPressed: () {},
            child: Text("Book Now"),
          )
        ],
      ),
    );
  }
}