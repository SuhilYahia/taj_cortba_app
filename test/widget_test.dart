import 'package:flutter_test/flutter_test.dart';
import 'package:taj_cortba_app/core/data/taj_cortba_data.dart';

void main() {
  test(
    'TajCortbaData provides approved 11 categories in Arabic and English',
    () {
      final arServices = TajCortbaData.getServices(true);
      final enServices = TajCortbaData.getServices(false);

      expect(arServices.length, 11);
      expect(enServices.length, 11);

      expect(arServices.first.id, 'facility-management');
      expect(arServices.first.subServices.isNotEmpty, true);
    },
  );

  test('TajCortbaData provides 12 sectors', () {
    final arSectors = TajCortbaData.getSectors(true);
    final enSectors = TajCortbaData.getSectors(false);

    expect(arSectors.length, 12);
    expect(enSectors.length, 12);
  });

  test('TajCortbaData provides company contact details', () {
    final company = TajCortbaData.getCompany(true);

    expect(company.phone, '0502284175');
    expect(company.whatsapp, '966502284175');
    expect(company.email, 'tajcortba@gmail.com');
  });
}
