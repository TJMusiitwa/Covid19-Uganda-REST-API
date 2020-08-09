import 'package:aqueduct/aqueduct.dart';
import 'package:covid/covid.dart';
import 'package:covid/model/summary.dart';

class SummaryController extends ResourceController {
  SummaryController(this.context);
  final ManagedContext context;

  @Operation.get()
  Future<Response> getSummary() async {
    final summaryQuery = Query<Summary>(context);
    final summary = await summaryQuery.fetch();

    return Response.ok(summary)
      ..cachePolicy = const CachePolicy(expirationFromNow: Duration(days: 1));
  }

  @Operation.put()
  Future<Response> updateSummary() async {
    final summary = Summary()
      ..read(await request.body.decode(), ignore: ["id"]);

    final query = Query<Summary>(context)
      ..values = summary
      ..where((s) => s.lastUpdated).lessThan(DateTime.now().toLocal());

    final updateSummary = await query.updateOne();

    return Response.ok(updateSummary);
  }
}
