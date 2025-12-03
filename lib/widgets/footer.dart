import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.grey[50],
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _FooterHeading('(Term Time)'),
          const SizedBox(height: 4),
          _FooterText('Monday - Friday 10am - 4pm'),
          const SizedBox(height: 12),
          _FooterHeading('(Outside of Term Time / Consolidation Weeks)'),
          const SizedBox(height: 4),
          _FooterText('Monday - Friday 10am - 3pm'),
          const SizedBox(height: 12),
          _FooterText('Purchase online 24/7'),
        ],
      ),
    );
  }
}

class _FooterHeading extends StatelessWidget {
  final String text;
  const _FooterHeading(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}

class _FooterText extends StatelessWidget {
  final String text;
  const _FooterText(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(color: Colors.black, fontSize: 14),
    );
  }
}
