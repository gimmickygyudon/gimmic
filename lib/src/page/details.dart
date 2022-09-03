import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gimmic/assets/icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../assets/widgets/button.dart';
import '../../assets/widgets/card.dart';
import '../../assets/widgets/chip.dart';
import '../../assets/widgets/dialog.dart';

class Details extends StatefulWidget {
  const Details({super.key, required this.arguments});
  final Map<dynamic, dynamic> arguments;

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> with TickerProviderStateMixin {
  List<String> images = ["images/hellocat.jpg", "images/hellocat1.jpg"];
  late PageController _pageController;
  late TabController _tabController;
  late ScrollController _scrollViewController;
  bool isScrollingDown = false;

  final String timenow = DateFormat("EEEEE, MMMM dd").format(DateTime.now());
  final ScrollController controller = ScrollController();
  final sink = StreamController<double>();
  late int activePage = widget.arguments['index'];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
        viewportFraction: 1, initialPage: widget.arguments['index']);
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
            duration: const Duration(milliseconds: 200),
            padding: hoveredThumbnail == index
                ? const EdgeInsets.all(4)
                : const EdgeInsets.all(6),
            child: MouseRegion(
              onEnter: (value) => setState(() => hoveredThumbnail = index),
              onExit: (value) => setState(() => hoveredThumbnail = -1),
              child: InkWell(
                onTap: () async {
                  if (currentIndex == index) {
                    await imageDialogHero(context, images, arguments, index);
                  }
                  _pageController.animateToPage(index,
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.ease);
                },
                // splashColor: Colors.white10, // Splash color over image
                child: Card(
                  shadowColor: Colors.black,
                  clipBehavior: Clip.antiAlias,
                  semanticContainer: true,
                  elevation: hoveredThumbnail == index ? 2 : 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 100),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(images[index]),
                        fit: BoxFit.cover,
                      ),
                      border: Border(
                          bottom: BorderSide(
                              // color: Colors.blue,
                              color: currentIndex == index
                                  ? hoveredThumbnail == index
                                      ? Colors.blue
                                      : Colors.blue.shade400
                                  : hoveredThumbnail == index
                                      ? Colors.orange.shade400
                                      : Colors.transparent,
                              width: 3)),
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
                      return GestureDetector(
                        onTap: () async {
                          await imageDialogHero(
                              context, images, arguments, pagePosition);
                        },
                        child: Hero(
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
  Widget detailCard(context, useSmallLayout, useVerticalLayout) {
    return Card(
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
                    top: 15, left: 10, right: 15, bottom: 0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Stack(children: [
                    TabBar(
                        indicator: const UnderlineTabIndicator(
                            borderSide: BorderSide.none,
                            insets: EdgeInsets.only(left: 20, right: 15)),
                        isScrollable: true,
                        indicatorWeight: 3,
                        labelColor: Colors.orange,
                        unselectedLabelColor: Colors.black45,
                        // labelPadding: const EdgeInsets.all(0),
                        labelPadding: const EdgeInsets.only(
                            top: 0, left: 15, right: 0, bottom: 10),
                        controller: _tabController,
                        labelStyle: GoogleFonts.roboto(
                            fontWeight: FontWeight.w500, fontSize: 16),
                        onTap: (e) {
                          setState(() {
                            tabController(_tabController.index);
                            toogleThumbnail = false;
                          });
                        },
                        tabs: <Widget>[
                          _tabController.index == 0
                              ? Tab(
                                  child: detailCardTab(
                                      0, Icons.data_object, "Hello Cat"),
                                )
                              : useSmallLayout
                                  ? Tab(
                                      child: detailCardTab(
                                          0, Icons.data_object, "Hello Cat"),
                                    )
                                  : Tab(
                                      child: detailCardTabIcon(
                                          0, Icons.data_object)),
                          _tabController.index == 1
                              ? Tab(
                                  child: detailCardTab(
                                      1, Icons.forum_outlined, "Comments"),
                                )
                              : useSmallLayout
                                  ? Tab(
                                      child: detailCardTab(
                                          1, Icons.forum_outlined, "Comments"),
                                    )
                                  : Tab(
                                      child: detailCardTabIcon(
                                          1, Icons.forum_outlined))
                        ]),
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      child: useVerticalLayout
                          ? null
                          : Align(
                              alignment: Alignment.centerRight,
                              child: Container(
                                padding: const EdgeInsets.only(
                                    right: 42, bottom: 5, top: 5),
                                child: ToggleButtons(
                                  borderRadius: BorderRadius.circular(25.7),
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
                            ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        margin: const EdgeInsets.only(
                            top: 6, left: 6, right: 0, bottom: 6),
                        decoration: BoxDecoration(
                            color: Colors.grey.shade50,
                            borderRadius: BorderRadius.circular(25.7)),
                        child: PopupMenuButton<int>(
                          elevation: 1,
                          color: Colors.grey.shade50,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                              side: const BorderSide(
                                  width: 1, color: Colors.black12)),
                          icon: const Icon(
                            Icons.more_vert,
                            color: Colors.black54,
                          ),
                          iconSize: 22,
                          padding: EdgeInsets.zero,
                          itemBuilder: (context) => [
                            PopupMenuItem(
                              value: 1,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 8, right: 8, top: 0, bottom: 0),
                                child: Row(
                                  children: [
                                    const Icon(Icons.favorite_border,
                                        color: Colors.black54),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text("Add to Favorites",
                                        style: GoogleFonts.roboto(
                                            fontWeight: FontWeight.w500,
                                            color: Colors.grey.shade800))
                                  ],
                                ),
                              ),
                            ),
                            PopupMenuItem(
                              value: 2,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 0),
                                child: Row(
                                  children: [
                                    const Icon(Icons.share_outlined,
                                        color: Colors.black54),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text("Share",
                                        style: GoogleFonts.roboto(
                                            fontWeight: FontWeight.w500,
                                            color: Colors.grey.shade800))
                                  ],
                                ),
                              ),
                            ),
                            PopupMenuItem(
                              value: 3,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 0),
                                child: Row(
                                  children: [
                                    const Icon(Icons.link_outlined,
                                        color: Colors.black54),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text("Copy Link",
                                        style: GoogleFonts.roboto(
                                            fontWeight: FontWeight.w500,
                                            color: Colors.grey.shade800))
                                  ],
                                ),
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
            child: Container(
              color: Colors.grey.shade50,
              child: SizedBox(
                height: MediaQuery.of(context).size.height / 2,
                child: TabBarView(
                  controller: _tabController,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 25, right: 25, bottom: 0, top: 10),
                      child: ListView(children: [
                        ExpansionTile(
                          onExpansionChanged: (value) {
                            setState(() {
                              toogleThumbnail = false;
                            });
                          },
                          tilePadding:
                              const EdgeInsets.symmetric(horizontal: 0),
                          title: Text(
                            'Aragon Malay',
                            style: GoogleFonts.roboto(
                                fontSize: 24,
                                fontWeight: FontWeight.w400,
                                letterSpacing: -0.5),
                          ),
                          subtitle: const Text('Legends of Zelda'),
                          trailing: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.favorite_border,
                                color: Colors.black87,
                              )),
                          children: [
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
                            ButtonBar(children: [
                              TextButton.icon(
                                  onPressed: () {},
                                  icon: const Icon(FontAwesomeIcons.wikipediaW,
                                      size: 14),
                                  label: const Text('Wikipedia')),
                              TextButton.icon(
                                  onPressed: () {},
                                  icon: const Icon(FontAwesomeIcons.google,
                                      size: 14),
                                  label: const Text('Google'))
                            ]),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child: Row(
                            children: [
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: chipTagOutlined(
                                      'Cat', FontAwesomeIcons.cat, 16.0, 12.0)),
                              const SizedBox(width: 6),
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: chipTagOutlined('Animal',
                                      Icons.pets_rounded, 16.0, 12.0)),
                            ],
                          ),
                        ),
                        const Divider(height: 20),
                        Theme(
                          data: ThemeData()
                              .copyWith(dividerColor: Colors.transparent),
                          child: ExpansionTile(
                            tilePadding:
                                const EdgeInsets.symmetric(horizontal: 0),
                            title: Text(
                              'Blender',
                              style: GoogleFonts.roboto(
                                  fontSize: 18, fontWeight: FontWeight.w400),
                            ),
                            subtitle: const Text('3.2.2 (bcfdb14560e7)'),
                            textColor: Colors.orange,
                            iconColor: Colors.orange,
                            leading: IconButton(
                                tooltip: 'Open Blender',
                                onPressed: () {},
                                icon: const Icon(
                                  IconSoftware.blender3d_filled,
                                  color: Colors.orangeAccent,
                                )),
                            children: const [
                              ListTile(
                                title: Text('Verticies'),
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
                        Theme(
                          data: ThemeData()
                              .copyWith(dividerColor: Colors.transparent),
                          child: ExpansionTile(
                            tilePadding:
                                const EdgeInsets.symmetric(horizontal: 0),
                            title: Text(
                              'Renderer',
                              style: GoogleFonts.roboto(
                                  fontSize: 18, fontWeight: FontWeight.w400),
                            ),
                            subtitle: const Text('Cycles / Eevee'),
                            leading: IconButton(
                                tooltip: 'Open Image',
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.image_outlined,
                                )),
                            children: const [
                              ListTile(
                                title: Text('Resolution'),
                                subtitle: Text('2080 x 2080 Pixels'),
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
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 6),
                              child: Icon(FontAwesomeIcons.youtube,
                                  size: 16, color: Colors.red),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8, 0, 4, 0),
                              child: Text('Youtube Tutorial',
                                  style: GoogleFonts.roboto(fontSize: 14)),
                            ),
                            const Expanded(child: Divider(indent: 12)),
                          ],
                        ),
                        const SizedBox(height: 6),
                        cardYoutube(images[0]),
                      ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      child: ListView(
                        children: const <Widget>[
                          CardComment(),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Container(
            color: Colors.grey.shade50,
            padding: EdgeInsets.only(
                top: 10,
                left: 20,
                right: 20,
                bottom: useVerticalLayout ? 20 : 10),
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: _tabController.index == 0
                  ? ElevatedButton.icon(
                      icon: const Icon(Icons.file_download_outlined),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.green.shade100),
                        foregroundColor:
                            MaterialStateProperty.resolveWith((states) {
                          return states.contains(MaterialState.hovered)
                              ? Colors.white
                              : Colors.green;
                        }),
                        minimumSize: MaterialStateProperty.all(
                            const Size(double.infinity, 56)),
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
                    )
                  : TextField(
                      autofocus: true,
                      decoration: InputDecoration(
                          isDense: true,
                          filled: true,
                          hintText: "Message...",
                          hintStyle:
                              GoogleFonts.roboto(fontWeight: FontWeight.w500),
                          prefixIcon:
                              const Icon(Icons.account_circle, size: 24),
                          prefixIconConstraints:
                              const BoxConstraints(minWidth: 55),
                          suffixIcon: const Icon(Icons.send, size: 24),
                          suffixIconConstraints:
                              const BoxConstraints(minWidth: 50),
                          border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.blue, width: 2),
                              borderRadius: BorderRadius.circular(25.7)),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.blue, width: 2),
                            borderRadius: BorderRadius.circular(25.7),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(25.7),
                          )),
                    ),
            ),
          ),
        ],
      ),
    );
  }

  Widget detailCardTabIcon(index, icons) {
    return IconButton(
      onPressed: () {
        setState(() {
          _tabController.animateTo(index);
          toogleThumbnail = false;
        });
      },
      padding: const EdgeInsets.all(14),
      style: ButtonStyle(
          padding: const MaterialStatePropertyAll(EdgeInsets.all(16)),
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
              padding: const MaterialStatePropertyAll(EdgeInsets.all(16)),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12))),
              backgroundColor: MaterialStateProperty.all(Colors.orange),
              elevation: MaterialStateProperty.all(0))
          : ButtonStyle(
              padding: const MaterialStatePropertyAll(EdgeInsets.all(16)),
              backgroundColor: MaterialStateProperty.all(Colors.grey.shade200),
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
      bool useSmallLayout = constraints.maxWidth > 1100;
      bool usePhoneLayout = constraints.maxWidth > 550;
      bool useVerticalLayout = constraints.maxWidth > 800;
      return Scaffold(
          extendBodyBehindAppBar: true,
          body: Container(
            color: Colors.grey.shade200,
            child: Row(
              children: [
                Expanded(
                  flex: 5,
                  child: AnimatedPadding(
                    curve: Curves.fastOutSlowIn,
                    duration: const Duration(milliseconds: 600),
                    padding: useVerticalLayout
                        ? useSmallLayout
                            ? const EdgeInsets.only(
                                top: 12, left: 24, right: 0, bottom: 12)
                            : const EdgeInsets.only(
                                top: 12, left: 12, right: 0, bottom: 12)
                        : EdgeInsets.zero,
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
                                  onPressed: () => Navigator.of(context).pop(),
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
                            backgroundColor: Colors.grey.shade200,
                            surfaceTintColor: Colors.grey.shade200,
                            expandedHeight: useVerticalLayout
                                ? constraints.maxHeight - 150
                                : usePhoneLayout
                                    ? constraints.maxHeight - 205 - 118
                                    : constraints.maxHeight - 325,
                            flexibleSpace: AnimatedPadding(
                              duration: const Duration(milliseconds: 300),
                              padding: useVerticalLayout
                                  ? const EdgeInsets.all(6)
                                  : const EdgeInsets.only(bottom: 6),
                              child: ClipRRect(
                                borderRadius: useVerticalLayout
                                    ? BorderRadius.circular(20)
                                    : const BorderRadius.only(
                                        bottomLeft: Radius.circular(12),
                                        bottomRight: Radius.circular(12)),
                                child: Stack(children: [
                                  FlexibleSpaceBar(
                                    title: null,
                                    background:
                                        imageMain(context, widget.arguments),
                                  ),
                                  Align(
                                      alignment: Alignment.bottomRight,
                                      child: Padding(
                                          padding: const EdgeInsets.all(16),
                                          child: buttonView3D(
                                              context, usePhoneLayout)))
                                ]),
                              ),
                            ),
                          ),
                          SliverFillRemaining(
                            hasScrollBody: useVerticalLayout ? false : true,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                AnimatedSize(
                                  duration: const Duration(milliseconds: 800),
                                  curve: Curves.fastOutSlowIn,
                                  child: AnimatedContainer(
                                    duration: const Duration(milliseconds: 800),
                                    height: useVerticalLayout
                                        ? null
                                        : toogleThumbnail
                                            ? null
                                            : 0,
                                    margin: toogleThumbnail
                                        ? const EdgeInsets.all(4)
                                        : useVerticalLayout
                                            ? const EdgeInsets.only(
                                                top: 4,
                                                left: 4,
                                                right: 6,
                                                bottom: 6)
                                            : null,
                                    decoration: BoxDecoration(
                                        color: Colors.grey.shade50,
                                        borderRadius:
                                            BorderRadius.circular(16)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: imageThumbnails(
                                              images.length,
                                              widget.arguments,
                                              activePage,
                                              useVerticalLayout),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Visibility(
                                  visible: useVerticalLayout ? false : true,
                                  child: Flexible(
                                      flex: 6,
                                      child: detailCard(context, useSmallLayout,
                                          useVerticalLayout)),
                                )
                              ],
                            ),
                          )
                        ]),
                  ),
                ),
                AnimatedSize(
                    duration: const Duration(milliseconds: 400),
                    child: SizedBox(width: useSmallLayout ? 8 : 0)),
                Visibility(
                  visible: useVerticalLayout ? true : false,
                  child: Expanded(
                      flex: 3,
                      child: AnimatedPadding(
                        curve: Curves.fastOutSlowIn,
                        duration: const Duration(milliseconds: 600),
                        padding: useSmallLayout
                            ? const EdgeInsets.only(
                                top: 12, left: 0, right: 24, bottom: 12)
                            : const EdgeInsets.only(
                                top: 12, left: 0, right: 12, bottom: 12),
                        child: detailCard(
                            context, useSmallLayout, useVerticalLayout),
                      )),
                )
              ],
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
