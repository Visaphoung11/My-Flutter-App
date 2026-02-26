import 'package:flutter/material.dart';
import '../../../model/property.dart';

class HeaderSection extends StatelessWidget {
  final Property? property;
  
  const HeaderSection({this.property});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.network(
          property?.image ?? "https://images.unsplash.com/photo-1564013799919-ab600027ffc6",
          height: 250,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Positioned(
          top: 15,
          left: 15,
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ),
        Positioned(
          top: 15,
          right: 15,
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: Icon(Icons.favorite_border),
          ),
        ),
      ],
    );
  }
}