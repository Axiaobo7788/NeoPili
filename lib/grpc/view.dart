import 'package:NeoPili/grpc/bilibili/app/viewunite/v1.pb.dart'
    show ViewReq, ViewReply;
import 'package:NeoPili/grpc/grpc_req.dart';
import 'package:NeoPili/grpc/url.dart';
import 'package:NeoPili/http/loading_state.dart';

class ViewGrpc {
  static Future<LoadingState<ViewReply>> view({
    required String bvid,
  }) {
    return GrpcReq.request(
      GrpcUrl.view,
      ViewReq(
        bvid: bvid,
      ),
      ViewReply.fromBuffer,
    );
  }
}
