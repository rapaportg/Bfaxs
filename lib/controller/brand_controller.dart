import 'package:bfaxs/bfaxs.dart';
import 'package:bfaxs/model/brand.dart';

class BrandController extends ResourceController {
  BrandController(this.context);
  ManagedContext context;

  @Operation.get()
  Future<Response> getAllBrands() async {
    final brandQuery = Query<Brand> (context);
    return Response.ok(await brandQuery.fetch());
  }

  @Operation.get('id')
  Future<Response> getBrand(@Bind.path('id') int id) async {
    final brandQuery = Query<Brand>(context)
      ..where((brand) => brand.id).equalTo(id);
    final brand = await brandQuery.fetchOne(); 

    if (brand == null){
       return Response.notFound(body: "item not found");
    }
    return Response.ok(brand);
  }

  @Operation.post()
  Future<Response> createBrand(@Bind.body() Brand body ) async {
    final brandQuery = Query<Brand>(context)
      ..values = body;  // values is a reference to our read.ManageObject
    final insertedBrand = await brandQuery.insert(); // inserts our query into the db      
    return Response.ok(insertedBrand);
  }

  @Operation.put('id')
  Future<Response> updatedBrand(@Bind.path('id') int id, @Bind.body() Brand body) 
    async { 
    final brandQuery = Query<Brand>(context)
      ..values = body // updates Payload ->   \\
      ..where((brand) => brand.id).equalTo(id); // at this index

    final updatedQuery = brandQuery.updateOne();
       
    if (updatedQuery == null){
       return Response.notFound(body: "item not found");
    }
    return Response.ok(updatedQuery);
  }

  @Operation.delete('id')
  Future<Response> deleteBrand(@Bind.path('id') int id) async {
    final brandQuery = Query<Brand>(context)
      ..where((brand) => brand.id).equalTo(id);

    final int deleteCount = await brandQuery.delete();

    if (deleteCount == 0){
       return Response.notFound(body: "item not found");
    }
    return Response.ok('deleted $deleteCount items');
  }
}