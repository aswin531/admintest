import 'package:admin_rent/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class ColorpickerFormfield extends FormField<Color> {
  ColorpickerFormfield({
    super.key,
    super.onSaved,
    Color super.initialValue = ExternalAppColors.white,
    String? labelText,
    TextEditingController? controller,
  }) : super(
          builder: (FormFieldState<Color> state) {
            return Column(
              children: [
                InkWell(
                  onTap: () {
                    showDialog(
                      context: state.context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text(labelText ?? 'Pick a Color'),
                          content: SingleChildScrollView(
                            child: ColorPicker(
                              pickerAreaBorderRadius: BorderRadius.circular(10),
                              displayThumbColor: true,
                              pickerColor: state.value!,
                              onColorChanged: (Color color) {
                                state.didChange(color);
                              },
                              //showLabel: true,
                              pickerAreaHeightPercent: 0.7,
                            ),
                          ),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text("OK"))
                          ],
                        );
                      },
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: state.value,
                      borderRadius: BorderRadius.circular(5.0),
                      border: Border.all(color: ExternalAppColors.iconGray),
                    ),
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(labelText ?? "Select a Color"),
                        const Icon(Icons.lens),
                      ],
                    ),
                  ),
                ),
                if (state.hasError)
                  Text(
                    state.errorText!,
                    style: const TextStyle(color: Colors.red, fontSize: 12.0),
                  )
              ],
            );
          },
        );
}
