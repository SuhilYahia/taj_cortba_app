import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/models.dart';
import '../theme/app_colors.dart';

class CustomAppDrawer extends StatelessWidget {
  final CompanyInfo company;
  final bool isAr;
  final VoidCallback onToggleLanguage;
  final Function(String route) onNavigate;

  const CustomAppDrawer({
    super.key,
    required this.company,
    required this.isAr,
    required this.onToggleLanguage,
    required this.onNavigate,
  });

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.primaryDark,
      child: SafeArea(
        child: Column(
          children: [
            // Drawer Header with Taj Cortba Logo & info
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
              decoration: const BoxDecoration(
                border: Border(bottom: BorderSide(color: Color(0x22FFFFFF))),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        'assets/logo/logo-light.webp',
                        height: 48,
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) =>
                            const Text(
                              'تاج قرطبة',
                              style: TextStyle(
                                color: AppColors.secondary,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.close, color: Colors.white70),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    company.fullName,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    company.tagline,
                    style: const TextStyle(
                      color: AppColors.secondaryLight,
                      fontSize: 12,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),

            // Navigation Links
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(vertical: 12),
                children: [
                  _drawerItem(
                    icon: Icons.home_outlined,
                    title: isAr ? 'الرئيسية' : 'Home',
                    onTap: () {
                      Navigator.pop(context);
                      onNavigate('/');
                    },
                  ),
                  _drawerItem(
                    icon: Icons.info_outline,
                    title: isAr ? 'من نحن' : 'About Us',
                    onTap: () {
                      Navigator.pop(context);
                      onNavigate('/about');
                    },
                  ),
                  _drawerItem(
                    icon: Icons.business_center_outlined,
                    title: isAr
                        ? 'خدماتنا المعتمدة (11 فئة)'
                        : 'Our Services (11 Categories)',
                    onTap: () {
                      Navigator.pop(context);
                      onNavigate('/services');
                    },
                  ),
                  _drawerItem(
                    icon: Icons.engineering_outlined,
                    title: isAr ? 'مشاريعنا وإنجازاتنا' : 'Our Projects',
                    onTap: () {
                      Navigator.pop(context);
                      onNavigate('/projects');
                    },
                  ),
                  _drawerItem(
                    icon: Icons.pie_chart_outline,
                    title: isAr ? 'القطاعات المستفيدة' : 'Sectors We Serve',
                    onTap: () {
                      Navigator.pop(context);
                      onNavigate('/sectors');
                    },
                  ),
                  _drawerItem(
                    icon: Icons.quiz_outlined,
                    title: isAr ? 'الأسئلة الشائعة' : 'FAQ',
                    onTap: () {
                      Navigator.pop(context);
                      onNavigate('/faq');
                    },
                  ),
                  _drawerItem(
                    icon: Icons.contact_phone_outlined,
                    title: isAr
                        ? 'اتصل بنا وطلب عرض سعر'
                        : 'Contact Us & Quote',
                    onTap: () {
                      Navigator.pop(context);
                      onNavigate('/contact');
                    },
                  ),
                  _drawerItem(
                    icon: Icons.privacy_tip_outlined,
                    title: isAr ? 'سياسة الخصوصية والشروط' : 'Privacy & Terms',
                    onTap: () {
                      Navigator.pop(context);
                      onNavigate('/privacy');
                    },
                  ),
                ],
              ),
            ),

            // Bottom drawer footer: Language Switcher & Direct contact
            Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                border: Border(top: BorderSide(color: Color(0x22FFFFFF))),
              ),
              child: Column(
                children: [
                  // Language Switcher button
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF143E69),
                      foregroundColor: Colors.white,
                      minimumSize: const Size(double.infinity, 44),
                    ),
                    icon: const Icon(Icons.language, size: 18),
                    label: Text(
                      isAr ? 'English Language' : 'اللغة العربية',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    onPressed: onToggleLanguage,
                  ),
                  const SizedBox(height: 10),
                  // Emergency Call Button
                  OutlinedButton.icon(
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppColors.secondary,
                      side: const BorderSide(color: AppColors.secondary),
                      minimumSize: const Size(double.infinity, 44),
                    ),
                    icon: const Icon(Icons.phone_in_talk, size: 18),
                    label: Text(
                      '${isAr ? "طوارئ 24/7" : "Emergency 24/7"}: ${company.phoneDisplay}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    onPressed: () => _launchUrl('tel:${company.phone}'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _drawerItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: AppColors.secondaryLight, size: 22),
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        color: Colors.white30,
        size: 12,
      ),
      onTap: onTap,
    );
  }
}
