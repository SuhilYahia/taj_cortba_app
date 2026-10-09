import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/data/taj_cortba_data.dart';
import '../../core/localization/language_provider.dart';
import '../../core/models/models.dart';
import '../../core/theme/app_colors.dart';
import '../../core/widgets/custom_app_drawer.dart';
import '../../core/widgets/floating_action_buttons.dart';
import '../../core/widgets/section_header.dart';

class ContactScreen extends StatefulWidget {
  final LanguageProvider languageProvider;

  const ContactScreen({super.key, required this.languageProvider});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  // Form Controllers
  final _quoteFormKey = GlobalKey<FormState>();
  final _contactFormKey = GlobalKey<FormState>();

  final _quoteNameController = TextEditingController();
  final _quotePhoneController = TextEditingController();
  final _quoteEmailController = TextEditingController();
  final _quoteCompanyController = TextEditingController();
  final _quoteDetailsController = TextEditingController();
  String _selectedServiceCategory = 'facility-management';

  final _contactNameController = TextEditingController();
  final _contactPhoneController = TextEditingController();
  final _contactEmailController = TextEditingController();
  final _contactSubjectController = TextEditingController();
  final _contactMessageController = TextEditingController();

  bool _isQuoteSubmitted = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _quoteNameController.dispose();
    _quotePhoneController.dispose();
    _quoteEmailController.dispose();
    _quoteCompanyController.dispose();
    _quoteDetailsController.dispose();
    _contactNameController.dispose();
    _contactPhoneController.dispose();
    _contactEmailController.dispose();
    _contactSubjectController.dispose();
    _contactMessageController.dispose();
    super.dispose();
  }

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isAr = widget.languageProvider.isArabic;
    final company = TajCortbaData.getCompany(isAr);
    final services = TajCortbaData.getServices(isAr);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          isAr ? 'اتصل بنا وطلب عرض سعر' : 'Contact Us & Request Quote',
        ),
        actions: [
          IconButton(
            tooltip: isAr ? 'English' : 'العربية',
            icon: const Icon(Icons.language, color: AppColors.secondary),
            onPressed: () => widget.languageProvider.toggleLanguage(),
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: AppColors.secondary,
          labelColor: AppColors.secondary,
          unselectedLabelColor: Colors.white70,
          labelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 13,
          ),
          tabs: [
            Tab(text: isAr ? 'طلب عرض سعر' : 'Request Quote'),
            Tab(text: isAr ? 'معلومات التواصل' : 'Contact Info'),
          ],
        ),
      ),
      drawer: CustomAppDrawer(
        company: company,
        isAr: isAr,
        onToggleLanguage: () => widget.languageProvider.toggleLanguage(),
        onNavigate: (route) => context.go(route),
      ),
      floatingActionButton: FloatingActionButtons(
        phone: company.phone,
        whatsapp: company.whatsapp,
        isAr: isAr,
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // Tab 1: Request Quote Form
          _buildQuoteForm(context, company, services, isAr),

          // Tab 2: Contact Information & Direct Message
          _buildContactInfoTab(context, company, isAr),
        ],
      ),
    );
  }

  Widget _buildQuoteForm(
    BuildContext context,
    CompanyInfo company,
    List<ServiceModel> services,
    bool isAr,
  ) {
    if (_isQuoteSubmitted) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.check_circle_outline,
                color: AppColors.success,
                size: 64,
              ),
              const SizedBox(height: 16),
              Text(
                isAr
                    ? 'تم استلام طلب عرض السعر بنجاح!'
                    : 'Quote Request Received Successfully!',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryDark,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                isAr
                    ? 'سيتواصل معك فريقنا الهندسي والتجاري خلال 24 ساعة بعرض فني ومالي مخصص.'
                    : 'Our engineering and sales team will contact you within 24 hours with a custom proposal.',
                textAlign: TextAlign.center,
                style: const TextStyle(color: AppColors.textBody, fontSize: 13),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () => setState(() => _isQuoteSubmitted = false),
                child: Text(isAr ? 'إرسال طلب آخر' : 'Submit Another Request'),
              ),
            ],
          ),
        ),
      );
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Form(
        key: _quoteFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionHeader(
              subtitle: isAr ? 'نموذج عرض السعر' : 'Quotation Form',
              title: isAr
                  ? 'اطلب عرض سعر مخصص لمنشأتك'
                  : 'Request a Custom Proposal',
              description: isAr
                  ? 'يرجى تعبئة الحقول وسيقوم مهندسونا بدراسة الاحتياج وتقديم عرض شامل.'
                  : 'Please complete the form and our technical team will formulate a full scope offer.',
            ),
            DropdownButtonFormField<String>(
              initialValue: _selectedServiceCategory,
              decoration: InputDecoration(
                labelText: isAr
                    ? 'اختر إحدى الخدمات المعتمدة'
                    : 'Select Service Category',
                prefixIcon: const Icon(Icons.category, color: AppColors.accent),
              ),
              items: services.map((s) {
                return DropdownMenuItem<String>(
                  value: s.id,
                  child: Text(
                    s.shortTitle,
                    style: const TextStyle(fontSize: 13),
                    overflow: TextOverflow.ellipsis,
                  ),
                );
              }).toList(),
              onChanged: (val) {
                if (val != null) setState(() => _selectedServiceCategory = val);
              },
            ),
            const SizedBox(height: 14),
            TextFormField(
              controller: _quoteNameController,
              decoration: InputDecoration(
                labelText: isAr ? 'الاسم الكريم' : 'Full Name',
                prefixIcon: const Icon(Icons.person, color: AppColors.accent),
              ),
              validator: (v) => (v == null || v.isEmpty)
                  ? (isAr ? 'الحقل مطلوب' : 'Required')
                  : null,
            ),
            const SizedBox(height: 14),
            TextFormField(
              controller: _quotePhoneController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: isAr ? 'رقم الجوال' : 'Phone Number',
                prefixIcon: const Icon(Icons.phone, color: AppColors.accent),
              ),
              validator: (v) => (v == null || v.isEmpty)
                  ? (isAr ? 'الحقل مطلوب' : 'Required')
                  : null,
            ),
            const SizedBox(height: 14),
            TextFormField(
              controller: _quoteEmailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: isAr ? 'البريد الإلكتروني' : 'Email Address',
                prefixIcon: const Icon(Icons.email, color: AppColors.accent),
              ),
            ),
            const SizedBox(height: 14),
            TextFormField(
              controller: _quoteCompanyController,
              decoration: InputDecoration(
                labelText: isAr
                    ? 'اسم المنشأة / الجهة'
                    : 'Company / Entity Name',
                prefixIcon: const Icon(Icons.business, color: AppColors.accent),
              ),
            ),
            const SizedBox(height: 14),
            TextFormField(
              controller: _quoteDetailsController,
              maxLines: 4,
              decoration: InputDecoration(
                labelText: isAr
                    ? 'تفاصيل المشروع ونطاق العمل المطلوب'
                    : 'Project Scope & Details',
                hintText: isAr
                    ? 'الموقع، المساحة، نوع الأنظمة، أو موعد بدء التشغيل...'
                    : 'Location, approximate size, requirements...',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                backgroundColor: AppColors.secondary,
                foregroundColor: AppColors.primaryDark,
              ),
              onPressed: () {
                if (_quoteFormKey.currentState?.validate() ?? false) {
                  setState(() => _isQuoteSubmitted = true);
                }
              },
              child: Text(
                isAr ? 'إرسال طلب عرض السعر' : 'Submit Quotation Request',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactInfoTab(
    BuildContext context,
    CompanyInfo company,
    bool isAr,
  ) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeader(
            subtitle: isAr ? 'معلومات التواصل' : 'Contact Channels',
            title: isAr
                ? 'قنوات الاتصال المباشرة'
                : 'Direct Communication Channels',
          ),
          _buildContactCard(
            icon: Icons.location_on,
            title: isAr ? 'المقر الرئيسي' : 'Headquarters',
            value: company.addressFull,
            actionLabel: isAr ? 'عرض الموقع' : 'View Location',
            onTap: () => _launchUrl(
              'https://maps.google.com/?q=${Uri.encodeComponent(company.addressFull)}',
            ),
          ),
          const SizedBox(height: 12),
          _buildContactCard(
            icon: Icons.phone_in_talk,
            title: isAr
                ? 'الهاتف الموحد وطوارئ 24/7'
                : 'Unified Phone & 24/7 Emergency',
            value: company.phoneDisplay,
            actionLabel: isAr ? 'اتصال الآن' : 'Call Now',
            onTap: () => _launchUrl('tel:${company.phone}'),
          ),
          const SizedBox(height: 12),
          _buildContactCard(
            icon: Icons.chat,
            title: isAr ? 'واتساب الأعمال' : 'Business WhatsApp',
            value: company.whatsappDisplay,
            actionLabel: isAr ? 'محادثة فورية' : 'Chat Now',
            iconColor: AppColors.whatsapp,
            onTap: () {
              final msg = isAr
                  ? 'السلام عليكم، أود التواصل معكم.'
                  : 'Hello, I would like to connect.';
              _launchUrl(
                'https://wa.me/${company.whatsapp}?text=${Uri.encodeComponent(msg)}',
              );
            },
          ),
          const SizedBox(height: 12),
          _buildContactCard(
            icon: Icons.email,
            title: isAr ? 'البريد الإلكتروني' : 'Email Address',
            value: company.email,
            actionLabel: isAr ? 'إرسال بريد' : 'Send Email',
            onTap: () => _launchUrl('mailto:${company.email}'),
          ),
          const SizedBox(height: 12),
          _buildContactCard(
            icon: Icons.access_time,
            title: isAr ? 'أوقات العمل' : 'Working Hours',
            value: company.workingHours,
          ),
          const SizedBox(height: 24),
          // Direct message form
          SectionHeader(
            subtitle: isAr ? 'رسالة سريعة' : 'Quick Message',
            title: isAr ? 'تواصل مع خدمة العملاء' : 'Contact Customer Care',
          ),
          Form(
            key: _contactFormKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _contactNameController,
                  decoration: InputDecoration(
                    labelText: isAr ? 'الاسم الكريم' : 'Full Name',
                  ),
                  validator: (v) => (v == null || v.isEmpty)
                      ? (isAr ? 'الحقل مطلوب' : 'Required')
                      : null,
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _contactPhoneController,
                  decoration: InputDecoration(
                    labelText: isAr ? 'رقم الهاتف' : 'Phone',
                  ),
                  validator: (v) => (v == null || v.isEmpty)
                      ? (isAr ? 'الحقل مطلوب' : 'Required')
                      : null,
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _contactSubjectController,
                  decoration: InputDecoration(
                    labelText: isAr ? 'الموضوع' : 'Subject',
                  ),
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _contactMessageController,
                  maxLines: 3,
                  decoration: InputDecoration(
                    labelText: isAr ? 'نص الرسالة' : 'Message',
                  ),
                  validator: (v) => (v == null || v.isEmpty)
                      ? (isAr ? 'الحقل مطلوب' : 'Required')
                      : null,
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 48),
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    if (_contactFormKey.currentState?.validate() ?? false) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            isAr
                                ? 'تم إرسال رسالتك بنجاح! سنتواصل معك قريباً.'
                                : 'Message sent successfully! We will connect soon.',
                          ),
                          backgroundColor: AppColors.success,
                        ),
                      );
                      _contactNameController.clear();
                      _contactPhoneController.clear();
                      _contactSubjectController.clear();
                      _contactMessageController.clear();
                    }
                  },
                  child: Text(isAr ? 'إرسال الرسالة' : 'Send Message'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactCard({
    required IconData icon,
    required String title,
    required String value,
    String? actionLabel,
    VoidCallback? onTap,
    Color? iconColor,
  }) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(color: AppColors.cardBorder),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: (iconColor ?? AppColors.primary).withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                icon,
                color: iconColor ?? AppColors.primary,
                size: 22,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppColors.textMuted,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    value,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryDark,
                    ),
                  ),
                ],
              ),
            ),
            if (actionLabel != null && onTap != null)
              TextButton(
                onPressed: onTap,
                child: Text(
                  actionLabel,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: AppColors.accent,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
