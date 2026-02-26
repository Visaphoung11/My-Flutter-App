import 'package:flutter/material.dart';
import 'widgets/header_section.dart';
import 'widgets/gallery_section.dart';
import 'widgets/content_section.dart';
import 'widgets/bottom_section.dart';
import '../../model/property.dart';

class PropertyDetailScreen extends StatelessWidget {
  final Property? property;

  PropertyDetailScreen({this.property});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header with back button and favorite
            HeaderSection(),
            
            // Gallery images
            GallerySection(),
            
            // Content with property details
            ContentSection(property: property),
            
            // Bottom section with price and book button
            BottomSection(property: property),
          ],
        ),
      ),
    );
  }
}