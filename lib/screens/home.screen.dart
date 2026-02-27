import 'package:flutter/material.dart';
import 'package:my_first_app/models/property.dart';
import 'package:my_first_app/services/property_manager.dart';
import 'property_detail/property_detail_screen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final PropertyManager _propertyManager = PropertyManager();

  @override
  void initState() {
    super.initState();
    // Listen to property changes
    _propertyManager.addListener(_onPropertiesChanged);
  }

  @override
  void dispose() {
    _propertyManager.removeListener(_onPropertiesChanged);
    super.dispose();
  }

  void _onPropertiesChanged() {
    if (mounted) {
      setState(() {});
    }
  }

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
              _buildSearchBar(),
              const SizedBox(height: 25),
              _buildCategoryIcons(),
              const SizedBox(height: 25),
              _buildPropertyCards(context), // Pass context
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
        const Text("Zillow", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.blueAccent)),
        GestureDetector(
          onTap: () {
            // For now, just show a message since we can't directly access parent state
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Use bottom navigation to go to Profile')),
            );
          },
          child: const CircleAvatar(
            radius: 20,
            backgroundColor: Colors.blueAccent,
            child: Icon(Icons.person, color: Colors.white),
          ),
        )
      ],
    );
  }

  Widget _buildSearchBar() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              hintText: "Search...",
              prefixIcon: const Icon(Icons.search),
              filled: true,
              fillColor: Colors.grey[100],
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(15), borderSide: BorderSide.none),
            ),
          ),
        ),


        const SizedBox(width: 10),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(color: Colors.blueAccent, borderRadius: BorderRadius.circular(15)),
          child: const Icon(Icons.tune, color: Colors.white),
        )
      ],
    );
  }

  Widget _buildCategoryIcons() {
    List<Map<String, dynamic>> categories = [
      {"name": "House", "icon": Icons.home_outlined},
      {"name": "Villa", "icon": Icons.villa_outlined},
      {"name": "Apartment", "icon": Icons.apartment_outlined},
      {"name": "Cottage", "icon": Icons.holiday_village_outlined},
    ];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: categories.map((cat) {
        return Column(
          children: [
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle, boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)]),
              child: Icon(cat['icon'], color: Colors.blueAccent),
            ),
            const SizedBox(height: 8),
            Text(cat['name']),
          ],
        );
      }).toList(),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const Text("See All", style: TextStyle(color: Colors.blueAccent)),
      ],
    );
  }

  Widget _buildPropertyCards(BuildContext context) {
    final properties = _propertyManager.properties;
    
    return SizedBox(
      height: 280,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: properties.map((property) => _propertyCard(context, property)).toList(),
      ),
    );
  }

  Widget _propertyCard(BuildContext context, Property property) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PropertyDetailScreen(property: property),
          ),
        );
      },
      child: Container(
        width: 220,
        margin: const EdgeInsets.only(right: 15),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20), boxShadow: [const BoxShadow(color: Colors.black12, blurRadius: 5)]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                  child: Image.network(property.image, height: 140, width: double.infinity, fit: BoxFit.cover),
                ),
                Positioned(
                  top: 10, right: 10,
                  child: GestureDetector(
                    onTap: () => Navigator.pushNamed(context, '/login'),
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                      child: const Icon(Icons.favorite, color: Colors.red, size: 18),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(property.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  const SizedBox(height: 4),
                  Row(children: [const Icon(Icons.location_on, size: 14, color: Colors.grey), Text(property.location, style: const TextStyle(color: Colors.grey))]),
                  const SizedBox(height: 8),
                  Text("\$${property.price}/month", style: const TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.bold)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}