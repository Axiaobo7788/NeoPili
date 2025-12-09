import 'package:NeoPili/common/widgets/flutter/refresh_indicator.dart';
import 'package:NeoPili/common/widgets/loading_widget/http_error.dart';
import 'package:NeoPili/grpc/bilibili/main/community/reply/v1.pb.dart'
    show SearchItem;
import 'package:NeoPili/http/loading_state.dart';
import 'package:NeoPili/models/common/reply/reply_search_type.dart';
import 'package:NeoPili/pages/video/reply_search_item/child/controller.dart';
import 'package:NeoPili/pages/video/reply_search_item/child/widgets/item.dart';
import 'package:NeoPili/utils/grid.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReplySearchChildPage extends StatefulWidget {
  const ReplySearchChildPage({
    super.key,
    required this.controller,
    required this.searchType,
  });

  final ReplySearchChildController controller;
  final ReplySearchType searchType;

  @override
  State<ReplySearchChildPage> createState() => _ReplySearchChildPageState();
}

class _ReplySearchChildPageState extends State<ReplySearchChildPage>
    with AutomaticKeepAliveClientMixin, GridMixin {
  ReplySearchChildController get _controller => widget.controller;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return refreshIndicator(
      onRefresh: _controller.onRefresh,
      child: CustomScrollView(
        controller: _controller.scrollController,
        physics: const AlwaysScrollableScrollPhysics(),
        slivers: [
          SliverPadding(
            padding: EdgeInsets.only(
              top: 7,
              bottom: MediaQuery.viewPaddingOf(context).bottom + 100,
            ),
            sliver: Obx(() => _buildBody(_controller.loadingState.value)),
          ),
        ],
      ),
    );
  }

  Widget _buildBody(LoadingState<List<SearchItem>?> loadingState) {
    return switch (loadingState) {
      Loading() => gridSkeleton,
      Success(:var response) =>
        response?.isNotEmpty == true
            ? SliverGrid.builder(
                gridDelegate: gridDelegate,
                itemBuilder: (context, index) {
                  if (index == response.length - 1) {
                    _controller.onLoadMore();
                  }
                  return ReplySearchItem(
                    item: response[index],
                    type: widget.searchType,
                  );
                },
                itemCount: response!.length,
              )
            : HttpError(onReload: _controller.onReload),
      Error(:var errMsg) => HttpError(
        errMsg: errMsg,
        onReload: _controller.onReload,
      ),
    };
  }

  @override
  bool get wantKeepAlive => true;
}
