import 'dart:core';

import 'package:bfaxs/bfaxs.dart';

class _Product {
  @primaryKey
  int id;

  @Column()
  int batchID;

  @Column()
  bool isScanned;

  @Column()
  DateTime firstScanDate;

  @Column()
  String stateOfFirstScan;

  @Column()
  int locID;

  @Column()
  String countyOfFirstScan;

  @Column()
  String regionOfFirstScan;

  @Column()
  String postalCodeOfFirstScan;

  @Column()
  String cityOfFirstScan; 

}

class Product extends ManagedObject<_Product> implements _Product {
  @Serialize()
  String get details => '$id - $isScanned';
}