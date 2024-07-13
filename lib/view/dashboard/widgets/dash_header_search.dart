import 'package:admin_rent/style/colors.dart';
import 'package:admin_rent/utils/primary_text.dart';
import 'package:flutter/material.dart';

class DashHeaderWidget extends StatelessWidget {
  const DashHeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PrimaryText(
                text: "DashBoard",
                size: 25.0,
                fontWeight: FontWeight.w800,
              ),
              PrimaryText(
                text: "Everything you need...",
                size: 16.0,
                color: ExternalAppColors.secondary,
              )
            ],
          ),
        ),
        const Spacer(
          flex: 1,
        ),
        Expanded(
            flex: 1,
            child: TextFormField(
              decoration: InputDecoration(
                  filled: true,
                  contentPadding: const EdgeInsets.only(left: 40.0, right: 5.0),
                  fillColor: ExternalAppColors.white,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide:
                          const BorderSide(color: ExternalAppColors.white)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide:
                          const BorderSide(color: ExternalAppColors.white)),
                  prefixIcon: const Icon(
                    Icons.search,
                    color: ExternalAppColors.black,
                  ),
                  hintText: "Search",
                  hintStyle: const TextStyle(
                      color: ExternalAppColors.secondary, fontSize: 14.0)),
            ))
      ],
    );
  }
}
