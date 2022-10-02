import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import 'package:gimmic/assets/functions/platform.dart';
import 'package:gimmic/assets/icons.dart';
import '../../assets/colors.dart'
    if (dart.library.js) '../../assets/colors_web.dart'
    if (dart.library.html) '../../assets/colors_web.dart'
    if (dart.library.io) '../../assets/colors.dart';

import '../../assets/functions/colors.dart';
import '../../assets/functions/url.dart';
import '../../assets/widgets/button.dart';
import '../../assets/widgets/card.dart';
import '../../assets/widgets/chip.dart';
import '../../assets/widgets/dialog.dart';
import '../../assets/widgets/menu.dart';
import '../../assets/widgets/snackbar.dart';

class Details extends StatefulWidget {
  const Details({Key? key, this.arguments}) : super(key: key);
  final Map<dynamic, dynamic>? arguments;

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> with TickerProviderStateMixin {
  final List<String> images = ["images/hellocat.jpg", "images/hellocat1.jpg"];
  late PageController _pageController;
  late TabController _tabController;
  late ScrollController _scrollViewController;
  bool isScrollingDown = false;

  final GlobalKey<ScaffoldState> detailScaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  final String timenow = DateFormat("EEEEE, MMMM dd").format(DateTime.now());
  final ScrollController controller = ScrollController();
  final ScrollController controllerComment = ScrollController();
  final sink = StreamController<double>();

  int activePage = 0;
  bool isAnimated = false;
  Map<dynamic, dynamic> arguments = {
    'name': 'default',
    'hero': 'default',
    'index': 0
  };

  @override
  void initState() {
    palettecache = false;

    super.initState();
    isAnimated = false;
    Future.delayed(const Duration(milliseconds: 50)).whenComplete(() {
      setState(() {
        isAnimated = true;
      });
    });

    if (widget.arguments != null) {
      arguments = widget.arguments!;
    }
    activePage = int.parse(arguments['index']);
    _pageController = PageController(
        viewportFraction: 1, initialPage: int.parse(arguments['index']));
    _tabController = TabController(length: 2, vsync: this);

    _scrollViewController = ScrollController();
    _scrollViewController.addListener(() {
      if (_scrollViewController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (!isScrollingDown) {
          setState(() {
            isScrollingDown = true;
            toogleThumbnail = false;
          });
        }
      }

      if (_scrollViewController.position.userScrollDirection ==
          ScrollDirection.forward) {
        if (isScrollingDown) {
          setState(() {
            isScrollingDown = false;
            toogleThumbnail = true;
          });
        }
      }
    });
    controller.addListener(() {
      if (controller.position.userScrollDirection == ScrollDirection.reverse) {
        if (!isScrollingDown) {
          setState(() {
            isScrollingDown = true;
            toogleThumbnail = false;
          });
        }
      }

      if (controller.position.userScrollDirection == ScrollDirection.forward) {
        if (isScrollingDown) {
          setState(() {
            isScrollingDown = false;
            toogleThumbnail = true;
          });
        }
      }
    });

    throttle(sink.stream).listen((offset) {
      _pageController.animateTo(offset,
          duration: const Duration(milliseconds: 200), curve: Curves.ease);
    });

    if (updatePaletteGenCompleter.isCompleted == false) {
      if (loadingpalette == false) {
        WidgetsBinding.instance.addPostFrameCallback((_) async {
          await rootScaffoldMessengerKey.currentState
              ?.showSnackBar(
                  snackbarPaletteLoading('Creating palette color...'))
              .closed
              .then((value) {
            if (updatePaletteGenCompleter.isCompleted) {
              rootScaffoldMessengerKey.currentState?.showSnackBar(
                  snackbarPaletteComplete('Palette color created'));
            }
          });
        });
      }
      updatePaletteGen(images).whenComplete(() async {
        debugPrint('updatePaletteGen Started');
        await updatePaletteGenCompleter.future.whenComplete(() {
          rootScaffoldMessengerKey.currentState?.hideCurrentSnackBar();
          if (palettecache == false) {
            detailScaffoldKey.currentState?.setState(() {
              setState(() {
                debugPrint('updatePaletteGenCompleter Complete');
              });
            });
          }
        });
      });
    }
  }

  @override
  void dispose() {
    palettecache = true;
    sink.close();
    _scrollViewController.dispose();
    _tabController.dispose();
    _pageController.dispose();
    controller.dispose();
    controllerComment.dispose();
    super.dispose();
  }

  tabController(index) {
    _tabController.animateTo(index);
  }

// indicators of images
  List<Widget> imageIndicators(imagesLength, currentIndex, layout) {
    return List<Widget>.generate(imagesLength, (index) {
      return GestureDetector(
        onTap: () => _pageController.animateToPage(index,
            duration: const Duration(milliseconds: 300), curve: Curves.ease),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.all(3),
          width: layout
              ? currentIndex == index
                  ? 30
                  : 10
              : 6,
          height: 6,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.7),
            color: currentIndex == index ? Colors.black54 : Colors.black26,
          ),
        ),
      );
    });
  }

// thumbnails of images
  int hoveredThumbnail = -1;
  List<Widget> imageThumbnails(
      imagesLength, arguments, currentIndex, useVerticalLayout) {
    return List<Widget>.generate(imagesLength, (index) {
      return ConstrainedBox(
        constraints: BoxConstraints(maxHeight: useVerticalLayout ? 116 : 88),
        child: AspectRatio(
          aspectRatio: 1 / 1,
          child: AnimatedPadding(
            curve: Curves.easeOut,
            duration: const Duration(milliseconds: 300),
            padding: hoveredThumbnail == index
                ? const EdgeInsets.all(4)
                : const EdgeInsets.all(6),
            child: MouseRegion(
              onEnter: (value) => setState(() => hoveredThumbnail = index),
              onExit: (value) => setState(() => hoveredThumbnail = -1),
              child: InkWell(
                onTap: () async {
                  if (currentIndex == index) {
                    await imageDialogHero(
                        context, images[index], arguments, index);
                  }
                  _pageController.animateToPage(index,
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.ease);
                },
                // splashColor: Colors.white10, // Splash color over image
                child: Card(
                  shadowColor: Colors.black,
                  clipBehavior: Clip.antiAlias,
                  semanticContainer: true,
                  elevation: hoveredThumbnail == index ? 2 : 0,
                  shape: RoundedRectangleBorder(
                      side: BorderSide(
                          color: currentIndex == index
                              ? hoveredThumbnail == index
                                  ? Colors.orange
                                  : Colors.orange.shade400
                              : hoveredThumbnail == index
                                  ? Colors.blue.shade400
                                  : Colors.transparent,
                          width: 3),
                      borderRadius: BorderRadius.circular(12)),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 100),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(images[index]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    });
  }

// main images
  Widget imageMain(context, arguments) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 3,
          child: SizedBox(
            height: MediaQuery.of(context).size.height / 8,
            width: MediaQuery.of(context).size.width / 2,
            child: Listener(
              onPointerSignal: _handlePointerSignal,
              child: _IgnorePointerSignal(
                child: PageView.builder(
                    physics: const BouncingScrollPhysics(),
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
                      void push() => imageDialogHero(context,
                          images[pagePosition], arguments, pagePosition);

                      return GestureDetector(
                        onSecondaryTapDown: (details) =>
                            onRightClickImageMainMenu(
                                context, images[pagePosition], push, details),
                        onLongPress: () => onRightClickImageMainMenu(
                            context, images[pagePosition], push),
                        onTapDown: (details) => onTapPosition(details),
                        onTap: () {
                          push();
                        },
                        child: Hero(
                          createRectTween: (Rect? begin, Rect? end) {
                            return MaterialRectCenterArcTween(
                                begin: begin, end: end);
                          },
                          tag: arguments['hero'] + pagePosition.toString(),
                          child: Image(
                            image: AssetImage(images[pagePosition]),
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    }),
              ),
            ),
          ),
        ),
      ],
    );
  }

  bool toogleThumbnail = true;
  Widget detailCard(useVerticalLayout) {
    return StatefulBuilder(
      builder: (context, setThisState) => Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: LayoutBuilder(builder: (context, constraints) {
          bool useSmallLayout = constraints.maxWidth < 400;
          debugPrint(constraints.maxWidth.toString());
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: double.infinity,
                color: paletteMutedColors.isEmpty
                    ? Colors.grey.shade100
                    : lighten(paletteMutedColors[activePage].color, .15),
                child: AnimatedPadding(
                  duration: const Duration(milliseconds: 200),
                  padding: useVerticalLayout
                      ? EdgeInsets.zero
                      : const EdgeInsets.only(top: 16, bottom: 8),
                  child: Center(
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      height: useVerticalLayout ? null : 4,
                      width: useVerticalLayout ? null : 32,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25.7),
                          color: Colors.grey.shade400),
                    ),
                  ),
                ),
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                color: paletteMutedColors.isEmpty
                    ? Colors.grey.shade100
                    : lighten(paletteMutedColors[activePage].color, .15),
                child: DefaultTabController(
                  initialIndex: 1,
                  length: 2,
                  child: AnimatedPadding(
                    duration: const Duration(milliseconds: 200),
                    padding: EdgeInsets.only(
                        top: useVerticalLayout ? 15 : 0,
                        left: 10,
                        right: 15,
                        bottom: 0),
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TabBar(
                              indicator: const UnderlineTabIndicator(
                                  borderSide: BorderSide.none,
                                  insets: EdgeInsets.only(left: 20, right: 15)),
                              isScrollable: true,
                              indicatorWeight: 3,
                              labelColor: Colors.orange,
                              unselectedLabelColor: Colors.black45,
                              padding: EdgeInsets.zero,
                              labelPadding: const EdgeInsets.only(
                                  top: 0, left: 15, right: 0, bottom: 0),
                              controller: _tabController,
                              labelStyle: GoogleFonts.roboto(
                                  fontWeight: FontWeight.w500, fontSize: 16),
                              onTap: (e) {
                                setThisState(() {
                                  tabController(_tabController.index);
                                  toogleThumbnail = false;
                                });
                              },
                              tabs: <Widget>[
                                _tabController.index == 0
                                    ? Tab(
                                        child: detailCardTab(setThisState, 0,
                                            Icons.data_object, "About"),
                                      )
                                    : useSmallLayout
                                        ? Tab(
                                            child: detailCardTabIcon(
                                                setThisState,
                                                0,
                                                Icons.data_object),
                                          )
                                        : Tab(
                                            child: detailCardTab(setThisState,
                                                0, Icons.data_object, "About")),
                                _tabController.index == 1
                                    ? Tab(
                                        child: detailCardTab(setThisState, 1,
                                            Icons.forum_outlined, "Comments"),
                                      )
                                    : useSmallLayout
                                        ? Tab(
                                            child: detailCardTabIcon(
                                                setThisState,
                                                1,
                                                Icons.forum_outlined),
                                          )
                                        : Tab(
                                            child: detailCardTab(
                                                setThisState,
                                                1,
                                                Icons.forum_outlined,
                                                "Comments"))
                              ]),
                          Row(
                            children: [
                              AnimatedSwitcher(
                                duration: const Duration(milliseconds: 300),
                                child: useVerticalLayout
                                    ? null
                                    : ToggleButtons(
                                        borderRadius:
                                            BorderRadius.circular(25.7),
                                        constraints: const BoxConstraints(
                                            minHeight: 34, minWidth: 34),
                                        renderBorder: false,
                                        isSelected: [toogleThumbnail],
                                        onPressed: (index) {
                                          setState(() {
                                            if (toogleThumbnail == false) {
                                              toogleThumbnail = true;
                                            } else {
                                              toogleThumbnail = false;
                                            }
                                          });
                                        },
                                        children: const [
                                          Tooltip(
                                            message: 'Show Thumbnails',
                                            child: Icon(
                                              Icons.photo_library,
                                              color: Colors.black54,
                                              size: 20,
                                            ),
                                          )
                                        ],
                                      ),
                              ),
                              AnimatedContainer(
                                duration: const Duration(milliseconds: 200),
                                margin: isWebMobile
                                    ? null
                                    : const EdgeInsets.only(
                                        top: 6, left: 6, right: 0, bottom: 6),
                                child: PopupMenuButton<int>(
                                    elevation: 4,
                                    color: paletteMutedColors.isEmpty
                                        ? Colors.grey.shade50
                                        : lighten(
                                            paletteMutedColors[activePage]
                                                .color,
                                            .15),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(6)),
                                    icon: const Icon(
                                      Icons.more_vert,
                                      color: Colors.black54,
                                    ),
                                    iconSize: 22,
                                    padding: EdgeInsets.zero,
                                    itemBuilder: (context) {
                                      return openItemMenu(
                                          context, currentUrl(context));
                                    }),
                              )
                            ],
                          ),
                        ]),
                  ),
                ),
              ),
              Expanded(
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  color: paletteMutedColors.isEmpty
                      ? Colors.grey.shade50
                      : lighten(paletteMutedColors[activePage].color, .15),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height / 2,
                    child: TabBarView(
                      controller: _tabController,
                      children: <Widget>[
                        Scrollbar(
                          controller: controller,
                          thumbVisibility: true,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 25, right: 25, bottom: 0, top: 4),
                            child: ScrollConfiguration(
                              behavior: ScrollConfiguration.of(context)
                                  .copyWith(scrollbars: false),
                              child: NotificationListener(
                                onNotification: (OverscrollNotification value) {
                                  if (value.overscroll < 0 &&
                                      _scrollViewController.offset +
                                              value.overscroll <=
                                          0) {
                                    if (_scrollViewController.offset != 0) {
                                      _scrollViewController.jumpTo(0);
                                    }
                                    return true;
                                  }
                                  if (_scrollViewController.offset +
                                          value.overscroll >=
                                      _scrollViewController
                                          .position.maxScrollExtent) {
                                    if (_scrollViewController.offset !=
                                        _scrollViewController
                                            .position.maxScrollExtent) {
                                      _scrollViewController.jumpTo(
                                          _scrollViewController
                                              .position.maxScrollExtent);
                                    }
                                    return true;
                                  }
                                  _scrollViewController.jumpTo(
                                      _scrollViewController.offset +
                                          value.overscroll);
                                  return true;
                                },
                                child: ListView(
                                    controller: controller,
                                    keyboardDismissBehavior:
                                        ScrollViewKeyboardDismissBehavior
                                            .onDrag,
                                    physics: const ClampingScrollPhysics(),
                                    shrinkWrap: true,
                                    children: [
                                      Theme(
                                        data: ThemeData(useMaterial3: true)
                                            .copyWith(
                                                dividerColor:
                                                    Colors.transparent),
                                        child: ExpansionTile(
                                          initiallyExpanded: true,
                                          onExpansionChanged: (value) {
                                            setThisState(() {
                                              toogleThumbnail = false;
                                            });
                                          },
                                          tilePadding:
                                              const EdgeInsets.symmetric(
                                                  horizontal: 0),
                                          title: Text(
                                            'Aragon Malay',
                                            style: GoogleFonts.roboto(
                                                color: Colors.black87,
                                                fontSize: 24,
                                                fontWeight: FontWeight.w400,
                                                letterSpacing: -0.5),
                                          ),
                                          subtitle: Text('Legends of Zelda',
                                              style: GoogleFonts.roboto(
                                                  color: Colors.black87,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400)),
                                          trailing: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text('4.7 (246)',
                                                  style: GoogleFonts.roboto(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Colors.black87)),
                                              IconButton(
                                                  tooltip: 'Add to Favorites',
                                                  onPressed: () {},
                                                  icon: const Icon(
                                                    Icons.favorite_border,
                                                    color: Colors.black87,
                                                  )),
                                            ],
                                          ),
                                          children: [
                                            const SizedBox(height: 4),
                                            SelectionArea(
                                              child: Text(
                                                "A cat is a furry animal that has a long tail and sharp claws. Cats are often kept as pets. Cats are lions, tigers, and other wild animals in the same family.",
                                                style: GoogleFonts.roboto(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w400,
                                                    letterSpacing: 0.1,
                                                    height: 1.6,
                                                    color: Colors.black87),
                                              ),
                                            ),
                                            Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  TextButton.icon(
                                                      onPressed: () => urlLink(
                                                          context,
                                                          'https://en.wikipedia.org/wiki/The_Legend_of_Zelda'),
                                                      icon: const Icon(
                                                          FontAwesomeIcons
                                                              .wikipediaW,
                                                          size: 14),
                                                      label: const Text(
                                                          'Wikipedia')),
                                                  TextButton.icon(
                                                      onPressed: () => urlLink(
                                                          context,
                                                          'https://www.google.com/search?q=legend+of+zelda'),
                                                      icon: const Icon(
                                                          FontAwesomeIcons
                                                              .google,
                                                          size: 14),
                                                      label:
                                                          const Text('Google'))
                                                ]),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            bottom: 12, top: 20),
                                        child: Wrap(
                                          spacing: 6,
                                          children: [
                                            chipTagOutlined(
                                                'Stray Cat',
                                                Icons.pets_rounded,
                                                paletteMutedColors.isEmpty
                                                    ? null
                                                    : lighten(
                                                        paletteMutedColors[
                                                                activePage]
                                                            .color,
                                                        .1),
                                                16.0,
                                                12.0),
                                            chipTagOutlined(
                                                'Animal',
                                                Icons.cruelty_free,
                                                paletteMutedColors.isEmpty
                                                    ? null
                                                    : lighten(
                                                        paletteMutedColors[
                                                                activePage]
                                                            .color,
                                                        .1),
                                                16.0,
                                                12.0),
                                          ],
                                        ),
                                      ),
                                      const Divider(height: 20),
                                      const SizedBox(height: 8),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Text('Creator',
                                                    style: GoogleFonts.roboto(
                                                        fontWeight:
                                                            FontWeight.w500)),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: const [
                                                    Icon(Icons.face, size: 16),
                                                    SizedBox(width: 4),
                                                    Text('Me'),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Text('License',
                                                    style: GoogleFonts.roboto(
                                                        fontWeight:
                                                            FontWeight.w500)),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: const [
                                                    Icon(
                                                        FontAwesomeIcons
                                                            .creativeCommonsZero,
                                                        size: 16),
                                                    SizedBox(width: 4),
                                                    Text('CC0'),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Text('Date',
                                                    style: GoogleFonts.roboto(
                                                        fontWeight:
                                                            FontWeight.w500)),
                                                const Text('3 Sep 2022')
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                      const SizedBox(height: 8),
                                      const Divider(height: 20),
                                      Theme(
                                        data: ThemeData(useMaterial3: true)
                                            .copyWith(
                                                dividerColor:
                                                    Colors.transparent),
                                        child: ListTileTheme(
                                          child: ExpansionTile(
                                            tilePadding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: 0),
                                            title: Text(
                                              'Blender',
                                              style: GoogleFonts.roboto(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            subtitle: const Text(
                                                '3.2.2 (bcfdb14560e7)'),
                                            textColor: Colors.orange,
                                            iconColor: Colors.orange,
                                            leading: IconButton(
                                                tooltip: 'Blender',
                                                onPressed: () {},
                                                icon: const Icon(
                                                  IconSoftware.blender3dfilled,
                                                  color: Colors.orangeAccent,
                                                )),
                                            children: const [
                                              ListTile(
                                                title: Text('Face Count'),
                                                subtitle: Text('115,835'),
                                              ),
                                              ListTile(
                                                title: Text('Objects'),
                                                subtitle: Text('19'),
                                              ),
                                              ListTile(
                                                title: Text('File Size'),
                                                subtitle: Text('28 MB'),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Theme(
                                        data: ThemeData(useMaterial3: true)
                                            .copyWith(
                                                dividerColor:
                                                    Colors.transparent),
                                        child: ExpansionTile(
                                          tilePadding:
                                              const EdgeInsets.symmetric(
                                                  horizontal: 0),
                                          title: Text(
                                            'Renderer',
                                            style: GoogleFonts.roboto(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w400),
                                          ),
                                          subtitle:
                                              const Text('Cycles / Eevee'),
                                          leading: IconButton(
                                              onPressed: () {},
                                              icon: const Icon(
                                                Icons.image_outlined,
                                              )),
                                          children: const [
                                            ListTile(
                                              title: Text('Resolution'),
                                              subtitle:
                                                  Text('2080 x 2080 Pixels'),
                                            ),
                                            ListTile(
                                              title: Text('Aspect Ratio'),
                                              subtitle: Text('1.000 / 1.000'),
                                            ),
                                            SizedBox(
                                              height: 8,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Theme(
                                        data: ThemeData(useMaterial3: true)
                                            .copyWith(
                                                dividerColor:
                                                    Colors.transparent),
                                        child: ExpansionTile(
                                          tilePadding:
                                              const EdgeInsets.symmetric(
                                                  horizontal: 0),
                                          title: Text(
                                            'Textures & Materials',
                                            style: GoogleFonts.roboto(
                                                fontWeight: FontWeight.w400),
                                          ),
                                          textColor: Colors.green,
                                          iconColor: Colors.green,
                                          leading: IconButton(
                                              tooltip: 'Surface',
                                              onPressed: () {},
                                              icon: const Icon(
                                                Icons.texture_rounded,
                                              )),
                                          children: const [
                                            ListTile(
                                              title: Text('Source'),
                                              subtitle: Text(
                                                  'https://www.textures.com'),
                                            ),
                                            ListTile(
                                              title: Text('Texture Used'),
                                              subtitle: Text('0'),
                                            ),
                                            ListTile(
                                              title: Text('Material'),
                                              subtitle: Text(
                                                  'Diffuse, Roughness and Falloff, Displacement, Others (Brightness, Contrast, etc.)'),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 18),
                                      Row(
                                        children: [
                                          const Padding(
                                            padding: EdgeInsets.only(left: 6),
                                            child: Icon(
                                                FontAwesomeIcons.youtube,
                                                size: 16,
                                                color: Colors.red),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                8, 0, 4, 0),
                                            child: Text('Youtube Tutorial',
                                                style: GoogleFonts.roboto(
                                                    fontSize: 14)),
                                          ),
                                          const Expanded(
                                              child: Divider(
                                                  indent: 12, endIndent: 12)),
                                          const Padding(
                                            padding: EdgeInsets.only(right: 4),
                                            child:
                                                Icon(Icons.schedule, size: 16),
                                          ),
                                          const Text('12 min')
                                        ],
                                      ),
                                      const SizedBox(height: 8),
                                      cardYoutube(images[0], paletteMutedColors,
                                          activePage),
                                    ]),
                              ),
                            ),
                          ),
                        ),
                        Scrollbar(
                          controller: controllerComment,
                          thumbVisibility: true,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            child: ScrollConfiguration(
                              behavior: ScrollConfiguration.of(context)
                                  .copyWith(scrollbars: false),
                              child: NotificationListener(
                                onNotification: (OverscrollNotification value) {
                                  if (value.overscroll < 0 &&
                                      _scrollViewController.offset +
                                              value.overscroll <=
                                          0) {
                                    if (_scrollViewController.offset != 0) {
                                      _scrollViewController.jumpTo(0);
                                    }
                                    return true;
                                  }
                                  if (_scrollViewController.offset +
                                          value.overscroll >=
                                      _scrollViewController
                                          .position.maxScrollExtent) {
                                    if (_scrollViewController.offset !=
                                        _scrollViewController
                                            .position.maxScrollExtent) {
                                      _scrollViewController.jumpTo(
                                          _scrollViewController
                                              .position.maxScrollExtent);
                                    }
                                    return true;
                                  }
                                  _scrollViewController.jumpTo(
                                      _scrollViewController.offset +
                                          value.overscroll);
                                  return true;
                                },
                                child: ListView(
                                  controller: controllerComment,
                                  keyboardDismissBehavior:
                                      ScrollViewKeyboardDismissBehavior.onDrag,
                                  children: <Widget>[
                                    CardComment(
                                      palettecolor: paletteMutedColors.isEmpty
                                          ? null
                                          : paletteMutedColors,
                                      dominantcolor:
                                          paletteDominantColors.isEmpty
                                              ? null
                                              : paletteDominantColors,
                                      colorindex: activePage,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                color: paletteMutedColors.isEmpty
                    ? Colors.grey.shade50
                    : lighten(paletteMutedColors[activePage].color, .15),
                padding: EdgeInsets.only(
                    top: 10,
                    left: 20,
                    right: 20,
                    bottom: useVerticalLayout ? 10 : 20),
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: _tabController.index == 0
                      ? ElevatedButton.icon(
                          icon: const Icon(Icons.file_download_outlined),
                          style: ButtonStyle(
                            visualDensity: const VisualDensity(
                                horizontal: -2, vertical: -2),
                            minimumSize: MaterialStateProperty.all(
                                const Size(double.infinity, 54)),
                            elevation: const MaterialStatePropertyAll(0),
                          ),
                          onPressed: () {},
                          label: Text("Download",
                              style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.w500)),
                        )
                      : Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.add_circle_outline)),
                            const SizedBox(width: 8),
                            Expanded(
                              child: TextField(
                                autofocus: isWebMobile ? false : true,
                                autocorrect: true,
                                decoration: InputDecoration(
                                  contentPadding: isWebMobile
                                      ? const EdgeInsets.symmetric(vertical: 12)
                                      : null,
                                  isDense: true,
                                  filled: true,
                                  fillColor: paletteMutedColors.isEmpty
                                      ? Colors.white70
                                      : lighten(
                                          paletteMutedColors[activePage].color,
                                          .1),
                                  hoverColor: paletteMutedColors.isEmpty
                                      ? Colors.white
                                      : lighten(
                                          paletteMutedColors[activePage].color,
                                          .05),
                                  hintText: "Message...",
                                  hintStyle: GoogleFonts.roboto(
                                      fontWeight: FontWeight.w500),
                                  prefixIcon: const Icon(Icons.account_circle,
                                      size: 24),
                                  prefixIconConstraints:
                                      const BoxConstraints(minWidth: 55),
                                  suffixIcon: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 4),
                                    child: IconButton(
                                        onPressed: () {},
                                        icon: const Icon(Icons.send, size: 24)),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            IconButton(
                                onPressed: () {}, icon: const Icon(Icons.mood)),
                          ],
                        ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }

  Widget detailCardTabIcon(setState, index, icons) {
    return IconButton(
      visualDensity: const VisualDensity(horizontal: -2, vertical: -2),
      onPressed: () {
        setState(() {
          _tabController.animateTo(index);
          toogleThumbnail = false;
        });
      },
      padding: const EdgeInsets.all(14),
      icon: Icon(icons, size: 20),
      style: ButtonStyle(
        padding: const MaterialStatePropertyAll(EdgeInsets.all(16)),
        shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
        backgroundColor: MaterialStateProperty.resolveWith((states) {
          return states.contains(MaterialState.hovered)
              ? paletteDominantColors.isEmpty
                  ? Colors.grey.shade200
                  : colorButtonLuminance(
                      paletteDominantColors[activePage].color, .2, .4)
              : null;
        }),
        foregroundColor: MaterialStateProperty.resolveWith((states) {
          return states.contains(MaterialState.hovered)
              ? Colors.white
              : paletteDominantColors.isEmpty
                  ? Colors.grey.shade700
                  : colorDark(paletteDominantColors[activePage].color, 1);
        }),
      ),
    );
  }

  Widget detailCardTab(setState, index, icons, labels) {
    return ElevatedButton.icon(
      style: _tabController.index == index
          ? ButtonStyle(
              visualDensity: const VisualDensity(horizontal: -2, vertical: -2),
              padding: const MaterialStatePropertyAll(EdgeInsets.all(16)),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12))),
              foregroundColor: MaterialStateProperty.resolveWith((states) {
                if (states.contains(MaterialState.hovered)) {
                  return Colors.white;
                }
                return paletteDominantColors.isEmpty
                    ? Colors.white
                    : colorLightText(
                        paletteDominantColors[activePage].color, 1);
              }),
              backgroundColor: MaterialStateProperty.resolveWith((states) {
                if (states.contains(MaterialState.hovered)) {
                  return paletteDominantColors.isEmpty
                      ? Colors.amber.shade100
                      : colorLuminance(
                          paletteDominantColors[activePage].color, .2);
                }
                return paletteDominantColors.isEmpty
                    ? Colors.amber
                    : colorLuminance(
                        paletteDominantColors[activePage].color, .4);
              }),
              elevation: MaterialStateProperty.all(0))
          : ButtonStyle(
              visualDensity: const VisualDensity(horizontal: -2, vertical: -2),
              padding: const MaterialStatePropertyAll(EdgeInsets.all(16)),
              foregroundColor: MaterialStateProperty.resolveWith((states) {
                if (states.contains(MaterialState.hovered)) {
                  return paletteDominantColors.isEmpty
                      ? Colors.amber
                      : colorLuminance(
                          paletteDominantColors[activePage].color, .6);
                }
                return paletteDominantColors.isEmpty
                    ? Colors.black54
                    : colorDark(paletteDominantColors[activePage].color, 1);
              }),
              backgroundColor: MaterialStateProperty.all(Colors.transparent),
              overlayColor: MaterialStateProperty.resolveWith((states) {
                if (states.contains(MaterialState.pressed)) {
                  return paletteMutedColors.isEmpty
                      ? Colors.black26
                      : colorDark(paletteMutedColors[activePage].color, .1);
                }
                return paletteMutedColors.isEmpty
                    ? Colors.black26
                    : paletteMutedColors[activePage].color;
              }),
              elevation: MaterialStateProperty.all(0)),
      onPressed: () {
        setState(() {
          _tabController.animateTo(index);
          toogleThumbnail = false;
        });
      },
      icon: Icon(
        icons,
        size: 18,
      ),
      label: Text(labels,
          style: GoogleFonts.roboto(
            fontWeight: _tabController.index == index
                ? FontWeight.w400
                : FontWeight.w500,
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      bool useSmallLayout = constraints.maxHeight > constraints.maxWidth / 2;
      bool usePhoneLayout = constraints.maxHeight < constraints.maxWidth / 2;
      bool useVerticalLayout = constraints.maxHeight < constraints.maxWidth;
      return Theme(
        data: ThemeData(
            useMaterial3: true,
            iconButtonTheme: IconButtonThemeData(
                style: ButtonStyle(
                    foregroundColor: MaterialStatePropertyAll(
                        paletteDominantColors.isEmpty
                            ? null
                            : colorButtonLuminance(
                                paletteDominantColors[activePage].color)))),
            elevatedButtonTheme: ElevatedButtonThemeData(
                style: ButtonStyle(
                    animationDuration: const Duration(milliseconds: 200),
                    backgroundColor: MaterialStateProperty.all(paletteDominantColors.isEmpty
                        ? Colors.green.shade100
                        : colorLight(paletteMutedColors[activePage].color, .0)),
                    foregroundColor:
                        MaterialStateProperty.resolveWith((states) {
                      if (states.contains(MaterialState.pressed)) {
                        return Colors.white;
                      }
                      return states.contains(MaterialState.hovered)
                          ? Colors.white
                          : paletteDominantColors.isEmpty
                              ? Colors.green
                              : colorDark(
                                  paletteDominantColors[activePage].color, .8);
                    }),
                    overlayColor: MaterialStateProperty.resolveWith(
                      (states) {
                        return states.contains(MaterialState.pressed)
                            ? paletteDominantColors.isEmpty
                                ? Colors.green.shade700
                                : darken(
                                    colorButtonLuminance(
                                        paletteDominantColors[activePage]
                                            .color),
                                    isWebMobile ? .05 : .1)
                            : paletteDominantColors.isEmpty
                                ? Colors.green.shade500
                                : colorLuminance(
                                    paletteDominantColors[activePage].color,
                                    .5);
                      },
                    ))),
            textSelectionTheme: TextSelectionThemeData(
              cursorColor: paletteDominantColors.isEmpty
                  ? null
                  : colorButtonLuminance(
                      paletteDominantColors[activePage].color),
              selectionHandleColor: paletteDominantColors.isEmpty
                  ? null
                  : colorButtonLuminance(
                      paletteDominantColors[activePage].color),
            ),
            inputDecorationTheme: InputDecorationTheme(
                iconColor: paletteDominantColors.isEmpty
                    ? null
                    : colorButtonLuminance(
                        paletteDominantColors[activePage].color),
                suffixIconColor: paletteDominantColors.isEmpty
                    ? null
                    : colorButtonLuminance(
                        paletteDominantColors[activePage].color),
                prefixIconColor: paletteDominantColors.isEmpty
                    ? null
                    : colorButtonLuminance(
                        paletteDominantColors[activePage].color),
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(25.7)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.7),
                    borderSide: BorderSide(
                        width: 2,
                        color: paletteDominantColors.isEmpty
                            ? Colors.blue
                            : lighten(paletteDominantColors[activePage].color, .2).computeLuminance() > 0.8
                                ? darken(paletteDominantColors[activePage].color, .5)
                                : lighten(paletteDominantColors[activePage].color, .2)))),
            textButtonTheme: TextButtonThemeData(
                style: ButtonStyle(
                    foregroundColor: MaterialStatePropertyAll(
              paletteDominantColors.isEmpty
                  ? null
                  : colorLuminance(paletteDominantColors[activePage].color, .4),
            ))),
            primaryColor: paletteDominantColors.isEmpty ? null : colorLuminance(paletteDominantColors[activePage].color, .4)),
        child: GestureDetector(
          onLongPressDown: (details) => onTapPosition(details),
          onLongPress: () =>
              onRightClickPageMenu(context, _refreshIndicatorKey),
          onSecondaryTapDown: (details) =>
              onRightClickPageMenu(context, _refreshIndicatorKey, details),
          child: Scaffold(
              key: detailScaffoldKey,
              extendBodyBehindAppBar: true,
              body: RefreshIndicator(
                key: _refreshIndicatorKey,
                onRefresh: () async {
                  return Future<void>.delayed(const Duration(seconds: 1));
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  color: paletteDominantColors.isEmpty
                      ? Colors.grey.shade200
                      : colorLight(
                          paletteDominantColors[activePage].color, .45),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 5,
                        child: AnimatedPadding(
                          curve: Curves.fastOutSlowIn,
                          duration: const Duration(milliseconds: 200),
                          padding: useVerticalLayout
                              ? useSmallLayout
                                  ? const EdgeInsets.only(
                                      top: 12, left: 12, right: 0, bottom: 12)
                                  : const EdgeInsets.only(
                                      top: 12, left: 24, right: 0, bottom: 12)
                              : EdgeInsets.zero,
                          child: ScrollConfiguration(
                            behavior: ScrollConfiguration.of(context)
                                .copyWith(scrollbars: false),
                            child: CustomScrollView(
                                controller: _scrollViewController,
                                physics: useVerticalLayout
                                    ? const NeverScrollableScrollPhysics()
                                    : null,
                                slivers: [
                                  SliverAppBar(
                                    elevation: 10,
                                    toolbarHeight: 75,
                                    leadingWidth: 120,
                                    leading: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: IconButton(
                                          onPressed: () =>
                                              Navigator.of(context).pop(),
                                          icon: Row(
                                            children: const [
                                              SizedBox(width: 6),
                                              Icon(
                                                color: Colors.white,
                                                Icons.arrow_back,
                                                shadows: [
                                                  Shadow(
                                                      color: Colors.black26,
                                                      offset: Offset(1, 1),
                                                      blurRadius: 2),
                                                ],
                                              ),
                                              SizedBox(width: 6),
                                              Text(
                                                'Back',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  shadows: [
                                                    Shadow(
                                                        color: Colors.black26,
                                                        offset: Offset(1, 1),
                                                        blurRadius: 2),
                                                  ],
                                                ),
                                              )
                                            ],
                                          )),
                                    ),
                                    backgroundColor: paletteDominantColors
                                            .isEmpty
                                        ? Colors.grey.shade200
                                        : colorLight(
                                            paletteDominantColors[activePage]
                                                .color,
                                            .45),
                                    surfaceTintColor: paletteDominantColors
                                            .isEmpty
                                        ? Colors.grey.shade200
                                        : colorLight(
                                            paletteDominantColors[activePage]
                                                .color,
                                            .45),
                                    expandedHeight: useVerticalLayout
                                        ? constraints.maxHeight - 150
                                        : usePhoneLayout
                                            ? constraints.maxHeight - 205 - 118
                                            : constraints.maxHeight > 600
                                                ? constraints.maxHeight - 485
                                                : constraints.maxHeight - 325,
                                    flexibleSpace: AnimatedContainer(
                                      color: paletteDominantColors.isEmpty
                                          ? Colors.grey.shade200
                                          : colorLight(
                                              paletteDominantColors[activePage]
                                                  .color,
                                              .45),
                                      duration:
                                          const Duration(milliseconds: 200),
                                      child: AnimatedPadding(
                                        duration:
                                            const Duration(milliseconds: 300),
                                        padding: useVerticalLayout
                                            ? const EdgeInsets.all(6)
                                            : EdgeInsets.zero,
                                        child: ClipRRect(
                                          borderRadius: useVerticalLayout
                                              ? BorderRadius.circular(20)
                                              : const BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(12),
                                                  bottomRight:
                                                      Radius.circular(12)),
                                          child: Stack(children: [
                                            FlexibleSpaceBar(
                                              title: null,
                                              background:
                                                  imageMain(context, arguments),
                                            ),
                                            Align(
                                                alignment:
                                                    Alignment.bottomRight,
                                                child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            16),
                                                    child: buttonView3D(
                                                        context,
                                                        arguments['name']
                                                            .toLowerCase(),
                                                        paletteDominantColors
                                                                .isEmpty
                                                            ? paletteDominantColors =
                                                                []
                                                            : paletteDominantColors,
                                                        activePage))),
                                            Align(
                                              alignment: Alignment.bottomCenter,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 16),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: imageIndicators(
                                                      images.length,
                                                      activePage,
                                                      useVerticalLayout),
                                                ),
                                              ),
                                            )
                                          ]),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SliverFillRemaining(
                                    hasScrollBody:
                                        useVerticalLayout ? false : true,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        AnimatedSize(
                                          duration:
                                              const Duration(milliseconds: 800),
                                          curve: Curves.fastOutSlowIn,
                                          child: AnimatedContainer(
                                            duration: const Duration(
                                                milliseconds: 200),
                                            height: useVerticalLayout
                                                ? null
                                                : toogleThumbnail
                                                    ? null
                                                    : 0,
                                            margin: useVerticalLayout
                                                ? const EdgeInsets.all(4)
                                                : toogleThumbnail
                                                    ? const EdgeInsets.fromLTRB(
                                                        4, 6, 4, 2)
                                                    : null,
                                            decoration: BoxDecoration(
                                                color:
                                                    paletteMutedColors.isEmpty
                                                        ? Colors.grey.shade50
                                                        : lighten(
                                                            paletteMutedColors[
                                                                    activePage]
                                                                .color,
                                                            .15),
                                                borderRadius:
                                                    BorderRadius.circular(16)),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: imageThumbnails(
                                                      images.length,
                                                      arguments,
                                                      activePage,
                                                      useVerticalLayout),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Visibility(
                                          visible:
                                              useVerticalLayout ? false : true,
                                          child: Flexible(
                                              flex: 6,
                                              child: AnimatedSlide(
                                                curve: Curves.easeOutExpo,
                                                duration: const Duration(
                                                    milliseconds: 300),
                                                offset: isAnimated
                                                    ? const Offset(0.0, 0.0)
                                                    : const Offset(0.0, 1.0),
                                                child: detailCard(
                                                    useVerticalLayout),
                                              )),
                                        )
                                      ],
                                    ),
                                  )
                                ]),
                          ),
                        ),
                      ),
                      AnimatedSize(
                          duration: const Duration(milliseconds: 200),
                          child: SizedBox(width: useSmallLayout ? 0 : 8)),
                      Visibility(
                        visible: useVerticalLayout ? true : false,
                        child: Expanded(
                            flex: 3,
                            child: AnimatedPadding(
                              curve: Curves.fastOutSlowIn,
                              duration: const Duration(milliseconds: 600),
                              padding: useSmallLayout
                                  ? const EdgeInsets.only(
                                      top: 14, left: 0, right: 12, bottom: 14)
                                  : const EdgeInsets.only(
                                      top: 12, left: 0, right: 24, bottom: 12),
                              child: detailCard(
                                useVerticalLayout,
                              ),
                            )),
                      )
                    ],
                  ),
                ),
              )),
        ),
      );
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
    for (var item in result.path) {
      final target = item.target;
      if (target is RenderPointerListener) {
        target.onPointerSignal = null;
      }
    }
    return res;
  }
}
