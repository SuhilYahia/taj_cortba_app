import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/data/taj_cortba_data.dart';
import '../../core/localization/language_provider.dart';
import '../../core/theme/app_colors.dart';
import '../../core/widgets/custom_app_drawer.dart';
import '../../core/widgets/floating_action_buttons.dart';

class SectorsScreen extends StatelessWidget {
  final LanguageProvider languageProvider;

  const SectorsScreen({super.key, required this.languageProvider});

  IconData _getSectorIcon(String iconName) {
    switch (iconName) {
      case 'account_balance':
        return Icons.account_balance;
      case 'corporate_fare':
        return Icons.corporate_fare;
      case 'factory':
        return Icons.factory;
      case 'local_hospital':
        return Icons.local_hospital;
      case 'school':
        return Icons.school;
      case 'menu_book':
        return Icons.menu_book;
      case 'hotel':
        return Icons.hotel;
      case 'storefront':
        return Icons.storefront;
      case 'apartment':
        return Icons.apartment;
      case 'account_balance_wallet':
        return Icons.account_balance_wallet;
      case 'flight':
        return Icons.flight;
      case 'sports_soccer':
        return Icons.sports_soccer;
      default:
        return Icons.domain;
    }
  }

  @override
  Widget build(BuildContext context) {
    final isAr = languageProvider.isArabic;
    final company = TajCortbaData.getCompany(isAr);
    final sectors = TajCortbaData.getSectors(isAr);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          isAr
              ? 'القطاعات المستفيدة (12 قطاعاً)'
              : 'Sectors We Serve (12 Sectors)',
        ),
        actions: [
          IconButton(
            tooltip: isAr ? 'English' : 'العربية',
            icon: const Icon(Icons.language, color: AppColors.secondary),
            onPressed: () => languageProvider.toggleLanguage(),
          ),
        ],
      ),
      drawer: CustomAppDrawer(
        company: company,
        isAr: isAr,
        onToggleLanguage: () => languageProvider.toggleLanguage(),
        onNavigate: (route) => context.go(route),
      ),
      floatingActionButton: FloatingActionButtons(
        phone: company.phone,
        whatsapp: company.whatsapp,
        isAr: isAr,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: sectors.length,
        separatorBuilder: (context, index) => const SizedBox(height: 14),
        itemBuilder: (context, index) {
          final sec = sectors[index];
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
              side: const BorderSide(color: AppColors.cardBorder),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: AppColors.primary.withValues(alpha: 0.08),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(
                          _getSectorIcon(sec.icon),
                          color: AppColors.primary,
                          size: 24,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          sec.title,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryDark,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    sec.description,
                    style: const TextStyle(
                      fontSize: 13,
                      color: AppColors.textBody,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Divider(color: AppColors.gray200, height: 1),
                  const SizedBox(height: 10),
                  ...sec.features.map(
                    (f) => Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.check_circle,
                            size: 14,
                            color: AppColors.success,
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              f,
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: AppColors.textPrimary,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Align(
                    alignment: AlignmentDirectional.centerEnd,
                    child: TextButton.icon(
                      icon: const Icon(Icons.request_quote_outlined, size: 16),
                      label: Text(
                        isAr
                            ? 'طلب عرض سعر لهذا القطاع'
                            : 'Request Sector Quote',
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: () => context.push('/contact'),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
