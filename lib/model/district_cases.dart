import 'package:aqueduct/aqueduct.dart';
import 'package:covid/covid.dart';

class DistrictCases extends ManagedObject<_DistrictCases>
    implements _DistrictCases {
  @override
  void willUpdate() {
    lastUpdated = DateTime.now().toLocal();
  }
}

class _DistrictCases {
  @Column(primaryKey: true, nullable: false, indexed: true)
  String districtName;

  @Column(nullable: false, indexed: true)
  String region;

  @Column(nullable: false)
  int cases;

  @Column(nullable: false)
  int deaths;

  @Column(nullable: false)
  int recoveries;

  @Column(nullable: false)
  DateTime lastUpdated;
}
