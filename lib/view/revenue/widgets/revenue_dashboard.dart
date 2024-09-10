import 'package:admin_rent/config/responsive.dart';
import 'package:admin_rent/controllers/providers/rental/rental_request_provider.dart';
import 'package:admin_rent/view/revenue/widgets/dashboard_charts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DashBoardPageRevenueWidget extends StatelessWidget {
  const DashBoardPageRevenueWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final rentalProvider = Provider.of<RentalRequestProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Dashboard')),
      body: Responsive(
        desktop: _buildDesktopLayout(rentalProvider),
        tablet: _buildTabletLayout(rentalProvider),
        mobile: _buildMobileLayout(rentalProvider),
        smallMobile: _buildMobileLayout(rentalProvider),
      ),
    );
  }

  Widget _buildDesktopLayout(RentalRequestProvider rentalProvider) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Total Revenue: \$${rentalProvider.totalRevenue}'),
              const Expanded(
                child: DashboardCharts(), 
              ),
            ],
          ),
        ),
        Expanded(
          flex: 3,
          child: ListView.builder(
            itemCount: rentalProvider.completedRequests.length,
            itemBuilder: (context, index) {
              final request = rentalProvider.completedRequests[index];
              return ListTile(
                title: Text('${request.name}'),
                subtitle: Text('Paid: \$${request.estimatedCost}'),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildTabletLayout(RentalRequestProvider rentalProvider) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Total Revenue: \$${rentalProvider.totalRevenue}'),
          const DashboardCharts(),  // Add your charts here
          ListView.builder(
            shrinkWrap: true,
            itemCount: rentalProvider.completedRequests.length,
            itemBuilder: (context, index) {
              final request = rentalProvider.completedRequests[index];
              return ListTile(
                title: Text('${request.name}'),
                subtitle: Text('Paid: \$${request.estimatedCost}'),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildMobileLayout(RentalRequestProvider rentalProvider) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Total Revenue: \$${rentalProvider.totalRevenue}'),
          const DashboardCharts(),  // Add your charts here
          ListView.builder(
            shrinkWrap: true,
            itemCount: rentalProvider.completedRequests.length,
            itemBuilder: (context, index) {
              final request = rentalProvider.completedRequests[index];
              return ListTile(
                title: Text('${request.name}'),
                subtitle: Text('Paid: \$${request.estimatedCost}'),
              );
            },
          ),
        ],
      ),
    );
  }
}
