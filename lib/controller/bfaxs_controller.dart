// import 'package:bfaxs/bfaxs.dart';
// import '../model/product.dart';


// class ProductController extends ResourceController {
//   ProductController(this.context);
//   ManagedContext context;

//   @Operation.get()
//   Future<Response> getAllProducts() async {
//     //final productQuery = Query<Product>(context);
//     return Response.ok(products);
//   }
  
//   @Operation.post()
//   Future<Response> createNewProduct() async {
//     //final productQuery = Query<Product>(context);
//     final Map<String,dynamic> body = await request.body.decode();
//     products.add(body);
//     return Response.ok(body);
//   }

//   @Operation.put('id')
//   Future<Response> updatedProduct(@Bind.path('id') int id) async {
//     //final productQuery = Query<Product>(context);
//     if (id < 0 || id > products.length - 1){
//       return Response.notFound(body: "Item not found");
//     }
//     final Map<String, dynamic> body = await request.body.decode();
//     products[id] = body;
//     return Response.ok("Updated a product");
//   }

//   @Operation.delete('id')
//   Future<Response> deletedProduct(@Bind.path('id') int id) async {
//     //final productQuery = Query<Product>(context);
//     final Map<String, dynamic> body = await request.body.decode();
//     products.removeAt(id);
//     return Response.ok("Deleted a product");
//   }

// }