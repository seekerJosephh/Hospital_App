import 'package:flutter/material.dart';
import 'package:hospital/core/constants/app_colors.dart';
import 'package:hospital/features/auth/models/billpayment_model.dart';
import 'package:hospital/services/billpayment_service.dart';

class PaymentbillScreen extends StatefulWidget {
  const PaymentbillScreen({super.key});

  @override
  State<PaymentbillScreen> createState() => _PaymentbillScreenState();
}

class _PaymentbillScreenState extends State<PaymentbillScreen> {
  final BillService _billService = BillService();
  TextEditingController _searchController = TextEditingController();
  String _searchQuery = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bill Payment"),
        backgroundColor: AppColors.primary,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              controller: _searchController,
              onChanged: (value) {
                setState(() {
                  _searchQuery = value;
                });
              },
              decoration: InputDecoration(
                hintText: "Search...",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.primary),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          ),
          Expanded(
            child: FutureBuilder<List<BillpaymentModel>>(
              future: _billService.fetchBills(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return const Center(child: Text("Error loading bills."));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text("No bills available."));
                } else {
                  final bills = snapshot.data!
                      .where((bill) => bill.hospitalName
                          .toLowerCase()
                          .contains(_searchQuery.toLowerCase()))
                      .toList();
                  return ListView.builder(
                    itemCount: bills.length,
                    itemBuilder: (context, index) {
                      final bill = bills[index];
                      return Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            const SizedBox(height: 10),
                            Container(
                              margin: const EdgeInsets.only(bottom: 20.0),
                              padding: const EdgeInsets.all(16.0),
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: AppColors.primary, width: 1),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Hospital: ${bill.hospitalName}",
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "Date: ${bill.date}",
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Text("Staff: ${bill.staffName}",
                                      style: const TextStyle(fontSize: 16)),
                                  const SizedBox(height: 10),
                                  Text("Disease: ${bill.typeOfDisease}",
                                      style: const TextStyle(fontSize: 16)),
                                  const SizedBox(height: 10),
                                  Text("Check Fee: \$${bill.checkFee}",
                                      style: const TextStyle(fontSize: 16)),
                                  const SizedBox(height: 10),
                                  Text("Warranty: ${bill.warranty}",
                                      style: const TextStyle(fontSize: 16)),
                                  const SizedBox(height: 10),
                                  Text("Drug Prices: \$${bill.drugPrices}",
                                      style: const TextStyle(fontSize: 16)),
                                  const SizedBox(height: 10),
                                  Text(
                                    "Total: \$${bill.total}",
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(height: 20),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      if (bill.actions.view)
                                        ElevatedButton(
                                          onPressed: () {
                                            // Handle View action
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: AppColors.primary,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                          ),
                                          child: const Text(
                                            "View",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      if (bill.actions.pay)
                                        ElevatedButton(
                                          onPressed: () {},
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: AppColors.primary,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                          ),
                                          child: const Text(
                                            "Pay",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
