// lib/features/auth/views/top_doctors_screen.dart (or wherever fits your structure)
import 'package:flutter/material.dart';
import 'package:hospital/features/auth/views/DoctorDetailScreen.dart';

class TopDoctorsScreen extends StatelessWidget {
  TopDoctorsScreen({super.key});

  // Dummy data - replace with your API / model later
  final List<Map<String, dynamic>> doctors = [
    {
      'name': 'Dr. Pang Chetra',
      'specialty': 'Cardiologist',
      'rating': 4.7,
      'distance': '800m away',
      'image': 'lib/assets/images/D1.png', // use network or asset
    },
    {
      'name': 'Dr. Vaamana',
      'specialty': 'Dentist',
      'rating': 4.7,
      'distance': '800m away',
      'image': 'lib/assets/images/D2.png',
    },
    {
      'name': 'Dr. Nallarasai',
      'specialty': 'Orthopaedic',
      'rating': 4.7,
      'distance': '800m away',
      'image': 'lib/assets/images/D3.jpg',
    },
    {
      'name': 'Dr. Nihal',
      'specialty': 'Cardiologist',
      'rating': 4.7,
      'distance': '800m away',
      'image': 'lib/assets/images/D4.png',
    },
    {
      'name': 'Dr. Rishita',
      'specialty': 'Cardiologist',
      'rating': 4.7,
      'distance': '800m away',
      'image': 'lib/assets/images/D5.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Top Doctors',
          style: TextStyle(
            color: Colors.black87,
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: doctors.length,
        itemBuilder: (context, index) {
          final doctor = doctors[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => DoctorDetailScreen(doctor: doctor),
                ),
              );
            },
            child: Card(
              margin: const EdgeInsets.only(bottom: 16),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        doctor['image'],
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) =>
                            const Icon(
                          Icons.person,
                          size: 80,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            doctor['name'],
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            doctor['specialty'],
                            style: TextStyle(
                                fontSize: 14, color: Colors.grey[700]),
                          ),
                          const SizedBox(height: 6),
                          Row(
                            children: [
                              const Icon(Icons.star,
                                  color: Colors.amber, size: 18),
                              const SizedBox(width: 4),
                              Text(
                                '${doctor['rating']}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(width: 16),
                              Icon(Icons.location_on_outlined,
                                  color: Colors.grey[600], size: 16),
                              const SizedBox(width: 4),
                              Text(
                                doctor['distance'],
                                style: TextStyle(
                                    color: Colors.grey[600], fontSize: 13),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
