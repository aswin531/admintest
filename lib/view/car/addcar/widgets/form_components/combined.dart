import 'package:admin_rent/view/car/addcar/widgets/add_model.dart';
import 'package:admin_rent/view/car/addcar/widgets/addbrand_screen.dart';
import 'package:flutter/material.dart';

class CombinedScreen extends StatelessWidget {
  const CombinedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 800) {
            // Side-by-side layout for larger screens
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: _buildContainer(
                    context,
                    title: 'Add Brand',
                    child: const AddBrandScreen(),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: _buildContainer(
                    context,
                    title: 'Add Model',
                    child: const AddModelScreen(),
                  ),
                ),
              ],
            );
          } else {
            // Stacked layout for smaller screens
            return Column(
              children: [
                _buildContainer(
                  context,
                  title: 'Add Brand',
                  child: const AddBrandScreen(),
                ),
                const SizedBox(height: 20),
                _buildContainer(
                  context,
                  title: 'Add Model',
                  child: const AddModelScreen(),
                ),
              ],
            );
          }
        },
      ),
    );
  }

  Widget _buildContainer(BuildContext context,
      {required String title, required Widget child}) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        image: const DecorationImage(
            opacity: 0.8,
            image: AssetImage(
              'assets/images/Dark Wallpaper.jpg',
            ),
            fit: BoxFit.cover),
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            spreadRadius: 2,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
          ),
          const SizedBox(height: 16),
          child,
        ],
      ),
    );
  }
}
