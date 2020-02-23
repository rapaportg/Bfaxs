import 'package:bfaxs/bfaxs.dart';
import 'package:bfaxs/model/product_batch.dart';

class BatchController extends ResourceController {
  BatchController(this.context);
  ManagedContext context;

  @Operation.get()
  Future<Response> getAllBatches() async {
    final batchQuery = Query<ProductBatch> (context);
    return Response.ok(await batchQuery.fetch());
  }

  @Operation.get('id')
  Future<Response> getBatch(@Bind.path('id') int id) async {
    final batchQuery = Query<ProductBatch>(context)
      ..where((batch) => batch.id).equalTo(id);
    final batch = await batchQuery.fetchOne(); 

    if (batch == null){
       return Response.notFound(body: "item not found");
    }
    return Response.ok(batch);
  }

  @Operation.post()
  Future<Response> createBatch(@Bind.body() ProductBatch body ) async {
    final batchQuery = Query<ProductBatch>(context)
      ..values = body;  // values is a reference to our read.ManageObject
    final insertedBatch = await batchQuery.insert(); // inserts our query into the db      
    return Response.ok(insertedBatch);
  }

  @Operation.put('id')
  Future<Response> updatedBatch(@Bind.path('id') int id, @Bind.body() ProductBatch body) 
    async { 
    final batchQuery = Query<ProductBatch>(context)
      ..values = body // updates Payload ->   \\
      ..where((batch) => batch.id).equalTo(id); // at this index

    final updatedQuery = batchQuery.updateOne();
       
    if (updatedQuery == null){
       return Response.notFound(body: "item not found");
    }
    return Response.ok(updatedQuery);
  }

  @Operation.delete('id')
  Future<Response> deleteBatch(@Bind.path('id') int id) async {
    final batchQuery = Query<ProductBatch>(context)
      ..where((batch) => batch.id).equalTo(id);

    final int deleteCount = await batchQuery.delete();

    if (deleteCount == 0){
       return Response.notFound(body: "item not found");
    }
    return Response.ok('deleted $deleteCount items');
  }
}