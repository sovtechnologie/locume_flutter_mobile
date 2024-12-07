import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:locume/app/screen/login/signup/controller/login_controller.dart';

class CustomDropdown extends StatefulWidget {
  final String heading;
  final List<String> options;
  final List<String> selectedValues;
  final TextEditingController controller;

  const CustomDropdown({
    Key? key,
    required this.heading,
    required this.options,
    required this.selectedValues,
    required this.controller,
  }) : super(key: key);

  @override
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final LoginController loginController = Get.find<LoginController>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          child: Text(
            widget.heading,
            style: const TextStyle(
              color: Color.fromARGB(255, 3, 61, 109),
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              _isExpanded = !_isExpanded;
            });
          },
          child: Container(
            decoration: BoxDecoration(
              color: const Color.fromRGBO(248, 247, 247, 1),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: const Color.fromRGBO(220, 215, 215, 1),
              ),
            ),
            child: Column(
              children: [
                AbsorbPointer(
                  child: TextFormField(
                    controller: widget.controller,
                    decoration: InputDecoration(
                      hintText: widget.heading,
                      fillColor: const Color.fromRGBO(248, 247, 247, 1),
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 0,
                        horizontal: 16,
                      ),
                      suffixIcon: const Icon(Icons.arrow_drop_down),
                    ),
                  ),
                ),
                if (_isExpanded)
                  Container(
                    height: 250,
                    child: SingleChildScrollView(
                      child: Column(
                        children: widget.options.map((option) {
                          return CheckboxListTile(
                            value: widget.selectedValues.contains(option),
                            title: Text(option),
                            controlAffinity: ListTileControlAffinity.leading,
                            onChanged: (isChecked) {
                              setState(() {
                                if (isChecked ?? false) {
                                  widget.selectedValues.add(option);
                                } else {
                                  widget.selectedValues.remove(option);
                                }
                                widget.controller.text =
                                    widget.selectedValues.join(', ');

                                // Update the selected shift IDs in the controller
                                loginController.updateSelectedShiftIds();
                              });
                            },
                          );
                        }).toList(),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
