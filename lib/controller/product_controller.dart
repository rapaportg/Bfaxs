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

  @Operation.get('id')
  Future<Response> getProduct(@Bind.path('id') int id) async {
    final productQuery = Query<Product>(context)
      ..where((product) => product.id).equalTo(id);
    final product = await productQuery.fetchOne(); 

    if (product == null){
       return Response.notFound(body: "item not found");
    }
    return Response.ok(product);
  }

  @Operation.post()
  Future<Response> createProduct(@Bind.body() Product body ) async {
    final productQuery = Query<Product>(context)
      ..values = body;  // values is a reference to our read.ManageObject
    final insertedProduct = await productQuery.insert(); // inserts our query into the db      
    return Response.ok(insertedProduct);
  }

  @Operation.put('id')
  Future<Response> updatedProduct(
    @Bind.path('id') int id, //expects to receive a value as id then casts it to int
    @Bind.body() Product body) 
    async { 
    final productQuery = Query<Product>(context)
      ..values = body // updates Payload ->   \\
      ..where((product) => product.id).equalTo(id); // at this index

    final updatedQuery = productQuery.updateOne();
       
    if (updatedQuery == null){
       return Response.notFound(body: "item not found");
    }

    return Response.ok(updatedQuery);
  }

  @Operation.delete('id')
  Future<Response> deleteProduct(@Bind.path('id') int id) async {
    final productQuery = Query<Product>(context)
      ..where((product) => product.id).equalTo(id);

    final int deleteCount = await productQuery.delete();

    if (deleteCount == 0){
       return Response.notFound(body: "item not found");
    }

    return Response.ok('deleted $deleteCount items');
  }
}

