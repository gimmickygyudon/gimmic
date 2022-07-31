import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/rendering.dart';
import 'package:gimmic/assets/colors.dart';
import 'package:gimmic/main.dart';

class YourResources extends StatefulWidget {
  const YourResources({super.key});

  @override
  State<YourResources> createState() => _YourResourcesState();
}

class _YourResourcesState extends State<YourResources>
    with TickerProviderStateMixin {
  List<String> images = ["images/hellocat.jpg", "images/hellocat1.jpg"];
  late PageController _pageController;
  late TabController _tabController;

  final ScrollController controller = ScrollController();
  final sink = StreamController<double>();
  int activePage = 1;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 1.0, initialPage: 1);
    _tabController = TabController(length: 2, vsync: this);

    throttle(sink.stream).listen((offset) {
      _pageController.animateTo(offset,
          duration: const Duration(milliseconds: 200), curve: Curves.ease);
    });
  }

  void dispose() {
    sink.close();
    _pageController.dispose();
    super.dispose();
  }

  List<Widget> indicators(imagesLength, currentIndex) {
    return List<Widget>.generate(imagesLength, (index) {
      return Container(
        margin: const EdgeInsets.all(3),
        width: 10,
        height: 10,
        decoration: BoxDecoration(
            color: currentIndex == index ? Colors.black : Colors.black26,
            shape: BoxShape.circle),
      );
    });
  }

  List<Widget> thumbnails(imagesLength, currentIndex) {
    return List<Widget>.generate(imagesLength, (index) {
      return AspectRatio(
        aspectRatio: 1 / 1,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              _pageController.animateToPage(index,
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.ease);
            }, // Image tapped
            splashColor: Colors.white10, // Splash color over image
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xff7c94b6),
                image: DecorationImage(
                  image: AssetImage(images[index]),
                  fit: BoxFit.cover,
                ),
                border: Border.all(
                  // color: Colors.blue,
                  color: currentIndex == index
                      ? Colors.orange
                      : Colors.transparent,
                  width: 4,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade200,
        surfaceTintColor: Colors.grey.shade200,
        elevation: 0.0,
        title: (const Text('Hello')),
      ),
      body: Container(
        color: Colors.grey.shade200,
        child: Padding(
          padding: const EdgeInsets.only(
              top: 10.0, left: 48.0, right: 48.0, bottom: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                flex: 6,
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      elevation: 0,
                      color: Theme.of(context).colorScheme.surfaceVariant,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            flex: 4,
                            child: Hero(
                                tag: 'catHero',
                                child: SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 1.5,
                                  width: MediaQuery.of(context).size.width,
                                  child: Listener(
                                    onPointerSignal: _handlePointerSignal,
                                    child: _IgnorePointerSignal(
                                      child: PageView.builder(
                                          scrollDirection: Axis.horizontal,
                                          itemCount: images.length,
                                          pageSnapping: true,
                                          controller: _pageController,
                                          // avoiding custom scroll animation
                                          /* scrollBehavior:
                                                    MyCustomScrollBehavior(), */
                                          onPageChanged: (page) {
                                            setState(() {
                                              activePage = page;
                                            });
                                          },
                                          itemBuilder: (context, pagePosition) {
                                            return Container(
                                                margin: const EdgeInsets.only(
                                                    top: 20.0,
                                                    left: 20.0,
                                                    right: 20.0,
                                                    bottom: 10.0),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                  child: Image(
                                                    image: AssetImage(
                                                        images[pagePosition]),
                                                    fit: BoxFit.cover,
                                                  ),
                                                ));
                                          }),
                                    ),
                                  ),
                                )),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 0.0,
                                  left: 10.0,
                                  right: 10.0,
                                  bottom: 10.0),
                              child: SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 8,
                                  width: MediaQuery.of(context).size.width,
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: thumbnails(
                                          images.length, activePage))),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 0.0, left: 48.0, right: 0.0, bottom: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      DefaultTabController(
                        initialIndex: 1,
                        length: 2,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: TabBar(
                            isScrollable: true,
                            labelColor: Colors.orange,
                            unselectedLabelColor: Colors.black45,
                            indicatorColor: Colors.orange.shade100,
                            // labelPadding: const EdgeInsets.all(0),
                            controller: _tabController,
                            tabs: const <Widget>[
                              Tab(
                                text: "Descriptions",
                              ),
                              Tab(
                                text: "Comments",
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height / 5,
                          child: TabBarView(
                            controller: _tabController,
                            children: const <Widget>[
                              Center(
                                child: Text("It's cloudy here"),
                              ),
                              Center(
                                child: Text("It's rainy here"),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                            alignment: Alignment.center,
                            child: Text('Take it or leave it',
                                style: Theme.of(context).textTheme.caption)),
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.green.shade100),
                          foregroundColor:
                              MaterialStateProperty.all(Colors.green),
                          /* minimumSize: MaterialStateProperty.all(
                                      const Size(220, 50)), */
                          elevation: const MaterialStatePropertyAll(0),
                        ),
                        onPressed: () {},
                        child: const Text("Download"),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Stream<double> throttle(Stream<double> src) async* {
    double offset = _pageController.position.pixels;
    DateTime dt = DateTime.now();
    await for (var delta in src) {
      if (DateTime.now().difference(dt) > Duration(milliseconds: 200)) {
        offset = _pageController.position.pixels;
      }
      dt = DateTime.now();
      offset += delta;
      yield offset;
    }
  }

  void _handlePointerSignal(PointerSignalEvent e) {
    if (e is PointerScrollEvent && e.scrollDelta.dy != 0) {
      sink.add(e.scrollDelta.dy);
    }
  }
}

class _IgnorePointerSignal extends SingleChildRenderObjectWidget {
  const _IgnorePointerSignal({Key? key, required Widget child})
      : super(key: key, child: child);

  @override
  RenderObject createRenderObject(_) => _IgnorePointerSignalRenderObject();
}

class _IgnorePointerSignalRenderObject extends RenderProxyBox {
  @override
  bool hitTest(BoxHitTestResult result, {required Offset position}) {
    final res = super.hitTest(result, position: position);
    result.path.forEach((item) {
      final target = item.target;
      if (target is RenderPointerListener) {
        target.onPointerSignal = null;
      }
    });
    return res;
  }
}
