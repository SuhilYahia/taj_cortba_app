import 'package:flutter/material.dart';

import '../../core/localization/language_provider.dart';
import '../../core/theme/app_colors.dart';
import '../../core/widgets/custom_app_drawer.dart';
import '../../core/widgets/floating_action_buttons.dart';
import '../../core/data/taj_cortba_data.dart';

import 'package:go_router/go_router.dart';

class PrivacyScreen extends StatelessWidget {
  final LanguageProvider languageProvider;

  const PrivacyScreen({super.key, required this.languageProvider});

  @override
  Widget build(BuildContext context) {
    final isAr = languageProvider.isArabic;
    final company = TajCortbaData.getCompany(isAr);

    return Scaffold(
      appBar: AppBar(
        title: Text(isAr ? 'سياسة الخصوصية والشروط' : 'Privacy Policy & Terms'),
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
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              isAr
                  ? 'سياسة الخصوصية وسرية المعلومات'
                  : 'Privacy & Confidentiality Policy',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryDark,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              isAr
                  ? 'تلتزم شركة تاج قرطبة للتشغيل والصيانة بحماية خصوصية وأمان بيانات عملائها وشركائها، وتطبيق أعلى المعايير النظامية والأمنية لحفظ وتشفير المعلومات.'
                  : 'Taj Cortba Operation and Maintenance Company commits to safeguarding the privacy and security of client data under stringent Saudi regulatory frameworks.',
              style: const TextStyle(
                fontSize: 13,
                color: AppColors.textBody,
                height: 1.6,
              ),
            ),
            const SizedBox(height: 20),
            _buildSection(
              title: isAr
                  ? '1. جمع البيانات واستخدامها'
                  : '1. Data Collection & Use',
              content: isAr
                  ? 'نجمع البيانات المحددة عبر نماذج طلب عروض الأسعار والتواصل (مثل الاسم، المنشأة، الهاتف، البريد) حصراً لتقديم العروض التشغيلية والخدمات الفنية المطلوبة.'
                  : 'We collect relevant data provided in quotation forms solely for processing operational requirements and client inquiries.',
            ),
            const SizedBox(height: 16),
            _buildSection(
              title: isAr
                  ? '2. اتفاقيات السرية والعمليات الميدانية'
                  : '2. Site Confidentiality & NDA',
              content: isAr
                  ? 'تخضع كافة أعمال التشغيل والصيانة في المواقع الحكومية والخاصة لاتفاقيات عدم إفصاح صارمة تضمن سلامة أسرار المنشآت وحرمة المرافق.'
                  : 'All operational activities conducted at client sites adhere to strict non-disclosure obligations safeguarding facility security.',
            ),
            const SizedBox(height: 16),
            _buildSection(
              title: isAr
                  ? '3. معايير السلامة المهنية والامتثال'
                  : '3. Safety Standards & Compliance',
              content: isAr
                  ? 'تلتزم فرق العمل بلوائح السلامة المهنية والبيئية المعتمدة في المملكة العربية السعودية لضمان بيئة عمل آمنة ومستدامة.'
                  : 'Our technicians strictly implement occupational safety and environmental regulations active in the Kingdom of Saudi Arabia.',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection({required String title, required String content}) {
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
          Text(
            title,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            content,
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
