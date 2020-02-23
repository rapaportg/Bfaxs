import 'dart:async';
import 'package:aqueduct/aqueduct.dart';   

class Migration1 extends Migration { 
  @override
  Future upgrade() async {
   		database.createTable(SchemaTable("_Product", [SchemaColumn("id", ManagedPropertyType.bigInteger, isPrimaryKey: true, autoincrement: true, isIndexed: false, isNullable: false, isUnique: false),SchemaColumn("batchID", ManagedPropertyType.integer, isPrimaryKey: false, autoincrement: false, isIndexed: false, isNullable: false, isUnique: false),SchemaColumn("isScanned", ManagedPropertyType.boolean, isPrimaryKey: false, autoincrement: false, isIndexed: false, isNullable: false, isUnique: false),SchemaColumn("firstScanDate", ManagedPropertyType.datetime, isPrimaryKey: false, autoincrement: false, isIndexed: false, isNullable: false, isUnique: false),SchemaColumn("stateOfFirstScan", ManagedPropertyType.string, isPrimaryKey: false, autoincrement: false, isIndexed: false, isNullable: false, isUnique: false),SchemaColumn("locID", ManagedPropertyType.integer, isPrimaryKey: false, autoincrement: false, isIndexed: false, isNullable: false, isUnique: false),SchemaColumn("countyOfFirstScan", ManagedPropertyType.string, isPrimaryKey: false, autoincrement: false, isIndexed: false, isNullable: false, isUnique: false),SchemaColumn("regionOfFirstScan", ManagedPropertyType.string, isPrimaryKey: false, autoincrement: false, isIndexed: false, isNullable: false, isUnique: false),SchemaColumn("postalCodeOfFirstScan", ManagedPropertyType.string, isPrimaryKey: false, autoincrement: false, isIndexed: false, isNullable: false, isUnique: false),SchemaColumn("cityOfFirstScan", ManagedPropertyType.string, isPrimaryKey: false, autoincrement: false, isIndexed: false, isNullable: false, isUnique: false)]));
  }
  
  @override
  Future downgrade() async {}
  
  @override
  Future seed() async {}
}
    