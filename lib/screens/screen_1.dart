import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Screen1 extends StatelessWidget {
  Screen1({Key key}) : super(key: key);

  static const routeName = '/screen_1';
  static const textValue =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis convallis justo non nisi placerat maximus. Praesent tincidunt ut dui fermentum aliquam. Donec nec sodales mi. Proin ultrices dignissim ullamcorper. Nam eu consectetur nunc. Vivamus facilisis fermentum varius. Integer rutrum, ligula ac tempus maximus, erat justo molestie mauris, tempor porta tellus elit egestas ante. Proin ac leo quis felis posuere dapibus id et felis. Aenean id mattis nulla. Sed at nibh et tortor tempor malesuada. Quisque egestas urna tellus, in tristique risus ultricies laoreet. Donec fringilla, est non dapibus tempor, nulla metus lacinia arcu, at mattis ex dui nec massa. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Cras consequat id purus consectetur malesuada \n\n Vestibulum eu varius orci. Nunc ornare neque sit amet volutpat tempus. Aenean et magna nisl. Integer ornare nulla eget odio rutrum tincidunt. Proin imperdiet in sapien id euismod. Sed interdum enim non euismod pulvinar. Quisque imperdiet eros lectus, vel tempus nibh tristique eu. Pellentesque nisi ex, fringilla varius nibh et, porta mollis sapien. Donec quis pulvinar nulla. In tempor a massa et venenatis. Pellentesque scelerisque tempus tellus at venenatis. Aliquam sed nunc vel purus ultrices porttitor pharetra fringilla arcu \n\nVestibulum ut dui id quam feugiat viverra at ut dui. Ut placerat consequat iaculis. Fusce at urna quis libero vulputate sollicitudin et maximus est. Pellentesque in massa id enim laoreet vehicula nec eu velit. Aliquam vestibulum dolor eu felis feugiat bibendum. Praesent maximus rhoncus elit in finibus. Interdum et malesuada fames ac ante ipsum primis in faucibus.';
  final _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.grey,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(100),
            child: AppBar(
              elevation: 0,
              backgroundColor: Colors.white,
              flexibleSpace: Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: Text(
                    'Title',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              actions: [
                IconButton(
                    icon: const Icon(
                      Icons.close,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
              ],
            ),
          ),
          body: Column(
            children: [
              Flexible(
                flex: 1,
                child: Container(
                  color: Colors.white,
                  child: Text(
                    'Lorem ipsum dolor sit amet, '
                    'consectetur adipiscing elit. '
                    '\nDuis convallis justo non nisi placerat maximus.',
                    maxLines: 5,
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              Flexible(
                flex: 3,
                child: CupertinoScrollbar(
                    controller: _scrollController,
                    isAlwaysShown: true,
                    child: ListView.builder(
                      controller: _scrollController,
                      itemCount: 50,
                      itemBuilder: (context, index) => const ListTile(
                        title: Text(
                          textValue,
                          style: TextStyle(fontSize: 28),
                        ),
                      ),
                    )),
              ),
            ],
          ),
          bottomNavigationBar: Container(
            height: 100,
            decoration: const BoxDecoration(color: Colors.white),
            child: Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  onPrimary: Colors.white,
                  primary: Color(0xFFDB00FF),
                  onSurface: Colors.grey,
                  minimumSize: const Size(150, 50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                ),
                onPressed: () {},
                child: const Text(
                  'TEST BUTTON',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
