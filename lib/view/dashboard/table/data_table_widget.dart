import 'package:admin_rent/view/dashboard/widgets/predefined_car_list.dart';
import 'package:flutter/material.dart';

class DataTableWidget extends StatelessWidget {
  const DataTableWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DataTable(
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
            'Date',
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
      rows: rentalHistory // Here predefined USed change It
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
    );
  }
}
