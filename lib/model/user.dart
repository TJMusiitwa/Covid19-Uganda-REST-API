import 'package:aqueduct/aqueduct.dart';
import 'package:covid/covid.dart';
import 'package:aqueduct/managed_auth.dart';

//TODO: This  class will have to be monitored for the possibility of removal
class User extends ManagedObject<_User>
    implements _User, ManagedAuthResourceOwner<_User> {
  @Serialize(input: true, output: false)
  String password;
}

class _User extends ResourceOwnerTableDefinition {}
