import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/data/taj_cortba_data.dart';
import '../../core/localization/language_provider.dart';
import '../../core/theme/app_colors.dart';
import '../../core/widgets/custom_app_drawer.dart';
import '../../core/widgets/floating_action_buttons.dart';
import '../../core/widgets/project_card_widget.dart';

class ProjectsScreen extends StatefulWidget {
  final LanguageProvider languageProvider;

  const ProjectsScreen({super.key, required this.languageProvider});

  @override
  State<ProjectsScreen> createState() => _ProjectsScreenState();
}

class _ProjectsScreenState extends State<ProjectsScreen> {
  String _selectedFilter = 'ALL';

  @override
  Widget build(BuildContext context) {
    final isAr = widget.languageProvider.isArabic;
    final company = TajCortbaData.getCompany(isAr);
    final allProjects = TajCortbaData.getProjects(isAr);

    // Extract unique project types
    final uniqueTypes = allProjects.map((p) => p.type).toSet().toList();
    final filterOptions = [
      {'id': 'ALL', 'label': isAr ? 'الكل' : 'All'},
      ...uniqueTypes.map((t) => {'id': t, 'label': t}),
    ];

    final filteredProjects = _selectedFilter == 'ALL'
        ? allProjects
        : allProjects.where((p) => p.type == _selectedFilter).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          isAr ? 'مشاريعنا وإنجازاتنا' : 'Our Projects & Achievements',
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
          // Filter Chips Horizontal Bar
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            color: AppColors.primary,
            child: SizedBox(
              height: 38,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: filterOptions.length,
                separatorBuilder: (context, index) => const SizedBox(width: 8),
                itemBuilder: (context, index) {
                  final opt = filterOptions[index];
                  final isSelected = _selectedFilter == opt['id'];
                  return ChoiceChip(
                    label: Text(
                      opt['label']!,
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
                        setState(() => _selectedFilter = opt['id']!);
                      }
                    },
                  );
                },
              ),
            ),
          ),

          // Projects List
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: filteredProjects.length,
              separatorBuilder: (context, index) => const SizedBox(height: 16),
              itemBuilder: (context, index) {
                final project = filteredProjects[index];
                return ProjectCardWidget(
                  project: project,
                  onTap: () => context.push('/projects/${project.id}'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
