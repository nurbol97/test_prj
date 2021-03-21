import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:test_prj/helpers/sizes_helpers.dart';

import 'package:test_prj/providers/base_items_provider.dart';

import 'package:test_prj/providers/base_items_provider.dart';

class ListViewCarousel extends StatelessWidget {
  ListViewCarousel(
      {Key key,
      this.direction,
      this.edgeInsets,
      this.height,
      this.textProvider,
      this.itemsCount})
      : super(key: key);
  Axis direction;
  EdgeInsets edgeInsets;
  double height;
  BaseItemsProvider textProvider;
  int itemsCount;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: direction,
      itemCount: itemsCount,
      itemBuilder: (context, index) => Container(
        padding: EdgeInsets.fromLTRB(
            index == 0 && direction == Axis.horizontal ? 20 : 6,
            10,
            6,
            direction == Axis.horizontal ? 12 : 0),
        child: CardDesign(
          index: index,
          textProvider: textProvider,
        ),
      ),
    );
  }
}

class CardDesign extends StatelessWidget {
  CardDesign({
    this.index,
    this.textProvider,
    Key key,
  }) : super(key: key);
  int index;
  BaseItemsProvider textProvider;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 10,
      child: Container(
        alignment: Alignment.center,
        height: 150,
        width: 340,
        child: Text(
          textProvider.generateItemAt(index + 1).toString(),
          style: TextStyle(fontWeight: FontWeight.w800, fontSize: 24),
        ),
      ),
    );
  }
}
