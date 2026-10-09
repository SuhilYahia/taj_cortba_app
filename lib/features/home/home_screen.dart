import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/data/taj_cortba_data.dart';
import '../../core/localization/language_provider.dart';
import '../../core/models/models.dart';
import '../../core/theme/app_colors.dart';
import '../../core/widgets/custom_app_drawer.dart';
import '../../core/widgets/floating_action_buttons.dart';
import '../../core/widgets/project_card_widget.dart';
import '../../core/widgets/section_header.dart';
import '../../core/widgets/service_card_widget.dart';

class HomeScreen extends StatelessWidget {
  final LanguageProvider languageProvider;

  const HomeScreen({super.key, required this.languageProvider});

  @override
  Widget build(BuildContext context) {
    final isAr = languageProvider.isArabic;
    final company = TajCortbaData.getCompany(isAr);
    final services = TajCortbaData.getServices(isAr);
    final projects = TajCortbaData.getProjects(isAr);
    final sectors = TajCortbaData.getSectors(isAr);
    final whyUs = TajCortbaData.getWhyUs(isAr);
    final stats = TajCortbaData.getStats(isAr);
    final partners = TajCortbaData.getPartners(isAr);
    final testimonials = TajCortbaData.getTestimonials(isAr);

    // Top 6 services and top 3 projects for the home page
    final featuredServices = services.take(6).toList();
    final featuredProjects = projects.take(3).toList();

    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/logo/logo-light.webp',
          height: 38,
          fit: BoxFit.contain,
          errorBuilder: (context, error, stackTrace) => Text(
            company.name,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ),
        actions: [
          IconButton(
            tooltip: isAr ? 'English' : 'العربية',
            icon: const Icon(Icons.language, color: AppColors.secondary),
            onPressed: () => languageProvider.toggleLanguage(),
          ),
          IconButton(
            tooltip: isAr ? 'طلب عرض سعر' : 'Request Quote',
            icon: const Icon(Icons.request_quote_outlined),
            onPressed: () => context.push('/contact'),
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
            // Top Emergency Banner
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              color: AppColors.primaryLight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.access_time_filled,
                    size: 14,
                    color: AppColors.secondary,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    isAr
                        ? 'طوارئ ودعم فني على مدار الساعة 24/7'
                        : 'Emergency & 24/7 Rapid Response',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),

            // Hero Section
            _buildHeroSection(context, company, isAr),

            // Company Overview / About Teaser
            _buildAboutTeaser(context, company, isAr),

            // Featured Services Section (Approved 11 categories)
            _buildServicesSection(context, featuredServices, isAr),

            // Why Choose Us
            _buildWhyUsSection(context, whyUs, isAr),

            // Featured Projects
            _buildProjectsSection(context, featuredProjects, isAr),

            // Sectors Preview
            _buildSectorsPreview(context, sectors, isAr),

            // Stats Counter
            _buildStatsSection(context, stats, isAr),

            // Partners / Clients
            _buildPartnersSection(context, partners, isAr),

            // Testimonials
            _buildTestimonialsSection(context, testimonials, isAr),

            // Call to Action Banner
            _buildCtaBanner(context, company, isAr),

            // Mobile-Friendly Footer
            _buildFooter(context, company, isAr),
          ],
        ),
      ),
    );
  }

  // Hero Section
  Widget _buildHeroSection(
    BuildContext context,
    CompanyInfo company,
    bool isAr,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 32),
      decoration: const BoxDecoration(
        color: AppColors.primary,
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [AppColors.primary, AppColors.primaryDark],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: AppColors.secondary.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: AppColors.secondary.withValues(alpha: 0.5),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.verified,
                  size: 14,
                  color: AppColors.secondary,
                ),
                const SizedBox(width: 6),
                Text(
                  isAr
                      ? 'معايير الجودة والتميز التشغيلي'
                      : 'Excellence in Operation & Maintenance',
                  style: const TextStyle(
                    color: AppColors.secondaryLight,
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Text(
            isAr
                ? 'شريككم الاستراتيجي في التشغيل والصيانة وإدارة المرافق'
                : 'Your Strategic Partner in Total Facility Management',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
              height: 1.3,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            company.shortDescription,
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.85),
              fontSize: 13,
              height: 1.6,
            ),
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              Expanded(
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.secondary,
                    foregroundColor: AppColors.primaryDark,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  icon: const Icon(Icons.request_quote, size: 18),
                  label: Text(
                    isAr ? 'طلب عرض سعر' : 'Request Quote',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  ),
                  onPressed: () => context.push('/contact'),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: OutlinedButton.icon(
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.white,
                    side: const BorderSide(color: Colors.white70),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  icon: const Icon(Icons.grid_view, size: 18),
                  label: Text(
                    isAr ? 'استكشف الخدمات' : 'Explore Services',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  ),
                  onPressed: () => context.push('/services'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // About Teaser
  Widget _buildAboutTeaser(
    BuildContext context,
    CompanyInfo company,
    bool isAr,
  ) {
    return Container(
      padding: const EdgeInsets.all(20),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SectionHeader(
                      subtitle: isAr ? 'نبذة عن الشركة' : 'Company Overview',
                      title: isAr
                          ? 'خبرة راسخة والتزام بأعلى معايير الجودة'
                          : 'Deep Expertise & Highest Quality',
                    ),
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
            ],
          ),
          const SizedBox(height: 16),
          // 4 key pillars
          _buildCheckItem(
            isAr
                ? 'كوادر هندسية وفنية متخصصة ومؤهلة'
                : 'Certified Engineers & Specialist Technicians',
          ),
          _buildCheckItem(
            isAr
                ? 'جاهزية واستجابة طارئة على مدار 24/7'
                : '24/7 Emergency Readiness & Mobile Units',
          ),
          _buildCheckItem(
            isAr
                ? 'التزام صارم باتفاقيات مستوى الخدمة (SLA)'
                : 'Strict Service Level Agreement (SLA) Compliance',
          ),
          _buildCheckItem(
            isAr
                ? 'أسطول متكامل وتجهيزات هيدروليكية حديثة'
                : 'Modern Tanker Fleet & Pumping Machinery',
          ),
          const SizedBox(height: 16),
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              foregroundColor: AppColors.primary,
              side: const BorderSide(color: AppColors.primary),
            ),
            onPressed: () => context.push('/about'),
            child: Text(isAr ? 'المزيد عن تاج قرطبة' : 'More About Taj Cortba'),
          ),
        ],
      ),
    );
  }

  Widget _buildCheckItem(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.check_circle, color: AppColors.success, size: 16),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Services Section
  Widget _buildServicesSection(
    BuildContext context,
    List<ServiceModel> services,
    bool isAr,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 28),
      color: AppColors.backgroundAlt,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeader(
            subtitle: isAr ? 'خدماتنا المعتمدة' : 'Approved Services',
            title: isAr
                ? 'منظومة متكاملة من 11 فئة تشغيلية وفنية'
                : 'Integrated Portfolio of 11 O&M Categories',
            description: isAr
                ? 'حلول معتمدة لإدارة المرافق، الصيانة الكهربائية، رعاية المسطحات الخضراء، توريد المياه، وصيانة المسابح.'
                : 'Certified solutions for total facilities, electrical grids, green irrigation, water logistics, and pool systems.',
          ),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: services.length,
            separatorBuilder: (context, index) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              final service = services[index];
              return ServiceCardWidget(
                service: service,
                onTap: () => context.push('/services/${service.id}'),
              );
            },
          ),
          const SizedBox(height: 18),
          Center(
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
              ),
              icon: const Icon(Icons.list_alt, size: 18),
              label: Text(
                isAr
                    ? 'استكشف كافة الفئات والخدمات الـ 11 المعتمدة'
                    : 'Explore All 11 Approved Service Categories',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
              onPressed: () => context.push('/services'),
            ),
          ),
        ],
      ),
    );
  }

  // Why Us Section
  Widget _buildWhyUsSection(
    BuildContext context,
    List<ValueModel> whyUs,
    bool isAr,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 28),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeader(
            subtitle: isAr ? 'لماذا تاج قرطبة' : 'Why Taj Cortba',
            title: isAr
                ? 'معايير التميز الهندسي والتشغيلي'
                : 'Standards of Operational Excellence',
            description: isAr
                ? 'نرتكز على أسس راسخة من الكفاءة والجودة والالتزام بأعلى مستويات الخدمة المعتمدة.'
                : 'Built upon solid pillars of efficiency, precision, and adherence to top service levels.',
          ),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 0.85,
            ),
            itemCount: whyUs.length,
            itemBuilder: (context, index) {
              final item = whyUs[index];
              return Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: AppColors.background,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.cardBorder),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: AppColors.secondary.withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(
                        Icons.star,
                        color: AppColors.secondaryDark,
                        size: 20,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      item.title,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryDark,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 6),
                    Expanded(
                      child: Text(
                        item.description,
                        style: const TextStyle(
                          fontSize: 11,
                          color: AppColors.textBody,
                          height: 1.4,
                        ),
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  // Projects Section
  Widget _buildProjectsSection(
    BuildContext context,
    List<ProjectModel> projects,
    bool isAr,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 28),
      color: AppColors.backgroundAlt,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeader(
            subtitle: isAr ? 'نماذج من أعمالنا' : 'Featured Projects',
            title: isAr
                ? 'مشاريع منجزة بكفاءة وجودة عالية'
                : 'Projects Executed with Quality',
            description: isAr
                ? 'سجل حافل بالنجاحات والشراكات التشغيلية مع كبرى الجهات الحكومية والشركات الخاصة.'
                : 'A proven track record of successful O&M partnerships with key governmental and corporate clients.',
          ),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: projects.length,
            separatorBuilder: (context, index) => const SizedBox(height: 14),
            itemBuilder: (context, index) {
              final project = projects[index];
              return ProjectCardWidget(
                project: project,
                onTap: () => context.push('/projects/${project.id}'),
              );
            },
          ),
          const SizedBox(height: 16),
          Center(
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                foregroundColor: AppColors.primary,
                side: const BorderSide(color: AppColors.primary, width: 1.5),
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 12,
                ),
              ),
              onPressed: () => context.push('/projects'),
              child: Text(
                isAr
                    ? 'عرض جميع المشاريع المنجزة'
                    : 'View All Executed Projects',
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Sectors Preview
  Widget _buildSectorsPreview(
    BuildContext context,
    List<SectorModel> sectors,
    bool isAr,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 28),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeader(
            subtitle: isAr ? 'القطاعات المستفيدة' : 'Sectors We Serve',
            title: isAr
                ? 'نخدم 12 قطاعاً حيوياً في المملكة'
                : 'Serving 12 Vital Sectors in Saudi Arabia',
          ),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: sectors.map((sec) {
              return ActionChip(
                backgroundColor: AppColors.background,
                side: const BorderSide(color: AppColors.cardBorder),
                label: Text(
                  sec.title,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primaryDark,
                  ),
                ),
                avatar: const Icon(
                  Icons.check_circle_outline,
                  size: 14,
                  color: AppColors.secondary,
                ),
                onPressed: () => context.push('/sectors'),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  // Stats Section
  Widget _buildStatsSection(
    BuildContext context,
    List<StatModel> stats,
    bool isAr,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      color: AppColors.primary,
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
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                stat.label,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white, fontSize: 12),
              ),
            ],
          );
        },
      ),
    );
  }

  // Partners
  Widget _buildPartnersSection(
    BuildContext context,
    List<String> partners,
    bool isAr,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeader(
            subtitle: isAr ? 'شركاء النجاح' : 'Success Partners',
            title: isAr
                ? 'ثقة كبرى المنشآت والجهات'
                : 'Trusted by Leading Entities',
          ),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: partners.map((p) {
              return Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: AppColors.background,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: AppColors.cardBorder),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.verified_user,
                      size: 14,
                      color: AppColors.secondary,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      p,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  // Testimonials
  Widget _buildTestimonialsSection(
    BuildContext context,
    List<TestimonialModel> testimonials,
    bool isAr,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 28),
      color: AppColors.backgroundAlt,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeader(
            subtitle: isAr ? 'آراء العملاء' : 'Testimonials',
            title: isAr ? 'ماذا يقول عملاؤنا عنا' : 'What Our Clients Say',
          ),
          SizedBox(
            height: 180,
            child: PageView.builder(
              itemCount: testimonials.length,
              itemBuilder: (context, index) {
                final t = testimonials[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: const BorderSide(color: AppColors.cardBorder),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              t.name,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: AppColors.primaryDark,
                              ),
                            ),
                            Row(
                              children: List.generate(
                                t.rating,
                                (i) => const Icon(
                                  Icons.star,
                                  size: 14,
                                  color: AppColors.secondary,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Text(
                          t.role,
                          style: const TextStyle(
                            fontSize: 11,
                            color: AppColors.textMuted,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Expanded(
                          child: Text(
                            '"${t.text}"',
                            style: const TextStyle(
                              fontSize: 12,
                              color: AppColors.textBody,
                              height: 1.5,
                              fontStyle: FontStyle.italic,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 4,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // CTA Banner
  Widget _buildCtaBanner(BuildContext context, CompanyInfo company, bool isAr) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: const BoxDecoration(
        color: AppColors.secondary,
        gradient: LinearGradient(
          colors: [AppColors.secondaryLight, AppColors.secondaryDark],
        ),
      ),
      child: Column(
        children: [
          Text(
            isAr
                ? 'جاهزون لخدمتكم وإدارة مرافقكم باحترافية'
                : 'Ready to Elevate Your Facility Operations',
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
                ? 'تواصل مع فريقنا الفني للحصول على استشارة تشغيلية أو عرض سعر مخصص لموقعك'
                : 'Connect with our engineering specialists for custom proposals and technical audits.',
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 12, color: AppColors.primaryDark),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryDark,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            ),
            onPressed: () => context.push('/contact'),
            child: Text(
              isAr ? 'طلب عرض سعر فوري' : 'Request Instant Quote',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  // Footer
  Widget _buildFooter(BuildContext context, CompanyInfo company, bool isAr) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 32),
      color: AppColors.primaryDark,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            'assets/logo/logo-light.webp',
            height: 44,
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) => Text(
              company.name,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            company.shortDescription,
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.7),
              fontSize: 12,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 20),
          const Divider(color: Color(0x22FFFFFF)),
          const SizedBox(height: 12),
          _footerContactRow(Icons.location_on, company.addressFull),
          _footerContactRow(Icons.phone, company.phoneDisplay),
          _footerContactRow(Icons.email, company.email),
          _footerContactRow(Icons.access_time, company.workingHours),
          const SizedBox(height: 20),
          Center(
            child: Text(
              '© ${DateTime.now().year} ${company.fullName}. ${isAr ? "جميع الحقوق محفوظة." : "All rights reserved."}',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white.withValues(alpha: 0.4),
                fontSize: 11,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _footerContactRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 14, color: AppColors.secondary),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                color: Colors.white.withValues(alpha: 0.8),
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
