import 'package:flutter/material.dart';
import 'single_child_layout_widget/container_widget.dart';
import 'single_child_layout_widget/padding_widget.dart';
import 'single_child_layout_widget/center_widget.dart';
import 'single_child_layout_widget/align_widget.dart';
import 'single_child_layout_widget/fitted_box_widget.dart';
import 'single_child_layout_widget/aspect_ratio_widget.dart';
import 'single_child_layout_widget/constrained_box_widget.dart';
import 'single_child_layout_widget/baseline_widget.dart';
import 'single_child_layout_widget/fractionally_sized_box_widget.dart';
import 'single_child_layout_widget/intrinsic_height_widget.dart';
import 'single_child_layout_widget/intrinsic_width_widget.dart';
import 'single_child_layout_widget/limited_box_widget.dart';
import 'single_child_layout_widget/offstage_widget.dart';
import 'single_child_layout_widget/overflow_box_widget.dart';
import 'single_child_layout_widget/sized_box_widget.dart';
import 'single_child_layout_widget/sized_overflow_box_widget.dart';
import 'single_child_layout_widget/transform_widget.dart';
import 'single_child_layout_widget/custom_single_child_layout_widget.dart';

class IndexLayout extends StatefulWidget {
  @override
  _IndexLayoutState createState() => _IndexLayoutState();
}

class _IndexLayoutState extends State<IndexLayout> {
  List<Map> page1;

  @override
  void initState() {
    super.initState();
    page1 = [
      {'title': 'Container', 'page': ContainerWidget()},
      {'title': 'Padding', 'page': PaddingWidget()},
      {'title': 'Center', 'page': CenterWidget()},
      {'title': 'Align', 'page': AlignWidget()},
      {'title': 'FittedBox', 'page': FittedBoxWidget()},
      {'title': 'AspectRatio', 'page': AspectRatioWidget()},
      {'title': 'ConstrainedBox', 'page': ConstrainedBoxWidget()},
      {'title': 'Baseline', 'page': BaselineWidget()},
      {'title': 'FractionallySizedBox', 'page': FractionallySizedBoxWidget()},
      {'title': 'IntrinsicHeight', 'page': IntrinsicHeightWidget()},
      {'title': 'IntrinsicWidth', 'page': IntrinsicWidthWidget()},
      {'title': 'LimitedBox', 'page': LimitedBoxWidget()},
      {'title': 'Offstage', 'page': OffstageWidget()},
      {'title': 'OverflowBox', 'page': OverflowBoxWidget()},
      {'title': 'SizedBox', 'page': SizedBoxWidget()},
      {'title': 'SizedOverflowBox', 'page': SizedOverflowBoxWidget(), 'finish': false},
      {'title': 'Transform', 'page': TransformWidget()},
      {'title': 'CustomSingleChildLayout', 'page': CustomSingleChildLayoutWidget(), 'finish': false},
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Layout'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: ListView(children: <Widget>[
        buildTitle('拥有单个子元素的布局widget'),
        buildColumnItem(page1),
      ]),
    );
  }

  Widget buildTitle(String title) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4.0),
      color: Color(0xffd3d3d3),
      child: Text(title),
    );
  }

  Widget buildColumnItem(List<Map> page) {
    return Column(
      children: page.map((item) {
        return ListTile(
          title: Text(item['title'], style: TextStyle(color: item['finish'] == null ? Colors.black : Colors.red)),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => item['page']));
          },
        );
      }).toList(),
    );
  }
}
