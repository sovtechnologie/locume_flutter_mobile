import 'package:flutter/material.dart';

class AcceptCancelAnimatedCard extends StatefulWidget {
  const AcceptCancelAnimatedCard({super.key});

  @override
  State<AcceptCancelAnimatedCard> createState() =>
      _AcceptCancelAnimatedCardState();
}

class _AcceptCancelAnimatedCardState extends State<AcceptCancelAnimatedCard> {
  String? status; // 'accept', 'cancel', or null

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;

    return SizedBox(
      height: 40,
      child: Row(
        children: [
          // Accept Button
          AnimatedExpandedButton(
            text: status == 'accept' ? 'Accepted' : 'Accept',
            isVisible: status != 'cancel',
            isExpanded: status == 'accept',
            onTap: () {
              if (status == null) {
                setState(() {
                  status = 'accept';
                });
              }
            },
            color: primaryColor,
            borderRadius: BorderRadius.only(
              bottomLeft: const Radius.circular(15),
              bottomRight:
                  status == 'accept' ? const Radius.circular(15) : Radius.zero,
            ),
          ),
          if (status == null)
            const SizedBox(
              width: 1,
            ),

          // Cancel Button
          AnimatedExpandedButton(
            text: status == 'cancel' ? 'Canceled' : 'Cancel',
            isVisible: status != 'accept',
            isExpanded: status == 'cancel',
            onTap: () {
              if (status == null) {
                setState(() {
                  status = 'cancel';
                });
              }
            },
            color: primaryColor,
            borderRadius: BorderRadius.only(
              bottomRight: const Radius.circular(15),
              bottomLeft:
                  status == 'cancel' ? const Radius.circular(15) : Radius.zero,
            ),
          ),
        ],
      ),
    );
  }
}

class AnimatedExpandedButton extends StatelessWidget {
  final String text;
  final bool isVisible;
  final bool isExpanded;
  final VoidCallback onTap;
  final Color color;
  final BorderRadius borderRadius;

  const AnimatedExpandedButton({
    super.key,
    required this.text,
    required this.isVisible,
    required this.isExpanded,
    required this.onTap,
    required this.color,
    required this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      width: isExpanded
          ? MediaQuery.of(context).size.width - 60
          : isVisible
              ? MediaQuery.of(context).size.width / 2 - 30.6
              : 0,
      curve: Curves.easeInOut,
      child: isVisible || isExpanded
          ? Material(
              color: color,
              borderRadius: borderRadius,
              child: InkWell(
                onTap: onTap,
                borderRadius: borderRadius,
                child: SizedBox(
                  height: 40,
                  child: Center(
                    child: Text(
                      text,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            )
          : const SizedBox.shrink(),
    );
  }
}
