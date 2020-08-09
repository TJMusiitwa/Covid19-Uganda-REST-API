import 'package:aqueduct/aqueduct.dart';
import 'package:covid/covid.dart';
import 'package:covid/model/timeline.dart';

class TimelineController extends ResourceController {
  TimelineController(this.context);

  final ManagedContext context;

  @Operation.get()
  Future<Response> getTimeline() async {
    final timelineQuery = Query<Timeline>(context);
    timelineQuery.sortBy((t) => t.createdAt, QuerySortOrder.ascending);
    final timeline = await timelineQuery.fetch();

    return Response.ok(timeline)
      ..cachePolicy = const CachePolicy(expirationFromNow: Duration(days: 1));
  }

  @Operation.post()
  Future<Response> addTimelineEntry() async {
    final timeline = Timeline()
      ..read(await request.body.decode(), ignore: ["id", "createdAt"]);
    final timelineEntryQuery = Query<Timeline>(context)..values = timeline;

    final insertTimelineEntry = await timelineEntryQuery.insert();
    return Response.ok(insertTimelineEntry);
  }
}
