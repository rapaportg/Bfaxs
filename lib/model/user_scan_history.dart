import 'dart:developer';

import 'package:bfaxs/bfaxs.dart';

class _UserScanHistory {
  @primaryKey
  int id;

  @Column()
  int userID;

  @Column()
  int productID;

  @Column()
  String areacode;

  @Column()
  String state;

  @Column()
  int locID;

  @Column()
  String county;

  @Column()
  String region;

  @Column()
  String postalCode;
  
  @Column()
  String city;

}

class UserScanHistory extends ManagedObject<_UserScanHistory> implements _UserScanHistory{
   
} 