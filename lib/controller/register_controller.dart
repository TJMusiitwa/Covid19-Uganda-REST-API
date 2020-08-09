import 'dart:async';

import 'package:aqueduct/aqueduct.dart';
import 'package:covid/model/user.dart';

class RegisterController extends ResourceController {
  RegisterController(this.context, this.authServer);

  final ManagedContext context;
  final AuthServer authServer;
//TODO: Will need to look into how to work on this Authorization
  @Operation.post()
  Future<Response> createAdmin(@Bind.body() User user) async {
    if (user.username == null || user.password == null) {
      return Response.badRequest(
          body: {"Error": "Username and password is required"});
    }
    user
      ..salt = AuthUtility.generateRandomSalt()
      ..hashedPassword = authServer.hashPassword(user.password, user.salt);

    return Response.ok(await Query(context, values: user).insert());
  }
}
