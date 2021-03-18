import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:test_prj/providers/horizontal_items.dart';
import 'package:test_prj/providers/vertical_items.dart';
import 'package:test_prj/screens/screen2design/ListViewCarousel.dart';

class Screen2 extends StatelessWidget {
  const Screen2({Key key}) : super(key: key);

  static const routeName = '/screen_2';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SafeArea(
            child: Scaffold(
              body: Center(
                child: Column(
                  children: [
                    ButtonBack(),
                    Container(
                      child: Consumer<HorizontalItemsProvider>(
                        builder: (context, value, child) {
                          return Column(
                            children: [
                              Container(
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.only(left: 16),
                                child: Text(
                                  'Section 1 (${value.itemsCount.toString()})',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 24),
                                ),
                              ),
                              Container(
                                height: 174,
                                child: ListViewCarousel(
                                  itemsCount: value.itemsCount,
                                  textProvider: value,
                                  direction: Axis.horizontal,
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    Flexible(
                      child: Consumer<VerticalItemsProvider>(
                        builder: (context, value, child) {
                          return Column(
                            children: [
                              Container(
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.only(left: 16),
                                child: Text(
                                  'Section 2 (${value.itemsCount.toString()})',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 24),
                                ),
                              ),
                              Flexible(
                                child: (Container(
                                  child: ListViewCarousel(
                                    itemsCount: value.itemsCount,
                                    textProvider: value,
                                    direction: Axis.vertical,
                                  ),
                                )),
                              )
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class ButtonBack extends StatelessWidget {
  const ButtonBack({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      child: IconButton(
        icon: Icon(
          Icons.close,
          size: 28,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
