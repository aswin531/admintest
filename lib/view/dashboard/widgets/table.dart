import 'package:admin_rent/config/responsive.dart';
import 'package:admin_rent/style/colors.dart';
import 'package:admin_rent/view/dashboard/widgets/predefined_car_list.dart';
import 'package:flutter/material.dart';

class TableDashWidget extends StatelessWidget {
  const TableDashWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double containerWidth;
    if (Responsive.isDesktop(context)) {
      containerWidth = double.infinity;
    } else if (Responsive.isTablet(context)) {
      containerWidth = MediaQuery.of(context).size.width * 0.9;
    } else {
      containerWidth = MediaQuery.of(context).size.width * 1.3;
    }

    return SingleChildScrollView(
      scrollDirection:
          Responsive.isDesktop(context) ? Axis.vertical : Axis.horizontal,
      child: Container(
        width: containerWidth,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: ExternalAppColors.primaryBg,
        ),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Car Status',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  DropdownButton<String>(
                    hint: Text("Filter"),
                    items: <String>['All', 'Completed', 'Pending']
                        .map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (_) {},
                  ),
                ],
              ),
              const SizedBox(height: 10),
              DataTable(
                headingRowHeight: 50,
                columnSpacing: 50,
                horizontalMargin: 30,
                columns: const [
                  DataColumn(
                    label: Text(
                      'Car',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Rental Date',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Duration',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Cost',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Status',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
                rows: rentalHistory
                    .map((rental) => DataRow(
                          cells: [
                            DataCell(
                              CircleAvatar(
                                backgroundImage: AssetImage(rental["carImage"]),
                                radius: 30,
                              ),
                            ),
                            DataCell(
                              Text(
                                rental["rentalDate"],
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.grey[700],
                                ),
                              ),
                            ),
                            DataCell(
                              Text(
                                rental["duration"],
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.grey[700],
                                ),
                              ),
                            ),
                            DataCell(
                              Text(
                                rental["cost"],
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.grey[700],
                                ),
                              ),
                            ),
                            DataCell(
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 6,
                                    horizontal: 16,
                                  ),
                                  decoration: BoxDecoration(
                                    color: rental["status"] == 'Completed'
                                        ? Colors.green.withOpacity(0.1)
                                        : Colors.red.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Text(
                                    rental["status"],
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: rental["status"] == 'Completed'
                                          ? Colors.green
                                          : Colors.red,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ))
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
