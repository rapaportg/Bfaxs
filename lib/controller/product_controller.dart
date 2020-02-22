import 'package:bfaxs/bfaxs.dart';
//import 'package:bfaxs/controller/bfaxs_controller.dart';
import 'package:bfaxs/model/product.dart';

class ProductController extends ResourceController {
  ProductController(this.context);
  ManagedContext context;

  @Operation.get()
  Future<Response> getAllProducts() async {
    final productQuery = Query<Product>(context);
    return Response.ok(await productQuery.fetch());
  }

}