import 'package:NeoPili/common/widgets/pair.dart';
import 'package:NeoPili/models/common/sponsor_block/action_type.dart';
import 'package:NeoPili/models/common/sponsor_block/segment_type.dart';

class PostSegmentModel {
  PostSegmentModel({
    required this.segment,
    required this.category,
    required this.actionType,
  });
  Pair<double, double> segment;
  SegmentType category;
  ActionType actionType;
}
