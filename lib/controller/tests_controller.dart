import 'package:aqueduct/aqueduct.dart';
import 'package:covid/covid.dart';
import 'package:covid/model/tests.dart';

class TestsController extends ResourceController {
  TestsController(this.context);

  final ManagedContext context;

  @Operation.get()
  Future<Response> getTestsSummary() async {
    final testsQuery = Query<Tests>(context);
    final tests = await testsQuery.fetch();

    return Response.ok(tests);
  }

  @Operation.put()
  Future<Response> putTestsSummary() async {
    final tests = Tests()
      ..read(await request.body.decode(), ignore: ["id", "lastUpdated"]);

    final query = Query<Tests>(context)
      ..values = tests
      ..where((t) => t.lastUpdated).lessThan(DateTime.now().toLocal());

    final updateTests = await query.updateOne();

    return Response.ok(updateTests);
  }
}
