import 'package:flutter/material.dart';

import 'package:kartal/kartal.dart';

class DropdownButtonWidget extends StatelessWidget {
  final String initialValue;
  final Function? onChange;
  final List<String> options;
  final String? title;
  final double? height;
  final double? width;
  final Color? backgroundColor;
  final double? borderRadius;
  const DropdownButtonWidget(
      {this.title,
      required this.initialValue,
      required this.options,
      this.onChange,
      this.height = 0.055,
      this.width = 0.88,
      this.backgroundColor = Colors.grey,
      this.borderRadius = 0.04});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingLow,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          title != null
              ? Text(
                  title!,
                )
              : const SizedBox(
                  width: 0,
                ),
          Padding(
            padding: EdgeInsets.only(
              top: context.dynamicHeight(0.01),
            ),
            child: Container(
              width: context.dynamicWidth(width!),
              height: context.dynamicHeight(height!),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  isExpanded: true,
                  value: initialValue,
                  onChanged: (String? newValue) {},
                  icon: const Icon(Icons.keyboard_arrow_down),
                  items: options.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Padding(
                        padding: EdgeInsets.only(left: context.dynamicWidth(0.03)),
                        child: Text(
                          value,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              decoration: BoxDecoration(
                color: backgroundColor!,
                borderRadius: BorderRadius.all(Radius.circular(context.dynamicHeight(borderRadius!))),
              ),
            ),
          )
        ],
      ),
    );
  }
}
