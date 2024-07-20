import 'package:admin_rent/config/responsive.dart';
import 'package:admin_rent/view/car/display/widgets/filterchips.dart';
import 'package:admin_rent/view/widgets/custom_search.dart';
import 'package:flutter/material.dart';

class CarListPage extends StatelessWidget {
  const CarListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('260 Vehicle founded'),
        actions: const [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              FilterChips(),
              SearchAndFilterBar(),
            ],
          ),
        ],
      ),
      body: const Responsive(
        desktop: DesktopLayout(),
        tablet: TabletLayout(),
        mobile: MobileLayout(),
        smallMobile: MobileLayout(),
      ),
    );
  }
}

class DesktopLayout extends StatelessWidget {
  const DesktopLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        childAspectRatio: 0.8,
      ),
      itemBuilder: (context, index) => const CarCard(),
      itemCount: 12,
    );
  }
}

class TabletLayout extends StatelessWidget {
  const TabletLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 0.75,
      ),
      itemBuilder: (context, index) => const CarCard(),
      itemCount: 12,
    );
  }
}

class MobileLayout extends StatelessWidget {
  const MobileLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Responsive.isSmallMobile(context)
        ? ListView.builder(
            itemBuilder: (context, index) => const CarCard(),
            itemCount: 12,
          )
        : GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.7,
            ),
            itemBuilder: (context, index) => const CarCard(),
            itemCount: 12,
          );
  }
}

class CarCard extends StatelessWidget {
  const CarCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset('assets/images/logo-dash.png', fit: BoxFit.cover),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Renault Clio',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    Chip(label: Text('ECONOMY')),
                  ],
                ),
                const SizedBox(height: 8),
                const Row(
                  children: [
                    Icon(Icons.person, size: 16),
                    Text(' 4'),
                    SizedBox(width: 8),
                    Icon(Icons.local_gas_station, size: 16),
                    Text(' Petrol'),
                  ],
                ),
                const SizedBox(height: 8),
                const Text('Deposit: 1000 tl'),
                const Text('KM Limit: 900km'),
                const Text('Credit Card Req.'),
                const SizedBox(height: 8),
                const Text('776.00 TL',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                const Text('258.99 TL Per Day'),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[900],
                    minimumSize: const Size(double.infinity, 36),
                  ),
                  child: const Text('RENT NOW'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
