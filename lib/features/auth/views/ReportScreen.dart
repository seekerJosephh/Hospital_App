import 'package:flutter/material.dart';
import 'package:hospital/core/constants/app_colors.dart'; // Adjust to your colors
import 'package:hospital/core/constants/app_fonts.dart';
import 'package:hospital/core/constants/app_size.dart';
import 'package:remixicon/remixicon.dart'; // If you're using remix icons

class ReportScreen extends StatelessWidget {
  const ReportScreen({super.key});

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
          'Report',
          style: TextStyle(
            color: Colors.black87,
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),

              // Heart Rate Card
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppColors.primary, // Teal/green like in image
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Heart rate',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        const Text(
                          '97',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 48,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Text(
                          'bpm',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    // Simple ECG-like waveform (you can use custom painter or image)
                    SizedBox(
                      height: 60,
                      child: CustomPaint(
                        painter: EcgWavePainter(),
                        child: const SizedBox.expand(),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Blood Group & Weight – side by side
              Row(
                children: [
                  Expanded(
                    child: _buildStatCard(
                      icon: Icons.water_drop,
                      iconColor: Colors.pink.shade300,
                      title: 'Blood Group',
                      value: 'A+',
                      bgColor: Colors.pink.shade50,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _buildStatCard(
                      icon: Icons.fitness_center,
                      iconColor: Colors.orange.shade700,
                      title: 'Weight',
                      value: '69kg',
                      bgColor: Colors.orange.shade50,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 32),

              // Latest report section
              const Text(
                'Latest report',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 16),

              _buildReportItem(
                date: 'Jul 10, 2025',
                title: 'General report',
                icon: Icons.description_outlined,
              ),
              const SizedBox(height: 12),
              _buildReportItem(
                date: 'Jul 5, 2025',
                title: 'General report',
                icon: Icons.description_outlined,
              ),

              const SizedBox(height: 100), // space for bottom nav
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatCard({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String value,
    required Color bgColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Icon(icon, color: iconColor, size: 36),
          const SizedBox(height: 12),
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[700],
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReportItem({
    required String date,
    required String title,
    required IconData icon,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFF26A69A).withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: const Color(0xFF26A69A), size: 28),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  date,
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.more_horiz, color: Colors.grey),
            onPressed: () {
              // TODO: Show menu (download, share, delete, etc.)
            },
          ),
        ],
      ),
    );
  }
}

// Simple custom painter for ECG-like line (you can replace with image or better animation)
class EcgWavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    final path = Path();
    path.moveTo(0, size.height * 0.6);
    path.lineTo(size.width * 0.15, size.height * 0.6);
    path.lineTo(size.width * 0.2, size.height * 0.3);
    path.lineTo(size.width * 0.25, size.height * 0.7);
    path.lineTo(size.width * 0.35, size.height * 0.7);
    path.lineTo(size.width * 0.4, size.height * 0.4);
    path.lineTo(size.width * 0.45, size.height * 0.8);
    path.lineTo(size.width * 0.55, size.height * 0.5);
    path.lineTo(size.width * 0.65, size.height * 0.6);
    path.lineTo(size.width * 0.75, size.height * 0.55);
    path.lineTo(size.width * 0.85, size.height * 0.65);
    path.lineTo(size.width, size.height * 0.6);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
