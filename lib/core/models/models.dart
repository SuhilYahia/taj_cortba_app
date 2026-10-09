class CompanyInfo {
  final String name;
  final String fullName;
  final String tagline;
  final String description;
  final String shortDescription;
  final int experienceYears;
  final String phone;
  final String phoneDisplay;
  final String whatsapp;
  final String whatsappDisplay;
  final String email;
  final String address;
  final String addressFull;
  final String workingHours;

  const CompanyInfo({
    required this.name,
    required this.fullName,
    required this.tagline,
    required this.description,
    required this.shortDescription,
    required this.experienceYears,
    required this.phone,
    required this.phoneDisplay,
    required this.whatsapp,
    required this.whatsappDisplay,
    required this.email,
    required this.address,
    required this.addressFull,
    required this.workingHours,
  });
}

class ServiceModel {
  final String id;
  final String number;
  final String title;
  final String shortTitle;
  final String icon;
  final String categoryGroup;
  final String description;
  final List<String> subServices;

  const ServiceModel({
    required this.id,
    required this.number,
    required this.title,
    required this.shortTitle,
    required this.icon,
    required this.categoryGroup,
    required this.description,
    required this.subServices,
  });
}

class ProjectModel {
  final int id;
  final String title;
  final String type;
  final String categoryKey;
  final String location;
  final int year;
  final String image;
  final String description;
  final List<String> scope;

  const ProjectModel({
    required this.id,
    required this.title,
    required this.type,
    required this.categoryKey,
    required this.location,
    required this.year,
    required this.image,
    required this.description,
    required this.scope,
  });
}

class SectorModel {
  final String id;
  final String title;
  final String icon;
  final String description;
  final List<String> features;

  const SectorModel({
    required this.id,
    required this.title,
    required this.icon,
    required this.description,
    required this.features,
  });
}

class FaqModel {
  final String question;
  final String answer;

  const FaqModel({required this.question, required this.answer});
}

class TestimonialModel {
  final int id;
  final String name;
  final String role;
  final String text;
  final int rating;

  const TestimonialModel({
    required this.id,
    required this.name,
    required this.role,
    required this.text,
    required this.rating,
  });
}

class StatModel {
  final int value;
  final String suffix;
  final String label;

  const StatModel({
    required this.value,
    required this.suffix,
    required this.label,
  });
}

class ValueModel {
  final String title;
  final String description;

  const ValueModel({required this.title, required this.description});
}
