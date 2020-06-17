import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CustomCenterSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue,
        constraints: BoxConstraints(
            maxWidth: double.infinity,
            minWidth: 200.0,
            maxHeight: double.infinity,
            minHeight: 200.0),
        child: CustomCenter(
          child: Container(
            width: 100.0,
            height: 100.0,
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}

class CustomCenter extends SingleChildRenderObjectWidget {
  CustomCenter({Widget child}) : super(child: child);

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderCustomCenter();
  }
}

class RenderCustomCenter extends RenderShiftedBox {
  RenderCustomCenter() : super(null);

  // 重写绘制方法
  @override
  void paint(PaintingContext context, Offset offset) {
    super.paint(context, offset);
  }

  // 重写布局方法
  @override
  void performLayout() {
    print('constraints: $constraints');

    // 判断子组件是否为空
    if (child != null) {
      // 存在子组件，继续向下传递布局约束
      child.layout(
        BoxConstraints(
          minWidth: 0.0,
          maxWidth: constraints.maxWidth,
          minHeight: 0.0,
          maxHeight: constraints.maxHeight,
        ),
        parentUsesSize: true, // 布局组件需要使用自组件的大小做相关调整
      );

      print('child.size: ${child.size}');

      // 根据子组件为布局（CustomCenter）定义布合适的大小
      size = Size(
          constraints.maxWidth,
        constraints.maxHeight);
      // 存在子组件则布局子组件
      centerChild();
    } else {
      size = Size(
          constraints.maxWidth,
          constraints.maxHeight);
    }

    print('size: $size');
  }

  void centerChild() {
    final BoxParentData childParentData = child.parentData;

    final double centerX = (size.width - child.size.width) / 2.0;
    final double centerY = (size.height - child.size.height) / 2.0;

    // 指定子元素的偏移位置
    childParentData.offset = Offset(centerX, centerY);
  }
}
