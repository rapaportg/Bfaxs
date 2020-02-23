import 'package:bfaxs/bfaxs.dart';
import 'package:bfaxs/model/user.dart';

class UserController extends ResourceController {
  UserController(this.context);
  ManagedContext context;

  @Operation.get()
  Future<Response> getAllUsers() async {
    final userQuery = Query<User> (context);
    return Response.ok(await userQuery.fetch());
  }

  @Operation.get('id')
  Future<Response> getUser(@Bind.path('id') int id) async {
    final userQuery = Query<User>(context)
      ..where((user) => user.id).equalTo(id);
    final user = await userQuery.fetchOne(); 

    if (user == null){
       return Response.notFound(body: "item not found");
    }
    return Response.ok(user);
  }

  @Operation.post()
  Future<Response> createUser(@Bind.body() User body ) async {
    final userQuery = Query<User>(context)
      ..values = body;  // values is a reference to our read.ManageObject
    final insertedUser = await userQuery.insert(); // inserts our query into the db      
    return Response.ok(insertedUser);
  }

  @Operation.put('id')
  Future<Response> updatedUser(@Bind.path('id') int id, @Bind.body() User body) 
    async { 
    final userQuery = Query<User>(context)
      ..values = body // updates Payload ->   \\
      ..where((user) => user.id).equalTo(id); // at this index

    final updatedQuery = userQuery.updateOne();
       
    if (updatedQuery == null){
       return Response.notFound(body: "item not found");
    }
    return Response.ok(updatedQuery);
  }

  @Operation.delete('id')
  Future<Response> deleteUser(@Bind.path('id') int id) async {
    final userQuery = Query<User>(context)
      ..where((user) => user.id).equalTo(id);

    final int deleteCount = await userQuery.delete();

    if (deleteCount == 0){
       return Response.notFound(body: "item not found");
    }
    return Response.ok('deleted $deleteCount items');
  }
}