import 'dart:io';

import 'package:admin_rent/controllers/providers/car/car_provider.dart';
import 'package:admin_rent/style/colors.dart';
import 'package:admin_rent/utils/primary_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:file_picker/file_picker.dart';

class AddBrandScreen extends StatelessWidget {
  const AddBrandScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final carProvider = Provider.of<CarProvider>(context);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const PrimaryText(
            text: "Brand Name",
            color: ExternalAppColors.white,
          ),
          const SizedBox(height: 10),
          TextField(
            controller: carProvider.brandController,
            decoration: InputDecoration(
              labelText: 'Enter brand name',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.blue, width: 2),
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Brand Logo',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              ElevatedButton(
                onPressed: () async {
                  FilePickerResult? result =
                      await FilePicker.platform.pickFiles(
                    type: FileType.custom,
                    allowedExtensions: ['jpg', 'png', 'jpeg'],
                  );

                  if (result != null) {
                    carProvider.setBrandLogo(File(result.files.single.path!));
                  } else {}
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Pick Logo',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color:Colors.white, ),
                ),
              ),
              const SizedBox(width: 20),
              carProvider.brandLogo != null
                  ? Image.file(
                      carProvider.brandLogo!,
                      width: 100,
                      height: 100,
                    )
                  : Container(
                      width: 100,
                      height: 100,
                      color: Colors.white,
                      child: const Icon(Icons.image, color: Colors.white),
                    ),
            ],
          ),
          const SizedBox(height: 20),
          Center(
            child: ElevatedButton(
              onPressed: () async {
                await carProvider.addBrandToFireStore(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                'Add Brand',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color:  Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
