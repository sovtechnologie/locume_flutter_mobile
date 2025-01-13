import 'package:flutter/material.dart';

class CustomizableField extends StatelessWidget {
  final String heading;
  final String hintText;
  final Widget? suffixText; // Allows dynamic content
  final VoidCallback? onSuffixTap;
  final TextEditingController controller;
  final TextInputType keyboardType; // New required parameter for keyboard type
  final int? numbnerlenght;

  const CustomizableField(
      {Key? key,
      required this.heading,
      required this.hintText,
      required this.controller,
      required this.keyboardType, // Required keyboard type
      this.suffixText,
      this.onSuffixTap,
      this.numbnerlenght})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Text(
            heading,
            style: const TextStyle(
              color: Color.fromARGB(255, 3, 61, 109),
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: TextFormField(
            maxLength: numbnerlenght != 0 ? numbnerlenght : 10,
            controller: controller,
            keyboardType: keyboardType, // Customizable keyboard type
            decoration: InputDecoration(
              hintText: hintText,
              fillColor: const Color.fromRGBO(248, 247, 247, 1),
              filled: true,
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Color.fromRGBO(220, 215, 215, 1),
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Color.fromRGBO(0, 116, 217, 1),
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              contentPadding: const EdgeInsets.symmetric(
                vertical: 0,
                horizontal: 16,
              ),
              suffixIcon: suffixText != null
                  ? Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 13,
                        horizontal: 13,
                      ),
                      child: InkWell(
                        onTap: onSuffixTap,
                        child: suffixText,
                      ),
                    )
                  : null,
            ),
          ),
        ),
      ],
    );
  }
}
