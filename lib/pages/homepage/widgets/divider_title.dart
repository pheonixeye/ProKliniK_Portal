import 'package:flutter/material.dart';

class DividerTitle extends StatelessWidget {
  const DividerTitle({
    super.key,
    required this.title,
    this.subtitle,
  });
  final String title;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        const Divider(),
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 48,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle != null
            ? Text(
                subtitle!,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 14,
                ),
              )
            : const SizedBox(),
        const Divider(),
      ],
    );
  }
}
