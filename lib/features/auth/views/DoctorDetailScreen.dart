// lib/features/auth/views/doctor_detail_screen.dart
import 'package:flutter/material.dart';
import 'package:hospital/features/auth/views/BookingAppointmentScreen.dart';

class DoctorDetailScreen extends StatefulWidget {
  final Map<String, dynamic> doctor;

  const DoctorDetailScreen({super.key, required this.doctor});

  @override
  State<DoctorDetailScreen> createState() => _DoctorDetailScreenState();
}

class _DoctorDetailScreenState extends State<DoctorDetailScreen> {
  String selectedDay = 'Wed'; // Default highlighted
  String selectedTime = '02:00 PM'; // Example

  final List<String> days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
  final List<String> timesMorning = ['09:00 AM', '10:00 AM', '11:00 AM'];
  final List<String> timesAfternoon = ['01:00 PM', '02:00 PM', '03:00 PM'];
  final List<String> timesEvening = ['04:00 PM', '07:00 PM', '08:00 PM'];

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
          'Doctor Detail',
          style: TextStyle(
              color: Colors.black87, fontSize: 22, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Doctor header card
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        widget.doctor['image'],
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
                            widget.doctor['name'],
                            style: const TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            widget.doctor['specialty'],
                            style: TextStyle(
                                fontSize: 16, color: Colors.grey[700]),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              const Icon(Icons.star,
                                  color: Colors.amber, size: 20),
                              const SizedBox(width: 4),
                              Text(
                                '${widget.doctor['rating']}',
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(width: 16),
                              Icon(Icons.location_on_outlined,
                                  color: Colors.grey[600], size: 18),
                              const SizedBox(width: 4),
                              Text(
                                widget.doctor['distance'],
                                style: TextStyle(color: Colors.grey[600]),
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

            const SizedBox(height: 24),

            // About section
            const Text(
              'About',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam...',
              style: TextStyle(fontSize: 15, color: Colors.grey[700]),
            ),
            const SizedBox(height: 8),
            TextButton(
              onPressed: () {},
              child: const Text('Read more',
                  style: TextStyle(color: Color(0xFF26A69A))),
            ),

            const SizedBox(height: 24),

            // Availability calendar (days)
            const Text(
              'Availability',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 60,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: days.length,
                itemBuilder: (context, index) {
                  final day = days[index];
                  final isSelected = day == selectedDay;
                  return GestureDetector(
                    onTap: () => setState(() => selectedDay = day),
                    child: Container(
                      width: 60,
                      margin: const EdgeInsets.only(right: 12),
                      decoration: BoxDecoration(
                        color:
                            isSelected ? const Color(0xFF26A69A) : Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            day,
                            style: TextStyle(
                              color: isSelected ? Colors.white : Colors.black87,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '2${index + 1}',
                            style: TextStyle(
                              color: isSelected ? Colors.white : Colors.black54,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 24),

            // Time slots
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                ...timesMorning.map((time) => _buildTimeSlot(time)),
                ...timesAfternoon.map((time) => _buildTimeSlot(time)),
                ...timesEvening.map((time) => _buildTimeSlot(time)),
              ],
            ),

            const SizedBox(height: 32),

            // Book button
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>
                          BookAppointmentScreen(doctor: widget.doctor),
                    ),
                  );
                },
                icon: const Icon(Icons.calendar_today, color: Colors.white),
                label: const Text(
                  'Book Appointment',
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF26A69A),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  elevation: 0,
                ),
              ),
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildTimeSlot(String time) {
    final isSelected = time == selectedTime;
    return GestureDetector(
      onTap: () => setState(() => selectedTime = time),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF26A69A) : Colors.white,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
              color: isSelected ? Colors.transparent : Colors.grey.shade300),
        ),
        child: Text(
          time,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black87,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
