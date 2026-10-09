import 'package:go_router/go_router.dart';

import 'core/localization/language_provider.dart';
import 'features/splash/splash_screen.dart';
import 'features/home/home_screen.dart';
import 'features/about/about_screen.dart';
import 'features/services/services_screen.dart';
import 'features/services/service_detail_screen.dart';
import 'features/projects/projects_screen.dart';
import 'features/projects/project_detail_screen.dart';
import 'features/sectors/sectors_screen.dart';
import 'features/faq/faq_screen.dart';
import 'features/contact/contact_screen.dart';
import 'features/privacy/privacy_screen.dart';

GoRouter createRouter(LanguageProvider languageProvider) {
  return GoRouter(
    initialLocation: '/splash',
    routes: [
      GoRoute(
        path: '/splash',
        builder: (context, state) =>
            SplashScreen(languageProvider: languageProvider),
      ),
      GoRoute(
        path: '/',
        builder: (context, state) =>
            HomeScreen(languageProvider: languageProvider),
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) =>
            HomeScreen(languageProvider: languageProvider),
      ),
      GoRoute(
        path: '/about',
        builder: (context, state) =>
            AboutScreen(languageProvider: languageProvider),
      ),
      GoRoute(
        path: '/services',
        builder: (context, state) =>
            ServicesScreen(languageProvider: languageProvider),
        routes: [
          GoRoute(
            path: ':serviceId',
            builder: (context, state) {
              final serviceId =
                  state.pathParameters['serviceId'] ?? 'facility-management';
              return ServiceDetailScreen(
                serviceId: serviceId,
                languageProvider: languageProvider,
              );
            },
          ),
        ],
      ),
      GoRoute(
        path: '/projects',
        builder: (context, state) =>
            ProjectsScreen(languageProvider: languageProvider),
        routes: [
          GoRoute(
            path: ':projectId',
            builder: (context, state) {
              final idStr = state.pathParameters['projectId'] ?? '1';
              final id = int.tryParse(idStr) ?? 1;
              return ProjectDetailScreen(
                projectId: id,
                languageProvider: languageProvider,
              );
            },
          ),
        ],
      ),
      GoRoute(
        path: '/sectors',
        builder: (context, state) =>
            SectorsScreen(languageProvider: languageProvider),
      ),
      GoRoute(
        path: '/faq',
        builder: (context, state) =>
            FaqScreen(languageProvider: languageProvider),
      ),
      GoRoute(
        path: '/contact',
        builder: (context, state) =>
            ContactScreen(languageProvider: languageProvider),
      ),
      GoRoute(
        path: '/privacy',
        builder: (context, state) =>
            PrivacyScreen(languageProvider: languageProvider),
      ),
    ],
  );
}
