import '../models/models.dart';

class TajCortbaData {
  // Company Data
  static CompanyInfo getCompany(bool isAr) {
    if (isAr) {
      return const CompanyInfo(
        name: 'تاج قرطبة',
        fullName: 'شركة تاج قرطبة للتشغيل والصيانة',
        tagline: 'شريككم الموثوق في خدمات التشغيل والصيانة وإدارة المرافق',
        description: 'شركة سعودية رائدة متخصصة في إدارة وتشغيل وصيانة المرافق والمنشآت، الصيانة الكهربائية، رعاية الحدائق والمسطحات الخضراء، وتوريد المياه ونزح الصرف الصحي وصيانة المسابح، ملتزمون بتقديم حلول تشغيلية وفنية مستدامة للقطاعين الحكومي والخاص وفق أعلى معايير الجودة والسلامة المهنية.',
        shortDescription: 'نقدم حلولاً تشغيلية وفنية وبيئية متكاملة في إدارة المرافق، الصيانة الكهربائية، صيانة الحدائق، توريد المياه، ونظافة المرافق للقطاعين الحكومي والخاص في المملكة العربية السعودية.',
        experienceYears: 15,
        phone: '0502284175',
        phoneDisplay: '0502284175',
        whatsapp: '966502284175',
        whatsappDisplay: '+966 50 228 4175',
        email: 'tajcortba@gmail.com',
        address: 'الرياض، المملكة العربية السعودية',
        addressFull:
            'حي العليا، طريق الملك فهد، الرياض 12211، المملكة العربية السعودية',
        workingHours: 'الأحد – الخميس: 8:00 ص – 5:00 م (طوارئ 24/7)',
      );
    } else {
      return const CompanyInfo(
        name: 'Taj Cortba',
        fullName: 'Taj Cortba Operation and Maintenance Company',
        tagline: 'Your Trusted Partner in Facility Management, Operation & Maintenance',
        description: 'A premier Saudi company specializing in total facility management, operation and maintenance, electrical and electromechanical systems, landscaping and irrigation, bulk water supply, wastewater drainage, and swimming pools maintenance. We deliver sustainable engineering solutions for public and private sectors in strict compliance with the highest standards of safety and quality.',
        shortDescription: 'Delivering integrated operational, engineering, and environmental facility management solutions across Saudi Arabia for government and corporate sectors.',
        experienceYears: 15,
        phone: '0502284175',
        phoneDisplay: '0502284175',
        whatsapp: '966502284175',
        whatsappDisplay: '+966 50 228 4175',
        email: 'tajcortba@gmail.com',
        address: 'Riyadh, Kingdom of Saudi Arabia',
        addressFull: 'Al Olaya Dist., King Fahd Road, Riyadh 12211, Kingdom of Saudi Arabia',
        workingHours: 'Sun – Thu: 8:00 AM – 5:00 PM (24/7 Emergency Support)',
      );
    }
  }

  // Approved Services (11 Categories)
  static List<ServiceModel> getServices(bool isAr) {
    if (isAr) {
      return const [
        ServiceModel(
          id: 'facility-management',
          number: '01',
          title: 'إدارة وتشغيل وصيانة المرافق',
          shortTitle: 'إدارة وتشغيل وصيانة المرافق',
          icon: 'business',
          categoryGroup: 'facilities',
          description: 'حلول متكاملة لإدارة وتشغيل وصيانة المنشآت الحكومية والخاصة، مع تنفيذ برامج الصيانة الدورية والوقائية وإدارة فرق التشغيل وبلاغات الصيانة لضمان استمرارية وكفاءة الأصول.',
          subServices: [
            'إدارة وتشغيل المرافق والمنشآت.',
            'التشغيل اليومي للمرافق.',
            'إدارة ومتابعة أعمال التشغيل.',
            'تنفيذ برامج الصيانة الوقائية.',
            'تنفيذ أعمال الصيانة التصحيحية.',
            'تنفيذ أعمال الصيانة الدورية والمجدولة.',
            'فحص ومتابعة الأنظمة والمعدات.',
            'اكتشاف الأعطال والمشكلات التشغيلية.',
            'معالجة الأعطال الفنية.',
            'إدارة ومتابعة بلاغات الصيانة.',
            'إدارة فرق التشغيل والصيانة.',
            'إعداد خطط وبرامج التشغيل والصيانة.',
            'جدولة أعمال الصيانة الدورية.',
            'متابعة أداء المرافق والأصول.',
            'إعداد التقارير التشغيلية والفنية.',
            'متابعة جاهزية المرافق واستمرارية تشغيلها.',
            'إدارة أعمال الصيانة للمرافق الحكومية والخاصة.',
          ],
        ),
        ServiceModel(
          id: 'electrical-maintenance',
          number: '02',
          title: 'خدمات الصيانة الكهربائية والتكييف والأعمال الكهروميكانيكية',
          shortTitle: 'الصيانة الكهربائية والتكييف',
          icon: 'electrical_services',
          categoryGroup: 'maintenance',
          description: 'خدمات فنية متخصصة لصيانة وفحص الأنظمة والشبكات الكهربائية، لوحات التوزيع والتحكم، شبكات الإنارة الداخلية والخارجية، ومعالجة الأعطال والاستجابة للطوارئ الكهربائية.',
          subServices: [
            'صيانة الأنظمة والشبكات الكهربائية.',
            'الفحص الدوري للأنظمة والتمديدات الكهربائية.',
            'فحص واختبار المكونات الكهربائية.',
            'معالجة الأعطال الكهربائية.',
            'صيانة لوحات التوزيع والتحكم.',
            'صيانة القواطع والمفاتيح الكهربائية.',
            'صيانة الإنارة الداخلية.',
            'صيانة الإنارة الخارجية.',
            'صيانة أعمدة الإنارة.',
            'صيانة وحدات ومصابيح الإضاءة.',
            'أعمال التمديدات الكهربائية.',
            'أعمال الإصلاحات الكهربائية.',
            'استبدال المكونات الكهربائية التالفة.',
            'تنفيذ أعمال الصيانة الوقائية.',
            'تنفيذ أعمال الصيانة التصحيحية.',
            'الاستجابة للأعطال الكهربائية الطارئة.',
          ],
        ),
        ServiceModel(
          id: 'gardens-landscaping',
          number: '03',
          title: 'خدمات الحدائق والمسطحات الخضراء والري',
          shortTitle: 'الحدائق والمسطحات الخضراء والري',
          icon: 'park',
          categoryGroup: 'environment',
          description: 'تصميم وتنسيق وصيانة الحدائق والمسطحات الخضراء، زراعة الأشجار والزهور الموسمية، تركيب وتشغيل شبكات الري الآلية، مكافحة الآفات، وتسميد التربة للمحافظة على المظهر الجمالي.',
          subServices: [
            'تصميم وتنسيق الحدائق.',
            'صيانة الحدائق.',
            'تنسيق المسطحات الخضراء.',
            'زراعة الأشجار والنباتات.',
            'زراعة الزهور والنباتات الموسمية.',
            'قص وتهذيب الأشجار والشجيرات.',
            'صيانة المسطحات العشبية.',
            'تركيب وصيانة شبكات الري.',
            'تشغيل أنظمة الري الآلية.',
            'معالجة ومتابعة مشاكل الري.',
            'مكافحة الآفات الزراعية.',
            'تسميد ومعالجة التربة.',
            'تقليم الأشجار والنباتات.',
            'العناية بالنباتات والمزروعات.',
          ],
        ),
        ServiceModel(
          id: 'water-supply',
          number: '04',
          title: 'خدمات توريد المياه',
          shortTitle: 'خدمات توريد المياه',
          icon: 'local_shipping',
          categoryGroup: 'water',
          description: 'توريد ونقل المياه الصالحة للشرب والمياه المخصصة للمشاريع والري ومواقع البناء بأسطول حديث من الصهاريج المعتمدة، مع إدارة سلاسل الإمداد على مدار الساعة.',
          subServices: [
            'توريد المياه الصالحة للشرب.',
            'توريد المياه للمشاريع والمنشآت.',
            'نقل وتوزيع المياه عبر الصهاريج (التناكر).',
            'تأمين إمدادات المياه المنتظمة.',
            'تلبية احتياجات المياه الطارئة.',
            'توريد مياه الري للمسطحات والحدائق.',
            'متابعة وتنسيق خطط توريد المياه.',
          ],
        ),
        ServiceModel(
          id: 'wastewater-drainage',
          number: '05',
          title: 'خدمات نزح مياه الصرف الصحي',
          shortTitle: 'نزح مياه الصرف الصحي',
          icon: 'water_drop',
          categoryGroup: 'water',
          description: 'شفط ونزح مياه الصرف الصحي والمياه الراكدة ومخلفات المشاريع والمواقع الإنشائية باستخدام صهاريج شفط حديثة ومجهزة بيئياً بأعلى معايير النظافة والالتزام النظامي.',
          subServices: [
            'شفط ونزح مياه الصرف الصحي.',
            'تفريغ بيارات الصرف الصحي.',
            'سحب المياه المتجمعة والراكدة.',
            'نزح المياه من المواقع الإنشائية والمشاريع.',
            'التعامل مع حالات الطفح والتسربات.',
            'توفير صهاريج الشفط والنزح المجهزة.',
            'التخلص الآمن والبيئي من مياه الصرف.',
          ],
        ),
        ServiceModel(
          id: 'water-pumping',
          number: '06',
          title: 'خدمات تشغيل معدات ضخ المياه',
          shortTitle: 'تشغيل معدات ضخ المياه',
          icon: 'settings_input_component',
          categoryGroup: 'water',
          description: 'تشغيل ومتابعة وصيانة مضخات المياه ومحطات الرفع ومعدات الضخ الهيدروليكية لضمان تدفق المياه واستقرار الضغط في الشبكات والمرافق.',
          subServices: [
            'تشغيل مضخات المياه بمختلف أنواعها.',
            'متابعة ومراقبة أداء محطات الضخ.',
            'فحص واختبار معدات الضخ بانتظام.',
            'صيانة مضخات المياه.',
            'معالجة أعطال المضخات التشغيلية.',
            'تنظيم ومراقبة تدفق وضغط المياه.',
            'التأكد من جاهزية وكفاءة المضخات.',
          ],
        ),
        ServiceModel(
          id: 'cleaning-services',
          number: '07',
          title: 'خدمات نظافة المرافق والخدمات المساندة',
          shortTitle: 'نظافة المرافق والخدمات المساندة',
          icon: 'cleaning_services',
          categoryGroup: 'facilities',
          description: 'خدمات النظافة الشاملة للمرافق الإدارية والتجارية والسكنية، التنظيف التأسيسي، التعقيم والتطهير، وتأمين الكوادر المساندة والضيافة للحفاظ على بيئة صحية ونظيفة.',
          subServices: [
            'النظافة العامة والشاملة للمرافق.',
            'نظافة المكاتب والمباني الإدارية.',
            'نظافة المجمعات السكنية والتجارية.',
            'التنظيف الدوري واليومي للمرافق.',
            'تنظيف وتلميع الأرضيات بمختلف أنواعها.',
            'نظافة الواجهات الزجاجية والمداخل.',
            'تنظيف وتطهير دورات المياه والخدمات.',
            'إدارة وجمع النفايات ونقلها للمواقع المعتمدة.',
            'خدمات التعقيم والتطهير الدوري.',
            'تأمين العمالة والمواد والأجهزة الخاصة بالنظافة.',
          ],
        ),
        ServiceModel(
          id: 'preventive-corrective-maintenance',
          number: '08',
          title: 'خدمات الصيانة الوقائية والتصحيحية',
          shortTitle: 'الصيانة الوقائية والتصحيحية',
          icon: 'build',
          categoryGroup: 'maintenance',
          description: 'تطبيق جداول صيانة وقائية دقيقة وبرامج استباقية دورية لكشف المشاكل قبل حدوثها، مع فرق متخصصة للإصلاح التصحيحي الفوري للأعطال الفنية والتشغيلية.',
          subServices: [
            'إعداد وتنفيذ خطط الصيانة الوقائية.',
            'الفحص الدوري للمعدات والأنظمة.',
            'إجراء الاختبارات التشغيلية الدورية.',
            'تشخيص واكتشاف الأعطال الفنية.',
            'تنفيذ أعمال الصيانة التصحيحية والإصلاحات.',
            'استبدال القطع الاستهلاكية والتالفة.',
            'إعادة تأهيل الأنظمة والمعدات لضمان كفاءتها.',
            'توثيق أعمال الصيانة وسجلات الأصول.',
          ],
        ),
        ServiceModel(
          id: 'swimming-pools-maintenance',
          number: '09',
          title: 'خدمات صيانة وتشغيل المسابح',
          shortTitle: 'صيانة وتشغيل المسابح',
          icon: 'pool',
          categoryGroup: 'facilities',
          description: 'صيانة وتشغيل المسابح والبحيرات الصناعية والنوافير، فحص التوازن الكيميائي والتعقيم، صيانة الفلاتر والمضخات ومعدات التسخين والإضاءة المائية.',
          subServices: [
            'تنظيف وتطهير مياه وأرضيات المسابح.',
            'فحص وضبط النسب الكيميائية ومستوى الكلور والحموضة.',
            'صيانة وفحص فلاتر المسابح وأنظمة الفلترة.',
            'صيانة مضخات المسابح وأنظمة تدوير المياه.',
            'معالجة التسربات والأعطال المائية والكهربائية للمسابح.',
            'تجهيز المسابح للمواسم الصيفية والشتوية.',
            'صيانة النوافير والشلالات المائية.',
          ],
        ),
        ServiceModel(
          id: 'emergency-services',
          number: '10',
          title: 'خدمات الطوارئ والاستجابة السريعة (24/7)',
          shortTitle: 'طوارئ واستجابة سريعة 24/7',
          icon: 'warning',
          categoryGroup: 'maintenance',
          description: 'فرق طوارئ ميدانية متأهبة على مدار الساعة (24/7) للتدخل الفوري ومعالجة الأعطال الكهربائية الحرجة، انقطاعات المياه، تسربات الصرف، ومشاكل الضخ المستعجلة.',
          subServices: [
            'استقبال البلاغات الطارئة على مدار 24 ساعة.',
            'فرق تدخل سريع مجهزة بأحدث الأدوات.',
            'التعامل مع الانقطاعات الكهربائية الطارئة.',
            'معالجة تسربات وطفح شبكات الصرف الصحي.',
            'تأمين إمدادات المياه العاجلة في حالات النقص.',
            'إصلاح مضخات الطوارئ وأنظمة الإمداد الحيوية.',
          ],
        ),
        ServiceModel(
          id: 'specialized-contracts',
          number: '11',
          title: 'عقود التشغيل والصيانة المتخصصة للقطاعات',
          shortTitle: 'عقود التشغيل والصيانة المتخصصة',
          icon: 'assignment',
          categoryGroup: 'facilities',
          description: 'تصميم وإبرام اتفاقيات ومستويات خدمة (SLA) مخصصة للجهات الحكومية والشركات الخاصة والمستشفيات والمجمعات، تتوافق مع متطلبات الحوكمة ومؤشرات الأداء.',
          subServices: [
            'عقود تشغيل وصيانة شاملة ومخصصة.',
            'إدارة اتفاقيات مستوى الخدمة (SLAs).',
            'توفير كوادر هندسية وإشرافية مقيمة.',
            'تقارير دورية لمؤشرات الأداء (KPIs).',
            'إدارة سلاسل الإمداد وقطع الغيار للمشاريع.',
            'استشارات وتطوير خطط إدارة المرافق.',
          ],
        ),
      ];
    } else {
      return const [
        ServiceModel(
          id: 'facility-management',
          number: '01',
          title: 'Facility Management, Operation & Maintenance',
          shortTitle: 'Facility Management',
          icon: 'business',
          categoryGroup: 'facilities',
          description: 'Comprehensive operations and maintenance solutions for public and corporate facilities, guaranteeing uninterrupted asset performance and SLA adherence.',
          subServices: [
            'Total Facility Operations & Management.',
            'Daily Routine Facility Upkeep.',
            'Operational Workflow Monitoring.',
            'Execution of Preventive Maintenance Programs.',
            'Corrective Maintenance Interventions.',
            'Scheduled Periodic Inspections.',
            'Equipment and Infrastructure Diagnostics.',
            'Technical Fault Troubleshooting.',
            'Rapid Remediation of Operational Issues.',
            'Ticketing and Maintenance Desk Management.',
            'Workforce and Technician Leadership.',
            'Strategic O&M Planning and Scheduling.',
            'Performance Tracking and SLA Auditing.',
            'Asset Lifecycle Reporting.',
          ],
        ),
        ServiceModel(
          id: 'electrical-maintenance',
          number: '02',
          title: 'Electrical, HVAC & Electromechanical Maintenance',
          shortTitle: 'Electrical & Electromechanical',
          icon: 'electrical_services',
          categoryGroup: 'maintenance',
          description: 'Specialized maintenance of electrical networks, switchgear, distribution boards, indoor/outdoor illumination, and round-the-clock emergency electrical repairs.',
          subServices: [
            'Electrical Grid and Circuit Maintenance.',
            'Routine Diagnostic Testing & Load Verification.',
            'Component & Insulation Testing.',
            'Electrical Fault Rectification.',
            'Switchboard and Panelboard Servicing.',
            'Circuit Breaker & Switch Maintenance.',
            'Interior Lighting System Care.',
            'Streetlight & Exterior Illumination Servicing.',
            'Cabling & Rewiring Services.',
            'Replacement of Damaged Components.',
            'Emergency Electrical Outage Response.',
          ],
        ),
        ServiceModel(
          id: 'gardens-landscaping',
          number: '03',
          title: 'Landscaping, Greenery & Automated Irrigation',
          shortTitle: 'Landscaping & Irrigation',
          icon: 'park',
          categoryGroup: 'environment',
          description: 'Landscape architecture, green space upkeep, tree planting, seasonal flora management, modern automated irrigation systems, pest control, and fertilization.',
          subServices: [
            'Landscape Design and Beautification.',
            'Green Space & Garden Maintenance.',
            'Lawn Care and Turf Rejuvenation.',
            'Tree and Shrub Pruning and Trimming.',
            'Planting Seasonal Flowers and Ornamental Flora.',
            'Installation & Maintenance of Automated Irrigation.',
            'Irrigation Leak Detection and Pressure Balancing.',
            'Eco-friendly Agricultural Pest Management.',
            'Soil Enrichment and Fertilization.',
          ],
        ),
        ServiceModel(
          id: 'water-supply',
          number: '04',
          title: 'Bulk Water Supply Services',
          shortTitle: 'Water Supply Services',
          icon: 'local_shipping',
          categoryGroup: 'water',
          description: 'Supplying potable and construction-grade water via a certified modern tanker fleet, managing reliable continuous delivery schedules.',
          subServices: [
            'Potable Drinking Water Deliveries.',
            'Industrial and Construction Site Bulk Water.',
            'Dedicated Fleet Tanker Logistics.',
            'Continuous Supply Continuity Plans.',
            'Urgent Bulk Water Provision.',
            'Irrigation Water Distribution.',
          ],
        ),
        ServiceModel(
          id: 'wastewater-drainage',
          number: '05',
          title: 'Sewage and Wastewater Drainage Services',
          shortTitle: 'Wastewater Drainage',
          icon: 'water_drop',
          categoryGroup: 'water',
          description: 'Effluent pumping, septic tank dewatering, stormwater extraction, and environmentally compliant wastewater transport using vacuum tankers.',
          subServices: [
            'Septic Tank Evacuation and Vacuum Drainage.',
            'Sewage Disposal in Compliant Facilities.',
            'Stormwater and Ground Flooding Pumping.',
            'Construction Dewatering Operations.',
            'Urgent Overflow & Blockage Mitigation.',
            'Modern Vacuum Tanker Deployment.',
          ],
        ),
        ServiceModel(
          id: 'water-pumping',
          number: '06',
          title: 'Water Pumping Equipment Operation',
          shortTitle: 'Water Pumping Systems',
          icon: 'settings_input_component',
          categoryGroup: 'water',
          description: 'Operations, routine checkups, and technical maintenance of hydraulic water pumps and booster stations to ensure network pressure stability.',
          subServices: [
            'Operating Multi-Stage Water Pump Stations.',
            'Booster System Performance Monitoring.',
            'Routine Mechanical and Pressure Checkups.',
            'Pump Overhaul and Seal Replacements.',
            'Flow Regulation and Pressure Tuning.',
          ],
        ),
        ServiceModel(
          id: 'cleaning-services',
          number: '07',
          title: 'Facility Cleaning & Support Services',
          shortTitle: 'Facility Cleaning & Support',
          icon: 'cleaning_services',
          categoryGroup: 'facilities',
          description: 'Comprehensive cleaning for corporate, retail, and residential facilities, periodic sanitation, glass facade cleaning, and waste management.',
          subServices: [
            'Total Commercial & Institutional Cleaning.',
            'Office and Workspace Sanitization.',
            'Floor Buffing, Polishing, and Waxing.',
            'Architectural Glass Facade Cleaning.',
            'Restroom Sanitization Protocols.',
            'Waste Collection & Environmental Disposal.',
            'Provision of Certified Cleaning Personnel.',
          ],
        ),
        ServiceModel(
          id: 'preventive-corrective-maintenance',
          number: '08',
          title: 'Preventive & Corrective Maintenance',
          shortTitle: 'Preventive & Corrective',
          icon: 'build',
          categoryGroup: 'maintenance',
          description: 'Scheduled preventive routines and instant corrective interventions to prolong asset longevity and minimize unexpected operational shutdowns.',
          subServices: [
            'Preventive Maintenance Plan Formulation.',
            'Asset Health Audits and Diagnostics.',
            'Operational Stress and Load Testing.',
            'Corrective Engineering Rectifications.',
            'Consumable and Component Overhaul.',
            'Historical Asset Record Management.',
          ],
        ),
        ServiceModel(
          id: 'swimming-pools-maintenance',
          number: '09',
          title: 'Swimming Pool Operations & Maintenance',
          shortTitle: 'Swimming Pool Care',
          icon: 'pool',
          categoryGroup: 'facilities',
          description: 'Complete pool maintenance, water chemical balance balancing, filter and pump overhauls, pool lighting, and seasonal commissioning.',
          subServices: [
            'Pool Water Scrubbing & Sanitization.',
            'Chemical & pH Balancing Protocols.',
            'Sand and Cartridge Filter Servicing.',
            'Circulation Pump Overhauls.',
            'Pool Waterproofing and Tile Repair.',
            'Water Feature & Fountain Servicing.',
          ],
        ),
        ServiceModel(
          id: 'emergency-services',
          number: '10',
          title: '24/7 Rapid Emergency Response',
          shortTitle: '24/7 Emergency Response',
          icon: 'warning',
          categoryGroup: 'maintenance',
          description: 'On-call emergency response units operating 24 hours a day, 7 days a week, resolving power cuts, severe leaks, drainage blockages, and critical pump failures.',
          subServices: [
            'Round-the-clock Emergency Ticket Intake.',
            'Rapid Response Field Crews.',
            'Critical Power Outage Restoration.',
            'Major Water Line Leak Resolution.',
            'Emergency Dewatering & Flood Recovery.',
          ],
        ),
        ServiceModel(
          id: 'specialized-contracts',
          number: '11',
          title: 'Sector-Specific Specialized O&M Contracts',
          shortTitle: 'Specialized O&M Contracts',
          icon: 'assignment',
          categoryGroup: 'facilities',
          description: 'Custom SLA-based operations and maintenance contracts structured for ministries, universities, hospitals, and major corporate headquarters.',
          subServices: [
            'Tailored Long-Term Facility Contracts.',
            'Service Level Agreement (SLA) Governance.',
            'Resident Engineering & Technical Teams.',
            'Executive KPI and Performance Metrics.',
            'Strategic Supply Chain Management.',
          ],
        ),
      ];
    }
  }

  // Projects Data
  static List<ProjectModel> getProjects(bool isAr) {
    if (isAr) {
      return const [
        ProjectModel(
          id: 1,
          title: 'عقد إدارة وتشغيل وصيانة مجمع النرجس السكني',
          type: 'إدارة وتشغيل وصيانة المرافق',
          categoryKey: 'facility-management',
          location: 'الرياض',
          year: 2024,
          image: 'assets/hero-landscaping.jpg',
          description: 'مشروع صيانة وإدارة مرافق شامل يضم النظافة المساندة والسباكة والكهرباء وصيانة المسطحات الخضراء والمسابح لـ 120 وحدة سكنية.',
          scope: [
            'تشغيل يومي للمرافق',
            'صيانة وقائية دورية',
            'صيانة المسابح والحدائق',
          ],
        ),
        ProjectModel(
          id: 2,
          title: 'الصيانة الفنية الشاملة لمركز العليا التجاري',
          type: 'إدارة وتشغيل وصيانة المرافق',
          categoryKey: 'facility-management',
          location: 'الرياض',
          year: 2023,
          image: 'https://images.unsplash.com/photo-1497366216548-37526070297c?auto=format&fit=crop&w=800&q=80',
          description: 'تشغيل وصيانة الأنظمة الكهروميكانيكية، لوحات التحكم والتوزيع، أنظمة التكييف والإنارة لضمان استمرارية النشاط التجاري.',
          scope: [
            'فحص دوري للمعدات',
            'معالجة الأعطال الفنية',
            'إدارة بلاغات الصيانة',
          ],
        ),
        ProjectModel(
          id: 3,
          title: 'تشغيل وصيانة مستشفى الحياة بالمنطقة الشرقية',
          type: 'خدمات الصيانة الوقائية والتصحيحية',
          categoryKey: 'preventive-corrective-maintenance',
          location: 'الدمام',
          year: 2023,
          image: 'https://images.unsplash.com/photo-1581092160607-ee22621dd758?auto=format&fit=crop&w=800&q=80',
          description: 'عقد تشغيل وصيانة الأنظمة الكهربائية الاحتياطية وشبكات المياه وأنظمة القوى للمستشفى لضمان الجاهزية التامة على مدار 24 ساعة.',
          scope: [
            'صيانة المولدات والأنظمة',
            'جاهزية طوارئ 24/7',
            'خطط صيانة وقائية',
          ],
        ),
        ProjectModel(
          id: 4,
          title: 'عقد صيانة شبكات الإنارة العامة واللوحات الكهربائية',
          type: 'خدمات الصيانة الكهربائية والتكييف والأعمال الكهروميكانيكية',
          categoryKey: 'electrical-maintenance',
          location: 'مكة المكرمة',
          year: 2023,
          image: 'https://images.unsplash.com/photo-1473341304170-971dccb5ac1e?auto=format&fit=crop&w=800&q=80',
          description: 'تشغيل فني وصيانة دورية لشبكات الإنارة وأعمدة الإضاءة واللوحات الكهربائية الرئيسية ومحولات التوزيع الفرعية بمكة المكرمة.',
          scope: [
            'صيانة أعمدة الإنارة',
            'فحص واختبار اللوحات',
            'استبدال المكونات التالفة',
          ],
        ),
        ProjectModel(
          id: 5,
          title: 'تأهيل وصيانة اللوحات الكهربائية للمنطقة الصناعية',
          type: 'خدمات الصيانة الكهربائية والتكييف والأعمال الكهروميكانيكية',
          categoryKey: 'electrical-maintenance',
          location: 'الجبيل',
          year: 2022,
          image: 'https://images.unsplash.com/photo-1621905252507-b35492cc74b4?auto=format&fit=crop&w=800&q=80',
          description: 'صيانة القواطع واللوحات الكهربائية الرئيسية ومحولات التوزيع وتدقيق كفاءة استهلاك الطاقة لـ 15 منشأة صناعية كبرى.',
          scope: [
            'صيانة القواطع الكهربائية',
            'صيانة لوحات التوزيع',
            'استجابة طوارئ كهربائية',
          ],
        ),
        ProjectModel(
          id: 6,
          title: 'تنسيق وصيانة حدائق وشبكات ري المنتجع السياحي',
          type: 'خدمات الحدائق والمسطحات الخضراء والري',
          categoryKey: 'gardens-landscaping',
          location: 'الرياض',
          year: 2023,
          image: 'assets/hero-landscaping.jpg',
          description: 'أعمال ري وصيانة وتنسيق المسطحات الخضراء، مع تركيب وصيانة شبكات الري الآلية وتقليم الأشجار وزراعة الزهور الموسمية.',
          scope: [
            'تشغيل أنظمة الري الآلية',
            'قص وتهذيب الأشجار',
            'زراعة النباتات الموسمية',
          ],
        ),
        ProjectModel(
          id: 7,
          title: 'عقد توريد وتشغيل تناكر المياه لمجمع المشاريع',
          type: 'خدمات توريد المياه',
          categoryKey: 'water-supply',
          location: 'الرياض',
          year: 2024,
          image: 'assets/water-tanker-project.jpg',
          description: 'توريد مياه محلاة وغير محلاة وجدولة التناكر ومعدات الضخ لتلبية الاحتياجات اليومية للإنشاءات والمرافق التشغيلية.',
          scope: [
            'توريد مياه محلاة وغير محلاة',
            'جدولة التناكر اليومية',
            'توفير مضخات الضخ',
          ],
        ),
        ProjectModel(
          id: 8,
          title: 'تشغيل وصيانة مسابح المجمع الرياضي والفندقي',
          type: 'خدمات صيانة وتشغيل المسابح',
          categoryKey: 'swimming-pools-maintenance',
          location: 'جدة',
          year: 2024,
          image: 'https://images.unsplash.com/photo-1576013551627-0cc20b96c2a7?auto=format&fit=crop&w=800&q=80',
          description: 'تنظيف وتعقيم دوري للمسابح، فحص جودة المياه ومعالجتها الكيميائية، وصيانة مضخات وفلاتر تدوير المياه.',
          scope: [
            'تعقيم وفحص جودة المياه',
            'صيانة أنظمة الفلترة',
            'صيانة المضخات والتدوير',
          ],
        ),
      ];
    } else {
      return const [
        ProjectModel(
          id: 1,
          title: 'Al Narjis Residential Compound Facility Management',
          type: 'Facility Management, Operation & Maintenance',
          categoryKey: 'facility-management',
          location: 'Riyadh',
          year: 2024,
          image: 'assets/hero-landscaping.jpg',
          description: 'Comprehensive operations and maintenance contract covering janitorial services, plumbing, electrical grid, landscaping, and pools for 120 residential villas.',
          scope: [
            'Daily Operations',
            'Preventive Maintenance',
            'Pool & Landscape Upkeep',
          ],
        ),
        ProjectModel(
          id: 2,
          title: 'Al Olaya Commercial Center Technical Maintenance',
          type: 'Facility Management, Operation & Maintenance',
          categoryKey: 'facility-management',
          location: 'Riyadh',
          year: 2023,
          image: 'https://images.unsplash.com/photo-1497366216548-37526070297c?auto=format&fit=crop&w=800&q=80',
          description: 'Operating electromechanical systems, switchboards, central HVAC, and lighting architecture to preserve business uptime.',
          scope: [
            'Periodic Diagnostics',
            'Corrective Remediation',
            'Ticketing Desk',
          ],
        ),
        ProjectModel(
          id: 3,
          title: 'Al Hayat Hospital O&M Support',
          type: 'Preventive & Corrective Maintenance',
          categoryKey: 'preventive-corrective-maintenance',
          location: 'Dammam',
          year: 2023,
          image: 'https://images.unsplash.com/photo-1581092160607-ee22621dd758?auto=format&fit=crop&w=800&q=80',
          description: 'Contract managing critical hospital backup generators, hydraulic lines, and electrical distribution for 24/7 readiness.',
          scope: [
            'Generator Upkeep',
            '24/7 Emergency Readiness',
            'Preventive Maintenance Schedules',
          ],
        ),
        ProjectModel(
          id: 4,
          title: 'Public Streetlight & Distribution Maintenance',
          type: 'Electrical, HVAC & Electromechanical Maintenance',
          categoryKey: 'electrical-maintenance',
          location: 'Makkah',
          year: 2023,
          image: 'https://images.unsplash.com/photo-1473341304170-971dccb5ac1e?auto=format&fit=crop&w=800&q=80',
          description: 'Comprehensive servicing of public illumination grids, lighting masts, primary panelboards, and transformers in Makkah.',
          scope: [
            'Lighting Mast Upkeep',
            'Panel Testing',
            'Component Upgrades',
          ],
        ),
        ProjectModel(
          id: 5,
          title: 'Industrial City Switchgear Maintenance',
          type: 'Electrical, HVAC & Electromechanical Maintenance',
          categoryKey: 'electrical-maintenance',
          location: 'Jubail',
          year: 2022,
          image: 'https://images.unsplash.com/photo-1621905252507-b35492cc74b4?auto=format&fit=crop&w=800&q=80',
          description: 'Switchgear, breaker, and transformer overhauls with power efficiency auditing across 15 industrial plants.',
          scope: [
            'Breaker Overhaul',
            'Switchboard Servicing',
            'Emergency Outage Crews',
          ],
        ),
        ProjectModel(
          id: 6,
          title: 'Tourist Resort Landscaping and Automated Irrigation',
          type: 'Landscaping, Greenery & Automated Irrigation',
          categoryKey: 'gardens-landscaping',
          location: 'Riyadh',
          year: 2023,
          image: 'assets/hero-landscaping.jpg',
          description: 'Turf care, automated irrigation network installation, tree trimming, and floral rotations for a premier resort.',
          scope: [
            'Automated Irrigation Operation',
            'Pruning & Trimming',
            'Seasonal Floriculture',
          ],
        ),
        ProjectModel(
          id: 7,
          title: 'Construction City Bulk Water Tanker Operations',
          type: 'Bulk Water Supply Services',
          categoryKey: 'water-supply',
          location: 'Riyadh',
          year: 2024,
          image: 'assets/water-tanker-project.jpg',
          description: 'Daily scheduled potable and industrial water tanker deliveries and pumping operations for major construction hubs.',
          scope: [
            'Potable & Non-Potable Water',
            'Daily Fleet Scheduling',
            'Pumping Equipment',
          ],
        ),
        ProjectModel(
          id: 8,
          title: 'Sport & Hospitality Complex Pools Management',
          type: 'Swimming Pool Operations & Maintenance',
          categoryKey: 'swimming-pools-maintenance',
          location: 'Jeddah',
          year: 2024,
          image: 'https://images.unsplash.com/photo-1576013551627-0cc20b96c2a7?auto=format&fit=crop&w=800&q=80',
          description: 'Routine water testing, chemical balance balancing, filter sand replacement, and circulation pump maintenance.',
          scope: [
            'Water Sanitization',
            'Filtration Upkeep',
            'Pump Calibration',
          ],
        ),
      ];
    }
  }

  // Sectors Data (12 Sectors)
  static List<SectorModel> getSectors(bool isAr) {
    if (isAr) {
      return const [
        SectorModel(
          id: 'government',
          title: 'الجهات والمنشآت الحكومية',
          icon: 'account_balance',
          description: 'تشغيل وصيانة المباني الوزارية، المقرات الإدارية، والمرافق الحكومية وفق أعلى اشتراطات الحوكمة والسلامة.',
          features: [
            'تشغيل يومي متكامل',
            'صيانة وقائية دورية',
            'جاهزية طوارئ 24/7',
          ],
        ),
        SectorModel(
          id: 'private',
          title: 'القطاع الخاص والشركات',
          icon: 'corporate_fare',
          description: 'حلول تشغيلية وصيانة شاملة للأبراج والمقرات المؤسسية لدعم استمرارية الأعمال وراحة الموظفين والزوار.',
          features: [
            'إدارة مرافق احترافية',
            'صيانة الأنظمة الكهربائية',
            'نظافة وإسناد تشغيلي',
          ],
        ),
        SectorModel(
          id: 'industrial',
          title: 'المنشآت والمجمعات الصناعية',
          icon: 'factory',
          description: 'صيانة البنية التحتية، لوحات التوزيع والجهد العالي، شبكات المياه، ومساندة التشغيل للبيئات الصناعية الصعبة.',
          features: [
            'صيانة اللوحات والمحولات',
            'إمدادات وتناكر المياه',
            'التزام بمعايير السلامة المهنية',
          ],
        ),
        SectorModel(
          id: 'hospitals',
          title: 'المستشفيات والمنشآت الصحية',
          icon: 'local_hospital',
          description: 'رعاية فائقة وحرجة للمرافق الطبية تضمن استمرارية الطاقة الاحتياطية، جودة المياه، ونظافة المرافق الحيوية.',
          features: [
            'استجابة طوارئ فورية',
            'توريد مياه نقية ومحلاة',
            'صيانة الأنظمة الحساسة',
          ],
        ),
        SectorModel(
          id: 'universities',
          title: 'الجامعات والكليات',
          icon: 'school',
          description: 'إدارة وتشغيل المرافق الأكاديمية والساحات والمسطحات الخضراء وشبكات الإنارة والمباني الإدارية والخدمية.',
          features: [
            'صيانة الحدائق والمسطحات',
            'تشغيل وصيانة المباني',
            'خطط صيانة موسمية',
          ],
        ),
        SectorModel(
          id: 'schools',
          title: 'المدارس والمجمعات التعليمية',
          icon: 'menu_book',
          description: 'تهيئة بيئة تعليمية آمنة ونظيفة عبر صيانة الكهرباء، المسابح المدرسية، الساحات، وشبكات المياه والتكييف.',
          features: [
            'صيانة دورية وقائية',
            'صيانة المسابح والملاعب',
            'سلامة المنشآت',
          ],
        ),
        SectorModel(
          id: 'hotels',
          title: 'الفنادق والمرافق الفندقية',
          icon: 'hotel',
          description: 'خدمات تشغيل وصيانة راقية تضمن تجربة ضيافة استثنائية من صيانة المسابح والحدائق والإنظمة الكهربائية.',
          features: [
            'صيانة وتشغيل المسابح',
            'تنسيق الحدائق والري',
            'دعم فني على مدار الساعة',
          ],
        ),
        SectorModel(
          id: 'malls',
          title: 'المجمعات والمراكز التجارية',
          icon: 'storefront',
          description: 'إدارة تشغيلية وصيانة مستمرة للممرات والمرافق الخدمية وأنظمة الإنارة ومواقف السيارات ونظافة المنشآت.',
          features: [
            'نظافة المرافق والساحات',
            'صيانة الإنارة واللوحات',
            'إدارة بلاغات التشغيل',
          ],
        ),
        SectorModel(
          id: 'residential',
          title: 'المجمعات السكنية والكمباوندات',
          icon: 'apartment',
          description: 'إدارة متكاملة للمجمعات السكنية الفاخرة تشمل صيانة المرافق المشتركة والمسابح والحدائق وتوريد المياه.',
          features: [
            'صيانة المسابح والمناظر الطبيعية',
            'إدارة النظافة اليومية',
            'طوارئ وصيانة على مدار الساعة',
          ],
        ),
        SectorModel(
          id: 'financial',
          title: 'المقرات والبنوك والقطاع المالي',
          icon: 'account_balance_wallet',
          description: 'تشغيل آمن وموثوق للمرافق المصرفية الحساسة ومراكز البيانات والأنظمة الكهربائية والاحتياطية.',
          features: [
            'استمرارية التيار الكهربائي',
            'حماية المرافق الحرجة',
            'أعلى معايير السرية والجودة',
          ],
        ),
        SectorModel(
          id: 'airports',
          title: 'المطارات ومحطات النقل',
          icon: 'flight',
          description: 'تشغيل المرافق الحيوية في المطارات ومحطات القطار والنقل العام بنظم تشغيلية عالية الكفاءة.',
          features: [
            'جاهزية مستمرة 24/7',
            'صيانة شبكات الإنارة والضخ',
            'كوادر تشغيلية محترفة',
          ],
        ),
        SectorModel(
          id: 'sports',
          title: 'المنشآت والملاعب الرياضية',
          icon: 'sports_soccer',
          description: 'صيانة الملاعب العشبية والمسطحات، أنظمة الإضاءة الكاشفة، المسابح الأولمبية، ومرافق الرياضيين والجمهور.',
          features: [
            'صيانة العشب والري',
            'صيانة المسابح الأولمبية',
            'إضاءة الملاعب وأنظمة الطاقة',
          ],
        ),
      ];
    } else {
      return const [
        SectorModel(
          id: 'government',
          title: 'Government Entities & Public Authorities',
          icon: 'account_balance',
          description: 'O&M services for ministries, administrative bodies, and government facilities in strict adherence to governance standards.',
          features: [
            'Integrated Daily Operations',
            'Periodic Preventive Schedules',
            '24/7 Emergency Readiness',
          ],
        ),
        SectorModel(
          id: 'private',
          title: 'Corporate & Private Sector Towers',
          icon: 'corporate_fare',
          description: 'Total operational solutions for corporate headquarters to ensure business continuity and workplace excellence.',
          features: [
            'Professional Facility Oversight',
            'Electrical Systems Servicing',
            'Janitorial & Operational Support',
          ],
        ),
        SectorModel(
          id: 'industrial',
          title: 'Industrial Facilities & Complexes',
          icon: 'factory',
          description: 'Heavy infrastructure maintenance, power distribution switchboards, and dewatering support for demanding plants.',
          features: [
            'Transformer & Panelboard Care',
            'Bulk Water Tankers',
            'Occupational Safety Compliance',
          ],
        ),
        SectorModel(
          id: 'hospitals',
          title: 'Hospitals & Healthcare Facilities',
          icon: 'local_hospital',
          description: 'Critical facility care securing backup generators, clean water networks, and aseptic sanitation.',
          features: [
            'Instant Response Units',
            'Potable Water Supplies',
            'Sensitive System Diagnostics',
          ],
        ),
        SectorModel(
          id: 'universities',
          title: 'Universities & Academic Campuses',
          icon: 'school',
          description: 'Comprehensive campus management covering administrative buildings, lecture halls, and sprawling landscaping.',
          features: [
            'Landscape Architecture Care',
            'Academic Building Upkeep',
            'Seasonal Maintenance Plans',
          ],
        ),
        SectorModel(
          id: 'schools',
          title: 'Educational Complexes & Schools',
          icon: 'menu_book',
          description: 'Providing a safe and clean learning environment via electrical maintenance, pools, grounds, and HVAC checks.',
          features: [
            'Routine Preventive Care',
            'Pool & Sports Grounds Upkeep',
            'Campus Safety Compliance',
          ],
        ),
        SectorModel(
          id: 'hotels',
          title: 'Hotels & Hospitality Resorts',
          icon: 'hotel',
          description: 'High-end facility upkeep ensuring an impeccable guest journey through immaculate pools and manicured gardens.',
          features: [
            'Pool Operation & Care',
            'Landscape & Automated Irrigation',
            'Round-the-clock Technical Support',
          ],
        ),
        SectorModel(
          id: 'malls',
          title: 'Shopping Malls & Retail Hubs',
          icon: 'storefront',
          description: 'Seamless continuous upkeep of public concourses, lighting grids, customer amenities, and parking facilities.',
          features: [
            'Concourse Janitorial Care',
            'Lighting & Power Maintenance',
            'Real-time Ticket Processing',
          ],
        ),
        SectorModel(
          id: 'residential',
          title: 'Gated Compounds & Residential Communities',
          icon: 'apartment',
          description: 'Integrated compound management encompassing communal infrastructure, swimming pools, and landscape design.',
          features: [
            'Pool & Green Space Servicing',
            'Daily Sanitation Services',
            '24/7 On-Call Technicians',
          ],
        ),
        SectorModel(
          id: 'financial',
          title: 'Financial Institutions & Banking Hubs',
          icon: 'account_balance_wallet',
          description: 'High-security O&M protocols for sensitive financial centers, server data centers, and backup power equipment.',
          features: [
            'Power Continuity Systems',
            'Critical Asset Safeguarding',
            'Top Quality & Security Compliance',
          ],
        ),
        SectorModel(
          id: 'airports',
          title: 'Airports & Transport Terminals',
          icon: 'flight',
          description: 'Operating mission-critical infrastructure in airport terminals and train stations with optimal uptime.',
          features: [
            '24/7 Continuous Operation',
            'Lighting & Pumping Grids',
            'Certified Operations Personnel',
          ],
        ),
        SectorModel(
          id: 'sports',
          title: 'Sports Stadia & Athletic Arenas',
          icon: 'sports_soccer',
          description: 'Maintaining turf pitches, high-intensity stadium lighting, Olympic swimming pools, and spectator concourses.',
          features: [
            'Turf Care & Modern Irrigation',
            'Olympic Pool Servicing',
            'Floodlight & Power Grid Maintenance',
          ],
        ),
      ];
    }
  }

  // FAQs
  static List<FaqModel> getFaqs(bool isAr) {
    if (isAr) {
      return const [
        FaqModel(
          question:
              'ما هي الخدمات الفنية والتشغيلية التي تقدمها شركة تاج قرطبة؟',
          answer: 'تتخصص شركتنا في تقديم منظومة متكاملة من 11 فئة معتمدة تشمل: إدارة وتشغيل وصيانة المرافق، الصيانة الكهربائية والتكييف، رعاية وتنسيق الحدائق وشبكات الري، توريد المياه، نزح مياه الصرف الصحي، تشغيل معدات ضخ المياه، نظافة المرافق والخدمات المساندة، الصيانة الوقائية والتصحيحية، صيانة وتشغيل المسابح، خدمات الطوارئ 24/7، وعقود التشغيل والصيانة المتخصصة.',
        ),
        FaqModel(
          question: 'هل تخدم شركة تاج قرطبة القطاعين الحكومي والخاص؟',
          answer: 'نعم، نحن نقدم خدماتنا الاحترافية للمشاريع والمنشآت الحكومية، الوزارات، الهيئات، المجمعات التجارية، المنشآت الصناعية، المستشفيات، الجامعات، الفنادق، والمجمعات السكنية الخاصة في كافة مناطق المملكة العربية السعودية.',
        ),
        FaqModel(
          question: 'ما هو المقصود بالصيانة الوقائية وكيف تطبقونها؟',
          answer: 'نضع خططاً وبرامج فحص دورية مجدولة (أسبوعية، شهرية، فصليّة) لكافة الأنظمة والمعدات واللوحات والشبكات، مما يتيح اكتشاف الأعطال قبل حدوثها ويقلل التوقفات المفاجئة ويحافظ على القيمة التشغيلية للأصول.',
        ),
        FaqModel(
          question: 'كيف يمكننا طلب عرض سعر أو التعاقد التشغيلي معكم؟',
          answer: 'بإمكانك طلب عرض سعر مخصص مباشرة عبر تعبئة النموذج المتوفر في التطبيق، أو عبر التواصل المباشر بالهاتف أو الواتساب، وسيقوم فريقنا الفني بدراسة المتطلبات وتقديم عرض متكامل خلال 24 ساعة.',
        ),
        FaqModel(
          question:
              'هل تتوفر لديكم طواقم صيانة لحالات الطوارئ وبلاغات الأعطال؟',
          answer: 'نعم، نوفر مركز بلاغات واستجابة سريعة على مدار الساعة (24/7) مع فرق ميدانية متأهبة للتعامل الفوري مع الأعطال الكهربائية الطارئة، طلبات توريد المياه العاجلة، ونزح الصرف الصحي الطارئ.',
        ),
        FaqModel(
          question: 'ما هي معايير الجودة والسلامة المهنية المطبقة لديكم؟',
          answer: 'نطبق لوائح السلامة المهنية المعتمدة محلياً ودولياً، وتخضع كوادرنا الفنية لبرامج تدريب مستمرة وإشراف هندسي مباشر لضمان تنفيذ كافة الأعمال وفق أعلى معايير الجودة ومستويات الأداء المتفق عليها (SLA).',
        ),
        FaqModel(
          question: 'هل تقدمون خدمات توريد المياه ونزح الصرف الصحي بعقود دورية ومجدولة؟',
          answer: 'نعم، نمتلك أسطولاً حديثاً ومجهزاً من صهاريج (تناكر) المياه ومعدات الضخ والنزح السريع، ونتيح التعاقد بنظام التوريد والنزح المجدول أو عند الطلب الفوري لمختلف المنشآت والمشاريع والمرافق.',
        ),
        FaqModel(
          question: 'ما هو نطاق خدمات صيانة وتشغيل المسابح التي توفرونها؟',
          answer: 'تشمل خدماتنا تنظيف وتعقيم مياه المسابح، فحص الجودة الكيميائية، صيانة المضخات والفلاتر وأنظمة التدوير، معالجة التسربات، والتجهيز الموسمي للمسابح في المجمعات السكنية والفنادق والمنشآت الرياضية.',
        ),
      ];
    } else {
      return const [
        FaqModel(
          question: 'What technical and operational services does Taj Cortba provide?',
          answer: 'Taj Cortba provides an integrated portfolio of 11 approved service categories: Total Facility Management, Electrical, HVAC and Electromechanical Maintenance, Landscaping, Green Spaces and Irrigation, Bulk Water Supply Logistics, Sewage and Wastewater Drainage, Water Pumping Equipment Operation, Facility Cleaning and Support, Preventive and Corrective Maintenance, Swimming Pool Operations, 24/7 Emergency Rapid Response, and Sector-Specific O&M Contracts.',
        ),
        FaqModel(
          question:
              'Does Taj Cortba serve both the government and private sectors?',
          answer: 'Yes, we provide certified engineering and operational services to government ministries, public authorities, corporate towers, industrial complexes, hospitals, universities, schools, luxury hotels, and private residential compounds throughout Saudi Arabia.',
        ),
        FaqModel(
          question:
              'What is preventive maintenance and how do you implement it?',
          answer: 'We design scheduled inspection regimens (weekly, monthly, quarterly) across all electromechanical systems, switchboards, and hydraulic networks. This proactive method identifies potential defects before breakdowns happen, minimizing costly downtime and extending asset operational lifespans.',
        ),
        FaqModel(
          question: 'How can we request a tailored price quote or initiate contracting?',
          answer: 'You can submit a custom quotation request directly through the app quote form, or contact our team via phone or WhatsApp. Our technical team evaluates requirements and responds with a detailed proposal within 24 hours.',
        ),
        FaqModel(
          question: 'Do you offer emergency technical standby crews for urgent tickets?',
          answer: 'Yes, we maintain a 24/7 rapid response dispatch desk and mobile field teams on standby to resolve power outages, water supply emergencies, and critical drainage overflows.',
        ),
        FaqModel(
          question: 'What quality and safety standards are enforced across your projects?',
          answer: 'We adhere to stringent occupational safety regulations and international facility management guidelines. Our engineers and technicians undergo continuous certified safety and technical training.',
        ),
        FaqModel(
          question: 'Do you offer scheduled contracts for water deliveries and sewage dewatering?',
          answer: 'Yes, we operate an advanced fleet of water supply tankers and vacuum pumping units, offering recurring scheduled arrangements as well as immediate on-demand mobilization.',
        ),
        FaqModel(
          question: 'What is the scope of swimming pool maintenance services provided?',
          answer: 'Our scope encompasses chemical water balancing and testing, circulation pump servicing, filtration sand overhauls, tile leak mitigation, and seasonal pool commissioning.',
        ),
      ];
    }
  }

  // Why Choose Us
  static List<ValueModel> getWhyUs(bool isAr) {
    if (isAr) {
      return const [
        ValueModel(
          title: 'خبرة واسعة',
          description: 'أكثر من 15 عاماً من الخبرة والريادة في قطاع التشغيل والصيانة وإدارة المرافق بالمملكة.',
        ),
        ValueModel(
          title: 'فريق فني متخصص',
          description: 'مهندسون وفنيون معتمدون يتمتعون بمهارة عالية في أعمال الحدائق، والكهرباء والتشغيل.',
        ),
        ValueModel(
          title: 'جودة معتمدة',
          description: 'نطبق معايير الجودة العالمية واللوائح المعتمدة محلياً لضمان سلامة العمليات.',
        ),
        ValueModel(
          title: 'عقود مستوى الخدمة',
          description: 'نلتزم بالمواعيد المحددة ومستويات الخدمة (SLA) المتفق عليها مع العميل بدقة.',
        ),
        ValueModel(
          title: 'حلول وقائية متكاملة',
          description: 'خطط صيانة ذكية واستباقية تحمي أصولكم وتقلل الكلف التشغيلية على المدى الطويل.',
        ),
        ValueModel(
          title: 'دعم واستجابة 24/7',
          description: 'جاهزية قصوى واستجابة سريعة جداً لبلاغات الأعطال والحالات الطارئة على مدار الساعة.',
        ),
      ];
    } else {
      return const [
        ValueModel(
          title: 'Decades of Proven Experience',
          description: 'Over 15 years of industry leadership in facility management and electromechanical maintenance across Saudi Arabia.',
        ),
        ValueModel(
          title: 'Certified Engineering Team',
          description: 'Highly skilled engineers and certified technicians specialized in electrical, HVAC, landscaping, and water systems.',
        ),
        ValueModel(
          title: 'Certified Quality Standards',
          description: 'Strict implementation of international quality frameworks and regulatory guidelines across all operational sites.',
        ),
        ValueModel(
          title: 'Strict SLA Adherence',
          description: 'Full compliance with agreed Service Level Agreements, measurable KPIs, and delivery timelines.',
        ),
        ValueModel(
          title: 'Comprehensive Preventive Plans',
          description: 'Smart proactive maintenance protocols protecting asset longevity and reducing ongoing capital costs.',
        ),
        ValueModel(
          title: '24/7 Rapid Response',
          description: 'Unmatched operational readiness and round-the-clock emergency assistance for unexpected system defects.',
        ),
      ];
    }
  }

  // Stats
  static List<StatModel> getStats(bool isAr) {
    if (isAr) {
      return const [
        StatModel(value: 15, suffix: '+', label: 'سنة خبرة'),
        StatModel(value: 250, suffix: '+', label: 'عقد صيانة وتشغيل'),
        StatModel(value: 120, suffix: '+', label: 'شريك نجاح'),
        StatModel(value: 350, suffix: '+', label: 'فني متخصص'),
      ];
    } else {
      return const [
        StatModel(value: 15, suffix: '+', label: 'Years Experience'),
        StatModel(value: 250, suffix: '+', label: 'Active Contracts'),
        StatModel(value: 120, suffix: '+', label: 'Success Partners'),
        StatModel(value: 350, suffix: '+', label: 'Technicians'),
      ];
    }
  }

  // Values
  static List<ValueModel> getValues(bool isAr) {
    if (isAr) {
      return const [
        ValueModel(
          title: 'الجودة الشاملة',
          description: 'نلتزم بتطبيق أرقى معايير الجودة الشاملة في كافة الخدمات التشغيلية والفنية الموكلة إلينا.',
        ),
        ValueModel(
          title: 'السلامة المهنية',
          description: 'توفير بيئة عمل آمنة هي أولويتنا القصوى لحماية الكوادر والممتلكات والمرافق والبيئة.',
        ),
        ValueModel(
          title: 'السرعة والاستجابة',
          description: 'جاهزية قصوى واستجابة فورية على مدار الساعة (24/7) للتعامل مع البلاغات وحالات الطوارئ.',
        ),
        ValueModel(
          title: 'الاستدامة والابتكار',
          description: 'نوظف أحدث الحلول الفنية والتقنيات الذكية لضمان إطالة العمر التشغيلي للمرافق وترشيد استهلاك الموارد.',
        ),
        ValueModel(
          title: 'الالتزام والشفافية',
          description: 'شركاء حقيقيون لعملائنا، نلتزم بالجداول الزمنية ومستويات الخدمة المعتمدة (SLA) بأعلى درجات الشفافية.',
        ),
        ValueModel(
          title: 'الاحترافية والتطوير',
          description: 'فريق هندسي وفني متخصص يخضع لبرامج تدريب وتأهيل مستمرة لمواكبة أحدث الممارسات العالمية.',
        ),
      ];
    } else {
      return const [
        ValueModel(
          title: 'Total Quality',
          description: 'Committed to executing comprehensive quality standards across all operational assignments.',
        ),
        ValueModel(
          title: 'Occupational Safety',
          description: 'Safeguarding our workforce, client properties, facilities, and the environment is our primary priority.',
        ),
        ValueModel(
          title: 'Rapid 24/7 Response',
          description: 'Unmatched operational readiness and swift response around the clock to handle emergencies.',
        ),
        ValueModel(
          title: 'Sustainability & Innovation',
          description: 'Deploying smart engineering practices to prolong asset lifespans and conserve resources.',
        ),
        ValueModel(
          title: 'Integrity & Transparency',
          description: 'Genuine client partnerships driven by strict adherence to approved SLAs and transparent reporting.',
        ),
        ValueModel(
          title: 'Professional Excellence',
          description: 'Specialized engineers and certified technicians undergoing continuous training.',
        ),
      ];
    }
  }

  // Testimonials
  static List<TestimonialModel> getTestimonials(bool isAr) {
    if (isAr) {
      return const [
        TestimonialModel(
          id: 1,
          name: 'م. عبدالله العتيبي',
          role: 'مدير تشغيل – هيئة حكومية',
          text: 'تعاملنا مع شركة تاج قرطبة في عقود تشغيل وصيانة شاملة لمبانينا الإدارية، وكان الأداء احترافياً للغاية من حيث كفاءة المهندسين والالتزام الدقيق بجداول الصيانة الوقائية.',
          rating: 5,
        ),
        TestimonialModel(
          id: 2,
          name: 'سارة المحمد',
          role: 'مديرة المرافق – مجمع تجاري',
          text: 'شركة موثوقة جداً في صيانة الشبكات واللوائح الكهربائية، حيث استجابتهم لبلاغات الطوارئ سريعة على مدار الساعة، ولديهم طواقم ذات كفاءة عالية وحلول مرنة تفوق التوقعات.',
          rating: 5,
        ),
        TestimonialModel(
          id: 3,
          name: 'خالد الشمري',
          role: 'مدير مجلس إدارة مجمع النخبة السكني',
          text: 'أسندنا لشركة تاج قرطبة إدارة وصيانة المجمع وتنسيق المسطحات الخضراء وتشغيل صهاريج المياه وصيانة المسابح، ووجدنا انضباطاً تاماً وجمالية فائقة وتعاملاً راقياً.',
          rating: 5,
        ),
      ];
    } else {
      return const [
        TestimonialModel(
          id: 1,
          name: 'Eng. Abdullah Al-Otaibi',
          role: 'Operations Director – Public Authority',
          text: 'We engaged Taj Cortba for comprehensive O&M contracts for our headquarters. Their engineering expertise and strict adherence to preventive maintenance were exceptional.',
          rating: 5,
        ),
        TestimonialModel(
          id: 2,
          name: 'Sarah Al-Mohammad',
          role: 'Facility Manager – Commercial Mall',
          text: 'An exceptionally reliable partner in electrical networks and HVAC. Their 24/7 emergency response is rapid, and their technical teams provide proactive solutions.',
          rating: 5,
        ),
        TestimonialModel(
          id: 3,
          name: 'Khaled Al-Shammari',
          role: 'Board President – Al-Nokhba Complex',
          text: 'We entrusted Taj Cortba with our complex facility management, landscape care, water tanker operations, and swimming pools. We experienced supreme professionalism.',
          rating: 5,
        ),
      ];
    }
  }

  // Partners list
  static List<String> getPartners(bool isAr) {
    if (isAr) {
      return const [
        'وزارة الشؤون البلدية والقروية والإسكان',
        'هيئة تطوير بوابة الدرعية',
        'أمانة منطقة الرياض',
        'الشركة السعودية للكهرباء',
        'شركة المياه الوطنية',
        'وزارة الصحة',
        'وزارة التعليم',
        'هيئة المدن الصناعية (مدن)',
      ];
    } else {
      return const [
        'Ministry of Municipal & Rural Affairs and Housing',
        'Diriyah Gate Development Authority',
        'Riyadh Region Municipality',
        'Saudi Electricity Company',
        'National Water Company',
        'Ministry of Health',
        'Ministry of Education',
        'Saudi Authority for Industrial Cities (MODON)',
      ];
    }
  }
}
