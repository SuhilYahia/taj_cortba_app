import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/data/taj_cortba_data.dart';
import '../../core/localization/language_provider.dart';
import '../../core/theme/app_colors.dart';
import '../../core/widgets/custom_app_drawer.dart';
import '../../core/widgets/floating_action_buttons.dart';
import '../../core/widgets/section_header.dart';

class AboutScreen extends StatelessWidget {
  final LanguageProvider languageProvider;

  const AboutScreen({super.key, required this.languageProvider});

  @override
  Widget build(BuildContext context) {
    final isAr = languageProvider.isArabic;
    final company = TajCortbaData.getCompany(isAr);
    final values = TajCortbaData.getValues(isAr);
    final stats = TajCortbaData.getStats(isAr);

    return Scaffold(
      appBar: AppBar(
        title: Text(isAr ? 'من نحن' : 'About Us'),
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Page Banner
            _buildPageHeader(isAr ? 'من نحن' : 'About Us', company.tagline),

            // Company Overview with Experience Badge
            Container(
              padding: const EdgeInsets.all(20),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      'assets/hero-landscaping.jpg',
                      height: 180,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Container(
                        height: 140,
                        color: AppColors.gray200,
                        child: const Icon(
                          Icons.business,
                          size: 48,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.secondary.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.workspace_premium,
                          color: AppColors.secondaryDark,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          '${company.experienceYears}+ ${isAr ? "عاماً من الريادة بالسوق السعودي" : "Years Leading in Saudi Market"}',
                          style: const TextStyle(
                            color: AppColors.secondaryDark,
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    company.fullName,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryDark,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    company.description,
                    style: const TextStyle(
                      fontSize: 13,
                      color: AppColors.textBody,
                      height: 1.6,
                    ),
                  ),
                ],
              ),
            ),

            // Vision & Mission Cards
            Container(
              padding: const EdgeInsets.all(20),
              color: AppColors.backgroundAlt,
              child: Column(
                children: [
                  _buildVisionMissionCard(
                    icon: Icons.lightbulb_outline,
                    title: isAr ? 'رؤيتنا' : 'Our Vision',
                    text: isAr
                        ? 'أن نكون الخيار الأول والشركة الأكثر موثوقية وريادة في قطاع التشغيل والصيانة وإدارة المرافق والخدمات المساندة بالمملكة، عبر تطبيق أرقى معايير الابتكار والاستدامة والمساهمة في تحقيق مستهدفات رؤية المملكة 2030.'
                        : 'To be the benchmark leader and most reliable enterprise in facility management and maintenance across the Kingdom by implementing cutting-edge innovation and supporting Saudi Vision 2030.',
                  ),
                  const SizedBox(height: 14),
                  _buildVisionMissionCard(
                    icon: Icons.track_changes,
                    title: isAr ? 'رسالتنا' : 'Our Mission',
                    text: isAr
                        ? 'تقديم خدمات تشغيل وصيانة وإدارة مرافق بمستوى قياسي يفوق توقعات شركائنا، بالاعتماد على الكفاءات الهندسية والتقنيات الحديثة، لضمان استمرارية تشغيل أصول ومرافق عملائنا بأعلى درجات الكفاءة والسلامة والأمان.'
                        : 'Delivering exceptional operation, maintenance, and facility management services that surpass client expectations through engineering prowess, modern technologies, and safety protocols.',
                  ),
                ],
              ),
            ),

            // Core Values
            Container(
              padding: const EdgeInsets.all(20),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SectionHeader(
                    subtitle: isAr ? 'قيمنا المؤسسية' : 'Core Values',
                    title: isAr
                        ? 'المبادئ التي تقود أعمالنا اليومية'
                        : 'Principles Driving Our Daily Work',
                  ),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: values.length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 10),
                    itemBuilder: (context, index) {
                      final val = values[index];
                      return Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: AppColors.background,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: AppColors.cardBorder),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(
                              Icons.check_circle,
                              color: AppColors.secondary,
                              size: 20,
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    val.title,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                      color: AppColors.primaryDark,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    val.description,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: AppColors.textBody,
                                      height: 1.4,
                                    ),
                                  ),
                                ],
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

            // Stats Counter
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
              color: AppColors.primaryDark,
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 1.8,
                ),
                itemCount: stats.length,
                itemBuilder: (context, index) {
                  final stat = stats[index];
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${stat.value}${stat.suffix}',
                        style: const TextStyle(
                          color: AppColors.secondary,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        stat.label,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPageHeader(String title, String subtitle) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      color: AppColors.primary,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            subtitle,
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.8),
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVisionMissionCard({
    required IconData icon,
    required String title,
    required String text,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.cardBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.08),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, color: AppColors.primary, size: 20),
              ),
              const SizedBox(width: 10),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryDark,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            text,
            style: const TextStyle(
              fontSize: 13,
              color: AppColors.textBody,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
