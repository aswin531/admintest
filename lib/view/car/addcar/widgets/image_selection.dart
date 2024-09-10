// ignore_for_file: use_build_context_synchronously

import 'dart:io';
import 'package:admin_rent/controllers/providers/car/car_provider.dart';
import 'package:admin_rent/utils/auth_buttons.dart';
import 'package:admin_rent/view/car/addcar/widgets/form_components/combined.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ImageSelectionWidget extends StatelessWidget {
  const ImageSelectionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final carProvider = Provider.of<CarProvider>(context);

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Image Selection',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Main Image',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            GestureDetector(
              onTap: () => _selectMainImage(context),
              child: Container(
                width: double.infinity,
                height: 120,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 224, 224, 224),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: carProvider.mainImage != null
                    ? Image.file(carProvider.mainImage!, fit: BoxFit.cover)
                    : const Icon(Icons.add_photo_alternate, size: 40),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Additional Images',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            SizedBox(
              height: 150,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemCount: carProvider.images.length + 1,
                itemBuilder: (context, index) {
                  if (index == carProvider.images.length) {
                    return GestureDetector(
                      onTap: () => _selectAdditionalImages(context),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(Icons.add_photo_alternate, size: 24),
                      ),
                    );
                  } else {
                    final image = carProvider.images[index];
                    return Stack(
                      children: [
                        Image.file(image, fit: BoxFit.cover),
                        Positioned(
                          top: 3,
                          right: 3,
                          child: GestureDetector(
                            onTap: () {
                              // Handle image removal
                              carProvider.setImages(
                                carProvider.images
                                    .where((img) => img != image)
                                    .toList(),
                              );
                            },
                            child: Container(
                              padding: const EdgeInsets.all(2),
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(Icons.delete,
                                  size: 14, color: Colors.red),
                            ),
                          ),
                        ),
                      ],
                    );
                  }
                },
              ),
            ),
            const CombinedScreen(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                  child: carProvider.isLoading
                      ? const CircularProgressIndicator()
                      : StyledButton(
                          text: "Submit",
                          onPressed: () {
                            carProvider.submitCarDetails(context);
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //       builder: (context) => DashBoardContent(),
                            //     ));
                          },
                        )),
            ),
            //
          ],
        ),
      ),
    );
  }

  Future<void> _selectMainImage(BuildContext context) async {
    final carProvider = Provider.of<CarProvider>(context, listen: false);
    carProvider.setLoading(true);
    final pickerResult = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: false,
    );

    if (pickerResult != null && pickerResult.files.isNotEmpty) {
      final file = File(pickerResult.files.single.path!);
      carProvider.setMainImage(file);
    }
    carProvider.setLoading(false);
  }

  Future<void> _selectAdditionalImages(BuildContext context) async {
    final carProvider = Provider.of<CarProvider>(context, listen: false);
    carProvider.setLoading(true);
    final pickerResult = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: true,
    );

    if (pickerResult != null && pickerResult.files.isNotEmpty) {
      final files = pickerResult.files.map((file) => File(file.path!)).toList();
      carProvider.setImages(files);
    }
    carProvider.setLoading(false);
  }
}
