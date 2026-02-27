import 'package:flutter/material.dart';
import 'widgets/header_section.dart';
import 'widgets/gallery_section.dart';
import 'widgets/content_section.dart';
import 'widgets/review_section.dart';
import 'widgets/bottom_section.dart';
import '../../models/property.dart';

class PropertyDetailScreen extends StatefulWidget {
  final Property? property;

  PropertyDetailScreen({this.property});

  @override
  State<PropertyDetailScreen> createState() => _PropertyDetailScreenState();
}

class _PropertyDetailScreenState extends State<PropertyDetailScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header with back button and favorite
            HeaderSection(property: widget.property),
            
            // Gallery images
            GallerySection(),
            
            // Content with property details
            ContentSection(property: widget.property),
            
            // Tabs for About and Reviews
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.grey[50],
                borderRadius: BorderRadius.circular(10),
              ),
              child: TabBar(
                controller: _tabController,
                labelColor: Colors.blueAccent,
                unselectedLabelColor: Colors.grey,
                indicatorColor: Colors.blueAccent,
                indicatorWeight: 2,
                tabs: [
                  Tab(text: "About"),
                  Tab(text: "Reviews"),
                ],
              ),
            ),
            
            // Tab Content
            SizedBox(
              height: 400,
              child: TabBarView(
                controller: _tabController,
                children: [
                  // About Tab Content (you can add more about content here)
                  Container(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "About this property",
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Experience luxury living in this stunning villa located in the heart of ${widget.property?.location ?? 'Goa'}. "
                          "This beautiful property offers modern amenities, breathtaking views, and unparalleled comfort. "
                          "Perfect for families, couples, or groups looking for an unforgettable stay.",
                          style: TextStyle(color: Colors.grey[700], height: 1.5),
                        ),
                        SizedBox(height: 20),
                        Text(
                          "Amenities",
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10),
                        Wrap(
                          spacing: 10,
                          runSpacing: 10,
                          children: [
                            _buildAmenityChip(Icons.wifi, "WiFi"),
                            _buildAmenityChip(Icons.pool, "Pool"),
                            _buildAmenityChip(Icons.local_parking, "Parking"),
                            _buildAmenityChip(Icons.ac_unit, "AC"),
                            _buildAmenityChip(Icons.kitchen, "Kitchen"),
                            _buildAmenityChip(Icons.tv, "TV"),
                          ],
                        ),
                      ],
                    ),
                  ),
                  // Reviews Tab Content
                  ReviewSection(property: widget.property),
                ],
              ),
            ),
            
            // Bottom section with price and book button
            BottomSection(property: widget.property),
          ],
        ),
      ),
    );
  }

  Widget _buildAmenityChip(IconData icon, String label) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: Colors.blueAccent),
          SizedBox(width: 6),
          Text(label, style: TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}