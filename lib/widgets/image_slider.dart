import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:hospital/core/constants/app_size.dart';

class ImageSlider extends StatefulWidget {
  final Function(int) onChange;
  final int currentSlide;

  const ImageSlider({
    Key? key,
    required this.currentSlide,
    required this.onChange,
  }) : super(key: key);

  @override
  _ImageSliderState createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  List<String> imagePaths = [];

  @override
  void initState() {
    super.initState();
    _loadImagePaths(); // Load images from JSON
  }

  Future<void> _loadImagePaths() async {
    try {
      // Load JSON data
      final String response =
          await rootBundle.loadString('lib/assets/jsons/imagesilder_dara.json');
      final data = json.decode(response) as Map<String, dynamic>;

      // Extract image paths
      setState(() {
        imagePaths = List<String>.from(data['images']);
      });
    } catch (e) {
      print('Error loading images: $e');
    }
  }

// I chang Image to Json Image
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: AppSizes.cardHeight(context),
          width: double.infinity,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(AppSizes.borderRadius(context)),
            child: imagePaths.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : CarouselSlider.builder(
                    options: CarouselOptions(
                      height: AppSizes.cardHeight(context),
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 3),
                      enlargeCenterPage: true,
                      viewportFraction: 1.0,
                      onPageChanged: (index, reason) {
                        widget.onChange(index);
                      },
                    ),
                    itemCount: imagePaths.length,
                    itemBuilder: (context, index, realIndex) {
                      return Image.asset(
                        imagePaths[index],
                        fit: BoxFit.cover,
                        width: double.infinity,
                      );
                    },
                  ),
          ),
        ),
        if (imagePaths.isNotEmpty)
          Positioned.fill(
            bottom: AppSizes.buttonHeight(context),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  imagePaths.length,
                  (index) => AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    width: widget.currentSlide == index ? 15 : 8,
                    height: 8,
                    margin: const EdgeInsets.only(right: 3),
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(AppSizes.borderRadius(context)),
                      color: widget.currentSlide == index
                          ? Colors.black
                          : Colors.transparent,
                      border: Border.all(color: Colors.black),
                    ),
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
