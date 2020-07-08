/*
 * Copyright (C) 2019-present Alibaba Inc. All rights reserved.
 * Author: Kraken Team.
 */

import 'dart:ui';
import 'package:kraken/css.dart';
import 'package:flutter/rendering.dart';
import 'package:kraken/rendering.dart';
import 'padding.dart';

class RenderLayoutParentData extends ContainerBoxParentData<RenderBox> {
  /// The distance by which the child's top edge is inset from the top of the stack.
  double top;

  /// The distance by which the child's right edge is inset from the right of the stack.
  double right;

  /// The distance by which the child's bottom edge is inset from the bottom of the stack.
  double bottom;

  /// The distance by which the child's left edge is inset from the left of the stack.
  double left;

  /// The child's width.
  ///
  /// Ignored if both left and right are non-null.
  double width;

  /// The child's height.
  ///
  /// Ignored if both top and bottom are non-null.
  double height;

  bool isPositioned = false;

  /// Row index of child when wrapping
  int runIndex = 0;

  RenderPositionHolder renderPositionHolder;
  int zIndex = 0;
  CSSPositionType position = CSSPositionType.static;

  /// Get element original position offset to parent(layoutBox) should be.
  Offset get stackedChildOriginalRelativeOffset {
    if (renderPositionHolder == null) return Offset.zero;
    return (renderPositionHolder.parentData as BoxParentData).offset;
  }

  // Whether offset is already set
  bool isOffsetSet = false;

  @override
  String toString() {
    return 'zIndex=$zIndex; position=$position; isPositioned=$isPositioned; renderPositionHolder=$renderPositionHolder; ${super.toString()}; runIndex: $runIndex;';
  }
}

class RenderLayoutBox extends RenderBox
    with
        ContainerRenderObjectMixin<RenderBox, ContainerBoxParentData<RenderBox>>,
        RenderBoxContainerDefaultsMixin<RenderBox, ContainerBoxParentData<RenderBox>>,
        CSSComputedMixin,
        RenderPaddingMixin {
  RenderLayoutBox({this.targetId, this.style});

  // id of current element
  int targetId;

  // Element style;
  CSSStyleDeclaration style;
}
