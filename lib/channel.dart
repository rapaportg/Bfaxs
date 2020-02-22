import 'package:bfaxs/controller/product_controller.dart';

import 'bfaxs.dart';

class BfaxsChannel extends ApplicationChannel {
  // Prepare Channel for DB
  // 1. tell app what our data model is 
  // 2. tell app channel what db we expect to connect to

  ManagedContext context;

  @override
  Future prepare() async {
    logger.onRecord.listen((rec) => print("$rec ${rec.error ?? ""} ${rec.stackTrace ?? ""}"));


  }

  @override
  Controller get entryPoint {
    final router = Router();
    router
      .route('/')
      .linkFunction((req) => 
          Response.ok("Hello")..contentType = ContentType.html);

    router.route('/products/[:id] ').link(() => ProductController(context));
          
    return router;
  }
}