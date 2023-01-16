import 'dart:async';
import 'dart:math';
import 'dart:typed_data';

import 'package:cross_file/cross_file.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gimmic/assets/functions/string.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:universal_html/html.dart';
import 'package:video_player/video_player.dart';

import 'package:gimmic/assets/functions/platform.dart';
import 'package:gimmic/assets/icons.dart';
import '../../assets/colors.dart'
    if (dart.library.js) '../../assets/colors_web.dart'
    if (dart.library.html) '../../assets/colors_web.dart'
    if (dart.library.io) '../../assets/colors.dart';

import '../../assets/functions/colors.dart';
import '../../assets/functions/resource.dart';
import '../../assets/functions/url.dart';
import '../../assets/functions/scroll.dart';
import '../../assets/label.dart';
import '../../assets/widgets/button.dart';
import '../../assets/widgets/card.dart';
import '../../assets/widgets/dialog.dart';
import '../../assets/widgets/menu.dart';
import '../../assets/widgets/shimmer.dart';
import '../../assets/widgets/snackbar.dart';

int activePage = 0;
bool toogleThumbnail = true;
bool isScrollingDown = false;
final List<String> images = ["images/hellocat.jpg", "images/hellocat1.jpg"];
List<Uint8List> pictures = [];
final GlobalKey<State<StatefulWidget>> _thumbnailsKey = GlobalKey<State<StatefulWidget>>();
final GlobalKey<State<StatefulWidget>> _thumbnailsImageKey = GlobalKey<State<StatefulWidget>>();

class Details extends StatefulWidget {
  const Details({Key? key, this.arguments}) : super(key: key);
  final Map<dynamic, dynamic>? arguments;

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  late PageController _pageController;

  late Future _loadItems;
  late String resource;
  late String randomEmoji;
  List<Map<String, dynamic>> data = List.empty();

  late VideoPlayerController _videoController;
  Uint8List? videoThumbnails;

  final GlobalKey<ScaffoldState> detailScaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();
  final GlobalKey<State<StatefulWidget>> _detailCardKey = GlobalKey<State<StatefulWidget>>();

  final String timenow = DateFormat("EEEEE, MMMM dd").format(DateTime.now());

  bool isAnimated = true;
  bool paletteLoaded = false;
  Map<dynamic, dynamic> arguments = {
    'name': 'default',
    'hero': 'default',
    'index': 0
  };

  @override
  void initState() {
    snackbarbinding = false;
    Completer updatePaletteGenCompleter = Completer();
    
    _loadItems = loadItems().then((value) async {
      List<Map<String, dynamic>> json = value;
      
      String currentUrl = GoRouter.of(context).location;
      int pos = currentUrl.lastIndexOf('/');
      resource = (pos != -1) ? currentUrl.substring(pos + 1, currentUrl.length) : currentUrl;
      resource = resource.replaceAll(RegExp(r'%20'), ' ');

      int index = json.indexWhere((element) => element["name"].toLowerCase().contains(resource.toLowerCase()));
      data = json.where((element) => element["name"].toLowerCase().contains(resource.toLowerCase())).toList();

      setState(() {
        arguments['hero'] = '${data.first['name']}_$index';
      });
      
      if (data.first["name"].toLowerCase() != resource.toLowerCase()) { 
        data = List.empty();
      } else {
        void bindSnackBar() {
          rootScaffoldMessengerKey.currentState
            ?.showSnackBar(snackbarPaletteLoading('Creating palette color...'))
            .closed
            .then((value) {
            rootScaffoldMessengerKey.currentState?.showSnackBar(snackbarPaletteComplete('Palette color created'));
          });
        }

        Timer(const Duration(milliseconds: 200), () {
          updatePaletteGen(data.first["images"], data.first["name"].toLowerCase(), bindSnackBar, updatePaletteGenCompleter).whenComplete(() async {
            await updatePaletteGenCompleter.future.whenComplete(() {
              if (loadingpalette == false) {
                rootScaffoldMessengerKey.currentState?.hideCurrentSnackBar();
              }
              if (snackbarbinding == false) {
                setState(() {
                  detailScaffoldKey.currentState?.setState(() {
                    if (paletteMutedColors.isNotEmpty 
                    && paletteVibrantColors.isNotEmpty 
                    && paletteDominantColors.isNotEmpty) {
                        paletteLoaded = true;  
                    }
                    // debugPrint('updatePaletteGenCompleter Complete');
                  });
                });
              }
            });
          });
        });
      }
    });

    final random = Random();
    randomEmoji = StringResource.emoji[random.nextInt(StringResource.emoji.length)];

    _scrollViewController = ScrollController();
    _videoController = VideoPlayerController.network('https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4')
    ..initialize().then((value) async {
      setState(() { });
    });
    _videoController.setLooping(true);

    _getVideoThumbnail('https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4', (imageBytes) { 
      videoThumbnails = imageBytes;            
      setState(() { });
    });

    super.initState();

    /* isAnimated = false;
    Future.delayed(const Duration(milliseconds: 50)).whenComplete(() {
      setState(() {
        isAnimated = true;
      });
    }); */

    if (widget.arguments != null) {
      arguments = widget.arguments!;
    }

    _scrollViewController.addListener(() {
      if (_scrollViewController.position.userScrollDirection == ScrollDirection.reverse) {
        if (!isScrollingDown && toogleThumbnail == true) {
          _thumbnailsKey.currentState?.setState(() {
            isScrollingDown = true;
            toogleThumbnail = false;           
          });
        }
      }

      if (_scrollViewController.position.userScrollDirection == ScrollDirection.forward) {
        if (isScrollingDown && toogleThumbnail == false) {
          _thumbnailsKey.currentState?.setState(() {
            isScrollingDown = false;
            toogleThumbnail = true;
          });
        }
      }
    });
    
    activePage = int.parse(arguments['index']);
    _pageController = PageController(viewportFraction: 1, initialPage: int.parse(arguments['index']));
  }

  @override
  void dispose() {
    snackbarbinding = true;
    _scrollViewController.dispose();
    _pageController.dispose();
    controller.dispose();
    controllerComment.dispose();
    _videoController.dispose();
    resetPalette();
    super.dispose();
  }

Future<void> _getVideoThumbnail(String path, void Function(Uint8List? imageBytes) callback) async {
  VideoElement video = VideoElement()
    ..crossOrigin = 'anonymous'
    ..src = path
    ..muted = true;
  CanvasElement canvas = CanvasElement();
  video.onLoadedMetadata.listen((Event event) async {
    canvas.width = video.videoWidth;
    canvas.height = video.videoHeight;
    video.currentTime = 0;
  });
  video.onSeeked.listen((Event event) async {
    CanvasRenderingContext2D ctx = canvas.context2D;
    ctx.drawImage(video, 0, 0);
    Blob blob = await canvas.toBlob('image/png', 0.95);
    XFile xFile = XFile(Url.createObjectUrlFromBlob(blob),
        mimeType: 'image/png',
        lastModified: DateTime.now(),
        length: blob.size);
    debugPrint('Obtained xFile=[${xFile.path}] for path=[$path].');
    callback.call(await xFile.readAsBytes());
  });
  video.onError.listen((Event event) async {
    debugPrint('Error processing path=[$path] with event=[$event].');
    callback.call(null);
  });
}

// indicators of images
  List<Widget> imageIndicators(currentIndex, layout) {
    return List<Widget>.generate(data.first["images"].length, (index) {
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
              : 0,
          height: 4,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.7),
            color: currentIndex == index ? Colors.black26 : Colors.black12,
          ),
        ),
      );
    });
  }

// thumbnails of images
  int hoveredThumbnail = -1;
  double? page = activePage.toDouble();
  Widget imageThumbnails(arguments, currentIndex, useVerticalLayout) {
    int length = data.first["images"].length;

    return StatefulBuilder(
      key: _thumbnailsImageKey,
      builder: (context, setState) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: List<Widget>.generate(length + 1, (index) {
          // video_exist var then -> add videos total +1
           return ConstrainedBox(
             constraints: BoxConstraints(maxHeight: useVerticalLayout ? 116 : 88),
             child: AspectRatio(
               aspectRatio: 1 / 0.95,
               child: AnimatedPadding(
                 curve: Curves.easeOut,
                 duration: const Duration(milliseconds: 300),
                 padding: hoveredThumbnail == index
                     ? const EdgeInsets.all(4)
                     : const EdgeInsets.all(6),
                 child: MouseRegion(
                   onEnter: (value) => setState(() => hoveredThumbnail = index),
                   onExit: (value) => setState(() => hoveredThumbnail = -1),
                   child: Card(
                     shadowColor: Colors.black,
                     clipBehavior: Clip.antiAlias,
                     semanticContainer: true,
                     elevation: hoveredThumbnail == index ? 4 : 2,
                     shape: RoundedRectangleBorder(
                       side: BorderSide(
                         color: page == index
                           ? hoveredThumbnail == index
                             ? Colors.orange
                             : Colors.orange.shade400
                           : hoveredThumbnail == index
                             ? Colors.blue.shade400
                             : Colors.transparent,
                         width: 3),
                       borderRadius: BorderRadius.circular(12)),
                     child: InkWell(
                       onTap: () async {
                         if (page == index) {
                           await imageDialogHero(context, images[index], arguments, index);
                         }

                         setState(() {
                           page = index.toDouble();                          
                         });

                         _pageController.animateToPage(
                           index,
                           duration: const Duration(milliseconds: 200),
                           curve: Curves.ease);
                       },
                       child: index == length 
                         ? videoThumbnails == null
                           ? const Center(child: CircularProgressIndicator())
                           : Stack(
                             fit: StackFit.expand,
                             children: [
                               Image(
                                   image: ResizeImage(
                                     MemoryImage(videoThumbnails!), width: 450, height: 250),
                                   fit: BoxFit.cover,
                               ),
                               Center(
                                 child: Icon(
                                   page == index ? Icons.play_circle_outlined : Icons.play_circle, color: Colors.white, size: 32,
                                   shadows: const [
                                     Shadow(
                                       color: Colors.black26,
                                       offset: Offset(1, 1),
                                       blurRadius: 2
                                     ),
                                   ]
                                 )
                               )
                             ],
                           ) 
                         : Image(
                           image: ResizeImage(
                             MemoryImage(data.first["images"][index]), width: 350, height: 250 ),
                           fit: BoxFit.cover,
                         ),
                     ),
                   ),
                 ),
               ),
             ),
           );
         })
        );
      }
    );
  }

  void updateTheme(int page) {
    if (activePage != page) {
      setState(() {
        toogleThumbnail = true;
        isScrollingDown = false;
        activePage = page;
      });
    }
  }                          
                            
  // Main Images
  Widget imageMain(context, arguments, useVerticalLayout) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 8,
      width: MediaQuery.of(context).size.width / 2,
      child: ScrollConfiguration(
          behavior: DragOnScroll(),
          child: PageView.builder(
              physics:  data.first["images"].length + 1 == 1 
                ? const NeverScrollableScrollPhysics() 
                : const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: data.first["images"].length + 1,
              pageSnapping: true,
              controller: _pageController,
              onPageChanged: (value) {
                if (value != data.first["images"].length) {
                  updateTheme(value);
                  _detailCardKey.currentState?.setState(() {});
                } 
                _thumbnailsImageKey.currentState?.setState(() { page = value.toDouble(); });
              },
              itemBuilder: (context, pagePosition) {
                int itemCount = data.first["images"].length;

                if (pagePosition == itemCount) { 
                  return _videoController.value.isInitialized
                    ? ResourceVideo(videoController: _videoController, useVerticalLayout: useVerticalLayout)
                    : Container(); 
                } else { 
                  void push() => imageDialogHero(context, images[pagePosition], arguments, pagePosition);
                  return GestureDetector(
                    onSecondaryTapDown: (details) => onRightClickImageMainMenu(context, images[pagePosition], push, details),
                    onLongPress: () => onRightClickImageMainMenu(context, images[pagePosition], push),
                    onTapDown: (details) => onTapPosition(details),
                    onTap: () {
                      push();
                    },
                    child: InteractiveViewer(
                      maxScale: 4.5,
                      minScale: 1.0,
                      child: Image(
                        image: MemoryImage(data.first["images"][pagePosition]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                }
              }
          ),
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      bool useSmallLayout = constraints.maxHeight > constraints.maxWidth / 2;
      bool usePhoneLayout = constraints.maxHeight < constraints.maxWidth / 2;
      bool useVerticalLayout = constraints.maxHeight < constraints.maxWidth;

      return FutureBuilder(
        future: _loadItems,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done && data.isEmpty) {
            return Scaffold(
              body: Center(
                child: Padding(
                  padding: const EdgeInsets.all(32),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SelectableText(randomEmoji,
                          style: GoogleFonts.robotoMono(
                              fontSize: useVerticalLayout ? 124 : 100,
                              color: Colors.black54,
                              letterSpacing: -10)),
                      const SizedBox(height: 36),
                      Text(
                        "The resource you looking for wasn't here",
                        style: GoogleFonts.roboto(
                          color: Colors.black54,
                          fontSize: 24,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 2),
                      TextButton.icon(
                        onPressed: () {
                          context.push('/resource?search=$resource');
                        },
                        icon: const Icon(Icons.search, size: 16),
                        label: Text("Search ‘$resource’", style: const TextStyle(fontStyle: FontStyle.italic))
                      ),
                      const SizedBox(height: 32),
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 15),
                            side: const BorderSide(color: Colors.deepPurple),
                            shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(25.7))),
                        onPressed: () {
                          context.go('/');
                        },
                        child: const Text('Go to Main Menu', style: TextStyle(fontWeight: FontWeight.w700))
                      ),                  
                    ]
                  ),
                ),
              ),
            );
          }
          return Theme(
            data: ThemeData(
            useMaterial3: true,
            iconButtonTheme: IconButtonThemeData(
              style: ButtonStyle(
                  foregroundColor: MaterialStatePropertyAll(
                    paletteLoaded
                      ? colorLightButton(paletteDominantColors[activePage].color, .15)
                      : null,
                  )
              )
            ),
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ButtonStyle(
                  animationDuration: const Duration(milliseconds: 200),
                  shadowColor: const MaterialStatePropertyAll(Colors.black54),
                  elevation: MaterialStateProperty.resolveWith(
                    (states) {
                      return states.contains(MaterialState.hovered)
                        ? 4
                        : 0;
                    },
                  ),
                  backgroundColor: MaterialStateProperty.all(paletteLoaded
                    ? colorLightButton(paletteDominantColors[activePage].color)
                    : Colors.green.shade100),
                  foregroundColor:
                    MaterialStateProperty.resolveWith((states) {
                      if (states.contains(MaterialState.pressed)) {
                        return Colors.white;
                      }
                      return states.contains(MaterialState.hovered)
                          ? Colors.white
                          : paletteLoaded
                              ? colorLight(paletteDominantColors[activePage].color, .05)
                              : Colors.green;
                  }),
                  overlayColor: MaterialStateProperty.resolveWith(
                    (states) {
                      return states.contains(MaterialState.pressed)
                          ? paletteLoaded
                              ? colorLight(paletteDominantColors[activePage].color, .025)
                              : Colors.green.shade700
                          : paletteLoaded
                              ? colorLightButton(paletteDominantColors[activePage].color, .05)
                              : Colors.green.shade500;
                    },
                  ))),
            textSelectionTheme: TextSelectionThemeData(
              cursorColor: paletteLoaded
                    ? colorLightButton(paletteDominantColors[activePage].color, .15)
                    : null,
              selectionHandleColor: paletteLoaded
                    ? colorLightButton(paletteDominantColors[activePage].color, .15)
                    : null,
            ),
            inputDecorationTheme: InputDecorationTheme(
                iconColor: paletteLoaded
                    ? colorLightButton(paletteDominantColors[activePage].color, .15)
                    : null,
                suffixIconColor: paletteLoaded
                    ? colorLightButton(paletteDominantColors[activePage].color, .15)
                    : null,
                prefixIconColor: paletteLoaded
                    ? colorLightButton(paletteDominantColors[activePage].color, .15)
                    : null,
                isDense: true,
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(25.7)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      width: 2,
                      color: paletteLoaded
                        ? colorLightButton(paletteDominantColors[activePage].color, .15)
                        : Colors.blue,
                    )
                )
            ),
            primaryColor: paletteDominantColors.isEmpty ? null : colorLuminance(paletteDominantColors[activePage].color, .4)),
          child: GestureDetector(
            onLongPressDown: (details) => onTapPosition(details),
            onLongPress: () => onRightClickPageMenu(context, _refreshIndicatorKey),
            onSecondaryTapDown: (details) => onRightClickPageMenu(context, _refreshIndicatorKey, details),
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
                    color: paletteLoaded
                      ? colorLight(paletteMutedColors[activePage].color, .75)
                      : Colors.grey.shade200,
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
                                        top: 16, left: 12, right: 0, bottom: 12)
                                    : const EdgeInsets.only(
                                        top: 16, left: 24, right: 0, bottom: 12)
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
                                      toolbarHeight: 75,
                                      leadingWidth: 120,
                                      leading: Padding(
                                        padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                                        child: TextButton.icon(
                                          style: ButtonStyle(
                                            overlayColor: MaterialStateProperty.resolveWith((states) {
                                              if(states.contains(MaterialState.hovered)) return Colors.white;
                                              if(states.contains(MaterialState.pressed)) return Colors.grey.shade300;

                                              return Colors.transparent;
                                            }),
                                            foregroundColor: MaterialStateProperty.resolveWith((states) {
                                              return states.contains(MaterialState.hovered)
                                                ? Colors.black87
                                                : Colors.white;
                                            })
                                          ),
                                          onPressed: () {
                                            // TODO:Cached future palette color workarounds
                                            /* arguments['name'] == 'default'
                                              ? context.push('/resource') 
                                              : context.pop(); */
                                              context.pop();
                                          },
                                          label: Text('Back',
                                            style: GoogleFonts.roboto(
                                              fontWeight: FontWeight.w600,
                                              shadows: [
                                                const Shadow(
                                                  color: Colors.black26,
                                                  offset: Offset(1, 1),
                                                  blurRadius: 2
                                                ),
                                              ],
                                            ),
                                          ),
                                          icon: const Icon(
                                            Icons.arrow_back,
                                            shadows: [
                                              Shadow(
                                                color: Colors.black26,
                                                offset: Offset(1, 1),
                                                blurRadius: 2
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      backgroundColor: Colors.transparent,
                                      surfaceTintColor: Colors.transparent,
                                      expandedHeight: useVerticalLayout
                                          ? constraints.maxHeight - 150
                                          : usePhoneLayout
                                              ? constraints.maxHeight - 205 - 118
                                              : constraints.maxHeight > 600
                                                  ? constraints.maxHeight - 485
                                                  : constraints.maxHeight - 325,
                                      flexibleSpace: Container(
                                        margin: useVerticalLayout
                                          ? const EdgeInsets.symmetric(horizontal: 4)
                                          : EdgeInsets.zero,
                                        child: Hero(
                                          tag: arguments['hero'] + 0.toString(), // TODO:replace '0' later with a images index
                                          child: itemLoaded.isCompleted 
                                          ? NonFutureImage(
                                            useVerticalLayout: useVerticalLayout, 
                                            imageMain: imageMain, 
                                            arguments: arguments, 
                                            imageIndicators: imageIndicators, 
                                            data: data)
                                          : FutureImage(
                                            loadItems: _loadItems,
                                            useVerticalLayout: useVerticalLayout, 
                                            imageMain: imageMain, 
                                            arguments: arguments,
                                            imageIndicators: imageIndicators, 
                                            data: data)
                                        ),
                                      ),
                                    ),
                                    FutureBuilder(
                                      future: _loadItems,
                                      builder: (context, snapshot) {
                                        return SliverFillRemaining(
                                          hasScrollBody: useVerticalLayout ? false : true,
                                          fillOverscroll: false, 
                                          child: ShimmerLoading(
                                            isLoading: snapshot.connectionState == ConnectionState.waiting,
                                            border: BorderRadius.circular(12),
                                            margin: useVerticalLayout
                                              ? const EdgeInsets.fromLTRB(4, 8, 4, 4)
                                              : const EdgeInsets.fromLTRB(0, 6, 0, 2),
                                            builder: ShimmerImageThumbnails(
                                              useVerticalLayout: useVerticalLayout, 
                                              constraints: constraints
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Visibility(
                                                  visible: toogleThumbnail || useVerticalLayout 
                                                    ? true
                                                    : false,
                                                  child: StatefulBuilder(
                                                  key: _thumbnailsKey,
                                                  builder: (context, setState) =>
                                                    AnimatedSize(
                                                      duration: const Duration(milliseconds: 800),
                                                      curve: Curves.fastOutSlowIn,
                                                      child: SizedBox(
                                                        width: double.infinity,
                                                        height: toogleThumbnail || useVerticalLayout
                                                            ? null
                                                            : 0,
                                                        child: Card(
                                                          color: paletteLoaded
                                                            ? colorLight(paletteMutedColors[activePage].color, .9)
                                                            : Colors.grey.shade50,
                                                          surfaceTintColor: paletteLoaded
                                                            ? colorLight(paletteMutedColors[activePage].color, .9)
                                                            : Colors.grey.shade50,
                                                          elevation: useVerticalLayout ? 2 : 0,
                                                          shadowColor: Colors.black26,
                                                          margin: useVerticalLayout
                                                            ? const EdgeInsets.fromLTRB(4, 8, 4, 4)
                                                            : const EdgeInsets.fromLTRB(4, 6, 4, 2),
                                                          shape: RoundedRectangleBorder(
                                                            borderRadius: BorderRadius.circular(12),
                                                          ),
                                                           child: Row(
                                                            mainAxisSize: MainAxisSize.min,
                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                            children: [
                                                              imageThumbnails(arguments, activePage, useVerticalLayout)
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Visibility(
                                                  visible: useVerticalLayout ? false : true,
                                                  child: Flexible(
                                                    flex: 6,
                                                    child: AnimatedSlide(
                                                      curve: Curves.easeOutExpo,
                                                      duration: const Duration( milliseconds: 300),
                                                      offset: isAnimated
                                                          ? const Offset(0.0, 0.0)
                                                          : const Offset(0.0, 1.0),
                                                      child: DetailCard(
                                                        notifyParent: updateTheme, 
                                                        key: _detailCardKey,
                                                        data: data,
                                                        paletteLoaded: paletteLoaded,
                                                        usePhoneLayout: usePhoneLayout,
                                                        useVerticalLayout: useVerticalLayout
                                                      ),
                                                    )
                                                  ),
                                                )
                                              ],
                                            )
                                          ),
                                        );
                                    },
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
                            child: FutureBuilder(
                              future: _loadItems,
                              builder: (context, snapshot) {
                                return AnimatedPadding(
                                  curve: Curves.fastOutSlowIn,
                                  duration: const Duration(milliseconds: 600),
                                  padding: useSmallLayout
                                      ? const EdgeInsets.only(
                                          top: 10, left: 0, right: 10, bottom: 10)
                                      : snapshot.connectionState == ConnectionState.waiting 
                                          ? const EdgeInsets.only(top: 16, left: 4, right: 28, bottom: 14)
                                          : const EdgeInsets.only(top: 12, left: 0, right: 24, bottom: 10),
                                  child: ShimmerLoading(
                                    builder: ShimmerDetailCard(
                                      useVerticalLayout: useVerticalLayout
                                    ),
                                    isLoading: snapshot.connectionState == ConnectionState.waiting,
                                    border: BorderRadius.circular(12),
                                    padding: useVerticalLayout
                                      ? EdgeInsets.zero
                                      : const EdgeInsets.only(top: 8),
                                    child: DetailCard(
                                      notifyParent: updateTheme, 
                                      key: _detailCardKey,
                                      data: data,
                                      paletteLoaded: paletteLoaded,
                                      usePhoneLayout: usePhoneLayout,
                                      useVerticalLayout: useVerticalLayout
                                    ),
                                  ),
                                );
                              },
                            )
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ),
            ),
          );
        },
      );
    });
  }
}

class FutureImage extends StatelessWidget {
  const FutureImage({
    super.key, 
    required this.useVerticalLayout, 
    required this.imageMain, 
    required this.arguments, 
    required this.imageIndicators, 
    required this.data,
    required this.loadItems
  });

  final bool useVerticalLayout;
  final Future loadItems;
  // ignore: prefer_typing_uninitialized_variables
  final imageMain, arguments, imageIndicators, data;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: loadItems,
      builder: (context, snapshot) {
        return FlexibleSpaceBar(
          title: null,
          background: ShimmerLoading(
            builder: ShimmerImageMain(useVerticalLayout: useVerticalLayout),
            isLoading: snapshot.connectionState == ConnectionState.waiting,
            border: useVerticalLayout
              ? BorderRadius.circular(20)
              : const BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12)
            ),
            child: NonFutureImage(
              useVerticalLayout: useVerticalLayout, imageMain: imageMain, 
              arguments: arguments, imageIndicators: imageIndicators, 
              data: data
            ),
          ),
        );
      },
    );
  }
}

class NonFutureImage extends StatelessWidget {
  const NonFutureImage({
    super.key, 
    required this.useVerticalLayout, 
    required this.imageMain, 
    required this.arguments, 
    required this.imageIndicators, 
    required this.data
  });

  final bool useVerticalLayout;
  // ignore: prefer_typing_uninitialized_variables
  final imageMain, arguments, imageIndicators, data;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: useVerticalLayout ? 2 : 0,
      color: Colors.transparent,
      shadowColor: Colors.black26,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
          borderRadius: useVerticalLayout
            ? BorderRadius.circular(20)
            : const BorderRadius.only(
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(12)),
      ),
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          FlexibleSpaceBar(
            title: null,
            background: imageMain(context, arguments, useVerticalLayout),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  buttonView3D(context, arguments['name'].toLowerCase(),
                    paletteDominantColors.isEmpty
                      ? paletteDominantColors = []
                      : paletteDominantColors,
                    activePage
                  ), 
                  buttonFullscreen(context, images, arguments, 
                  paletteDominantColors.isEmpty
                      ? paletteDominantColors = []
                      : paletteDominantColors,
                  activePage),
                ],
              )
          ),
        ]
      ),
    );
  }
}

class ResourceVideo extends StatefulWidget {
  const ResourceVideo({
    super.key, 
    required this.videoController,
    required this.useVerticalLayout
  });
  final VideoPlayerController videoController;
  final bool useVerticalLayout;

  @override
  State<ResourceVideo> createState() => _ResourceVideoState();
}

class _ResourceVideoState extends State<ResourceVideo> {
  bool onHover = false;
  bool onClick = false;
  late Duration durationVideo;

  @override
  void initState() {
    durationVideo = widget.videoController.value.duration;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) => setState(() {
        onHover = true;
      }),
      onExit: (event) => setState(() {
        onHover = false;
        onClick = false;
      }),
      child: Container(
        color: Colors.black,
        child: Stack(
          fit: StackFit.expand,
          children: [
            ClipRect(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  if (!widget.useVerticalLayout) {
                    return Center(
                      child: Stack(
                        children: [
                          AspectRatio(
                            aspectRatio: widget.videoController.value.aspectRatio,
                            child: VideoPlayer(widget.videoController)
                          ),
                        ]
                      ),
                    );
                  }

                  return SizedBox.expand(
                    child: FittedBox(
                      fit: BoxFit.cover,
                      child: SizedBox(
                        height: constraints.maxHeight,
                        width: widget.videoController.value.size.width,
                        child: VideoPlayer(widget.videoController)
                      ),
                    ),
                  );
                }
              ),
            ),
            AnimatedContainer(
              curve: Curves.easeOut,
              duration: const Duration(milliseconds: 400),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: const [0, 0.85, 1.0],
                  colors: <Color>[
                    Colors.transparent,
                    Colors.black12,
                     onHover || !widget.videoController.value.isPlaying
                      ? onClick ? Colors.black38 : Colors.black54
                      : Colors.black38
                  ],
                ),
              ),
            ),
            AnimatedScale(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeInCubic,
              scale: onHover && !widget.videoController.value.isPlaying ? 1.15 : 1,
              child: Center(
                child: AnimatedSwitcher(
                  switchInCurve: Curves.easeInCubic,
                  switchOutCurve: Curves.easeInCubic,
                  duration: const Duration(milliseconds: 200),
                  child: widget.videoController.value.isPlaying && !onHover || onClick
                  ? null 
                  : Container(
                      height: 84,
                      width: 84,
                      decoration: BoxDecoration(
                        color: Colors.black45,
                        borderRadius: BorderRadius.circular(60)
                      )
                    ),
                ),
              ),
            ),
            AnimatedOpacity(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeInCubic,
              opacity: widget.videoController.value.isPlaying && !onHover || onClick 
                ? 0 
                : 1,
              child: IconButton(
                style: ButtonStyle(
                  shape: const MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.zero)),
                  foregroundColor: const MaterialStatePropertyAll(Colors.white),
                  overlayColor: MaterialStateProperty.resolveWith((states) {
                    if (states.contains(MaterialState.pressed)) return Colors.transparent;

                    return states.contains(MaterialState.pressed)
                      ? Colors.black26
                      : Colors.transparent;
                  }),
                  backgroundColor: const MaterialStatePropertyAll(Colors.transparent),
                ),
                icon: AnimatedScale(
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.easeInCubic,
                  scale: onHover && !widget.videoController.value.isPlaying ? 1.15 : 1,
                  child: Icon(size: 60, widget.videoController.value.isPlaying ? Icons.play_arrow : Icons.pause)),
                onPressed: () {
                  setState(() {
                    if (widget.videoController.value.isPlaying) {
                      onClick = false;
                      widget.videoController.pause();
                    } else {
                      onClick = true;
                      widget.videoController.play();
                    }
                  });
                }
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: InkWell(
                onTap: () {
                  setState(() {
                    if (widget.videoController.value.isPlaying) {
                      onClick = false;
                      widget.videoController.pause();
                    } else {
                      onClick = true;
                      widget.videoController.play();
                    }
                  });
                },
                child: Tooltip(
                  textStyle: const TextStyle(fontSize: 14, color: Colors.white),
                  message: widget.videoController.value.isPlaying ? 'Pause (space/k)' : 'Play (space/k)',
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade800,
                    borderRadius: BorderRadius.circular(25.7)
                  ),
                  verticalOffset: 20,
                  preferBelow: false,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 20),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AnimatedSwitcher(
                          duration: const Duration(milliseconds: 200),
                          child: widget.videoController.value.isBuffering
                          ? const Padding(
                            padding: EdgeInsets.only(left: 4),
                            child: SizedBox(
                                width: 13,
                                height: 13,
                                child: CircularProgressIndicator(strokeWidth: 3, color: Colors.yellow,)
                              ),
                          )
                          : Padding(
                            padding: const EdgeInsets.only(bottom: 2),
                            child: Icon(color: widget.videoController.value.isPlaying 
                              ? Colors.redAccent.shade100
                              : Colors.yellow.shade300, size: 18,
                              shadows: const [
                                Shadow(
                                  color: Colors.black26,
                                  offset: Offset(1, 1),
                                  blurRadius: 2
                                ),
                              ],
                              widget.videoController.value.isPlaying 
                              ? Icons.play_circle : Icons.pause_circle
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        ValueListenableBuilder(
                          valueListenable: widget.videoController,
                          builder: (context, VideoPlayerValue value, child) {
                            final minutes = value.position.inMinutes.roundToDouble().toString().padLeft(2, '0');
                            final seconds = (value.position.inSeconds % 60).roundToDouble().toString().padLeft(2, '0');

                            final dminutes = widget.videoController.value.duration.inMinutes.roundToDouble().toString().padLeft(2, '0');
                            final dseconds = ((widget.videoController.value.duration.inSeconds.roundToDouble() % 60) - 1).toString().padLeft(2, '0');

                            return Text(
                              "$minutes:$seconds / $dminutes:$dseconds",
                              style: GoogleFonts.roboto(
                                shadows: const [
                                  Shadow(
                                    color: Colors.black45,
                                    offset: Offset(1, 1),
                                    blurRadius: 2
                                  ),
                                ],
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.grey.shade200
                              ),
                            );
                          }
                        ), 
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ]
        ),
      ),
    );
  }
}

class DetailCard extends StatefulWidget {
  const DetailCard({
    super.key, 
    required this.notifyParent, 
    required this.usePhoneLayout, 
    required this.useVerticalLayout,
    required this.data, 
    required this.paletteLoaded
  });
  
  final Function(int) notifyParent;
  final bool usePhoneLayout, useVerticalLayout;
  final bool paletteLoaded;
  final List<Map<String, dynamic>> data;

  @override
  State<DetailCard> createState() => _DetailCardState();
}

late ScrollController controller, controllerComment, _scrollViewController;
late TabController _tabController;
late FocusNode _msgInputFocusNode;
final GlobalKey<State<StatefulWidget>> _msgInputKey = GlobalKey<State<StatefulWidget>>();
int tabIndex = 0;
bool onHoverTileBrand = false;
bool expandTileBrand = true;

bool favorited = false;

class _DetailCardState extends State<DetailCard> with SingleTickerProviderStateMixin {

  void _tabUpdate(int index) {
    if (tabIndex != index && _tabController.offset != 0) {
      setState(() {
        tabIndex = index;
      });
    }
  }

  @override
  void initState() {
    _msgInputFocusNode = FocusNode();
    _msgInputFocusNode.addListener(() { 
      if (_msgInputFocusNode.hasFocus) {

      }
    });

    _tabController = TabController(length: 2, vsync: this);
    _tabController.animation?.addListener(() { 
      if (_tabController.offset <= 0.499 && _tabController.offset >= 0.001 
      || _tabController.offset <= -0.501 && _tabController.offset >= -1.0) {
        _tabUpdate(0);
      }

      if (_tabController.offset >= 0.501 && _tabController.offset <= 1.0 
      || _tabController.offset >= -0.499 && _tabController.offset <= -0.001) {
        _tabUpdate(1);
      }
    });
    
    controller = ScrollController();
    controllerComment = ScrollController();
    super.initState();

    controller.addListener(() {
      if (controller.position.userScrollDirection == ScrollDirection.reverse) {
        if (!isScrollingDown && toogleThumbnail == true) {
          _thumbnailsKey.currentState?.setState(() {
            isScrollingDown = true;
            toogleThumbnail = false;           
          });
        }
      }

    if (controller.position.userScrollDirection == ScrollDirection.forward) {
      if (isScrollingDown && toogleThumbnail == false) {
          _thumbnailsKey.currentState?.setState(() {
            isScrollingDown = false;
            toogleThumbnail = true;
          });
        }
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: widget.useVerticalLayout ? 2 : 0,
      shadowColor: Colors.black26,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: double.infinity,
            color: widget.paletteLoaded
              ? colorLight(paletteMutedColors[activePage].color, .9)
              : Colors.grey.shade50,
            child: AnimatedPadding(
              duration: const Duration(milliseconds: 200),
              padding: widget.useVerticalLayout
                  ? EdgeInsets.zero
                  : const EdgeInsets.only(top: 8),
              child: Visibility(
                visible: widget.useVerticalLayout ? false : true,
                child: Center(
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    height: widget.useVerticalLayout ? null : 4,
                    width: widget.useVerticalLayout ? null : 32,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.7),
                      color: widget.paletteLoaded
                        ? colorLightButton(paletteMutedColors[activePage].color)
                        : Colors.grey.shade400
                    ),
                  ),
                ),
              ),
            ),
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            color: widget.paletteLoaded
                  ? colorLight(paletteMutedColors[activePage].color, .9)
                  : Colors.grey.shade50,
            child: AnimatedPadding(
              duration: const Duration(milliseconds: 200),
              padding: EdgeInsets.only(
                  top: widget.useVerticalLayout ? 5 : 10,
                  left: 10,
                  right: 15,
                  bottom: 0),
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    StatefulBuilder(
                      builder: (context, setState) {
                        return TabBar(
                          mouseCursor: SystemMouseCursors.basic,
                          controller: _tabController,
                          dividerColor: Colors.transparent,
                          indicator: const UnderlineTabIndicator(
                            borderSide: BorderSide(
                              color: Colors.transparent, width: 0
                            ),
                          ),
                          indicatorWeight: 0,
                          isScrollable: true,
                          overlayColor: MaterialStateProperty.resolveWith((states) {
                            return states.contains(MaterialState.hovered)
                              ? Colors.black
                              : null;
                          }),
                          labelColor: widget.paletteLoaded
                            ? colorLight(paletteDominantColors[activePage].color, .1)
                            : Colors.orange,
                          unselectedLabelColor: widget.paletteLoaded
                            ? colorLight(paletteDominantColors[activePage].color, .2)
                            : Colors.grey.shade700,
                          padding: EdgeInsets.zero,
                          labelPadding: const EdgeInsets.fromLTRB(14, 8, 4, 0),
                          labelStyle: GoogleFonts.roboto(fontWeight: FontWeight.w500, fontSize: 16),
                          onTap: (e) {
                            setState(() {
                              tabIndex = e;
                            });
                            _thumbnailsKey.currentState?.setState(() {
                              toogleThumbnail = false;
                              isScrollingDown = true;
                            });
                          },
                          tabs: <Widget>[
                            Tab(
                              child: ElevatedButton.icon(
                                style: ButtonStyle(
                                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
                                  backgroundColor: MaterialStatePropertyAll(
                                    tabIndex == 0 
                                    ? widget.paletteLoaded
                                      ? colorLight(paletteDominantColors[activePage].color, .1)
                                      : Colors.green.shade700
                                    : null 
                                  ),
                                  foregroundColor: MaterialStatePropertyAll(
                                    tabIndex == 0
                                    ? Colors.white
                                    : null
                                  )
                                ),
                                label: Text("About", 
                                  style: GoogleFonts.roboto(fontWeight: FontWeight.w600)
                                ),
                                icon: const Icon(Icons.window, size: 18),
                                onPressed: () {
                                  setState(() {
                                    tabIndex = 0;
                                    _tabController.animateTo(0);
                                  });
                                },
                              )
                            ),
                            Tab(
                              child: ElevatedButton.icon(
                                style: ButtonStyle(
                                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
                                  backgroundColor: MaterialStatePropertyAll(
                                    tabIndex == 1
                                    ? widget.paletteLoaded
                                      ? colorLight(paletteDominantColors[activePage].color, .1)
                                      : Colors.green.shade700
                                    : null 
                                  ),
                                  foregroundColor: MaterialStatePropertyAll(
                                    tabIndex == 1
                                    ? Colors.white
                                    : null
                                  )
                                ),
                                label: Text("Chat", 
                                  style: GoogleFonts.roboto(fontWeight: FontWeight.w600)
                                ),
                                icon: const Icon(Icons.chat, size: 18),
                                onPressed: () {
                                  setState(() {
                                    tabIndex = 1;
                                    _tabController.animateTo(1);
                                  });
                                },
                              )
                            )
                          ]);
                      }
                    ),
                    Row(
                      children: [
                        Visibility(
                          visible: widget.useVerticalLayout ? false : true,
                          child: ToggleButtons(
                            fillColor: widget.paletteLoaded
                              ? colorLight(paletteDominantColors[activePage].color, .7)
                              : null,
                            borderRadius:BorderRadius.circular(25.7),
                            constraints: const BoxConstraints(minHeight: 34, minWidth: 34),
                            renderBorder: false,
                            isSelected: [toogleThumbnail],
                            onPressed: (index) {
                              setState(() {
                                _thumbnailsKey.currentState?.setState(() {
                                  if (toogleThumbnail == false) {
                                    toogleThumbnail = true;
                                    isScrollingDown = false;
                                  } else {
                                    toogleThumbnail = false;
                                    isScrollingDown = true;
                                  }
                                });
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
                          )
                        ),
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          margin: isWebMobile
                              ? null
                              : const EdgeInsets.only(top: 6, left: 6, right: 0, bottom: 6),
                          child: PopupMenuButton<int>(
                              elevation: 4,
                              color: paletteMutedColors.isEmpty
                                  ? Colors.grey.shade50
                                  : lighten(paletteMutedColors[activePage].color, .15),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                              icon: const Icon(
                                Icons.more_vert,
                                color: Colors.black54,
                              ),
                              iconSize: 22,
                              padding: EdgeInsets.zero,
                              itemBuilder: (context) {
                                return openItemMenu(context, currentUrl(context));
                              }),
                        )
                      ],
                    ),
                  ]),
            ),
          ),
          Expanded(
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              color: widget.paletteLoaded
                  ? colorLight(paletteMutedColors[activePage].color, .9)
                  : Colors.grey.shade50,
              child: SizedBox(
                height: MediaQuery.of(context).size.height / 2,
                child: TabBarView(
                  controller: _tabController,
                  children: <Widget>[
                    Scrollbar(
                      controller: controller,
                      thumbVisibility: true,
                      child: Padding(
                        padding: EdgeInsets.only(left: 24, right: 24, bottom: 0, top: widget.useVerticalLayout ? 6 : 12),
                        child: ScrollConfiguration(
                          behavior: DragOnScroll().copyWith(scrollbars: false),
                          child: NotificationListener(
                            onNotification: (OverscrollNotification value) {
                              if (value.overscroll < 0 && _scrollViewController.offset + value.overscroll <= 0) {
                                if (_scrollViewController.offset != 0) {
                                  _scrollViewController.jumpTo(0);
                                }
                                return true;
                              }
                              if (_scrollViewController.offset + value.overscroll >= _scrollViewController.position.maxScrollExtent) {
                                if (_scrollViewController.offset != _scrollViewController.position.maxScrollExtent) {
                                  _scrollViewController.jumpTo(_scrollViewController.position.maxScrollExtent);
                                }
                                return true;
                              }
                              _scrollViewController.jumpTo(_scrollViewController.offset + value.overscroll);
                              return true;
                            },
                            child: ListView(
                                controller: controller,
                                keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                                physics: const ClampingScrollPhysics(),
                                shrinkWrap: true,
                                children: [
                                  StatefulBuilder(
                                    builder: (context, setState) {
                                      return Card(
                                        color: onHoverTileBrand
                                          ? widget.paletteLoaded
                                            ? colorLight(paletteDominantColors[activePage].color, .85)
                                            : Colors.grey.shade100
                                          : Colors.transparent,
                                        elevation: 0,
                                        margin: EdgeInsets.zero,
                                        child: InkWell(
                                          borderRadius: BorderRadius.circular(12),
                                          hoverColor: widget.paletteLoaded
                                            ? colorLight(paletteDominantColors[activePage].color, .8)
                                            : Colors.grey.shade200,
                                          splashColor: widget.paletteLoaded
                                            ? colorLight(paletteDominantColors[activePage].color, .85)
                                            : Colors.grey.shade50,
                                          onHover:(value) {
                                            setState(() {                                                                                  
                                              onHoverTileBrand = value;
                                            });
                                          },
                                          onTap: () {
                                            setState(() {
                                              favorited 
                                                ? favorited = false 
                                                : favorited = true;
                                            });
                                          },
                                          child: AnimatedPadding(
                                            curve: Curves.fastOutSlowIn,
                                            duration: const Duration(milliseconds: 200),
                                            padding: onHoverTileBrand 
                                              ? EdgeInsets.fromLTRB(14, 0, 8, expandTileBrand ? 8 : 4)
                                              : const EdgeInsets.symmetric(horizontal: 2, vertical: 0),
                                            child: Theme(
                                              data: ThemeData(useMaterial3: true).copyWith(
                                                splashFactory: NoSplash.splashFactory,
                                                hoverColor: Colors.transparent,
                                                dividerColor: Colors.transparent),
                                              child: ExpansionTile(
                                                initiallyExpanded: expandTileBrand,
                                                onExpansionChanged: (value) {
                                                  setState(() {
                                                    expandTileBrand
                                                      ? expandTileBrand = false 
                                                      : expandTileBrand = true;
                                                  });
                                                  _thumbnailsKey.currentState?.setState(() {
                                                    toogleThumbnail = false;
                                                  });
                                                },
                                                tilePadding: const EdgeInsets.symmetric(horizontal: 0),
                                                title: Text(
                                                  widget.data.first['name'],
                                                  style: GoogleFonts.roboto(
                                                      color: Colors.grey.shade800,
                                                      fontSize: 24,
                                                      fontWeight: FontWeight.w500,
                                                      letterSpacing: -0.5),
                                                ),
                                                subtitle: Text(
                                                    widget.data.first['brand'].toString().toTitleCase(),
                                                    style: GoogleFonts.roboto(
                                                        color: Colors.grey.shade700,
                                                        fontSize: 14,
                                                        fontWeight: FontWeight.w500)),
                                                trailing: Row(
                                                  mainAxisSize: MainAxisSize.min,
                                                  children: [
                                                    IconButton(
                                                      tooltip: 'Add to Favorites',
                                                      onPressed: () {
                                                        setState(() {
                                                          favorited 
                                                            ? favorited = false 
                                                            : favorited = true;
                                                        });
                                                      },
                                                      icon: Icon(
                                                        favorited ? Icons.favorite : Icons.favorite_border,
                                                        color: favorited ? Colors.red.shade300 : Colors.black87,
                                                      )),
                                                  ],
                                                ),
                                                children: [
                                                  const SizedBox(height: 4),
                                                  Text(
                                                    "A cat is a furry animal that has a long tail and sharp claws. Cats are often kept as pets. Cats are lions, tigers, and other wild animals in the same family.",
                                                    style: GoogleFonts.roboto(
                                                        fontSize: 14,
                                                        fontWeight: FontWeight.w400,
                                                        letterSpacing: 0.1,
                                                        height: 1.6,
                                                        color: Colors.black87),
                                                  ),
                                                  /* Theme(
                                                    data: ThemeData(
                                                      textButtonTheme: TextButtonThemeData(
                                                        style: ButtonStyle(
                                                          shape: MaterialStatePropertyAll(
                                                            RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.7))),
                                                          foregroundColor: MaterialStateProperty.resolveWith((states) {
                                                            return states.contains(MaterialState.hovered)
                                                              ? Colors.white
                                                              : widget.paletteLoaded
                                                                ? colorLight(paletteDominantColors[activePage].color, .1)
                                                                : null;
                                                          }),
                                                          overlayColor: MaterialStateProperty.resolveWith((states) {
                                                            return states.contains(MaterialState.hovered)
                                                              ? widget.paletteLoaded 
                                                                ? colorLight(paletteDominantColors[activePage].color, .1)
                                                                : null
                                                              : null;
                                                          })
                                                        ),
                                                      )
                                                    ),
                                                    child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.end,
                                                        children: [
                                                          TextButton.icon(
                                                              onPressed: () => urlLink(context, 'https://en.wikipedia.org/wiki/The_Legend_of_Zelda'),
                                                              icon: const Icon(FontAwesomeIcons.wikipediaW, size: 14),
                                                              label: const Text('Wikipedia', 
                                                                style: TextStyle(fontWeight: FontWeight.w600)
                                                              )
                                                          ),
                                                          const SizedBox(width: 4),
                                                          TextButton.icon(
                                                              onPressed: () => urlLink(context, 'https://www.google.com/search?q=${widget.data.first['name']}'),
                                                              icon: const Icon(FontAwesomeIcons.google, size: 14),
                                                              label: const Text('Google',
                                                                style: TextStyle(fontWeight: FontWeight.w600)
                                                              )
                                                          )
                                                        ]),
                                                  ), */
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 12, top: 20),
                                    child: Wrap(
                                      spacing: 8,
                                      runSpacing: 8,
                                        children: List.generate(widget.data.first['tags'].length, (i) {
                                          // TODO: Theme is only workaround for ripple splash effect on chips
                                          return Theme(
                                            data: Theme.of(context).copyWith(
                                              splashColor: widget.paletteLoaded 
                                                ? colorLight(paletteMutedColors[activePage].color, .8)
                                                : Colors.grey.shade100,
                                              canvasColor: widget.paletteLoaded 
                                                ? colorLightButton(paletteMutedColors[activePage].color)
                                                : Colors.grey.shade200
                                            ),
                                            child: ActionChip(
                                              visualDensity: const VisualDensity(vertical: -4, horizontal: -4),
                                              padding: null,
                                              side: BorderSide.none,
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(25.7)
                                              ),
                                              onPressed: () {},
                                              label: Text(
                                                widget.data.first['tags'][i],
                                                style: TextStyle(
                                                  color: Colors.grey.shade700,
                                                  fontSize: 12, fontWeight: FontWeight.w600
                                                )
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                  const Divider(height: 20, color: Colors.black12),
                                  const SizedBox(height: 8),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            const Text('Creator', style: TextStyle(fontWeight: FontWeight.w600)),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
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
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            const Text('License',
                                                style: TextStyle(fontWeight: FontWeight.w600)),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: const [
                                                Icon(
                                                    FontAwesomeIcons.creativeCommonsZero,
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
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: const [
                                            Text('Date', style: TextStyle(fontWeight: FontWeight.w600)),
                                            Text('3 Sep 2022')
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(height: 8),
                                  const Divider(height: 20, color: Colors.black12),
                                  Theme(
                                    data: ThemeData(useMaterial3: true)
                                        .copyWith(dividerColor: Colors.transparent),
                                    child: ExpansionTile(
                                      tilePadding: const EdgeInsets.symmetric(horizontal: 0),
                                      title: const Text(
                                        'Blender',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      subtitle: Text('3.2.2 | bcfdb14560e7', 
                                        style: TextStyle(
                                          color: Colors.grey.shade600,
                                          wordSpacing: 1,
                                          fontWeight: FontWeight.w500)
                                      ),
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
                                  Theme(
                                    data: ThemeData(useMaterial3: true)
                                        .copyWith(dividerColor: Colors.transparent),
                                    child: ExpansionTile(
                                      tilePadding: const EdgeInsets.symmetric(horizontal: 0),
                                      title: const Text(
                                        'Renderer',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      subtitle: Text('Cycles / Eevee',
                                        style: TextStyle(
                                          color: Colors.grey.shade600,
                                          fontWeight: FontWeight.w500)
                                      ),
                                      leading: IconButton(
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
                                        SizedBox(height: 8),
                                      ],
                                    ),
                                  ),
                                  Theme(
                                    data: ThemeData(useMaterial3: true)
                                        .copyWith(dividerColor: Colors.transparent),
                                    child: ExpansionTile(
                                      tilePadding: const EdgeInsets.symmetric(horizontal: 0),
                                      title: const Text(
                                        'Textures & Materials',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500),
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
                                          subtitle: Text('Diffuse, Roughness and Falloff, Displacement, Others (Brightness, Contrast, etc.)'),
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
                                        padding: const EdgeInsets.fromLTRB(8, 0, 4, 0),
                                        child: Text('Youtube Tutorial',
                                            style: GoogleFonts.roboto(
                                                fontSize: 14)),
                                      ),
                                      const Expanded(
                                          child: Divider(
                                            indent: 12, 
                                            endIndent: 12, 
                                            color: Colors.black12)
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(right: 4),
                                        child: Icon(Icons.schedule, size: 16),
                                      ),
                                      const Text('12 min')
                                    ],
                                  ),
                                  const SizedBox(height: 8),
                                  CardYoutube(
                                    thumbnails: images[0], 
                                    paletteColor: paletteMutedColors, 
                                    paletteLoaded: widget.paletteLoaded,
                                    colorIndex: activePage
                                  ),
                                ]),
                          ),
                        ),
                      ),
                    ),
                    Scrollbar(
                      controller: controllerComment,
                      thumbVisibility: true,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: ScrollConfiguration(
                          behavior: ScrollConfiguration.of(context)
                              .copyWith(scrollbars: false),
                          child: NotificationListener(
                            onNotification: (OverscrollNotification value) {
                              if (value.overscroll < 0 && _scrollViewController.offset + value.overscroll <= 0) {
                                if (_scrollViewController.offset != 0) {
                                  _scrollViewController.jumpTo(0);
                                }
                                return true;
                              }
                              if (_scrollViewController.offset + value.overscroll >= _scrollViewController .position.maxScrollExtent) {
                                if (_scrollViewController.offset != _scrollViewController.position.maxScrollExtent) {
                                  _scrollViewController.jumpTo(_scrollViewController.position.maxScrollExtent);
                                }
                                return true;
                              }
                              _scrollViewController.jumpTo(_scrollViewController.offset + value.overscroll);
                              return true;
                            },
                            child: ListView(
                              controller: controllerComment,
                              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                              children: <Widget>[
                                CardComment(
                                  paletteLoaded: widget.paletteLoaded,
                                  palettecolor: paletteMutedColors.isEmpty
                                    ? null
                                    : paletteMutedColors,
                                  dominantcolor: paletteDominantColors.isEmpty
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
            color: widget.paletteLoaded
                  ? colorLight(paletteMutedColors[activePage].color, .9)
                  : Colors.grey.shade50,
            padding: const EdgeInsets.only(
                top: 10,
                left: 20,
                right: 20,
                bottom: 10),
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: tabIndex == 0
                  ? Hero(
                    tag: 'download',
                    child: ElevatedButton.icon(
                      icon: const Icon(Icons.file_download_outlined),
                      style: ButtonStyle(
                        visualDensity: const VisualDensity(horizontal: -2, vertical: -2),
                        minimumSize: MaterialStateProperty.all(const Size(double.infinity, 54)),
                        elevation: const MaterialStatePropertyAll(0),
                      ),
                      onPressed: () { 
                        downloadDialogHero(context, widget.data.first['name'], 'Blender', widget.useVerticalLayout); 
                      },
                      label: Text("Download", style: GoogleFonts.roboto(fontWeight: FontWeight.w500)),
                    ),
                  )
                  : Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.add_circle_outline)),
                        const SizedBox(width: 8),
                        Expanded(
                          child: StatefulBuilder(
                            key: _msgInputKey,
                            builder: (context, setState) => TextField(
                              autofocus: isWebMobile ? false : true,
                              autocorrect: true,
                              focusNode: _msgInputFocusNode,
                              onTap: () => setState(() {
                                _msgInputFocusNode.requestFocus();
                              }),
                              onTapOutside: (event) => setState(() {
                                _msgInputFocusNode.unfocus();
                              }),
                              style: const TextStyle(
                                fontWeight: FontWeight.w600
                              ),
                              decoration: InputDecoration(
                                contentPadding: isWebMobile
                                    ? const EdgeInsets.symmetric(vertical: 12)
                                    : null,
                                isDense: true,
                                filled: true,
                                fillColor: widget.paletteLoaded
                                    ? colorLight(paletteDominantColors[activePage].color)
                                    : Colors.white70,
                                hoverColor: widget.paletteLoaded
                                    ? colorLight(paletteDominantColors[activePage].color, .75)
                                    : Colors.white,
                                hintText: _msgInputFocusNode.hasFocus 
                                  ? null
                                  : "Message...",
                                hintStyle: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: widget.paletteLoaded
                                    ? colorLight(paletteDominantColors[activePage].color, .4)
                                    : Colors.grey
                                ),
                                prefixIcon: const Icon(Icons.account_circle, size: 24),
                                prefixIconConstraints: const BoxConstraints(minWidth: 55),
                                suffixIcon: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 4),
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.send_rounded, size: 24)),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.mood)
                      ),
                    ],
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
