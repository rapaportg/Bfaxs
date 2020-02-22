import 'package:bfaxs/bfaxs.dart';
import '../model/batch.dart';

class BatchController extends ResourceController {
  BatchController(this.context);
  ManagedContext context;

  @Operation.get()
  Future<Response> getAllBatches() async {
    final batchQuery = Query<Batch> 
  }
}