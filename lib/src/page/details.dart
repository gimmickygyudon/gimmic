import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';

class Details extends StatefulWidget {
  const Details({super.key});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> with TickerProviderStateMixin {
  List<String> images = ["images/hellocat.jpg", "images/hellocat1.jpg"];
  late PageController _pageController;
  late TabController _tabController;

  final String timenow = DateFormat("EEEEE, MMMM dd").format(DateTime.now());
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

  @override
  void dispose() {
    sink.close();
    _pageController.dispose();
    super.dispose();
  }

// indicators of images
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

// thumbnails of images
  List<Widget> thumbnails(imagesLength, currentIndex) {
    return List<Widget>.generate(imagesLength, (index) {
      return AspectRatio(
        aspectRatio: 1 / 1,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              if (currentIndex == index) {
                showDialog(
                    context: context,
                    builder: (_) => imageDialog(context, index));
              }
              _pageController.animateToPage(index,
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.ease);
            },
            // splashColor: Colors.white10, // Splash color over image
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

  Widget mainImage(context, pagePosition) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12.0),
      child: GestureDetector(
        onTap: () async {
          await showDialog(
              context: context,
              builder: (_) => imageDialog(context, pagePosition));
        },
        child: Tooltip(
          verticalOffset: 150,
          message: 'Click to Fullscreen',
          child: Image(
            image: AssetImage(images[pagePosition]),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

// interactive image dialog
  Widget imageDialog(context, pagePosition) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: InteractiveViewer(
        panEnabled: false,
        minScale: 0.5,
        maxScale: 4,
        child: GestureDetector(
          onTap: () => Navigator.pop(context, false), // passing false
          child: Image(
            image: AssetImage(images[pagePosition]),
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }

  Widget detailCard(context, useSmallLayout, useVerticalLayout) {
    return Padding(
      padding: useVerticalLayout
          ? const EdgeInsets.only(bottom: 0.0)
          : const EdgeInsets.only(bottom: 10.0),
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 0,
        color: Theme.of(context).colorScheme.surfaceVariant,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              color: Colors.grey.shade100,
              child: DefaultTabController(
                initialIndex: 1,
                length: 2,
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 10.0, left: 20.0, right: 20.0, bottom: 0.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Stack(children: [
                      TabBar(
                        indicator: UnderlineTabIndicator(
                            borderSide: BorderSide(
                                width: 3.0, color: Colors.orange.shade200),
                            insets:
                                const EdgeInsets.symmetric(horizontal: 20.0)),
                        isScrollable: true,
                        indicatorWeight: 3,
                        labelColor: Colors.orange,
                        unselectedLabelColor: Colors.black45,
                        indicatorColor: Colors.orange.shade100,
                        // labelPadding: const EdgeInsets.all(0),
                        labelPadding: const EdgeInsets.only(
                            top: 0.0, left: 15.0, right: 15.0, bottom: 5.0),
                        controller: _tabController,
                        tabs: useSmallLayout
                            ? const <Widget>[
                                Tab(
                                  text: "Hello Cat",
                                ),
                                Tab(
                                  text: "Comments",
                                ),
                              ]
                            : const <Widget>[
                                Tab(
                                  icon: Icon(Icons.view_in_ar),
                                ),
                                Tab(
                                  icon: Icon(Icons.comment_rounded),
                                ),
                              ],
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          margin: const EdgeInsets.only(
                              top: 6.0, left: 6.0, right: 0.0, bottom: 6.0),
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: PopupMenuButton<int>(
                            icon: const Icon(
                              Icons.more_vert,
                              color: Colors.black54,
                            ),
                            iconSize: 20.0,
                            itemBuilder: (context) => [
                              PopupMenuItem(
                                value: 1,
                                child: Row(
                                  children: const [
                                    Icon(Icons.star),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text("Get The App")
                                  ],
                                ),
                              ),
                              PopupMenuItem(
                                value: 2,
                                child: Row(
                                  children: const [
                                    Icon(Icons.chrome_reader_mode),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text("About")
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ]),
                  ),
                ),
              ),
            ),
            Expanded(
              child: SizedBox(
                height: MediaQuery.of(context).size.height / 5,
                child: TabBarView(
                  controller: _tabController,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: ListView(children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 30.0),
                          child: Row(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Chip(
                                  labelStyle: const TextStyle(
                                      color: Colors.black54,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500),
                                  label: const Text('Cat'),
                                  backgroundColor: Colors.transparent,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                      side: const BorderSide(
                                          width: 1, color: Colors.black12)),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                ),
                              ),
                              const SizedBox(width: 6),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Chip(
                                  labelStyle: const TextStyle(
                                      color: Colors.black54,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500),
                                  label: const Text('Animal'),
                                  backgroundColor: Colors.transparent,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                      side: const BorderSide(
                                          width: 1, color: Colors.black12)),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 30.0),
                          child: Text('Created on',
                              style: Theme.of(context).textTheme.caption),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(right: 30.0, bottom: 20.0),
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                timenow,
                                style: const TextStyle(
                                  color: Colors.black54,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              )),
                        ),
                        Text(
                          "Description",
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          "A cat is a furry animal that has a long tail and sharp claws. Cats are often kept as pets. Cats are lions, tigers, and other wild animals in the same family.",
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                      ]),
                    ),
                    const Center(
                      child: Text("It's rainy here"),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 0.0, left: 30.0, right: 30.0, bottom: 20.0),
              child: ElevatedButton.icon(
                icon: const Icon(Icons.file_download_outlined),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.green.shade100),
                  foregroundColor: MaterialStateProperty.resolveWith((states) {
                    return states.contains(MaterialState.hovered)
                        ? Colors.white
                        : Colors.green;
                  }),
                  minimumSize: MaterialStateProperty.all(const Size(220, 50)),
                  elevation: const MaterialStatePropertyAll(0),
                  overlayColor: MaterialStateProperty.resolveWith(
                    (states) {
                      return states.contains(MaterialState.pressed)
                          ? Colors.green.shade700
                          : Colors.green.shade500;
                    },
                  ),
                ),
                onPressed: () {},
                label: const Text("Download"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      bool useVerticalLayout = constraints.maxWidth > 800;
      bool useSmallLayout = constraints.maxWidth > 900;
      bool useHorizontalShrink = constraints.maxHeight > 600;
      return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.grey.shade200,
            surfaceTintColor: Colors.grey.shade200,
            elevation: 0.0,
            title: (const Text('Hello Cat')),
          ),
          body: SafeArea(
            child: Container(
              color: Colors.grey.shade200,
              child: Padding(
                padding: useVerticalLayout
                    ? const EdgeInsets.only(
                        top: 10.0, left: 48.0, right: 24.0, bottom: 10.0)
                    : const EdgeInsets.only(
                        top: 5.0, left: 12.0, right: 12.0, bottom: 0.0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 5,
                      child: CustomScrollView(
                          physics: useVerticalLayout
                              ? const NeverScrollableScrollPhysics()
                              : null,
                          slivers: [
                            SliverFillRemaining(
                              hasScrollBody: false,
                              child: ConstrainedBox(
                                constraints: BoxConstraints(
                                    minHeight: constraints.maxHeight - 100.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(
                                      flex: 4,
                                      child: Card(
                                        clipBehavior:
                                            Clip.antiAliasWithSaveLayer,
                                        elevation: 0,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .surfaceVariant,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: [
                                            Expanded(
                                              flex: 3,
                                              child: Hero(
                                                  tag: 'catHero',
                                                  child: SizedBox(
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height /
                                                            8,
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            2,
                                                    child: Listener(
                                                      onPointerSignal:
                                                          _handlePointerSignal,
                                                      child:
                                                          _IgnorePointerSignal(
                                                        child: PageView.builder(
                                                            scrollDirection:
                                                                Axis.horizontal,
                                                            itemCount:
                                                                images.length,
                                                            pageSnapping: true,
                                                            controller:
                                                                _pageController,
                                                            // avoiding custom scroll animation
                                                            /* scrollBehavior:
                                                                  MyCustomScrollBehavior(), */
                                                            onPageChanged:
                                                                (page) {
                                                              setState(() {
                                                                activePage =
                                                                    page;
                                                              });
                                                            },
                                                            itemBuilder: (context,
                                                                pagePosition) {
                                                              return mainImage(
                                                                  context,
                                                                  pagePosition);
                                                            }),
                                                      ),
                                                    ),
                                                  )),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 0.0,
                                            left: 0.0,
                                            right: 0.0,
                                            bottom: 0.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: thumbnails(
                                                  images.length, activePage),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: AspectRatio(
                                                aspectRatio: 1 / 1,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                        color: Colors.black54,
                                                        width: 2,
                                                      ),
                                                      borderRadius:
                                                          const BorderRadius
                                                                  .all(
                                                              Radius.circular(
                                                                  12))),
                                                  child: InkWell(
                                                    splashColor: Colors.black26,
                                                    onTap: () {
                                                      Navigator.pushNamed(
                                                          context,
                                                          '/resource/detail/view');
                                                    },
                                                    child: FittedBox(
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(18.0),
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            const Icon(
                                                                Icons
                                                                    .view_in_ar_rounded,
                                                                size: 34.0,
                                                                color: Colors
                                                                    .black87),
                                                            Visibility(
                                                              visible:
                                                                  useHorizontalShrink
                                                                      ? true
                                                                      : false,
                                                              child:
                                                                  const Padding(
                                                                padding: EdgeInsets
                                                                    .only(
                                                                        top:
                                                                            6.0),
                                                                child: Text(
                                                                    'View 3D',
                                                                    style: TextStyle(
                                                                        fontWeight:
                                                                            FontWeight.w600)),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    Visibility(
                                      visible: useVerticalLayout ? false : true,
                                      child: Flexible(
                                          flex: 6,
                                          child: detailCard(
                                              context,
                                              useSmallLayout,
                                              useVerticalLayout)),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ]),
                    ),
                    Visibility(
                      visible: useVerticalLayout ? true : false,
                      child: Expanded(
                          flex: 3,
                          child: detailCard(
                              context, useSmallLayout, useVerticalLayout)),
                    )
                  ],
                ),
              ),
            ),
          ));
    });
  }

  Stream<double> throttle(Stream<double> src) async* {
    double offset = _pageController.position.pixels;
    DateTime dt = DateTime.now();
    await for (var delta in src) {
      if (DateTime.now().difference(dt) > const Duration(milliseconds: 200)) {
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
