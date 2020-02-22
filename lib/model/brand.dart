import 'package:bfaxs/bfaxs.dart';

class _Brand {
  @primaryKey
  int id;

  @Column()
  String name;

  @Column()
  String state;

  @Column(unique: true)
  String email;

  @Column()
  String lisenceNum;
}

class Brand extends ManagedObject<_Brand> implements _Brand {
  @Serialize()
  String get details => '$name - $state';
}