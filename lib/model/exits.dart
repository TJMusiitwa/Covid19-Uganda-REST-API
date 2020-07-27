import 'package:aqueduct/aqueduct.dart';
import 'package:covid/covid.dart';

class Exits extends ManagedObject<_Exits> implements _Exits {}

class _Exits {
  @Column(primaryKey: true, autoincrement: true)
  int id;

  @Column(nullable: false)
  int selfExits;
  @Column(nullable: false, defaultValue: "0")
  int repatriations;

  @Column(nullable: false)
  DateTime lastUpdated;
}
