import 'package:aqueduct/aqueduct.dart';
import 'package:covid/covid.dart';
import 'package:covid/model/age_gender.dart';

class AgeGenderController extends ResourceController {
  AgeGenderController(this.context);
  final ManagedContext context;

  @Operation.get()
  Future<Response> getAgeGenderStats() async {
    final ageGenderQuery = Query<AgeGender>(context);
    final stat = await ageGenderQuery.fetch();

    return Response.ok(stat);
  }

  @Operation.get('age_group')
  Future<Response> getAgeGenderStatsByAgeGroup(
      @Bind.path("age_group") String ageGroup) async {
    final ageGenderQueryByAgeGroup = Query<AgeGender>(context)
      ..where((ag) => ag.ageGroup).equalTo(ageGroup, caseSensitive: false);
    final ageGroupQuery = await ageGenderQueryByAgeGroup.fetchOne();

    return Response.ok(ageGroupQuery);
  }

  @Operation.put('age_group')
  Future<Response> updateAgeGenderStats(@Bind.path("age_group") String ageGroup,
      @Bind.body(ignore: ["lastUpdated"]) AgeGender ageGender) async {
    final ageGender = AgeGender()
      ..read(await request.body.decode(),
          ignore: ["id", "totalAgeGroup", "updatedDate"]);

    final query = Query<AgeGender>(context)
      ..values = ageGender
      ..where((ag) => ag.ageGroup).equalTo(ageGroup);

    final updateAgeGroup = await query.updateOne();
    return Response.ok(updateAgeGroup);
  }

  @Operation.post()
  Future<Response> addAgeGenderEntry() async {
    final ageGender = AgeGender()
      ..read(await request.body.decode(), ignore: ["id"]);
    final ageGenderEntryQuery = Query<AgeGender>(context)..values = ageGender;

    final insertAgeGenderEntry = await ageGenderEntryQuery.insert();
    return Response.ok(insertAgeGenderEntry);
  }
}
