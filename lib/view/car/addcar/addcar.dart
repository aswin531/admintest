import 'dart:io';

import 'package:admin_rent/controllers/providers/car/car_provider.dart';
import 'package:admin_rent/view/car/addcar/widgets/add_car_form.dart';
import 'package:admin_rent/view/car/display/desktop/desk_carlist_desk.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class AddVehiclePage extends StatelessWidget {
  const AddVehiclePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Add New Vehicle'),
          actions: [
            IconButton(
              icon: const Icon(Icons.list),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DesktopCarListScreen(),
                  ),
                );
              },
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              SizedBox(height: 20.h),
              Center(
                child: Text(
                  'Add Vehicle Images',
                  style: TextStyle(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              Consumer<CarProvider>(
                builder: (context, carProvider, child) {
                  return ElevatedButton.icon(
                    onPressed: () async {
                      FilePickerResult? result = await FilePicker.platform
                          .pickFiles(type: FileType.image);
                      if (result != null) {
                        carProvider
                            .setMainImage(File(result.files.single.path!));
                      }
                    },
                    icon: const Icon(Icons.image),
                    label: const Text(
                      "Select Main Image",
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 12.0,
                      ),
                      textStyle: TextStyle(
                        fontSize: 18.sp,
                      ),
                    ),
                  );
                },
              ),
              SizedBox(height: 20.h),
              Consumer<CarProvider>(
                builder: (context, carProvider, child) {
                  return ElevatedButton.icon(
                    onPressed: () async {
                      FilePickerResult? result = await FilePicker.platform
                          .pickFiles(type: FileType.image, allowMultiple: true);
                      if (result != null) {
                        carProvider.setImages(
                            result.paths.map((path) => File(path!)).toList());
                      }
                    },
                    icon: const Icon(Icons.collections),
                    label: const Text(
                      "Select Multiple Images",
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 12.0,
                      ),
                      textStyle: TextStyle(fontSize: 18.sp),
                    ),
                  );
                },
              ),
              SizedBox(height: 30.h),
              Center(
                child: Text(
                  'Enter Vehicle Details',
                  style: TextStyle(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              AddCarFormWidget(),
              SizedBox(height: 30.h),
            ],
          ),
        ),
      ),
    );
  }
}
