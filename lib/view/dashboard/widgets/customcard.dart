import 'package:admin_rent/view/dashboard/widgets/detail_page.dart';
import 'package:admin_rent/view/revenue/widgets/revenue_dashboard.dart';
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
              GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DetailPage(
                      title: 'Engine',
                      subtitle: 'Details about Engine',
                    ),
                  ),
                ),
                child: _buildCard(
                  title: 'Engine',
                  subtitle: 'Engine Varient',
                  icon: Icons.bolt,
                  backgroundColor: Colors.blue,
                  width: actualCardWidth,
                ),
              ),
              GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DetailPage(
                      title: 'Fuel',
                      subtitle: 'Details about Fuel',
                    ),
                  ),
                ),
                child: _buildCard(
                  title: 'Fuel',
                  subtitle: 'Fuel Type',
                  icon: FontAwesomeIcons.gasPump,
                  backgroundColor: Colors.green,
                  width: actualCardWidth,
                ),
              ),
              GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DetailPage(
                      title: 'Location',
                      subtitle: 'Details about Location',
                    ),
                  ),
                ),
                child: _buildCard(
                  title: 'Location',
                  subtitle: 'Locations',
                  icon: Icons.location_on_outlined,
                  backgroundColor: Colors.orange,
                  width: actualCardWidth,
                ),
              ),
              GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const DashBoardPageRevenueWidget()),
                ),
                child: _buildCard(
                  title: 'Revenue',
                  subtitle: 'Total Revenue',
                  icon: Icons.discount_outlined,
                  backgroundColor: Colors.purple,
                  width: actualCardWidth,
                ),
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
