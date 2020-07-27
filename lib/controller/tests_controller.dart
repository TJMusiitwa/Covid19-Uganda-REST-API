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
}
