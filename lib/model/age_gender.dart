import 'package:aqueduct/aqueduct.dart';
import 'package:covid/covid.dart';

class AgeGender extends ManagedObject<_AgeGender> implements _AgeGender {
  void willCreate() {
    calcTotal();
  }

  @override
  void willUpdate() {
    calcTotal();
    updatedDate = DateTime.now().toLocal();
  }

  void calcTotal() {
    totalAgeGroup = male + female;
  }

  @override
  void willInsert() {
    updatedDate = DateTime.now().toLocal();
  }
}

class _AgeGender {
  @Column(primaryKey: true, autoincrement: true)
  int id;

  String ageGroup;
  int male;
  int female;
  int totalAgeGroup;
  DateTime updatedDate;
}
