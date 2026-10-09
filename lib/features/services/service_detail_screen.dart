import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/data/taj_cortba_data.dart';
import '../../core/localization/language_provider.dart';
import '../../core/theme/app_colors.dart';
import '../../core/widgets/floating_action_buttons.dart';

class ServiceDetailScreen extends StatelessWidget {
  final String serviceId;
  final LanguageProvider languageProvider;

  const ServiceDetailScreen({
    super.key,
    required this.serviceId,
    required this.languageProvider,
  });

  IconData _getIconData(String iconName) {
    switch (iconName) {
      case 'business':
        return Icons.domain;
      case 'electrical_services':
        return Icons.electrical_services;
      case 'park':
        return Icons.yard;
      case 'local_shipping':
        return Icons.local_shipping;
      case 'water_drop':
        return Icons.water_drop;
      case 'settings_input_component':
        return Icons.settings_input_component;
      case 'cleaning_services':
        return Icons.cleaning_services;
      case 'build':
        return Icons.build;
      case 'pool':
        return Icons.pool;
      case 'warning':
        return Icons.warning_amber_rounded;
      case 'assignment':
        return Icons.assignment;
      default:
        return Icons.miscellaneous_services;
    }
  }

  @override
  Widget build(BuildContext context) {
    final isAr = languageProvider.isArabic;
    final company = TajCortbaData.getCompany(isAr);
    final allServices = TajCortbaData.getServices(isAr);

    final service = allServices.firstWhere(
      (s) => s.id == serviceId,
      orElse: () => allServices.first,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(service.shortTitle),
        actions: [
          IconButton(
            tooltip: isAr ? 'طلب عرض سعر' : 'Request Quote',
            icon: const Icon(Icons.request_quote_outlined),
            onPressed: () => context.push('/contact'),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButtons(
        phone: company.phone,
        whatsapp: company.whatsapp,
        isAr: isAr,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Top Header Card with Service Number & Icon
            Container(
              padding: const EdgeInsets.all(24),
              color: AppColors.primary,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.secondary,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          '${isAr ? "فئة معتمدة رقم" : "Approved Category"} ${service.number}',
                          style: const TextStyle(
                            color: AppColors.primaryDark,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      Container(
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                          color: Colors.white12,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(
                          _getIconData(service.icon),
                          color: AppColors.secondary,
                          size: 24,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    service.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      height: 1.3,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    service.description,
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.85),
                      fontSize: 13,
                      height: 1.6,
                    ),
                  ),
                ],
              ),
            ),

            // Scope & All Sub-services List
            Container(
              padding: const EdgeInsets.all(20),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.checklist,
                        color: AppColors.secondary,
                        size: 22,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        isAr
                            ? 'المهام ونطاق العمل المعتمد (${service.subServices.length} مهام)'
                            : 'Approved Scope of Work (${service.subServices.length} items)',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryDark,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: service.subServices.length,
                    separatorBuilder: (context, index) =>
                        const Divider(color: AppColors.gray100, height: 12),
                    itemBuilder: (context, index) {
                      final item = service.subServices[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(top: 2),
                              padding: const EdgeInsets.all(2),
                              decoration: const BoxDecoration(
                                color: AppColors.successLight,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.check,
                                size: 14,
                                color: AppColors.success,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                item,
                                style: const TextStyle(
                                  fontSize: 13,
                                  color: AppColors.textPrimary,
                                  height: 1.4,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),

            // Call to action button
            Container(
              padding: const EdgeInsets.all(20),
              color: AppColors.backgroundAlt,
              child: Column(
                children: [
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.secondary,
                      foregroundColor: AppColors.primaryDark,
                      minimumSize: const Size(double.infinity, 48),
                    ),
                    icon: const Icon(Icons.request_quote),
                    label: Text(
                      isAr
                          ? 'طلب عرض سعر لهذه الخدمة'
                          : 'Request Quotation for this Service',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    onPressed: () => context.push('/contact'),
                  ),
                  const SizedBox(height: 10),
                  OutlinedButton.icon(
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppColors.primary,
                      side: const BorderSide(color: AppColors.primary),
                      minimumSize: const Size(double.infinity, 48),
                    ),
                    icon: const Icon(Icons.arrow_back),
                    label: Text(
                      isAr ? 'العودة لدليل الخدمات' : 'Back to Services',
                    ),
                    onPressed: () => context.pop(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
