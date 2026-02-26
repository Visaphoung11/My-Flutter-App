import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: _buildBottomNav(context),
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
            Navigator.pushNamed(context, '/profile');
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
    return SizedBox(
      height: 280,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _propertyCard(context, "Naples Villa", "Panjim, Goa", "86,000"),
          _propertyCard(context, "Colina Villa", "Coorg, Kerala", "100,000"),
        ],
      ),
    );
  }

  Widget _propertyCard(BuildContext context, String name, String loc, String price) {
    return Container(
      width: 220,
      margin: const EdgeInsets.only(right: 15),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20), boxShadow: [const BoxShadow(color: Colors.black12, blurRadius: 5)]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack( // Heart on top of image
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                child: Image.network("https://images.unsplash.com/photo-1613490493576-7fde63acd811?w=500", height: 140, width: double.infinity, fit: BoxFit.cover),
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
                Text(name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                const SizedBox(height: 4),
                Row(children: [const Icon(Icons.location_on, size: 14, color: Colors.grey), Text(loc, style: const TextStyle(color: Colors.grey))]),
                const SizedBox(height: 8),
                Text("\$$price/month", style: const TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.bold)),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildBottomNav(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.blueAccent,
      unselectedItemColor: Colors.grey,
      onTap: (index) {
        if (index != 0) Navigator.pushNamed(context, '/login');
      },
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: "Favorite"),
        BottomNavigationBarItem(icon: Icon(Icons.chat_bubble_outline), label: "Reviews"),
        BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: "Profile"),
      ],
    );
  }
}