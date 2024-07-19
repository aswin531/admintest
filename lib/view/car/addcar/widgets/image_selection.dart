import 'package:admin_rent/utils/auth_buttons.dart';
import 'package:flutter/material.dart';

class ImageSelectionWidget extends StatelessWidget {
  const ImageSelectionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
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
            onTap: () {
              // Add main image selection functionality here
            },
            child: Container(
              width: double.infinity,
              height: 120,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 224, 224, 224),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(Icons.add_photo_alternate, size: 40),
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Additional Images',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          SizedBox(
            height: 100,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemCount: 4,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return GestureDetector(
                    onTap: () {
                      // Add multiple image selection functionality here
                    },
                    child: Container(
                      decoration: BoxDecoration(image:const DecorationImage(image:AssetImage("assets/images/addcarimg.jpg")),
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(Icons.add_photo_alternate, size: 24),
                    ),
                  );
                } else {
                  return Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(8),
                          image: const DecorationImage(
                            image: AssetImage('assets/images/login_bg.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 3,
                        right: 3,
                        child: GestureDetector(
                          onTap: () {
                            // Add remove functionality here
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
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: StyledButton(
                text: "Submit",
                onPressed: () {},
              ),
            ),
          )
        ],
      ),
    );
  }
}
