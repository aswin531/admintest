import 'package:admin_rent/config/responsive.dart';
import 'package:admin_rent/style/colors.dart';
import 'package:admin_rent/view/dashboard/table/data_table_widget.dart';
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
                  const Text(
                    'Car Status',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  DropdownButton<String>(
                    hint: const Text("Filter"),
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
              const DataTableWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

