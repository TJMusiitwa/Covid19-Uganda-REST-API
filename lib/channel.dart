import 'dart:io';

import 'package:aqueduct/managed_auth.dart';
import 'package:covid/controller/age_group_controller.dart';
import 'package:covid/controller/districtCases_controller.dart';
import 'package:covid/controller/hospitalCases_controller.dart';
import 'package:covid/controller/register_controller.dart';
import 'package:covid/controller/timeline_controller.dart';
import 'package:covid/model/user.dart';

import 'controller/summary_controller.dart';
import 'covid.dart';

/// This type initializes an application.
///
/// Override methods in this class to set up routes and initialize services like
/// database connections. See http://aqueduct.io/docs/http/channel/.
class CovidChannel extends ApplicationChannel {
  /// Initialize services in this method.
  ///
  /// Implement this method to initialize services, read values from [options]
  /// and any other initialization required before constructing [entryPoint].
  ///
  /// This method is invoked prior to [entryPoint] being accessed.
  ManagedContext context;

  AuthServer authServer;

  @override
  Future prepare() async {
    logger.onRecord.listen(
        (rec) => print("$rec ${rec.error ?? ""} ${rec.stackTrace ?? ""}"));
    final config = CovidConfiguration(options.configurationFilePath);
    final dataModel = ManagedDataModel.fromCurrentMirrorSystem();
    final persistentStore = PostgreSQLPersistentStore.fromConnectionInfo(
      config.database.username,
      config.database.password,
      config.database.host,
      config.database.port,
      config.database.databaseName,
    );

    context = ManagedContext(dataModel, persistentStore);
//TODO: Pay attention to this and fix when possible.
    final authStorage = ManagedAuthDelegate<User>(context);
    authServer = AuthServer(authStorage);
  }

  /// Construct the request channel.
  ///
  /// Return an instance of some [Controller] that will be the initial receiver
  /// of all [Request]s.
  ///
  /// This method is invoked after [prepare].
  @override
  Controller get entryPoint {
    final router = Router();

    router.route("/summary").link(() => SummaryController(context));

    router
        .route("/districts/[:district_name]")
        .link(() => DistrictCasesController(context));

    router
        .route("/hospitals/[:hospital_name]")
        .link(() => HospitalCasesController(context));

    router.route("/timeline").link(() => TimelineController(context));

    router
        .route("/agegenderstats/[:age_group]")
        .link(() => AgeGenderController(context));

    router
        .route("/register")
        .link(() => RegisterController(context, authServer));

    router.route("/auth/token").link(() => AuthController(authServer));

    router.route("/example").linkFunction((request) async {
      return Response.ok({"key": "value"});
    });

    router.route("/").linkFunction((request) async {
      return Response.ok("Hello World");
    });

//* Route to Swagger Documentation
    router.route("/client").linkFunction((request) async {
      final client = await File('client.html').readAsString();
      return Response.ok(client)..contentType = ContentType.html;
    });

    return router;
  }
}

class CovidConfiguration extends Configuration {
  CovidConfiguration(String fileName) : super.fromFile(File(fileName));

  DatabaseConfiguration database;
}

//*Command to run migrations:
//pub run aqueduct db upgrade --connect postgres://postgres:password@localhost:5432/database
