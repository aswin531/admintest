// import 'dart:io';
// import 'package:admin_rent/controllers/providers/car/car_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:file_picker/file_picker.dart';

// class AddCarScreen extends StatefulWidget {
//   @override
//   _AddCarScreenState createState() => _AddCarScreenState();
// }

// class _AddCarScreenState extends State<AddCarScreen> {
//   final _formKey = GlobalKey<FormState>();
//   String? _name, _brand, _model;
//   double? _pricePerDay;
//   File? _mainImage;
//   List<File> _images = [];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Add Car'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: ListView(
//             children: [
//               TextFormField(
//                 decoration: InputDecoration(labelText: 'Name'),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter the name';
//                   }
//                   return null;
//                 },
//                 onSaved: (value) => _name = value,
//               ),
//               TextFormField(
//                 decoration: InputDecoration(labelText: 'Brand'),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter the brand';
//                   }
//                   return null;
//                 },
//                 onSaved: (value) => _brand = value,
//               ),
//               TextFormField(
//                 decoration: InputDecoration(labelText: 'Model'),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter the model';
//                   }
//                   return null;
//                 },
//                 onSaved: (value) => _model = value,
//               ),
//               TextFormField(
//                 decoration: InputDecoration(labelText: 'Price Per Day'),
//                 keyboardType: TextInputType.number,
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter the price per day';
//                   }
//                   return null;
//                 },
//                 onSaved: (value) => _pricePerDay = double.tryParse(value!),
//               ),
//               SizedBox(height: 16),
//               ElevatedButton(
//                 onPressed: () async {
//                   FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.image);
//                   if (result != null) {
//                     setState(() {
//                       _mainImage = File(result.files.single.path!);
//                     });
//                   }
//                 },
//                 child: Text('Pick Main Image'),
//               ),
//               SizedBox(height: 16),
//               ElevatedButton(
//                 onPressed: () async {
//                   FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.image, allowMultiple: true);
//                   if (result != null) {
//                     setState(() {
//                       _images = result.paths.map((path) => File(path!)).toList();
//                     });
//                   }
//                 },
//                 child: Text('Pick Additional Images'),
//               ),
//               SizedBox(height: 16),
//               ElevatedButton(
//                 onPressed: () {
//                   if (_formKey.currentState!.validate()) {
//                     _formKey.currentState!.save();
//                     if (_mainImage != null && _images.isNotEmpty) {
//                       Provider.of<CarProvider>(context, listen: false).addCarVehicle(
//                         context: context,
//                         name: _name!,
//                         brand: _brand!,
//                         model: _model!,
//                         pricePerDay: _pricePerDay!,
//                         mainImage: _mainImage!,
//                         images: _images,
//                       );
//                     }
//                   }
//                 },
//                 child: Text('Add Car'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
