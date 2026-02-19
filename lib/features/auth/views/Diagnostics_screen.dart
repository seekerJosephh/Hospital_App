import 'package:flutter/material.dart';
import 'package:hospital/core/constants/app_colors.dart';
import 'package:hospital/core/constants/app_fonts.dart';
import 'package:hospital/core/constants/app_size.dart';
import 'package:hospital/widgets/search_bar.dart'; // Assuming this is your custom search
import 'package:remixicon/remixicon.dart';

class DiagnosticsServicesScreen extends StatelessWidget {
  const DiagnosticsServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background ?? Colors.grey.shade50,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leadingWidth: 56,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_rounded, color: AppColors.primary),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Diagnostics',
          style: TextStyle(
            color: AppColors.primary,
            fontSize: 22, // Slightly larger for emphasis
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Badge(
              isLabelVisible: true, // Show badge if notifications exist
              label: const Text('3', style: TextStyle(fontSize: 10)),
              child: Icon(
                Icons.notifications_outlined,
                color: AppColors.primary,
                size: AppSizes.iconSize(context),
              ),
            ),
            onPressed: () {
              // TODO: Notifications screen
            },
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppSizes.paddingMedium(context),
                vertical: AppSizes.paddingSmall(context),
              ),
              child: const MySearchBar(),
            ),
          ),

          // Featured / Popular Diagnostics Section
          _buildSectionHeader(context,
              title: 'Popular Diagnostics', showSeeAll: true),
          SliverPadding(
            padding: EdgeInsets.symmetric(
                horizontal: AppSizes.paddingMedium(context)),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 12,
                mainAxisSpacing: 16,
                childAspectRatio:
                    0.85, // Slightly taller for better label space
              ),
              delegate: SliverChildListDelegate([
                _buildServiceCard(Remix.stethoscope_line, "Consultation"),
                _buildServiceCard(Remix.lungs_fill, "Lungs Check"),
                _buildServiceCard(Remix.syringe_line, "Blood Test"),
                _buildServiceCard(Remix.virus_fill, "Infection"),
                _buildServiceCard(Remix.capsule_fill, "Medication"),
                _buildServiceCard(Remix.psychotherapy_fill, "Mental Health"),
                _buildServiceCard(Remix.test_tube_fill, "Lab Tests"),
                _buildServiceCard(Remix.heart_pulse_fill, "Cardiology"),
              ]),
            ),
          ),

          // Services Section (with placeholder for real content)
          _buildSectionHeader(context, title: 'All Services', showSeeAll: true),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppSizes.paddingMedium(context),
                vertical: AppSizes.paddingSmall(context),
              ),
              child: Column(
                children: [
                  // Placeholder for services list or carousel
                  Container(
                    height: 180,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'lib/assets/images/loading.gif',
                            width: 120,
                            height: 120,
                          ),
                          const SizedBox(height: 12),
                          Text(
                            'Loading services...',
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  // You can replace with real ListView/GridView of services later
                ],
              ),
            ),
          ),

          const SliverToBoxAdapter(
              child: SizedBox(height: 40)), // Bottom padding
        ],
      ),
    );
  }

  Widget _buildSectionHeader(
    BuildContext context, {
    required String title,
    bool showSeeAll = false,
  }) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.fromLTRB(
          AppSizes.paddingMedium(context),
          AppSizes.paddingMedium(context),
          AppSizes.paddingMedium(context),
          8,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Colors.black87,
              ),
            ),
            if (showSeeAll)
              TextButton(
                onPressed: () {
                  // TODO: Navigate to full list
                },
                style: TextButton.styleFrom(
                  foregroundColor: AppColors.primary,
                  padding: EdgeInsets.zero,
                ),
                child: const Text(
                  'See all',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildServiceCard(IconData icon, String label) {
    return GestureDetector(
      onTap: () {
        // TODO: Navigate to service detail / booking
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Material(
            elevation: 2,
            shadowColor: AppColors.primary.withOpacity(0.2),
            borderRadius: BorderRadius.circular(20),
            child: Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Icon(
                icon,
                color: AppColors.primary,
                size: 36,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            label,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 11.5,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
              height: 1.2,
            ),
          ),
        ],
      ),
    );
  }
}
