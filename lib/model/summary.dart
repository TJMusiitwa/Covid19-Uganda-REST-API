import 'package:aqueduct/aqueduct.dart';
import 'package:covid/covid.dart';

class Summary extends ManagedObject<_Summary> implements _Summary {
  @override
  void willUpdate() {
    lastUpdated = DateTime.now().toLocal();
  }
}

class _Summary {
  @Column(primaryKey: true, autoincrement: true, omitByDefault: true)
  int id;

  @Column(nullable: false)
  int cases;

  @Column(nullable: false)
  int deaths;

  @Column(nullable: false)
  int recoveries;

  @Column(nullable: false)
  DateTime lastUpdated;
}
