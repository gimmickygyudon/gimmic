import 'package:flutter/material.dart';
import 'package:gimmic/assets/label.dart';
import 'package:gimmic/assets/widgets/builder.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../icons.dart';
import 'item.dart';
import 'menu.dart';

List<Widget> dialogsHero(String title, 
  bool useVerticalLayout, PageController pageController, Function callback) {
  return [
    DownloadDialogHero(
      title: title, 
      useVerticalLayout: useVerticalLayout, 
      pageController: pageController,
      callback: callback,
    ), const AddDialogHero(),
  ];
}

class AddDialogHero extends StatelessWidget {
  const AddDialogHero({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: Align(
                alignment: Alignment.centerRight,
                child: Theme(
                  data: ThemeData(
                    useMaterial3: true,
                    chipTheme: ChipThemeData(
                      labelPadding: EdgeInsets.zero,
                      side: const BorderSide(color: Colors.transparent),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.7)
                      ),
                      labelStyle: const TextStyle(fontSize: 12),
                    )
                  ),
                  child: Wrap(
                    spacing: 4,
                    children: [
                      InputChip(
                        backgroundColor: Colors.blueGrey.shade50,
                        visualDensity: const VisualDensity(vertical: -4, horizontal: -4),
                        label: Padding(
                          padding: const EdgeInsets.only(bottom: 1),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.apps, size: 14, color: Colors.grey.shade800),
                              const SizedBox(width: 4),
                              Text('All ', style: GoogleFonts.roboto(
                                color: Colors.grey.shade800,
                                fontWeight: FontWeight.w600)
                              ),
                            ],
                          ),
                        ), 
                        onSelected: (value) {},
                      ),
                      InputChip(
                        visualDensity: const VisualDensity(vertical: -4, horizontal: -4),
                        label: Padding(
                          padding: const EdgeInsets.only(bottom: 1),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(IconSoftware.blender3doutlinedalt, size: 14, color: Colors.orangeAccent),
                              const SizedBox(width: 4),
                              Text('Blender', style: GoogleFonts.roboto(
                                color: Colors.grey.shade600,
                                fontWeight: FontWeight.w600)
                              ),
                            ],
                          ),
                        ), 
                        onSelected: (value) {},
                      ),
                      InputChip(
                        visualDensity: const VisualDensity(vertical: -4, horizontal: -4),
                        label: Padding(
                          padding: const EdgeInsets.only(bottom: 1),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(Icons.image_outlined, size: 14),
                              const SizedBox(width: 4),
                              Text('Image', style: GoogleFonts.roboto(
                                color: Colors.grey.shade600,
                                fontWeight: FontWeight.w600)
                              ),
                            ],
                          ),
                        ), 
                        onSelected: (value) {},
                      ),
                      InputChip(
                        visualDensity: const VisualDensity(vertical: -4, horizontal: -4),
                        label: Padding(
                          padding: const EdgeInsets.only(bottom: 1),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(Icons.movie_outlined, size: 14),
                              const SizedBox(width: 4),
                              Text('Video', style: GoogleFonts.roboto(
                                color: Colors.grey.shade600,
                                fontWeight: FontWeight.w600)
                              ),
                            ],
                          ),
                        ), 
                        onSelected: (value) {},
                      ),
                    ]
                  ),
                ),
              ),
            )
          ],
        ),
        const SizedBox(height: 8),
        ItemImage(),
        const SizedBox(height: 8),
        const ItemRenderEngine(),
        const SizedBox(height: 8),
        Card(
          surfaceTintColor: Colors.transparent,
          color: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.grey.shade200, width: 1),
            borderRadius: BorderRadius.circular(6)
          ),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {}, 
                      icon: Icon(Icons.indeterminate_check_box_outlined, color: Colors.grey.shade700)
                    ),
                    const SizedBox(width: 4),
                    Text('1 Item Selected', style: TextStyle(
                      color: Colors.grey.shade600,
                      fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: ElevatedButton.icon(
                    style: ButtonStyle(
                      textStyle: MaterialStatePropertyAll(
                        TextStyle(
                          color: Colors.grey.shade800,
                          fontWeight: FontWeight.w600
                        )
                      ),
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(6))),
                      backgroundColor: MaterialStatePropertyAll(Colors.deepPurpleAccent.shade200),
                      foregroundColor: const MaterialStatePropertyAll(Colors.white),
                      shadowColor: const MaterialStatePropertyAll(Colors.black38)
                    ),
                    onPressed: () {}, 
                    icon: const Icon(Icons.add, size: 20),
                    label: Text('Add', style: GoogleFonts.roboto())
                  ),
                ),
              ],
            ),
          )
        ),
      ],
    );
  }
}

bool addMenu = false;

class DownloadDialogHero extends StatelessWidget {
  const DownloadDialogHero({
    super.key, 
    required this.title, 
    required this.useVerticalLayout, 
    required this.pageController, 
    required this.callback, 
  });

  final String title;
  final Function callback;
  final bool useVerticalLayout;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(title, 
                    style: TextStyle(
                      color: Colors.grey.shade900,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    )
                  ),
                  IntrinsicHeight(
                    child: Row(
                      children: [
                        Text('by Gimmicky Gyudon', 
                          style: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          )
                        ),
                        const VerticalDivider(indent: 5, endIndent: 3),
                        const Tooltip(
                          message: 'User Verified',
                          child: Padding(
                            padding: EdgeInsets.only(top: 2),
                            child: Icon(
                              Icons.verified, 
                              size: 14,
                              color: Colors.blue
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 100,
                child: AspectRatio(
                  aspectRatio: 1 / 1,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset('images/hellocat1.jpg', fit: BoxFit.cover)
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: Text(
            'Download ready. You can re-download this project for free at any time.',
            style: TextStyle(
              color: Colors.grey.shade700
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
          child: Row(
            children: [
              const Text(
               'Files',
                style: TextStyle(
                  color: Colors.grey
                ),
              ),
              Expanded(
                child: Divider(color: Colors.grey.shade200, indent: 8, endIndent: 8)
              ),
              OutlinedButton(
                onPressed: () {
                  addMenu = true;
                  callback(1);
                }, 
                style: ButtonStyle(
                  visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
                  padding: const MaterialStatePropertyAll(EdgeInsets.symmetric(vertical: 12, horizontal: 8)),
                  side: MaterialStatePropertyAll(BorderSide(color: Colors.grey.shade300)),
                  textStyle: const MaterialStatePropertyAll(
                    TextStyle(fontWeight: FontWeight.w600)
                  ),
                  foregroundColor: MaterialStatePropertyAll(Colors.grey.shade700)
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.add, size: 16, color: Colors.grey.shade800),
                    const SizedBox(width: 2),
                    const Text('add ')
                  ],
                ),
              )
            ],
          ),
        ),
        ItemRenderEngine(),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.all(4),
          child: CheckboxListTile(
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.grey.shade200),
              borderRadius: BorderRadius.circular(12)
            ),
            checkboxShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.7)),
            checkColor: Colors.green.shade400,
            activeColor: Colors.transparent,
            contentPadding: const EdgeInsets.only(left: 16, right: 8),
            controlAffinity: ListTileControlAffinity.trailing,
            title: Text('Terms and Conditions', 
              style: TextStyle(
                color: Colors.grey.shade700,
                wordSpacing: -0.75,
                fontWeight: FontWeight.w600
              )
            ),
            subtitle: Center(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Tooltip(
                  message: 'Click to Read Terms and Conditions',
                  child: TextButton.icon(
                    style: ButtonStyle(
                      padding: const MaterialStatePropertyAll(EdgeInsets.zero),
                      visualDensity: const VisualDensity(vertical: -4, horizontal: -4),
                      alignment: Alignment.centerLeft,
                      overlayColor: const MaterialStatePropertyAll(Colors.transparent),
                      foregroundColor: MaterialStateProperty.resolveWith((states) {
                        return states.contains(MaterialState.hovered)
                          ? Colors.lightBlue
                          : Colors.grey;
                      })
                    ),
                    onPressed: () {
                      showModalBottomSheet(
                        enableDrag: true,
                        isScrollControlled: true,
                        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                        context: context,
                        builder: (context) {
                          return const AgreementsDialogHero();                                     
                        },
                      );
                    }, 
                    icon: const Icon(Icons.policy, size: 16), 
                    label: Text('Help', style: GoogleFonts.roboto(fontWeight: FontWeight.w600))
                  ),
                ),
              ),
            ),
            value: true, 
            onChanged: (value) {}
          ),
        ),
        const SizedBox(height: 12),
        ButtonBar(
          buttonPadding: const EdgeInsets.only(left: 16),
          children: [
            OutlinedButton(
              onPressed: () => context.pop(), 
              style: ButtonStyle(
                side: MaterialStatePropertyAll(BorderSide(color: Colors.grey.shade300)),
                shape: MaterialStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)
                  )
                ),
              ),
              child: const Text(
                'Cancel',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),                        
            ),
            ElevatedButton(
              style: ButtonStyle(
                elevation: const MaterialStatePropertyAll(0),
                shape: MaterialStatePropertyAll(
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))
                ),
                backgroundColor: MaterialStateProperty.resolveWith((states) {
                  return states.contains(MaterialState.hovered) 
                    ? Colors.deepPurple.shade600
                    : Colors.deepPurple.shade400;
                }),
                foregroundColor: const MaterialStatePropertyAll(Colors.white),
              ),
              onPressed: () {},
              child: const Text(
                'Download',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            )
          ],
        ),
      ],
    );
  }
}



class DialogHero extends StatefulWidget {
  const DialogHero({
    super.key, 
    required this.useVerticalLayout, 
    required this.title
  });

  final bool useVerticalLayout;
  final String title;

  @override
  State<DialogHero> createState() => _DialogHeroState();
}


class _DialogHeroState extends State<DialogHero> {
  late PageController _pageController;
  
  @override
  void initState() {
    addMenu = false;
    _pageController = PageController(initialPage: 0, viewportFraction: 1);
    super.initState();
  }
  
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void changePage(int i) {
    setState(() {
      _pageController.animateToPage(i,
        duration: const Duration(milliseconds: 600), 
        curve: Curves.ease
      );       
    });
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: FractionalOffset.center,
      child: Hero(
        tag: "download",
        child: SizedBox(
          width: 400,
          child: Card(
            elevation: 0,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 600),
                        child: addMenu 
                          ? Row(
                            children: [
                              IconButton(
                                onPressed:() {
                                  setState(() {
                                    changePage(0);
                                    addMenu = false;
                                  });
                                }, 
                                icon: const Icon(Icons.arrow_back)
                              ),
                              const SizedBox(width: 12),
                              Text(
                                'Select Item', 
                                style: TextStyle(
                                  color: Colors.grey.shade800,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                )
                              )
                            ],
                          )
                          : Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Row(
                              children: [
                                Icon(Icons.download, color: Colors.grey.shade800),
                                const SizedBox(width: 12),
                                Text(
                                  'Download', 
                                  style: TextStyle(
                                    color: Colors.grey.shade800,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                  )
                                )
                              ],
                            ),
                          ),
                      ),
                      Row(
                        children: [
                          AnimatedSwitcher(
                            duration: const Duration(milliseconds: 600),
                            child: addMenu ? IconButton(
                              tooltip: 'Wassup',
                              style: ButtonStyle(iconColor: MaterialStatePropertyAll(Colors.grey.shade700)),
                              onPressed:() => context.pop(), 
                              icon: const Icon(Icons.help_outline)
                            ) : null,
                          ),
                          IconButton(
                            onPressed:() {
                              context.pop();
                            }, 
                            icon: const Icon(Icons.close)
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 4),
                  Divider(
                    indent: 8,
                    endIndent: 8,
                    color: Colors.grey.shade200
                  ),
                  ExpandablePageView(
                    controller: _pageController,
                    itemCount: 2,
                    itemBuilder: (context, index) => dialogsHero(
                      widget.title, widget.useVerticalLayout, _pageController, changePage)[index]
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

downloadDialogHero(context, title, useVerticalLayout) {
  Navigator.push(context, PageRouteBuilder(
    fullscreenDialog: false,
    opaque: false,
    barrierDismissible: true,
    barrierColor: Colors.black38,
    pageBuilder: (BuildContext context, animation, secondaryAnimation) {
      return DialogHero(useVerticalLayout: useVerticalLayout, title: title); 
    }
  ));
}


class AgreementsDialogHero extends StatelessWidget {
  const AgreementsDialogHero({
    super.key, 
  });

  Widget sideButtons(context, useVerticalLayout) {
    List<Icon> icons = [
      const Icon(Icons.close),
      const Icon(Icons.download),
      const Icon(Icons.print)
    ];

    return Theme(
      data: ThemeData(
        useMaterial3: true,
        iconButtonTheme: IconButtonThemeData(
          style: ButtonStyle(
            elevation: const MaterialStatePropertyAll(6),
              shadowColor: const MaterialStatePropertyAll(Colors.black38),
              shape: MaterialStatePropertyAll(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))
              ),
              backgroundColor: const MaterialStatePropertyAll(Colors.white)
          )
        )
      ),
      child: Column(
        children: List.generate(3, (index) {
          return Visibility(
            visible: index == 0 
              ? useVerticalLayout 
                ? true : false
              : true,
            child: Padding(
              padding: EdgeInsets.only(top: index == 0 ? 8 : 16),
              child: IconButton(
                onPressed: () => GoRouter.of(context).pop(), 
                icon: icons[index]
              ),
            ),
          );
        }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
      bool useVerticalLayout = constraints.maxHeight < constraints.maxWidth;

        return Dialog(
          insetPadding: useVerticalLayout ? null : EdgeInsets.zero,
          backgroundColor: Colors.transparent,
          child: Padding(
            padding: EdgeInsets.all(useVerticalLayout ? 8 : 0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Visibility(
                  visible: useVerticalLayout ? true : false,
                  child: sideButtons(context, useVerticalLayout)
                ),
                SizedBox(width: useVerticalLayout ? 16 : 0),
                Flexible(
                  child: Container(
                    width: 800,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(useVerticalLayout ? 12 : 0)
                    ),
                    child: Stack(
                      children: [
                        SingleChildScrollView(
                          child: InkWell(
                            hoverColor: Colors.transparent,
                            overlayColor: const MaterialStatePropertyAll(Colors.transparent),
                            onTap: () => context.pop(),
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                children: <Widget>[
                                  Icon(Icons.copyright, size: 72, color: Colors.grey.shade700),
                                  const SizedBox(height: 16),
                                  const Text('Last Updated: 10 Januari 2023'),
                                  const SizedBox(height: 8),
                                  Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Text(StringResource.terms_header,
                                      style: GoogleFonts.roboto(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600
                                      ),
                                    ),
                                  ),
                                ] + List.generate(StringResource.terms_and_conditions.length, (index) {
                                  return ListTile(
                                    dense: true,
                                    leading: Text((index + 1).toString(), style: const TextStyle(fontSize: 16)),
                                    title: Text(StringResource.terms_and_conditions[index],
                                      style: GoogleFonts.roboto(fontSize: 14),
                                    ),
                                  );
                                }) +
                                [ 
                                  Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Text(StringResource.terms_footer, 
                                      style: GoogleFonts.roboto(fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  ButtonBar(
                                    children: [
                                       TextButton(
                                        onPressed: () => context.pop(), 
                                        child: Text('Disagree', 
                                          style: GoogleFonts.roboto(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.grey
                                          )
                                        )
                                      ),
                                      TextButton(
                                        onPressed: () => context.pop(), 
                                        child: Text('Agree', style: GoogleFonts.roboto(fontWeight: FontWeight.w600))
                                      )
                                    ]
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Center(
                          child: Align(
                            alignment: Alignment.centerRight, 
                            child: Visibility(
                              visible: useVerticalLayout ? false : true,
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(16, constraints.maxHeight / 3.5, 16, 16),
                                child: sideButtons(context, useVerticalLayout),
                              )
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Visibility(
                            visible: useVerticalLayout ? false : true,
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: IconButton(
                                style: ButtonStyle(
                                  elevation: const MaterialStatePropertyAll(6),
                                  shadowColor: const MaterialStatePropertyAll(Colors.black38),
                                  shape: MaterialStatePropertyAll(
                                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.7))
                                  ),
                                  backgroundColor: const MaterialStatePropertyAll(Colors.white)
                                ),
                                onPressed: () => GoRouter.of(context).pop(), 
                                icon: const Icon(Icons.close)
                              ),
                            )
                          ),
                        )
                      ],
                    ),
                  )
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}

imageDialogHero(context, images, hero, pagePosition) {
  Navigator.of(context).push(PageRouteBuilder(
    fullscreenDialog: false,
    opaque: false,
    barrierDismissible: true,
    barrierColor: Colors.black54,
    transitionDuration: const Duration(milliseconds: 200),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      final tween = Tween(begin: begin, end: end);
      final offsetAnimation = animation.drive(tween);
      return SlideTransition(
        position: offsetAnimation,
        child: child,
      );
    },
    pageBuilder: (BuildContext context, animation, secondaryAnimation) {
      return Scaffold(
        backgroundColor: Colors.transparent,
        body: GestureDetector(
          onLongPress: () => onRightClickImageMenu(context, images),
          onLongPressDown: (details) => onTapPosition(details),
          onSecondaryTapDown: (details) =>
              onRightClickImageMenu(context, images, details),
          onTap: () => Navigator.pop(context),
          child: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Hero(
              tag: pagePosition == null
                  ? hero
                  : hero['hero'] + pagePosition.toString(),
              child: InteractiveViewer(
                panEnabled: true,
                minScale: 1,
                maxScale: 6,
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Stack(children: [
                    Center(
                      child: Image(image: AssetImage(images)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(25.7)),
                        child: IconButton(
                            onPressed: () => Navigator.pop(context),
                            icon: const Icon(
                              Icons.close,
                              color: Colors.white,
                              size: 24,
                            )),
                      ),
                    ),
                  ]),
                ),
              ),
            ),
          ),
        ),
      );
    })
  );
}

imageDialog(context, images, pagePosition) {
  showGeneralDialog(
    barrierDismissible: true,
    barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
    context: context,
    pageBuilder: (context, animation, secondaryAnimation) {
      return Padding(
        padding: const EdgeInsets.all(0.0),
        child: InteractiveViewer(
          panEnabled: true,
          minScale: 1,
          maxScale: 6,
          child: GestureDetector(
            onTap: () => Navigator.pop(context, false), // passing false
            child: Image(
              image: pagePosition == null
                  ? AssetImage(images)
                  : AssetImage(images[pagePosition]),
            ),
          ),
        ),
      );
    },
  );
}

void aboutDialog(BuildContext context) {
  showAboutDialog(
    children: [ const SizedBox(height: 45) ],
    applicationName: StringResource.title,
    applicationVersion: StringResource.version,
    applicationIcon: const Padding(
      padding: EdgeInsets.only(top: 12),
      child: FlutterLogo(),
    ),
    applicationLegalese: StringResource.paragraph,
    context: context
  );
}
