import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/rendering.dart';
import 'package:gimmic/assets/widgets/button.dart';
import 'package:google_fonts/google_fonts.dart';
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
    _pageController = PageController(viewportFraction: 1, initialPage: 1);
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

  tabController(index) {
    _tabController.animateTo(index);
  }

// indicators of images
  List<Widget> imageIndicators(imagesLength, currentIndex) {
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
  List<Widget> imageThumbnails(imagesLength, currentIndex) {
    return List<Widget>.generate(imagesLength, (index) {
      return AspectRatio(
        aspectRatio: 1 / 1,
        child: Padding(
          padding: const EdgeInsets.all(8),
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

// main images
  Widget imageMain(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 3,
          child: Hero(
              tag: 'catHero',
              child: SizedBox(
                height: MediaQuery.of(context).size.height / 8,
                width: MediaQuery.of(context).size.width / 2,
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
                          return Padding(
                            padding: const EdgeInsets.all(8),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: GestureDetector(
                                onTap: () async {
                                  await showDialog(
                                      context: context,
                                      builder: (_) =>
                                          imageDialog(context, pagePosition));
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
                            ),
                          );
                        }),
                  ),
                ),
              )),
        ),
      ],
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
          ? const EdgeInsets.only(bottom: 0)
          : const EdgeInsets.only(bottom: 12),
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 0,
        color: Theme.of(context).colorScheme.surfaceVariant,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
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
                      top: 10, left: 15, right: 15, bottom: 0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Stack(children: [
                      TabBar(
                          indicator: UnderlineTabIndicator(
                              borderSide: BorderSide(
                                  width: 2, color: Colors.orange.shade400),
                              insets:
                                  const EdgeInsets.only(left: 20, right: 15)),
                          isScrollable: true,
                          indicatorWeight: 3,
                          labelColor: Colors.orange,
                          unselectedLabelColor: Colors.black45,
                          // labelPadding: const EdgeInsets.all(0),
                          labelPadding: const EdgeInsets.only(
                              top: 0, left: 15, right: 10, bottom: 5),
                          controller: _tabController,
                          labelStyle: GoogleFonts.roboto(
                              fontWeight: FontWeight.w500, fontSize: 16),
                          onTap: (e) {
                            setState(() {
                              tabController(_tabController.index);
                            });
                          },
                          tabs: <Widget>[
                            AnimatedSwitcher(
                              duration: const Duration(milliseconds: 1000),
                              child: _tabController.index == 0
                                  ? Tab(
                                      child: detailCardTab(
                                          0,
                                          Icons.view_in_ar_rounded,
                                          "Hello Cat"),
                                    )
                                  : useSmallLayout
                                      ? Tab(
                                          child: detailCardTab(
                                              0,
                                              Icons.view_in_ar_rounded,
                                              "Hello Cat"),
                                        )
                                      : Tab(
                                          child: detailCardTabIcon(
                                              0, Icons.view_in_ar)),
                            ),
                            _tabController.index == 1
                                ? Tab(
                                    child: detailCardTab(
                                        1, Icons.comment_outlined, "Comments"),
                                  )
                                : useSmallLayout
                                    ? Tab(
                                        child: detailCardTab(1,
                                            Icons.comment_outlined, "Comments"),
                                      )
                                    : Tab(
                                        child: detailCardTabIcon(
                                            1, Icons.comment_outlined))
                          ]),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          margin: const EdgeInsets.only(
                              top: 6, left: 6, right: 0, bottom: 6),
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(18))),
                          child: PopupMenuButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                                side: const BorderSide(
                                    width: 1, color: Colors.black12)),
                            icon: const Icon(
                              Icons.more_vert,
                              color: Colors.black54,
                            ),
                            iconSize: 20,
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
                      padding: const EdgeInsets.all(30),
                      child: ListView(children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 30),
                          child: Row(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Chip(
                                  labelStyle: GoogleFonts.roboto(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 12,
                                      color: Colors.black54),
                                  label: const Text('Cat'),
                                  backgroundColor: Colors.transparent,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      side: const BorderSide(
                                          width: 1, color: Colors.black12)),
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                ),
                              ),
                              const SizedBox(width: 6),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Chip(
                                  labelStyle: GoogleFonts.roboto(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 12,
                                      color: Colors.black54),
                                  label: const Text('Animal'),
                                  backgroundColor: Colors.transparent,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      side: const BorderSide(
                                          width: 1, color: Colors.black12)),
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 30),
                          child: Text('Created on',
                              style: GoogleFonts.roboto(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black54)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 30, bottom: 20),
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(timenow,
                                  style: GoogleFonts.roboto(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black54))),
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
                  top: 0, left: 30, right: 30, bottom: 20),
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

  Widget detailCardTabIcon(index, icons) {
    return IconButton(
      onPressed: () {
        setState(() {
          _tabController.animateTo(index);
        });
      },
      padding: const EdgeInsets.all(14),
      style: ButtonStyle(
          shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
          backgroundColor: MaterialStateProperty.all(Colors.grey.shade200),
          foregroundColor: MaterialStateProperty.resolveWith((states) {
            return states.contains(MaterialState.hovered)
                ? Colors.black
                : Colors.grey.shade700;
          })),
      icon: Icon(icons, size: 20),
      color: _tabController.index == index ? Colors.white : Colors.black87,
    );
  }

  Widget detailCardTab(index, icons, String labels) {
    return ElevatedButton.icon(
      style: _tabController.index == index
          ? ButtonStyle(
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8))),
              backgroundColor: MaterialStateProperty.all(Colors.orange),
              elevation: MaterialStateProperty.all(0))
          : ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.grey.shade200),
              elevation: MaterialStateProperty.all(0)),
      onPressed: () {
        setState(() {
          _tabController.animateTo(index);
        });
      },
      icon: Icon(
        icons,
        size: 18,
        color: _tabController.index == index ? Colors.white : Colors.black87,
      ),
      label: Text(labels,
          style: GoogleFonts.roboto(
              fontWeight: _tabController.index == index
                  ? FontWeight.w400
                  : FontWeight.w500,
              color: _tabController.index == index
                  ? Colors.white
                  : Colors.black87)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      bool useVerticalLayout = constraints.maxWidth > 800;
      bool useSmallLayout = constraints.maxWidth > 1100;
      bool useHorizontalShrink = constraints.maxHeight > 600;
      return Scaffold(
          appBar: AppBar(
              backgroundColor: Colors.grey.shade200,
              surfaceTintColor: Colors.grey.shade200,
              elevation: 0,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Resource'),
                  // TODO: need improvement for this search bar
                  // undecorated search box - currently hidden.

                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Row(
                      children: [
                        AnimatedSwitcher(
                            duration: const Duration(milliseconds: 400),
                            child: useHorizontalShrink
                                ? TextButton.icon(
                                    icon: const Icon(Icons.light_mode_rounded,
                                        size: 20),
                                    onPressed: null,
                                    label: Text(
                                      'Light Mode',
                                      style: GoogleFonts.roboto(
                                          fontWeight: FontWeight.w500),
                                    ),
                                  )
                                : null),
                        const IconButton(
                          icon: Icon(Icons.settings_outlined),
                          onPressed: null,
                        ),
                      ],
                    ),
                  ),
                ],
              )),
          body: Container(
            color: Colors.grey.shade200,
            child: AnimatedPadding(
              curve: Curves.fastOutSlowIn,
              duration: const Duration(milliseconds: 600),
              padding: useVerticalLayout
                  ? const EdgeInsets.only(
                      top: 0, left: 24, right: 24, bottom: 12)
                  : const EdgeInsets.only(
                      top: 0, left: 12, right: 12, bottom: 0),
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
                                  minHeight: constraints.maxHeight - 100),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(flex: 4, child: imageMain(context)),
                                  Expanded(
                                    flex: 1,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: imageThumbnails(
                                              images.length, activePage),
                                        ),
                                        buttonBigView3D(
                                            context, useHorizontalShrink)
                                      ],
                                    ),
                                  ),
                                  AnimatedSize(
                                      curve: Curves.fastOutSlowIn,
                                      duration:
                                          const Duration(milliseconds: 400),
                                      child: SizedBox(
                                          height:
                                              useVerticalLayout ? null : 16)),
                                  Visibility(
                                    visible: useVerticalLayout ? false : true,
                                    child: Flexible(
                                        flex: 6,
                                        child: detailCard(context,
                                            useSmallLayout, useVerticalLayout)),
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
