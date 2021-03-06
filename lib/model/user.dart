import 'package:bfaxs/bfaxs.dart';

class _User {
  @primaryKey
  int id;

  @Column(unique: true)
  String email;

  @Column()
  String name;

  @Column()
  String password; // Encrypt this later

  @Column()
  String role;

}

class User extends ManagedObject<_User> implements _User {}