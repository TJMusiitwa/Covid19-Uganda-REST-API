import 'package:aqueduct/aqueduct.dart';
import 'package:covid/covid.dart';

class HospitalCases extends ManagedObject<_HospitalCases>
    implements _HospitalCases {
  @override
  void willUpdate() {
    lastUpdated = DateTime.now().toLocal();
  }

  @override
  void willInsert() {
    createdDate = DateTime.now().toLocal();
  }
}

class _HospitalCases {
  @Column(primaryKey: true, nullable: false, indexed: true)
  String hospitalName;

  @Column(nullable: false)
  int cases;

  @Column(nullable: false)
  int deaths;

  @Column(nullable: false)
  int recoveries;

  @Column(nullable: false)
  DateTime lastUpdated;

  @Column(nullable: false)
  DateTime createdDate;
}
