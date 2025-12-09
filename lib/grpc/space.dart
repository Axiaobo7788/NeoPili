import 'package:NeoPili/grpc/bilibili/app/dynamic/v2.pb.dart';
import 'package:NeoPili/grpc/bilibili/pagination.pb.dart';
import 'package:NeoPili/grpc/grpc_req.dart';
import 'package:NeoPili/grpc/url.dart';
import 'package:NeoPili/http/loading_state.dart';
import 'package:fixnum/fixnum.dart';

class SpaceGrpc {
  static Future<LoadingState<OpusSpaceFlowResp>> opusSpaceFlow({
    required int hostMid,
    String? next,
    required String filterType,
  }) {
    return GrpcReq.request(
      GrpcUrl.opusSpaceFlow,
      OpusSpaceFlowReq(
        hostMid: Int64(hostMid),
        pagination: Pagination(
          pageSize: 20,
          next: next,
        ),
        filterType: filterType,
      ),
      OpusSpaceFlowResp.fromBuffer,
    );
  }
}
