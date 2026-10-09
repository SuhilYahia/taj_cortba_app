import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../theme/app_colors.dart';

class FloatingActionButtons extends StatelessWidget {
  final String phone;
  final String whatsapp;
  final bool isAr;

  const FloatingActionButtons({
    super.key,
    required this.phone,
    required this.whatsapp,
    required this.isAr,
  });

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    final whatsappMessage = isAr
        ? 'السلام عليكم، أود الاستفسار عن خدمات شركة تاج قرطبة للتشغيل والصيانة.'
        : 'Hello, I would like to inquire about Taj Cortba Operation and Maintenance services.';

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        FloatingActionButton.small(
          heroTag: 'fab_whatsapp',
          backgroundColor: AppColors.whatsapp,
          foregroundColor: Colors.white,
          onPressed: () {
            final url =
                'https://wa.me/$whatsapp?text=${Uri.encodeComponent(whatsappMessage)}';
            _launchUrl(url);
          },
          tooltip: isAr ? 'واتساب' : 'WhatsApp',
          child: const Icon(Icons.chat, size: 20),
        ),
        const SizedBox(height: 10),
        FloatingActionButton.small(
          heroTag: 'fab_call',
          backgroundColor: AppColors.accent,
          foregroundColor: Colors.white,
          onPressed: () {
            _launchUrl('tel:$phone');
          },
          tooltip: isAr ? 'اتصال 24/7' : 'Call 24/7',
          child: const Icon(Icons.phone, size: 20),
        ),
      ],
    );
  }
}
