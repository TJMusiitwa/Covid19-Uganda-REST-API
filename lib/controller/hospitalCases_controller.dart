import 'package:aqueduct/aqueduct.dart';
import 'package:covid/covid.dart';
import 'package:covid/model/hospital_cases.dart';

class HospitalCasesController extends ResourceController {
  HospitalCasesController(this.context);
  final ManagedContext context;

  @Operation.get("hospital_name")
  Future<Response> getHospitalByName(
      @Bind.path("hospital_name") String hospitalName) async {
    final hospitalQueryByName = Query<HospitalCases>(context)
      ..where((h) => h.hospitalName)
          .equalTo(hospitalName, caseSensitive: false);
    final hospitalNameQuery = await hospitalQueryByName.fetchOne();

    return Response.ok(hospitalNameQuery);
  }

  @Operation.get()
  Future<Response> getHospitalCases() async {
    final hospitalQuery = Query<HospitalCases>(context);
    hospitalQuery.sortBy((h) => h.hospitalName, QuerySortOrder.ascending);
    final hospitalCases = await hospitalQuery.fetch();

    return Response.ok(hospitalCases);
  }

  @Operation.put("hospital_name")
  Future<Response> updateHospital(
      @Bind.path("hospital_name") String hospitalName,
      @Bind.body(ignore: ["lastUpdated"]) HospitalCases hospitalCases) async {
    final hospitalCase = HospitalCases()..read(await request.body.decode());

    final hospitalQueryByName = Query<HospitalCases>(context)
      ..values = hospitalCase
      ..where((h) => h.hospitalName).equalTo(hospitalName);

    final updateHospital = await hospitalQueryByName.updateOne();
    return Response.ok(updateHospital);
  }

  // @Operation.put("hospital_name")
  // Future<Response> updateDistrict() async {
  //   final hospitalCase = HospitalCases()..read(await request.body.decode());

  //   final query = Query<HospitalCases>(context)..values = hospitalCase
  //   ..where((h) => h.hospitalName).equalTo(hospitalCase.hospitalName);

  //   final updateHospital = await query.updateOne();

  //   return Response.ok(updateHospital);
  // }

  @Operation.post()
  Future<Response> addHospital() async {
    final hospital = HospitalCases()..read(await request.body.decode());

    final hospitalEntryQuery = Query<HospitalCases>(context)..values = hospital;

    final insertHospitalEntry = await hospitalEntryQuery.insert();

    return Response.ok(insertHospitalEntry);
  }
}
