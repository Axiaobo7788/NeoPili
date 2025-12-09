import 'package:NeoPili/http/loading_state.dart';
import 'package:NeoPili/http/user.dart';
import 'package:NeoPili/models_new/follow/data.dart';
import 'package:NeoPili/pages/follow_type/controller.dart';

class FollowSameController extends FollowTypeController {
  @override
  Future<LoadingState<FollowData>> customGetData() =>
      UserHttp.sameFollowing(mid: mid, pn: page);
}
