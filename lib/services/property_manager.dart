import 'package:flutter/material.dart';
import '../models/property.dart';

class PropertyManager extends ChangeNotifier {
  static final PropertyManager _instance = PropertyManager._internal();
  factory PropertyManager() => _instance;
  PropertyManager._internal();

  List<Property> _properties = [
    // Default properties
    Property(
      name: "Naples Villa",
      location: "Panjim, Goa", 
      price: "86,000",
      image: "https://images.unsplash.com/photo-1613490493576-7fde63acd811?w=500"
    ),
    Property(
      name: "Colina Villa",
      location: "Coorg, Kerala",
      price: "100,000", 
      image: "https://images.unsplash.com/photo-1613490493576-7fde63acd811?w=500"
    ),
    Property(
      name: "Beach House",
      location: "Malibu, California",
      price: "125,000", 
      image: "https://images.unsplash.com/photo-1613490493576-7fde63acd811?w=500"
    ),
  ];

  List<Property> get properties => List.unmodifiable(_properties);

  void addProperty(Property property) {
    _properties.insert(0, property); // Add to beginning
    notifyListeners();
  }

  Property? getPropertyById(String id) {
    try {
      return _properties.firstWhere((p) => p.name == id);
    } catch (e) {
      return null;
    }
  }
}
