import 'dart:io';
import 'package:admin_rent/controllers/providers/car/car_provider.dart';
import 'package:admin_rent/view/car/addcar/testcar/testcar.dart';
import 'package:admin_rent/view/car/addcar/widgets/image_preview.dart';
import 'package:admin_rent/view/car/display/desktop/desk_carlist_desk.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class AddVehiclePage extends StatelessWidget {
  const AddVehiclePage({super.key});

  @override
  Widget build(BuildContext context) {
    Provider.of<CarProvider>(context); 
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
        body: Consumer<CarProvider>(
          builder: (context, carProvider, child) {
            if (carProvider.isLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return LayoutBuilder(
                builder: (context, constraints) {
                  if (constraints.maxWidth > 600) {
                    return _buildDesktopView(carProvider);
                  } else {
                    return _buildMobileView(carProvider);
                  }
                },
              );
            }
          },
        ),
      ),
    );
  }

  Widget _buildDesktopView(CarProvider carProvider) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(
              children: [
                _buildHeader('Add Vehicle Images'),
                const SizedBox(height: 20),
                _buildMobileView(carProvider),
                 ImagePreviewWidget(
                  mainImage: carProvider.mainImage,
                  images: carProvider.images,
                ),
                _buildSelectMainImageButton(),
                const SizedBox(height: 20),
                _buildSelectMultipleImagesButton(),
                const SizedBox(height: 30),
                _buildHeader('Enter Vehicle Details'),
                const SizedBox(height: 20),
                AddCarFormWidgetTest()
                //AddCarFormWidget(),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            color: Colors.grey[200],
            child: Center(
              child: Text(
                'Preview Area (Optional)',
                style: TextStyle(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMobileView(CarProvider carProvider) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          _buildHeader('Add Vehicle Images'),
          SizedBox(height: 20.h),
          ImagePreviewWidget(
            mainImage: carProvider.mainImage,
            images: carProvider.images,
          ),
          _buildSelectMainImageButton(),
          SizedBox(height: 20.h),
          _buildSelectMultipleImagesButton(),
          SizedBox(height: 30.h),
          _buildHeader('Enter Vehicle Details'),
          SizedBox(height: 20.h),
          AddCarFormWidgetTest(),
          // AddCarFormWidget(),
          SizedBox(height: 30.h),
        ],
      ),
    );
  }

  Widget _buildHeader(String text) {
    return Center(
      child: Text(
        text,
        style: TextStyle(
          fontSize: 22.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildSelectMainImageButton() {
    return Consumer<CarProvider>(
      builder: (context, carProvider, child) {
        return ElevatedButton.icon(
          onPressed: () async {
            FilePickerResult? result = await FilePicker.platform.pickFiles(
              type: FileType.image,
            );
            if (result != null) {
              carProvider.setMainImage(File(result.files.single.path!));
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
    );
  }

  Widget _buildSelectMultipleImagesButton() {
    return Consumer<CarProvider>(
      builder: (context, carProvider, child) {
        return ElevatedButton.icon(
          onPressed: () async {
            FilePickerResult? result = await FilePicker.platform.pickFiles(
              type: FileType.image,
              allowMultiple: true,
            );
            if (result != null) {
              carProvider.setImages(
                result.paths.map((path) => File(path!)).toList(),
              );
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
    );
  }
}
