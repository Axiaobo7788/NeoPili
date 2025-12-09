import 'package:NeoPili/http/loading_state.dart';
import 'package:NeoPili/http/video.dart';
import 'package:NeoPili/models/model_hot_video_item.dart';
import 'package:NeoPili/models_new/popular/popular_precious/data.dart';
import 'package:NeoPili/pages/common/common_list_controller.dart';

class PopularPreciousController
    extends CommonListController<PopularPreciousData, HotVideoItemModel> {
  @override
  void onInit() {
    super.onInit();
    queryData();
  }

  int? mediaId;

  @override
  List<HotVideoItemModel>? getDataList(PopularPreciousData response) {
    mediaId = response.mediaId;
    return response.list;
  }

  @override
  Future<LoadingState<PopularPreciousData>> customGetData() =>
      VideoHttp.popularPrecious(page: page);
}
