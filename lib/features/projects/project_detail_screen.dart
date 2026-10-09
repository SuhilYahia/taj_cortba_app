import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:go_router/go_router.dart';

import '../../core/data/taj_cortba_data.dart';
import '../../core/localization/language_provider.dart';
import '../../core/theme/app_colors.dart';
import '../../core/widgets/floating_action_buttons.dart';

class ProjectDetailScreen extends StatelessWidget {
  final int projectId;
  final LanguageProvider languageProvider;

  const ProjectDetailScreen({
    super.key,
    required this.projectId,
    required this.languageProvider,
  });

  @override
  Widget build(BuildContext context) {
    final isAr = languageProvider.isArabic;
    final company = TajCortbaData.getCompany(isAr);
    final allProjects = TajCortbaData.getProjects(isAr);

    final project = allProjects.firstWhere(
      (p) => p.id == projectId,
      orElse: () => allProjects.first,
    );

    final isLocalAsset = project.image.startsWith('assets/');

    return Scaffold(
      appBar: AppBar(
        title: Text(project.title),
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
            // Image
            SizedBox(
              height: 240,
              width: double.infinity,
              child: isLocalAsset
                  ? Image.asset(
                      project.image,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Container(
                        color: AppColors.gray200,
                        child: const Icon(
                          Icons.image,
                          size: 48,
                          color: AppColors.gray400,
                        ),
                      ),
                    )
                  : CachedNetworkImage(
                      imageUrl: project.image,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => Container(
                        color: AppColors.gray100,
                        child: const Center(
                          child: CircularProgressIndicator(strokeWidth: 2),
                        ),
                      ),
                      errorWidget: (context, url, error) => Container(
                        color: AppColors.gray200,
                        child: const Icon(
                          Icons.image_not_supported,
                          color: AppColors.gray400,
                        ),
                      ),
                    ),
            ),

            // Metadata card
            Container(
              padding: const EdgeInsets.all(20),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.secondary.withValues(alpha: 0.15),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          project.type,
                          style: const TextStyle(
                            color: AppColors.secondaryDark,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          const Icon(
                            Icons.location_on,
                            size: 14,
                            color: AppColors.accent,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            project.location,
                            style: const TextStyle(
                              color: AppColors.accent,
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 12),
                      Row(
                        children: [
                          const Icon(
                            Icons.calendar_today,
                            size: 14,
                            color: AppColors.textMuted,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '${project.year}',
                            style: const TextStyle(
                              color: AppColors.textMuted,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    project.title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryDark,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    project.description,
                    style: const TextStyle(
                      fontSize: 13,
                      color: AppColors.textBody,
                      height: 1.6,
                    ),
                  ),
                ],
              ),
            ),

            // Scope executed
            Container(
              padding: const EdgeInsets.all(20),
              color: AppColors.backgroundAlt,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    isAr
                        ? 'نطاق الأعمال المنجزة في المشروع'
                        : 'Executed Project Scope',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryDark,
                    ),
                  ),
                  const SizedBox(height: 12),
                  ...project.scope.map(
                    (item) => Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.check_circle,
                            color: AppColors.success,
                            size: 18,
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              item,
                              style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: AppColors.textPrimary,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: Colors.white,
                      minimumSize: const Size(double.infinity, 48),
                    ),
                    onPressed: () => context.push('/contact'),
                    child: Text(
                      isAr
                          ? 'طلب عرض سعر لمشروع مماثل'
                          : 'Request Quote for Similar Project',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
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
