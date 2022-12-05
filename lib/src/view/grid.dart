import 'package:flutter/material.dart';
import 'package:gimmic/assets/functions/platform.dart';
import 'package:gimmic/assets/functions/string.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../assets/functions/scroll.dart';
import '../../assets/functions/url.dart';
import '../../assets/widgets/button.dart';
import '../../assets/widgets/menu.dart';

class GridResource extends StatefulWidget {
  final bool useVerticalLayout;
  final bool useVerticalLayout2x;
  final bool useVerticalLayout3x;
  final bool parallax;

  final List<bool> layouts;
  final int gridRowCount;
  final ScrollController scrollViewController;
  final List<Map<String, dynamic>> foundResource;

  const GridResource(
      {super.key,
      required this.layouts,
      required this.useVerticalLayout,
      required this.gridRowCount,
      required this.useVerticalLayout2x,
      required this.useVerticalLayout3x,
      required this.foundResource,
      required this.scrollViewController, required this.parallax});

  @override
  State<GridResource> createState() => _GridResourceState();
}

int selectedIndex = -1;

final String timenow = DateFormat("MMMM dd").format(DateTime.now());

List<String> images = [
  "images/hellocat.jpg",
  "images/hellocat1.jpg",
  "images/hellocat.jpg",
  "images/hellocat1.jpg"
];

final GlobalKey<State<StatefulWidget>> _imageIndicatorKey = GlobalKey<State<StatefulWidget>>();

// image indicators
List<Widget> imageIndicators(imagesLength, currentIndex, layout) {
  return List<Widget>.generate(imagesLength, (index) {
    return GestureDetector(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        margin: const EdgeInsets.all(3),
        width: 4,
        height: 4,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.7),
          color: currentIndex == index ? Colors.black54 : Colors.black26,
        ),
      ),
    );
  });
}

bool isTileSelected = false;
Widget gridDescription(context, setState, layouts, name, widget, selectedIndex, index) {
  return AnimatedSize(
    duration: const Duration(milliseconds: 300),
    curve: Curves.ease,
    child: LayoutBuilder(
      builder: (context, constraints) => SizedBox(
        height: layouts[0] ? 0 : null,
        width: constraints.maxWidth,
        child: Visibility(
          maintainAnimation: true,
          maintainState: true,
          visible: layouts[0] ? false : true,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 6),
            child: StatefulBuilder(
              builder: (context, setState) => 
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Theme(
                    data: ThemeData(useMaterial3: true)
                        .copyWith(dividerColor: Colors.transparent),
                    child: ListTileTheme(
                      iconColor: Colors.deepPurple,
                      textColor: Colors.deepPurple,
                      dense: true,
                      horizontalTitleGap: 0,
                      child: ExpansionTile(
                        onExpansionChanged: (value) {
                          if (isWebMobile) {
                            selectedIndex = index;
                            setState(() {
                              isTileSelected = value;
                            });
                          }
                        },
                        maintainState: true,
                        title: MouseRegion(
                          onEnter: (event) => setState(() => isTileSelected = true),
                          onExit: (event) => setState(() => isTileSelected = false),
                          child: Text(name,
                              style: GoogleFonts.roboto(
                                  color: Colors.grey.shade800,
                                  fontSize: isWebMobile ? 22 : 20,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: -1)),
                        ),
                        subtitle: MouseRegion(
                          onEnter: (event) => setState(() => isTileSelected = true),
                          onExit: (event) => setState(() => isTileSelected = false),
                          child: Text(
                              widget.foundResource[index]["brand"].toString().toTitleCase(),
                              style: GoogleFonts.roboto(
                                  height: 1,
                                  color: Colors.grey.shade600,
                                  fontSize: isWebMobile ? 18 : 16,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0)
                              ),
                        ),
                        trailing: MouseRegion(
                          onEnter: (event) => setState(() => isTileSelected = true),
                          onExit: (event) => setState(() => isTileSelected = false),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                  tooltip: 'Add to Favorites',
                                  visualDensity: const VisualDensity(
                                      horizontal: -2, vertical: -2),
                                  color: selectedIndex == index
                                      ? Colors.black87
                                      : Colors.black54,
                                  onPressed: () {},
                                  icon: const Icon(Icons.favorite_border)),
                              const SizedBox(width: 6),
                              SizedBox(
                                  child: selectedIndex == index
                                      ? isTileSelected
                                          ? const Icon(Icons.expand_circle_down,
                                              color: Colors.deepPurple)
                                          : const Icon(
                                              Icons.expand_circle_down_outlined,
                                              color: Colors.black87)
                                      : const Icon(
                                          Icons.expand_circle_down_outlined,
                                          color: Colors.black54)),
                            ],
                          ),
                        ),
                        children: <Widget>[
                          AnimatedPadding(
                            duration: const Duration(milliseconds: 400),
                            padding: isWebMobile
                                ? EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical:
                                        widget.useVerticalLayout3x ? 0 : 5)
                                : selectedIndex == index
                                    ? const EdgeInsets.only(left: 10, right: 10)
                                    : const EdgeInsets.only(
                                        left: 10, right: 10),
                            child: Column(
                              children: [
                                AnimatedSize(
                                  curve: Curves.fastOutSlowIn,
                                  duration: const Duration(milliseconds: 400),
                                  child: SizedBox(
                                      height:
                                          selectedIndex == index || isWebMobile
                                              ? null
                                              : 10,
                                      child: const Padding(
                                        padding: EdgeInsets.all(8),
                                        child: SelectableText(
                                            'A cat is a furry animal that has a long tail and sharp claws. Cats are often kept as pets. Cats are lions, tigers, and other wild animals in the same family.'),
                                      )),
                                ),
                                const SizedBox(height: 10),
                                ButtonBar(
                                  alignment: MainAxisAlignment.spaceBetween,
                                  buttonPadding: EdgeInsets.zero,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 5, bottom: 0),
                                      child: SizedBox(
                                        width: constraints.maxWidth / 1.65,
                                        child: ScrollConfiguration(
                                          behavior: DragOnScroll(),
                                          child: SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                            child: Wrap(
                                              spacing: 8,
                                              children: List.generate(
                                                widget.foundResource[index]['tags'].length, (i) {
                                                  return FilterChip(
                                                    visualDensity: const VisualDensity(
                                                      vertical: -4,
                                                      horizontal: -4),
                                                    padding: null,
                                                    side: BorderSide.none,
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(25.7)
                                                    ),
                                                    backgroundColor:
                                                      selectedIndex == index
                                                          ? Colors.deepPurple.withOpacity(.15)
                                                          : Colors.deepPurple.withOpacity(.05),
                                                    onSelected: (value) {},
                                                    label: Text(widget.foundResource[index]['tags'][i],
                                                      style: const TextStyle(
                                                          color: Colors.black54,
                                                          fontSize: 12,
                                                          fontWeight: FontWeight.w600)),
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: selectedIndex == index
                                          ? const EdgeInsets.all(0)
                                          : const EdgeInsets.only(right: 5),
                                      child: downloadButton(context,
                                          selectedIndex, index, 'Download'),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ),
  );
}

class _GridResourceState extends State<GridResource> {
  @override
  Widget build(BuildContext context) {
    return AnimatedPadding(
      curve: Curves.easeIn,
      duration: const Duration(milliseconds: 600),
      padding: widget.useVerticalLayout
          ? const EdgeInsets.only(bottom: 0, top: 6, left: 40, right: 40)
          : const EdgeInsets.only(bottom: 0, top: 6, left: 24, right: 24),
      child: GridView.builder(
          physics: const BouncingScrollPhysics(),
          controller: widget.scrollViewController,
          itemCount: widget.foundResource.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisExtent: widget.useVerticalLayout
                  ? MediaQuery.of(context).size.width / 3.25
                  : 390,
              crossAxisCount: widget.gridRowCount,
              crossAxisSpacing: isWebMobile ? 10 : 0,
              mainAxisSpacing: 0),
          itemBuilder: (context, index) {
            return Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: BigCard(
                    index: index,
                    parallax: widget.parallax,
                    foundResource: widget.foundResource,
                    useVerticalLayout3x: widget.useVerticalLayout3x,
                    layouts: widget.layouts));
          }),
    );
  }
}

class BigCard extends StatefulWidget {
  const BigCard(
      {super.key,
      required this.index,
      required this.foundResource,
      required this.useVerticalLayout3x,
      required this.layouts, required this.parallax});

  final List<Map<String, dynamic>> foundResource;
  final bool useVerticalLayout3x;
  final bool parallax;
  final int index;

  final List<bool> layouts;

  @override
  State<BigCard> createState() => _BigCardState();
}

class _BigCardState extends State<BigCard> with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;

  double localX = 0;
  double localY = 0;
  bool defaultPosition = true;
  bool downButton = false;

  double scaleX = 1;
  double scaleY = 1;

  @override
  void initState() {
    super.initState();
    _setupAnimation();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  void _setupAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
    )..addListener(() => setState(() {
          scaleX = animation.value;
          scaleY = animation.value;
        }));
    animation = Tween<double>(begin: 1, end: 0.9).animate(CurvedAnimation(
      curve: Curves.decelerate,
      parent: animationController,
    ));
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    double percentageX = (localX / (size.width / 2.25)) * 100;
    double percentageY = (localY / (size.width / 2.5)) * 100;

    String name = widget.foundResource[widget.index]['name'];
    String hero = 'test_${widget.index}';
    int i = 1;
    int pageIndex = 0;

    void pushNamed() {
      context.pushNamed('details', params: {
        'name': name.toLowerCase(),
      }, extra: {
        "name": name,
        "hero": hero,
        "index": '$i'
      });
    }

    String url = currentUrl(context, "/${name.toLowerCase()}");
    return Transform(
      transform: Matrix4.identity()
        ..setEntry(3, 2, 0.001)
        ..rotateX(defaultPosition ? 0 : (0.2 * (percentageY / 50) + -0.2))
        ..rotateY(defaultPosition ? 0 : (-0.2 * (percentageX / 50) + 0.2)),
      alignment: FractionalOffset.center,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) {
          setState(() {
            selectedIndex = widget.index;
            if (widget.parallax) {
              defaultPosition = false;
            }
          });
        },
        onExit: (_) {
          setState(() {
            selectedIndex = -1;
            if (widget.parallax) {
              localY = (size.height) / 2;
              localX = (size.width * 0.45) / 2;
              defaultPosition = true;
            }
          });
        },
        onHover: (details) {
          if (widget.parallax) {
            if (mounted) setState(() => defaultPosition = false);
            if (details.localPosition.dx > 0 && details.localPosition.dy > 0) {
              if (details.localPosition.dx < (size.width * 0.45) * 1.5 &&
                  details.localPosition.dy > 0) {
                localX = details.localPosition.dx;
                localY = details.localPosition.dy;
              }
            }
          }
        },
        child: GestureDetector(
          onSecondaryTapDown: (details) => onRightClickMenu(context, url,
              [widget.index], hero + i.toString(), pushNamed, details),
          onLongPress: () => onRightClickMenu(context, url,
              images[widget.index], hero + i.toString(), pushNamed),
          onTapDown: (details) => onTapPosition(details),
          onTap: () => pushNamed(),
          child: AnimatedScale(
            curve: Curves.ease,
            duration: Duration(
              milliseconds: isWebMobile && widget.useVerticalLayout3x ? 0 : 300),
            scale: isWebMobile && widget.useVerticalLayout3x
                ? 1
                : selectedIndex == widget.index ? 1 : 0.95,
            child: Hero(
              tag: hero + i.toString(),
              child: Card(
                  clipBehavior: selectedIndex == widget.index 
                    ? Clip.none
                    : Clip.antiAlias,
                  elevation: selectedIndex == widget.index
                      ? 15
                      : widget.layouts[0] ? 15 : 2,
                  shadowColor: selectedIndex == widget.index
                      ? Colors.blue
                      : Colors.black38,
                  color: Colors.transparent,
                  surfaceTintColor: Colors.deepPurple,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide.none
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 3,
                        child: Stack(
                          fit: StackFit.expand, children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: AnimatedContainer(
                              curve: Curves.fastOutSlowIn,
                              duration: const Duration(milliseconds: 500),
                              foregroundDecoration: BoxDecoration(
                                border: selectedIndex == widget.index
                                  ? const Border(
                                      top: BorderSide(color: Colors.blue, width: 3),
                                      bottom: BorderSide(color: Colors.blue, width: 3)
                                    )
                                  : null,
                              ),
                              child: AnimatedScale(
                                curve: Curves.easeOutQuart,
                                duration: const Duration(milliseconds: 600),
                                scale: selectedIndex == widget.index ? 1.05 : 1,
                                child: ScrollConfiguration(
                                  behavior: DragOnScroll(),
                                  child: PageView.builder(
                                    pageSnapping: true,
                                    onPageChanged: (value) {
                                        _imageIndicatorKey.currentState?.setState(() {
                                        pageIndex = value;
                                      });
                                    },
                                    physics: const BouncingScrollPhysics(),
                                    itemCount: widget.foundResource[widget.index]["images"].length,
                                    itemBuilder: (context, i) => InteractiveViewer(
                                      child: Image(
                                        image: MemoryImage(widget.foundResource[widget.index]["images"][i]),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Visibility(
                            visible: 
                              widget.foundResource[widget.index]["images"].length == 1
                                ? false
                                : true,
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(8, 8, 8, widget.layouts[1] ? 80 : 8),
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: StatefulBuilder(
                                  key: _imageIndicatorKey,
                                  builder: (context, setState) => Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: imageIndicators(
                                          widget.foundResource[widget.index]["images"].length,
                                          pageIndex,
                                          widget.useVerticalLayout3x)),
                                ),
                              ),
                            ),
                          ),
                          AnimatedOpacity(
                            opacity: selectedIndex == widget.index || isWebMobile
                                    ? 1
                                    : 0,
                            duration: const Duration(milliseconds: 200),
                            child: Align(
                                alignment: Alignment.topRight,
                                child: Transform(
                                  transform: Matrix4.identity()
                                      ..translate(
                                          defaultPosition ? 0.0 : (5 * (percentageX / 50) + -5),
                                          defaultPosition ? 0.0 : (10 * (percentageY / 50) + -10), 
                                        0.0),
                                  child: Padding(
                                    padding: const EdgeInsets.all(16),
                                    child: buttonMoreMenu(
                                      url, images[widget.index], hero + i.toString(), pushNamed),
                                  ),
                                )),
                          ),
                          AnimatedOpacity(
                            opacity: selectedIndex == widget.index || isWebMobile
                                    ? 1
                                    : 0,
                            curve: Curves.easeIn,
                            duration: const Duration(milliseconds: 150),
                            child: Align(
                              alignment: Alignment.bottomRight,
                              child: AnimatedScale(
                                scale: selectedIndex == widget.index || isWebMobile
                                    ? 1
                                    : 0.9,
                                curve: Curves.easeOut,
                                duration: const Duration(milliseconds: 350),
                                child: Transform(
                                  transform: Matrix4.identity()
                                      ..translate(
                                          defaultPosition ? 0.0 : (15 * (percentageX / 50) + -15),
                                          defaultPosition ? 0.0 : (30 * (percentageY / 50) + -30), 
                                        0.0),
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(8, 8, 8, widget.layouts[1] ? 76 : 8),
                                    child: TextButton(
                                      style: const ButtonStyle(
                                          foregroundColor: MaterialStatePropertyAll(Colors.white),
                                          textStyle: MaterialStatePropertyAll(
                                            TextStyle(
                                            shadows: [
                                              Shadow(
                                                  color: Colors.black26,
                                                  offset: Offset(1, 1),
                                                  blurRadius: 2),
                                              ],
                                            ))),
                                      onPressed: () {},
                                      child: Text(widget.foundResource[widget.index]["time"])
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Transform(
                              transform: Matrix4.identity()
                                  ..translate(
                                      defaultPosition ? 0.0 : (10 * (percentageX / 50) + -10),
                                      defaultPosition ? 0.0 : (20 * (percentageY / 50) + -20), 
                                    0.0),
                              child: AnimatedContainer(
                                curve: Curves.ease,
                                duration: const Duration(milliseconds: 300),
                                margin: EdgeInsets.all(selectedIndex == widget.index ? 12 : 0),
                                decoration: BoxDecoration(
                                  color: selectedIndex == widget.index
                                    ? Colors.blueGrey.shade50
                                    : Colors.white,
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(selectedIndex == widget.index ? 12 : 0), 
                                    bottom: const Radius.circular(12))
                                ),
                                child: Transform(
                                  transform: Matrix4.identity()
                                  ..translate(
                                      defaultPosition ? 0.0 : (7.5 * (percentageX / 50) + -7.5),
                                      defaultPosition ? 0.0 : (5 * (percentageY / 50) + -5), 
                                    0.0),
                                  child: gridDescription(
                                    context, setState, widget.layouts, 
                                    name, widget, selectedIndex, widget.index))
                                  ),
                            ))
                        ]),
                      ),
                    ],
                  )),
            ),
          ),
        ),
      ),
    );
  }
}
