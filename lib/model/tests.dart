import 'package:aqueduct/aqueduct.dart';
import 'package:covid/covid.dart';

class Tests extends ManagedObject<_Tests> implements _Tests {}

class _Tests {
  @Column(primaryKey: true, autoincrement: true)
  int id;

  @Column(nullable: false)
  int totalTests;

  @Column(nullable: false)
  int newPositive;

  @Column(nullable: false)
  int newNegative;

  @Column(nullable: false)
  int totalCummulativeTests;

  @Column(nullable: false)
  DateTime lastUpdated;
}
