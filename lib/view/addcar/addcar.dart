
import 'dart:io';
import 'package:admin_rent/controllers/providers/car/car_provider.dart';
import 'package:admin_rent/view/addcar/widgets/add_car_form.dart';
import 'package:admin_rent/view/display/desktop/desk_carlist_desk.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              SizedBox(height: 10.h),
              Consumer<CarProvider>(
                builder: (context, carProvider, child) {
                  return ElevatedButton(
                    onPressed: () async {
                      FilePickerResult? result = await FilePicker.platform
                          .pickFiles(type: FileType.image);
                      if (result != null) {
                        carProvider
                            .setMainImage(File(result.files.single.path!));
                      }
                    },
                    child: const Text("Main Image"),
                  );
                },
              ),
              SizedBox(height: 10.h),
              Consumer<CarProvider>(
                builder: (context, carProvider, child) {
                  return ElevatedButton(
                    onPressed: () async {
                      FilePickerResult? result = await FilePicker.platform
                          .pickFiles(type: FileType.image, allowMultiple: true);
                      if (result != null) {
                        carProvider.setImages(
                            result.paths.map((path) => File(path!)).toList());
                      }
                    },
                    child: const Text("Multiple Images"),
                  );
                },
              ),
              SizedBox(height: 10.h),
              AddCarFormWidget(),
              IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DesktopCarListScreen(),
                            ));
                      },
                      icon: Icon(Icons.abc))
            ],
          ),
        ),
      ),
    );
  }
}
