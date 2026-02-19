import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hospital/core/constants/app_colors.dart';
import 'package:hospital/core/constants/app_fonts.dart';
import 'package:hospital/core/constants/app_size.dart';
import 'package:hospital/features/auth/models/appointment_model.dart';
import 'package:hospital/features/auth/models/home_category_model.dart';
import 'package:hospital/features/auth/views/Diagnostics_screen.dart';
import 'package:hospital/features/auth/views/PharmacyScreen.dart';
import 'package:hospital/features/auth/views/PrescriptionScreen.dart';
import 'package:hospital/features/auth/views/ReportScreen.dart';
import 'package:hospital/features/auth/views/TopDoctorsScreen.dart';
import 'package:hospital/features/auth/views/appointment_screen.dart';
import 'package:hospital/features/auth/views/editProfile_screen.dart';
import 'package:hospital/features/auth/views/insurance_screen.dart';

import 'package:hospital/pages/todolist_page.dart';
import 'package:hospital/services/appointment_service.dart';
import 'package:hospital/services/home_category_service.dart';
import 'package:hospital/widgets/home_app_bar.dart';
import 'package:hospital/widgets/image_slider.dart';
import 'package:hospital/widgets/search_bar.dart';
import 'package:remixicon/remixicon.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentSlider = 0;
  int selectedIndex = 0;

  late Future<List<Appointment>> appointments;
  final Future<List<Category>> categoriesFuture =
      CategoryService.loadCategories();

  @override
  void initState() {
    super.initState();
    appointments = AppointmentService().fetchAppointments();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top Spacing Reduced
                const SizedBox(height: 15),
                CustomAppBar(),
                const SizedBox(height: 15),
                const MySearchBar(),
                const SizedBox(height: 15),
                ImageSlider(
                  currentSlide: currentSlider,
                  onChange: (value) {
                    setState(() {
                      currentSlider = value;
                    });
                  },
                ),
                const SizedBox(height: 20),
                // Task Progress Card
                Container(
                  height: AppSizes.cardHeight(context), // 10% of screen height

                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 77, 26, 138),
                    borderRadius:
                        BorderRadius.circular(AppSizes.borderRadius(context)),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(AppSizes.paddingMedium(context)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Your today's tasks\nalmost done!",
                              style: TextStyle(
                                color: AppColors.text,
                                fontSize: AppFonts.getHeadingThree(context),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: AppSizes.buttonHeight(context)),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => TodolistPage()));
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.background,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Text(
                                "View Task",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 77, 26, 138),
                                    fontWeight: FontWeight.w800,
                                    fontSize: AppFonts.getBodySmall(context)),
                              ),
                            ),
                          ],
                        ),
                        // ignore: prefer_const_constructors
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            SizedBox(
                              width: AppSizes.Within(context),
                              height: AppSizes.Heighin(context),
                              child: CircularProgressIndicator(
                                value: 0.85,
                                strokeWidth: AppSizes.borderRadius(context),
                                color: AppColors.text,
                                backgroundColor:
                                    Color.fromARGB(255, 203, 33, 233),
                              ),
                            ),
                            Text(
                              "85%",
                              style: TextStyle(
                                color: AppColors.text,
                                fontSize: AppFonts.getBodyText(context),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                Container(
                  margin: EdgeInsets.symmetric(
                      vertical: AppSizes.paddingSmall(context)),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                  decoration: BoxDecoration(
                    color: AppColors
                        .primary, // Teal background matching healthcare apps
                    borderRadius: BorderRadius.circular(
                        AppSizes.borderRadius(context) * 1.2),
                  ),
                  child: GridView.count(
                    crossAxisCount: 4,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    mainAxisSpacing: 20, // Vertical spacing between rows
                    crossAxisSpacing:
                        12, // Horizontal spacing – balanced, not too tight
                    childAspectRatio:
                        0.95, // Slightly taller to fit label comfortably
                    children: [
                      _buildIconTile(
                        icon: Icons
                            .medical_services_outlined, // Stethoscope for Diagnostic
                        label: "Diagnostic",
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => DiagnosticsServicesScreen()),
                          );
                        },
                      ),
                      _buildIconTile(
                        icon: Icons.badge_outlined, // ID card for Insurance
                        label: "Insurance",
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => InsuranceScreen()),
                          );
                        },
                      ),
                      _buildIconTile(
                        icon: Icons
                            .calendar_month_outlined, // Calendar for Appointment
                        label: "Appointment",
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => AppointmentsScreen()),
                          );
                        },
                      ),
                      _buildIconTile(
                        icon: Icons
                            .person_outline, // or better: Icons.medical_services_outlined
                        label: "Doctor",
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => TopDoctorsScreen(),
                            ),
                          );
                        },
                      ),
                      _buildIconTile(
                        icon: Icons
                            .description_outlined, // Clipboard/report for Report
                        label: "Report",
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => ReportScreen(),
                            ),
                          );
                        },
                      ),
                      _buildIconTile(
                        icon: Icons.payments_outlined, // Money/bill for Payment
                        label: "Payment",
                        onTap: () {
                          // TODO: Navigate to Payment/Bill page
                        },
                      ),
                      _buildIconTile(
                        icon: Icons
                            .medical_information_outlined, // Prescription/clipboard+
                        label: "Prescription",
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => PrescriptionScreen(),
                            ),
                          );
                        },
                      ),
                      _buildIconTile(
                        icon: Icons.local_pharmacy_outlined, // Pill/pharmacy
                        label: "Pharmacy",
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => PharmacyScreen(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                // Categories Section
                if (selectedIndex == 0)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Category",
                        style: TextStyle(
                            fontSize: AppFonts.getHeadingTwo(context),
                            fontWeight: FontWeight.w900),
                      ),
                      Text(
                        "See all",
                        style: TextStyle(
                            fontSize: AppFonts.getHeadingTwo(context),
                            color: AppColors.primary),
                      ),
                    ],
                  ),
                // Calling Category from func
                _categorySection(categoriesFuture),

                const SizedBox(height: 20),
                if (selectedIndex == 0) const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Upcoming Appointments",
                      style: TextStyle(
                          fontSize: AppFonts.getHeadingTwo(context),
                          fontWeight: FontWeight.w800),
                    ),
                    Icon(
                      Icons.sort,
                      size: AppSizes.iconSize(context),
                      color: AppColors.primary,
                    ),
                  ],
                ),
                FutureBuilder<List<Appointment>>(
                  future: appointments,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    }

                    if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return const Center(
                        child: Text('No appointments available.'),
                      );
                    }

                    // Sort appointments by date in ascending order
                    List<Appointment> sortedAppointments = snapshot.data!;
                    sortedAppointments.sort((a, b) => DateTime.parse(a.date)
                        .compareTo(DateTime.parse(b.date)));

                    return Column(
                      children: sortedAppointments
                          .map((appointment) =>
                              AppointmentCard(appointment: appointment))
                          .toList(),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Func Test
  Widget _buildIconTile({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: Icon(icon,
                size: 35, // Slightly larger icon for visibility
                color: AppColors.primary // Teal icon color
                ),
          ),
          const SizedBox(height: 10),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w600,
              height: 1.2,
            ),
          ),
        ],
      ),
    );
  }
  // For Category Card

  Widget _categoryCard(String title, String subtitle,
      {required Color color, required Color lightColor}) {
    return Container(
      width: 150,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: lightColor,
            blurRadius: 10,
            spreadRadius: 5,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              subtitle,
              style: TextStyle(
                color: Colors.white.withOpacity(0.9),
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _categorySection(Future<List<Category>> categoriesFuture) {
    return FutureBuilder<List<Category>>(
      future: categoriesFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No categories available.'));
        }

        return SizedBox(
          height: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: snapshot.data!
                .map((category) => _categoryCard(
                      category.title,
                      category.subtitle,
                      color: category.color,
                      lightColor: category.lightColor,
                    ))
                .toList(),
          ),
        );
      },
    );
  }

  // org
  Widget _category() {
    return Column(
      children: <Widget>[
        SizedBox(
          height: AppSizes.cardHeight(context),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              _categoryCard1(
                "Chemist & Drugist",
                "350 + Stores",
                color: AppColors.primary,
                lightColor: Colors.teal.shade100,
              ),
              _categoryCard1(
                "Covid - 19 Specialist",
                "899 Doctors",
                color: Colors.blue.shade400,
                lightColor: Colors.blue.shade200,
              ),
              _categoryCard1(
                "Cardiologists Specialist",
                "500 + Doctors",
                color: Colors.orange.shade300,
                lightColor: Colors.orange.shade100,
              ),
              _categoryCard1(
                "Dermatologist",
                "300 + Doctors",
                color: Colors.teal.shade300,
                lightColor: Colors.teal.shade100,
              ),
              _categoryCard1(
                "General Surgeon",
                "500 + Doctors",
                color: Colors.blue.shade400,
                lightColor: Colors.blue.shade200,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _categoryCard1(String title, String subtitle,
      {required Color color, required Color lightColor}) {
    return Container(
      width: AppSizes.Within(context),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(AppSizes.borderRadius(context)),
        boxShadow: [
          BoxShadow(
            color: lightColor,
            blurRadius: 20,
            spreadRadius: 5,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: AppFonts.getBodyText(context),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              subtitle,
              style: TextStyle(
                // ignore: deprecated_member_use
                color: Colors.white.withOpacity(0.9),
                fontSize: AppFonts.getBodySmall(context),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIconWithLabel(IconData icon, String label, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: AppSizes.paddingLarge(context), // Adjusted icon size
            backgroundColor: Colors.white,
            child: Icon(
              icon,
              size: AppSizes.iconSize(context), // Reduced icon size
              color: Colors.teal,
            ),
          ),
          const SizedBox(height: 4), // Reduced space between icon and label
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: AppFonts.getCaption(context),
                fontWeight: FontWeight.w900,
                color: Colors.white),
          ),
        ],
      ),
    );
  }
}

class AppointmentCard extends StatelessWidget {
  final Appointment appointment;

  const AppointmentCard({super.key, required this.appointment});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(20),
      ),
      width: double.infinity,
      height: AppSizes.cardsmallHeight(context),
      child: Row(
        children: [
          // Date Section
          Container(
            height: AppSizes.cardHeight(context),
            width: AppSizes.buttonHeight(context),
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
            decoration: BoxDecoration(
              color: Colors.lightBlue,
              borderRadius:
                  BorderRadius.circular(AppSizes.borderRadius(context)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  appointment.date,
                  style: TextStyle(
                    color: AppColors.text,
                    fontSize: AppFonts.getBodySmalltwo(context),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  appointment.day,
                  style: TextStyle(
                    color: AppColors.text,
                    fontSize: AppFonts.getBodySmallThree(context),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: AppSizes.borderRadius(context),
          ),
          // Appointment Details Section
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  appointment.time,
                  style: TextStyle(
                    color: AppColors.text,
                    fontSize: AppFonts.getBodySmalltwo(context),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  appointment.doctor,
                  style: TextStyle(
                    color: AppColors.text,
                    fontSize: AppFonts.getBodySmall(context),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  appointment.appointmentType,
                  style: TextStyle(
                    color: AppColors.text,
                    fontSize: AppFonts.getBodySmallThree(context),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
