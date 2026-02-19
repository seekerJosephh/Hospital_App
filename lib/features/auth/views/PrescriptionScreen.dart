import 'package:flutter/material.dart';
import 'package:hospital/features/auth/views/PrescriptionRequestForm.dart';
import 'package:intl/intl.dart';

class PrescriptionScreen extends StatefulWidget {
  const PrescriptionScreen({super.key});

  @override
  State<PrescriptionScreen> createState() => _PrescriptionScreenState();
}

class _PrescriptionScreenState extends State<PrescriptionScreen> {
  // Dummy data – replace with real API / database later
  final List<Map<String, dynamic>> _prescriptions = [
    {
      'medicine': 'Amlodipine 5mg',
      'dosage': '1 tablet',
      'frequency': 'Once daily',
      'duration': '30 days',
      'startDate': DateTime(2025, 12, 15),
      'doctor': 'Dr. Pang Chetra',
      'status': 'Active',
      'takenToday': true,
      'refillAvailable': true,
    },
    {
      'medicine': 'Metformin 500mg',
      'dosage': '1 tablet',
      'frequency': 'Twice daily (after meals)',
      'duration': '90 days',
      'startDate': DateTime(2025, 11, 20),
      'doctor': 'Dr. Nihal',
      'status': 'Active',
      'takenToday': false,
      'refillAvailable': false,
    },
    {
      'medicine': 'Atorvastatin 20mg',
      'dosage': '1 tablet',
      'frequency': 'Once daily at bedtime',
      'duration': 'Completed',
      'startDate': DateTime(2025, 10, 1),
      'endDate': DateTime(2025, 12, 30),
      'doctor': 'Dr. Pang Chetra',
      'status': 'Completed',
      'takenToday': null,
      'refillAvailable': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded, color: Colors.black87),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Prescriptions',
          style: TextStyle(
            color: Colors.black87,
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const PrescriptionRequestForm(),
            ),
          );
        },
        backgroundColor: const Color(0xFF26A69A),
        icon: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        label: const Text('New Request',
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.white)),
      ),
      body: _prescriptions.isEmpty
          ? _buildEmptyState()
          : ListView.builder(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 80),
              itemCount: _prescriptions.length,
              itemBuilder: (context, index) {
                final rx = _prescriptions[index];
                return _buildPrescriptionCard(rx);
              },
            ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.medical_information_outlined,
            size: 100,
            color: const Color.fromARGB(255, 172, 172, 172),
          ),
          const SizedBox(height: 24),
          const Text(
            'No prescriptions yet',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.black54,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'Your active prescriptions will appear here',
            style: TextStyle(
              fontSize: 15,
              color: Colors.grey[600],
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          OutlinedButton.icon(
            onPressed: () {
              // TODO: contact doctor / request prescription
            },
            icon: const Icon(Icons.add),
            label: const Text('Request Prescription'),
            style: OutlinedButton.styleFrom(
              foregroundColor: const Color(0xFF26A69A),
              side: const BorderSide(color: Color(0xFF26A69A)),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPrescriptionCard(Map<String, dynamic> rx) {
    final isActive = rx['status'] == 'Active';
    final isCompleted = rx['status'] == 'Completed';
    final start = DateFormat('MMM d, yyyy').format(rx['startDate']);
    final end = rx['endDate'] != null
        ? DateFormat('MMM d, yyyy').format(rx['endDate'])
        : 'Ongoing';

    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 1.5,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: isActive
                        ? Colors.green.shade100
                        : isCompleted
                            ? Colors.grey.shade200
                            : Colors.orange.shade100,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    rx['status'],
                    style: TextStyle(
                      color: isActive
                          ? Colors.green.shade800
                          : isCompleted
                              ? Colors.grey.shade800
                              : Colors.orange.shade800,
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                    ),
                  ),
                ),
                if (rx['refillAvailable'] == true)
                  TextButton.icon(
                    onPressed: () {
                      // TODO: Refill request
                    },
                    icon: const Icon(Icons.refresh, size: 18),
                    label: const Text('Refill'),
                    style: TextButton.styleFrom(
                      foregroundColor: const Color(0xFF26A69A),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              rx['medicine'],
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              '${rx['dosage']} • ${rx['frequency']}',
              style: TextStyle(
                fontSize: 15,
                color: Colors.grey[800],
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Icon(Icons.calendar_today_outlined,
                    size: 16, color: Colors.grey[600]),
                const SizedBox(width: 6),
                Text(
                  '$start → $end',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[700],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.person_outline, size: 16, color: Colors.grey[600]),
                const SizedBox(width: 6),
                Text(
                  'Prescribed by ${rx['doctor']}',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[700],
                  ),
                ),
              ],
            ),
            if (isActive) ...[
              const Divider(height: 24),
              Row(
                children: [
                  Checkbox(
                    value: rx['takenToday'] ?? false,
                    activeColor: const Color(0xFF26A69A),
                    onChanged: (bool? value) {
                      // TODO: save taken status (local or backend)
                      setState(() {
                        rx['takenToday'] = value;
                      });
                    },
                  ),
                  const Text(
                    'Taken today',
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}
