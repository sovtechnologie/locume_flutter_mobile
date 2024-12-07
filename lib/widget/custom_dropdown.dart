import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:locume/Theme/theme.dart';
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
                          return CustomCheckboxListTile(
                            title: option,
                            value: widget.selectedValues.contains(option),
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
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}

class CustomCheckboxListTile extends StatelessWidget {
  final String title;
  final bool value;
  final ValueChanged<bool?> onChanged;

  const CustomCheckboxListTile({
    Key? key,
    required this.title,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
        value: value,
        onChanged: onChanged,
        activeColor: textColor,
        checkColor: Colors.white, // Check mark color
        side: MaterialStateBorderSide.resolveWith(
          (states) {
            if (states.contains(MaterialState.selected)) {
              return BorderSide(color: textColor);
            }
            return BorderSide(color: textColor); // Border color when unchecked
          },
        ),
      ),
      title: Text(
        title,
        style: TextStyle(color: textColor),
      ),
      onTap: () {
        onChanged(!value);
      },
    );
  }
}

class SingleSelectionDropdown extends StatefulWidget {
  final String heading;
  final List<String> options;
  final String selectedValue;
  final TextEditingController controller;
  final void Function(String?)? onChanged;

  const SingleSelectionDropdown({
    Key? key,
    required this.heading,
    required this.options,
    required this.selectedValue,
    required this.controller,
    this.onChanged,
  }) : super(key: key);

  @override
  _SingleSelectionDropdownState createState() =>
      _SingleSelectionDropdownState();
}

class _SingleSelectionDropdownState extends State<SingleSelectionDropdown> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
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
                      suffixIcon: const Icon(
                        Icons.arrow_drop_down,
                        color: Color.fromARGB(255, 3, 61, 109),
                      ),
                    ),
                  ),
                ),
                if (_isExpanded)
                  Container(
                    height: 150,
                    child: SingleChildScrollView(
                      child: Column(
                        children: widget.options.map((option) {
                          return ListTile(
                            minTileHeight: 18,
                            title: Text(
                              option,
                              style: TextStyle(color: textColor),
                            ),
                            onTap: () {
                              setState(() {
                                widget.controller.text = option;
                                widget.onChanged?.call(option);
                                _isExpanded =
                                    false; // Collapse dropdown after selection
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
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}
