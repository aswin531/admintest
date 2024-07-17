import 'dart:io';
import 'package:admin_rent/utils/primary_text.dart';
import 'package:flutter/material.dart';

class ImagePreviewWidget extends StatelessWidget {
  final File? mainImage;
  final List<File> images;

  const ImagePreviewWidget({
    super.key,
    required this.mainImage,
    required this.images,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (mainImage != null) ...[
          const PrimaryText(
            text: "Main Image:",
            size: 20,
          ),
          Image.file(
            mainImage!,
            height: 150,
            width: 150,
          ),
          const SizedBox(height: 20),
        ],
        if (images.isNotEmpty) ...[
          const PrimaryText(
            text: "Additional Image:",
            size: 20,
          ),
          SizedBox(
            height: 150,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: images.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.file(
                    images[index],
                    height: 150,
                    width: 150,
                  ),
                );
              },
            ),
          ),
        ],
      ],
    );
  }
}
