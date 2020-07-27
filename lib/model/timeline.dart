import 'package:aqueduct/aqueduct.dart';
import 'package:covid/covid.dart';

class Timeline extends ManagedObject<_Timeline> implements _Timeline {
  @override
  void willInsert() {
    createdAt = DateTime.now().toLocal();
  }
}

class _Timeline {
  @Column(primaryKey: true, autoincrement: true, omitByDefault: true)
  int id;

  @Column(nullable: false)
  DateTime createdAt;

  @Column(nullable: false)
  int cases;

  @Column(nullable: false)
  int deaths;

  @Column(nullable: false)
  int recoveries;
}
