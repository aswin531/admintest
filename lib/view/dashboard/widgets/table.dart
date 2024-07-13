import 'package:admin_rent/config/responsive.dart';
import 'package:admin_rent/view/dashboard/widgets/predefined_car_list.dart';
import 'package:flutter/material.dart';

class HistoryTable extends StatelessWidget {
  const HistoryTable({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection:
          Responsive.isDesktop(context) ? Axis.vertical : Axis.horizontal,
      child: Card(
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: DataTable(
            columns: const [
              DataColumn(label: Text('Car')),
              DataColumn(label: Text('Rental Date')),
              DataColumn(label: Text('Duration')),
              DataColumn(label: Text('Cost')),
              DataColumn(label: Text('Status')),
            ],
            rows: rentalHistory
                .map((rental) => DataRow(
                      cells: [
                        DataCell(
                          CircleAvatar(
                            backgroundImage: AssetImage(rental["carImage"]),
                          ),
                        ),
                        DataCell(Text(rental["rentalDate"])),
                        DataCell(Text(rental["duration"])),
                        DataCell(Text(rental["cost"])),
                        DataCell(Text(rental["status"])),
                      ],
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }
}
