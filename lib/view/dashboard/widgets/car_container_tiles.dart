import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CarContainerCards extends StatelessWidget {
  const CarContainerCards({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double cardWidth = 90;
        double cardHeight1 = 80;
        double cardHeight2 = 90;

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            // spacing: 10.0,
            // runSpacing: 10.0,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    _buildCard(
                      title: 'Engine',
                      subtitle: 'Subtitle 1',
                      icon: Icons.bolt,
                      backgroundColor: Colors.lightBlueAccent,
                      width: cardWidth,
                      height: cardHeight1,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    _buildCard(
                      title: 'Fuel',
                      subtitle: 'Subtitle 2',
                      icon: FontAwesomeIcons.gasPump,
                      backgroundColor: Colors.lightGreenAccent,
                      width: cardWidth,
                      height: cardHeight2,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    _buildCard(
                      title: 'Engine',
                      subtitle: 'Subtitle 1',
                      icon: Icons.bolt,
                      backgroundColor: Colors.purple.withOpacity(0.5),
                      width: cardWidth,
                      height: cardHeight1,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    _buildCard(
                      title: 'Fuel',
                      subtitle: 'Subtitle 2',
                      icon: FontAwesomeIcons.gasPump,
                      backgroundColor: Colors.blueGrey,
                      width: cardWidth,
                      height: cardHeight2,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildCard({
    required String title,
    required String subtitle,
    required IconData icon,
    required Color backgroundColor,
    required double width,
    required double height,
  }) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                size: 24,
                color: backgroundColor,
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
