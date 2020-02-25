import 'package:bfaxs/controller/product_controller.dart';
import 'package:bfaxs/controller/batch_controller.dart';
import 'package:bfaxs/controller/user_controller.dart';
import 'package:bfaxs/controller/brand_controller.dart';
import 'package:bfaxs/controller/user_scan_history_controller.dart';

import 'bfaxs.dart';

class BfaxsChannel extends ApplicationChannel {
  // Prepare Channel for DB
  // 1. tell app what our data model is 
  // 2. tell app channel what db we expect to connect to

  ManagedContext context;

  @override
  Future prepare() async {
    logger.onRecord.listen((rec) => print("$rec ${rec.error ?? ""} ${rec.stackTrace ?? ""}"));
    final config = BfaxsConfig(options.configurationFilePath); //defaults to config.yaml - options is a part of ApplicationChannel
    final dataModel = ManagedDataModel.fromCurrentMirrorSystem();  // searched our library for all subclasses of ManagedObject
    final persistentStore = PostgreSQLPersistentStore.fromConnectionInfo( //Holds our connects to the PostgresDB
      config.database.username, 
      config.database.password, 
      config.database.host, 
      config.database.port, 
      config.database.databaseName);    
    context = ManagedContext(dataModel, persistentStore);

  }

  @override
  Controller get entryPoint {
    final router = Router();
    router
      .route('/')
      .linkFunction((req) => 
          Response.ok("Hello")..contentType = ContentType.html);

    router.route('/products/[:id]').link(() => ProductController(context));
    router.route('/batch/[:id]').link(() =>  BatchController(context));
    router.route('/user/[:id]').link(() => UserController(context));
    router.route('/brand/[:id]').link(() => BrandController(context));
    router.route('/userscanhistory/[:id]').link(() => UserScanHistoryController(context));
          
    return router;
  }
}

class BfaxsConfig extends Configuration {
  BfaxsConfig(String path) : super.fromFile(File(path));

  DatabaseConfiguration database;
}