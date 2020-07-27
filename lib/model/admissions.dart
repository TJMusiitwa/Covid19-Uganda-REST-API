import 'package:aqueduct/aqueduct.dart';
import 'package:covid/covid.dart';

class Admissions extends ManagedObject<_Admissions> implements _Admissions {}

class _Admissions {
  @Column(primaryKey: true, autoincrement: true)
  int id;
  int currentlyAdmitted;
  int newAdmissions;
  int newDischarges;

  @Column(nullable: false)
  DateTime lastUpdated;
}
