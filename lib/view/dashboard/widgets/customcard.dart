import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HorizontalCards extends StatelessWidget {
  const HorizontalCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: LayoutBuilder(
        builder: (context, constraints) {
          double cardSpacing = 10.0;
          int cardsPerRow = 2;
          double actualCardWidth =
              (constraints.maxWidth - (cardSpacing * (cardsPerRow - 1))) /
                  cardsPerRow;

          return Wrap(
            spacing: cardSpacing,
            runSpacing: cardSpacing,
            children: [
              _buildCard(
                title: 'Engine',
                subtitle: 'Subtitle 1',
                icon: Icons.bolt,
                backgroundColor: Colors.blue,
                width: actualCardWidth,
              ),
              _buildCard(
                title: 'Fuel',
                subtitle: 'Subtitle 2',
                icon: FontAwesomeIcons.gasPump,
                backgroundColor: Colors.green,
                width: actualCardWidth,
              ),
              _buildCard(
                title: 'Location',
                subtitle: 'Subtitle 3',
                icon: Icons.location_on_outlined,
                backgroundColor: Colors.orange,
                width: actualCardWidth,
              ),
              _buildCard(
                title: 'Card 4',
                subtitle: 'Subtitle 4',
                icon: Icons.discount_outlined,
                backgroundColor: Colors.purple,
                width: actualCardWidth,
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildCard({
    required String title,
    required String subtitle,
    required IconData icon,
    required Color backgroundColor,
    required double width,
  }) {
    return Container(
      width: width,
      constraints: const BoxConstraints(
        minHeight: 100,
        maxHeight: 200,
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Container(
              width: 64,
              height: 64,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                size: 32,
                color: backgroundColor,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16.0),
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
