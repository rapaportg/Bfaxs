import 'package:bfaxs/bfaxs.dart';

class _ProductBatch {
  @primaryKey
  int id;

  @Column()
  String brand;

  @Column()
  DateTime publishedDate;

  @Column()
  String strain;

  @Column()
  String name;

  @Column()
  int cbdContent;

  @Column()
  int thcContent;

  @Column()
  String labResults;

  @Column()
  String image; //64 byte encoded

  @Column()
  int numInBatch;

}

class ProductBatch extends ManagedObject<_ProductBatch> implements _ProductBatch {
  @Serialize()
  String get details => '$name - $brand';
}