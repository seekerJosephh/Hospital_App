import 'package:flutter/material.dart';
import 'package:hospital/features/auth/views/ProductDetailScreen.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class PharmacyScreen extends StatefulWidget {
  const PharmacyScreen({super.key});

  @override
  State<PharmacyScreen> createState() => _PharmacyScreenState();
}

class _PharmacyScreenState extends State<PharmacyScreen> {
  File? _uploadedPrescription;
  int _cartItemCount = 0;

  // Dummy product data (you can replace with real API later)
  final List<Map<String, dynamic>> _popularProducts = [
    {
      'name': 'Panadol',
      'price': 15.99,
      'oldPrice': null,
      'image': 'lib/assets/images/panadol.jpg',
      'rating': 4.8
    },
    {
      'name': 'Bodrex Herbal',
      'price': 7.99,
      'oldPrice': null,
      'image': 'lib/assets/images/bodrex.jpg',
      'rating': 4.5
    },
    {
      'name': 'Konidin',
      'price': 5.99,
      'oldPrice': null,
      'image': 'lib/assets/images/konidin.jpg',
      'rating': 4.7
    },
  ];

  final List<Map<String, dynamic>> _saleProducts = [
    {
      'name': 'OBH Combi',
      'price': 9.99,
      'oldPrice': 14.99,
      'image': 'lib/assets/images/obh_combi.jpg',
      'rating': 4.6
    },
    {
      'name': 'Betadine',
      'price': 6.99,
      'oldPrice': 9.99,
      'image': 'lib/assets/images/betadine.jpg',
      'rating': 4.9
    },
    {
      'name': 'Betadrexin',
      'price': 7.99,
      'oldPrice': 12.99,
      'image': 'lib/assets/images/betadrexin.jpg',
      'rating': 4.4
    },
  ];

  Future<void> _uploadPrescription() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _uploadedPrescription = File(pickedFile.path);
      });

      // Optional: show success
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Prescription uploaded successfully')),
      );
    }
  }

  void _addToCart() {
    setState(() {
      _cartItemCount++;
    });
  }

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
          'Pharmacy',
          style: TextStyle(
              color: Colors.black87, fontSize: 22, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        actions: [
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.shopping_cart_outlined,
                    color: Color(0xFF26A69A)),
                onPressed: () {
                  // TODO: Go to Cart screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const CartScreen()),
                  );
                },
              ),
              if (_cartItemCount > 0)
                Positioned(
                  right: 8,
                  top: 8,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      '$_cartItemCount',
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search bar
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search drugs, category...',
                  prefixIcon: const Icon(Icons.search, color: Colors.grey),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 0),
                ),
              ),
            ),

            // Upload Prescription Card
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFF26A69A).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Order quickly with Prescription',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF26A69A),
                      ),
                    ),
                    const SizedBox(height: 16),
                    GestureDetector(
                      onTap: _uploadPrescription,
                      child: Container(
                        height: 140,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: Colors.grey.shade300),
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.upload_file,
                                size: 48,
                                color: const Color(0xFF26A69A),
                              ),
                              const SizedBox(height: 12),
                              const Text(
                                'Upload Prescription',
                                style: TextStyle(
                                  color: Color(0xFF26A69A),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
// Popular Products
            _buildSectionHeader('Popular Product', 'See all'),
            SizedBox(
              height:
                  260, // ← increased from 220 → fixes overflow on most devices
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: _popularProducts.length,
                itemBuilder: (context, index) {
                  final product = _popularProducts[index];
                  return SizedBox(
                    width: 160,
                    child: _buildProductCard(product),
                  );
                },
              ),
            ),

// Products on Sale (same change)
            _buildSectionHeader('Product on Sale', 'See all'),
            SizedBox(
              height: 280,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: _saleProducts.length,
                itemBuilder: (context, index) {
                  final product = _saleProducts[index];
                  return SizedBox(
                    width: 160,
                    child: _buildProductCard(product, isSale: true),
                  );
                },
              ),
            ),
            const SizedBox(height: 100), // space for bottom elements
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title, String actionText) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Colors.black87,
            ),
          ),
          TextButton(
            onPressed: () {
              // TODO: See all products
            },
            child: Text(
              actionText,
              style: const TextStyle(
                  color: Color(0xFF26A69A), fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductCard(Map<String, dynamic> product,
      {bool isSale = false}) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailScreen(product: product),
          ),
        );
      },
      child: Container(
        width: 160,
        margin: const EdgeInsets.only(right: 12),
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(16)),
              child: Image.asset(
                product['image'],
                height: 110,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product['name'],
                    style: const TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 14),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.amber, size: 16),
                      const SizedBox(width: 4),
                      Text(
                        '${product['rating']}',
                        style:
                            const TextStyle(fontSize: 13, color: Colors.grey),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      Text(
                        '\$${product['price'].toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF26A69A),
                        ),
                      ),
                      if (isSale && product['oldPrice'] != null) ...[
                        const SizedBox(width: 8),
                        Text(
                          '\$${product['oldPrice'].toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontSize: 13,
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      ],
                    ],
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 8, bottom: 8),
                child: IconButton(
                  icon: const Icon(Icons.add_circle,
                      color: Color(0xFF26A69A), size: 32),
                  onPressed: _addToCart,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Placeholder Cart Screen (you can expand later)
class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My cart'),
        centerTitle: true,
      ),
      body: const Center(child: Text('Cart items will appear here')),
    );
  }
}
