import 'package:aqueduct/aqueduct.dart';
import 'package:covid/covid.dart';
import 'package:covid/model/district_cases.dart';

class DistrictCasesController extends ResourceController {
  DistrictCasesController(this.context);
  final ManagedContext context;

  @Operation.get()
  Future<Response> getDistricts() async {
    final districtQuery = Query<DistrictCases>(context);
    districtQuery
      ..fetchLimit = 20
      ..pageBy(
        (d) => d.districtName,
        QuerySortOrder.ascending,
      );

    final districtCases = await districtQuery.fetch();
    return Response.ok(districtCases);
  }

  @Operation.post()
  Future<Response> addDistrict() async {
    final district = DistrictCases()..read(await request.body.decode());

    final districtEntryQuery = Query<DistrictCases>(context)..values = district;

    final insertDistrictEntry = await districtEntryQuery.insert();

    return Response.ok(insertDistrictEntry);
  }

  @Operation.get("district_name")
  Future<Response> getDistrictByName(
      @Bind.path("district_name") String districtName) async {
    final districtQuery = Query<DistrictCases>(context);
    districtQuery
        .where((d) => d.districtName)
        .equalTo(districtName, caseSensitive: false);

    final singleDistrict = await districtQuery.fetchOne();
    return Response.ok(singleDistrict);
  }

  // @Operation.put("district_name")
  // Future<Response> updateDistrict() async {
  //   final districtCase = DistrictCases()..read(await request.body.decode());

  //   final query = Query<DistrictCases>(context)..values = districtCase;

  //   final postedDistrictCase = await query.update();

  //   return Response.ok(postedDistrictCase);
  // }

  @Operation.put("district_name")
  Future<Response> updateDistrictByName(
      @Bind.path("district_name") String districtName,
      @Bind.body(ignore: ["lastUpdated"]) DistrictCases districtCases) async {
    final query = Query<DistrictCases>(context)
      ..where((x) => x.districtName).equalTo(districtName);

    final updatedDistrictCase = await query.updateOne();

    return Response.ok(updatedDistrictCase);
  }
}
