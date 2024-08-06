import 'package:admin_rent/controllers/providers/rental/rental_request_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DataTableWidget extends StatelessWidget {
  const DataTableWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final rentalRequestProvider = Provider.of<RentalRequestProvider>(context);
    final requests = rentalRequestProvider.allRequests;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        headingRowHeight: 60,
        columnSpacing: 30,
        horizontalMargin: 20,
        columns: const [
          DataColumn(
            label: Text(
              'User',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.black,
              ),
            ),
          ),
          DataColumn(
            label: Text(
              'Start Date',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.black,
              ),
            ),
          ),
          DataColumn(
            label: Text(
              'End Date',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.black,
              ),
            ),
          ),
          DataColumn(
            label: Text(
              'Duration',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.black,
              ),
            ),
          ),
          DataColumn(
            label: Text(
              'City',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.black,
              ),
            ),
          ),
          DataColumn(
            label: Text(
              'Status',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.black,
              ),
            ),
          ),
        ],
        rows: requests.map((rental) {
          final duration = _calculateDuration(rental.startDate, rental.endDate);

          return DataRow(
            cells: [
              DataCell(
                Container(
                  width: 100,
                  height: 60,
                  decoration: BoxDecoration(
                    // image: DecorationImage(
                    //   image: AssetImage(rental.carImage ?? 'assets/images/default-car.png'),
                    //   fit: BoxFit.cover,
                    // ),
                    borderRadius: BorderRadius.circular(8),
                    border:
                        Border.all(color: Colors.transparent.withOpacity(0)),
                  ),
                  child: const Icon(Icons.person),
                ),
              ),
              DataCell(
                Text(
                  rental.startDate.toString(),
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[800],
                  ),
                ),
              ),
              DataCell(
                Text(
                  rental.endDate.toString(),
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[800],
                  ),
                ),
              ),
              DataCell(
                Text(
                  duration,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[800],
                  ),
                ),
              ),
              DataCell(
                Text(
                  rental.address,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[800],
                  ),
                ),
              ),
              DataCell(
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                  decoration: BoxDecoration(
                    color: _getStatusColor(
                        rental.status.toString().split('.').last),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    rental.status.toString().split('.').last.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }

  String _calculateDuration(DateTime startDate, DateTime endDate) {
    final duration = endDate.difference(startDate).inDays;
    return duration > 7 ? '${(duration / 7).floor()} weeks' : '$duration days';
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'accepted':
        return Colors.green.withOpacity(0.8);
      case 'Pending':
        return Colors.orange.withOpacity(0.8);
      case 'rejected':
        return Colors.red.withOpacity(0.8);
      default:
        return Colors.blue.withOpacity(0.8);
    }
  }
}
