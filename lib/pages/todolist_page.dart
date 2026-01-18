import 'package:flutter/material.dart';
import 'package:hospital/core/constants/app_colors.dart';
import 'package:hospital/features/auth/models/todoList_model.dart';
import 'package:hospital/features/auth/views/editProfile_screen.dart';
import 'package:hospital/features/auth/views/insurance_screen.dart';
import 'package:hospital/features/auth/views/paymentbill_screen.dart';
import 'package:hospital/features/auth/views/prescription_screen.dart';
import 'package:hospital/services/todoList_service.dart';
import 'package:remixicon/remixicon.dart';

class TodolistPage extends StatefulWidget {
  const TodolistPage({super.key});

  @override
  State<TodolistPage> createState() => _TodolistPageState();
}

class _TodolistPageState extends State<TodolistPage> {
  // ignore: unused_field
  late Future<List<TodoItem>> _todoItems;

  @override
  void initState() {
    super.initState();
    _todoItems = TodoService().fetchTodoItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        title: const Text(
          "Things you have To-Do",
          style:
              TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Image placeholder
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              height: 200, // Adjust height to your needs
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey[300], // Placeholder color
                borderRadius: BorderRadius.circular(10),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(
                    10), // Ensures image respects the border radius
                child: Image.asset(
                  "lib/assets/images/Todo.jpg",
                  fit: BoxFit.cover, // Ensures the image fits the box
                ),
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Today",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: AppColors.primary,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    // Add your View All button functionality here
                  },
                  child: const Text(
                    "View All",
                    style: TextStyle(color: AppColors.primary, fontSize: 14),
                  ),
                ),
              ],
            ),
          ),
          // Today's tasks section
          Expanded(
            child: ListView(
              children: [
                ToDoItem(
                  title: "Verify your Account",
                  subtitle: "4 records found",
                  status: "Pending",
                  icon: Icons.person,
                  iconColor: AppColors.primary,
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PersonalInfoScreen()));
                  },
                ),
                ToDoItem(
                  title: "Fill Emergency Form",
                  subtitle: "4 records found",
                  status: "Completed",
                  icon: Icons.file_copy,
                  iconColor: AppColors.primary,
                  onTap: () {},
                ),
                ToDoItem(
                  title: "Fill Insurance Form",
                  subtitle: "4 records found",
                  status: "Pending",
                  icon: Icons.assignment_turned_in,
                  iconColor: AppColors.primary,
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => InsuranceScreen()));
                  },
                ),
                ToDoItem(
                  title: "Payment Bill",
                  subtitle: "4 records found",
                  status: "Pending",
                  icon: Remix.refund_2_line,
                  iconColor: AppColors.primary,
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PaymentbillScreen()));
                  },
                ),
                ToDoItem(
                  title: "Prescription",
                  subtitle: "4 records found",
                  status: "In Progress",
                  icon: Remix.dossier_line,
                  iconColor: AppColors.primary,
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PrescriptionScreen()));
                  },
                ),
                ToDoItem(
                  title: "Receipt",
                  subtitle: "4 records found",
                  status: "In Progress",
                  icon: Icons.account_balance_wallet,
                  iconColor: AppColors.primary,
                  onTap: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ToDoItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final String? status;
  final IconData icon;
  final Color iconColor;
  final VoidCallback onTap;

  ToDoItem({
    required this.title,
    required this.subtitle,
    this.status,
    required this.icon,
    required this.iconColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.text,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: iconColor.withOpacity(0.1),
            child: Icon(icon, color: iconColor),
          ),
          title: Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
          ),
          subtitle: Text(subtitle),
          trailing: status != null
              ? Text(
                  status!,
                  style: const TextStyle(
                    color: AppColors.primary,
                    fontWeight: FontWeight.bold,
                  ),
                )
              : const Icon(Icons.arrow_forward_ios,
                  size: 16, color: Colors.grey),
          onTap: onTap,
        ),
      ),
    );
  }
}

class DetailsScreeen extends StatelessWidget {
  const DetailsScreeen({super.key, required this.title, required this.details});

  final String title;
  final String details;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: AppColors.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          details,
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
