import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/data/taj_cortba_data.dart';
import '../../core/localization/language_provider.dart';
import '../../core/theme/app_colors.dart';
import '../../core/widgets/custom_app_drawer.dart';
import '../../core/widgets/floating_action_buttons.dart';
import '../../core/widgets/service_card_widget.dart';

class ServicesScreen extends StatefulWidget {
  final LanguageProvider languageProvider;

  const ServicesScreen({super.key, required this.languageProvider});

  @override
  State<ServicesScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  String _searchQuery = '';
  String _selectedCategory = 'all';

  @override
  Widget build(BuildContext context) {
    final isAr = widget.languageProvider.isArabic;
    final company = TajCortbaData.getCompany(isAr);
    final allServices = TajCortbaData.getServices(isAr);

    final categories = [
      {'id': 'all', 'label': isAr ? 'الكل (11 فئة)' : 'All (11 Categories)'},
      {'id': 'facilities', 'label': isAr ? 'المرافق والتشغيل' : 'Facilities'},
      {
        'id': 'maintenance',
        'label': isAr ? 'الصيانة والكهرباء' : 'Maintenance',
      },
      {'id': 'environment', 'label': isAr ? 'الحدائق والري' : 'Landscaping'},
      {'id': 'water', 'label': isAr ? 'المياه والنزح' : 'Water & Drainage'},
    ];

    // Filter services based on category and query
    final filteredServices = allServices.where((s) {
      final matchesCategory =
          _selectedCategory == 'all' || s.categoryGroup == _selectedCategory;
      if (_searchQuery.trim().isEmpty) return matchesCategory;

      final q = _searchQuery.toLowerCase().trim();
      final matchesTitle = s.title.toLowerCase().contains(q);
      final matchesDesc = s.description.toLowerCase().contains(q);
      final matchesSub = s.subServices.any(
        (sub) => sub.toLowerCase().contains(q),
      );

      return matchesCategory && (matchesTitle || matchesDesc || matchesSub);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          isAr ? 'دليل الخدمات المعتمدة' : 'Approved Services Catalog',
        ),
        actions: [
          IconButton(
            tooltip: isAr ? 'English' : 'العربية',
            icon: const Icon(Icons.language, color: AppColors.secondary),
            onPressed: () => widget.languageProvider.toggleLanguage(),
          ),
        ],
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
      body: Column(
        children: [
          // Search & Filter header
          Container(
            padding: const EdgeInsets.all(16),
            color: AppColors.primary,
            child: Column(
              children: [
                TextField(
                  onChanged: (val) => setState(() => _searchQuery = val),
                  style: const TextStyle(fontSize: 14),
                  decoration: InputDecoration(
                    hintText: isAr
                        ? 'ابحث في الخدمات أو المهام التشغيلية...'
                        : 'Search services or operational tasks...',
                    prefixIcon: const Icon(
                      Icons.search,
                      color: AppColors.textMuted,
                    ),
                    suffixIcon: _searchQuery.isNotEmpty
                        ? IconButton(
                            icon: const Icon(Icons.clear, size: 18),
                            onPressed: () => setState(() => _searchQuery = ''),
                          )
                        : null,
                    fillColor: Colors.white,
                    filled: true,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  height: 38,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 8),
                    itemBuilder: (context, index) {
                      final cat = categories[index];
                      final isSelected = _selectedCategory == cat['id'];
                      return ChoiceChip(
                        label: Text(
                          cat['label']!,
                          style: TextStyle(
                            color: isSelected
                                ? AppColors.primaryDark
                                : Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        selected: isSelected,
                        selectedColor: AppColors.secondary,
                        backgroundColor: AppColors.primaryLight,
                        onSelected: (selected) {
                          if (selected) {
                            setState(() => _selectedCategory = cat['id']!);
                          }
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),

          // Services list
          Expanded(
            child: filteredServices.isEmpty
                ? Center(
                    child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.search_off,
                            size: 48,
                            color: AppColors.textLight,
                          ),
                          const SizedBox(height: 12),
                          Text(
                            isAr
                                ? 'لم يتم العثور على خدمات مطابقة'
                                : 'No matching services found',
                            style: const TextStyle(
                              color: AppColors.textMuted,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                : ListView.separated(
                    padding: const EdgeInsets.all(16),
                    itemCount: filteredServices.length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 14),
                    itemBuilder: (context, index) {
                      final service = filteredServices[index];
                      return ServiceCardWidget(
                        service: service,
                        showAllSubservices: false,
                        onTap: () => context.push('/services/${service.id}'),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
