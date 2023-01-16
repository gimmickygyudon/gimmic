import 'package:flutter/material.dart';
import 'package:gimmic/assets/label.dart';
import 'package:gimmic/assets/widgets/builder.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../icons.dart';
import 'item.dart';
import 'menu.dart';

List<Widget> dialogsHero(String title, String mainItems,
  bool useVerticalLayout, PageController pageController, Function changePage, 
  Function updateItem, Function setSelectionItem, bool onAgreement, Function updateAgreement, 
  Map<String, dynamic> isSelected) {
  return [
    DownloadDialogHero(
      title: title, 
      mainItems: mainItems,
      useVerticalLayout: useVerticalLayout, 
      pageController: pageController,
      changePage: changePage,
      updateItem: updateItem,
      isSelected: isSelected,
      onAgreement: onAgreement,
      updateAgreement: updateAgreement,
    ), AddDialogHero(
      useVerticalLayout: useVerticalLayout,
      updateItem: updateItem, 
      isSelected: isSelected, 
      setSelectionItem: setSelectionItem,
      changePage: changePage,
    ),
  ];
}

class AddDialogHero extends StatelessWidget {
  const AddDialogHero({
    super.key, 
    required this.updateItem, 
    required this.changePage, 
    required this.isSelected, 
    required this.setSelectionItem, 
    required this.useVerticalLayout
  });

  final Function updateItem, changePage, setSelectionItem;
  final Map<String, dynamic> isSelected;
  final bool useVerticalLayout;

  @override
  Widget build(BuildContext context) {
    final List<String> listItems = ['All', 'Blender', 'Image', 'Video'];
    final List<IconData> listItemsIcon = [
      Icons.apps, IconSoftware.blender3doutlinedalt, Icons.image_outlined, Icons.play_circle_outline
    ];

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
                    children: List.generate(listItems.length, (index) {
                      return InputChip(
                        visualDensity: const VisualDensity(vertical: -4, horizontal: -4),
                        label: Padding(
                          padding: const EdgeInsets.only(bottom: 1),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(listItemsIcon[index], size: 14, color: listItems[index] != 'Blender' 
                                ? Colors.grey.shade800 
                                : Colors.orangeAccent
                              ),
                              const SizedBox(width: 4),
                              Text(listItems[index], style: GoogleFonts.roboto(
                                color: Colors.grey.shade800,
                                fontWeight: FontWeight.w600)
                              ),
                            ],
                          ),
                        ),
                        showCheckmark: false,
                        selected: listItems[index] == 'All' 
                          ? isSelected.values.every((element) => element == true)
                          : !isSelected.values.every((element) => element == true) && isSelected[listItems[index]] == true,
                        selectedColor: Colors.blueGrey.shade50,
                        onSelected: (value) {
                          if (listItems[index] == 'All') {
                            setSelectionItem(value);
                          } else {
                            setSelectionItem(false); // TODO: Unnecessary double setState
                            updateItem(listItems[index], value);
                          }
                        },
                      );
                    })
                  ),
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: 400,
          child: ListView(
            shrinkWrap: true,
            children: [ 
              Column(
                children: [
                  const SizedBox(height: 8),
                  ItemImage(useVerticalLayout: useVerticalLayout, 
                    updateItem: updateItem, 
                    isSelected: isSelected['Image']
                  ),
                  const SizedBox(height: 8),
                  ItemRenderEngine(useVerticalLayout: useVerticalLayout,
                    updateItem: updateItem, 
                    isSelected: isSelected['Blender']
                  ),
                  const SizedBox(height: 8),
                  ItemVideo(useVerticalLayout: useVerticalLayout,
                    updateItem: updateItem, 
                    isSelected: isSelected['Video']
                  ),
                  const SizedBox(height: 8),
                ],
              ) 
            ]
          ),
        ),
        Card(
          surfaceTintColor: Colors.transparent,
          color: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.grey.shade300, width: 1),
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
                      onPressed: () {
                        bool value;
                        isSelected.values.where((element) => element == true).isEmpty 
                          ? value = true : value = false;

                        setSelectionItem(value);
                      }, 
                      icon: Icon(isSelected.values.where((element) => element == true).isEmpty
                        ? Icons.check_box_outline_blank
                        : Icons.indeterminate_check_box_outlined, 
                        color: Colors.grey.shade600)
                    ),
                    const SizedBox(width: 4),
                    Text('${isSelected.values.where((element) => element == true).length} Item Selected',
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontWeight: FontWeight.w600
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 6),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      padding: const MaterialStatePropertyAll(EdgeInsets.symmetric(horizontal: 8)),
                      textStyle: MaterialStatePropertyAll(
                        TextStyle(
                          color: Colors.grey.shade800,
                          fontWeight: FontWeight.w600
                        )
                      ),
                      visualDensity: VisualDensity.compact,
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(6))),
                      backgroundColor: MaterialStateProperty.resolveWith((states) {
                        return states.contains(MaterialState.disabled) 
                          ? Colors.deepPurple.shade200
                          : Colors.deepPurple;
                      }),
                      foregroundColor: const MaterialStatePropertyAll(Colors.white),
                      shadowColor: const MaterialStatePropertyAll(Colors.black38)
                    ),
                    onPressed: isSelected.containsValue(true) ? () {
                      changePage(0);
                    } : null,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.playlist_add_check, size: 24),
                        const SizedBox(width: 4),
                        Text('Add ', style: GoogleFonts.roboto()),
                      ],
                    )
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
    required this.title, required this.mainItems,
    required this.useVerticalLayout, 
    required this.pageController, 
    required this.changePage, required this.updateItem, required this.updateAgreement,
    required this.isSelected, required this.onAgreement,  
  });

  final String title, mainItems;
  final Function changePage, updateItem, updateAgreement;
  final bool useVerticalLayout, onAgreement;
  final PageController pageController;
  final Map<String, dynamic> isSelected;

  @override
  Widget build(BuildContext context) {
    final GlobalKey<TooltipState> keyTooltip = GlobalKey<TooltipState>();
    final List<String> listItems = ['Blender', 'Image', 'Video'];
    final List<IconData> listItemsIcon = [
      IconSoftware.blender3dfilled, Icons.image_outlined, Icons.play_circle_outline
    ];
    final List<double> listItemsSize = [28, 3, 45];

    listItemsIcon.removeAt(listItems.indexOf(mainItems));
    listItemsSize.removeAt(listItems.indexOf(mainItems));
    listItems.remove(mainItems);

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
                  changePage(1);
                }, 
                style: ButtonStyle(
                  visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
                  padding: const MaterialStatePropertyAll(EdgeInsets.symmetric(vertical: 21, horizontal: 8)),
                  side: MaterialStatePropertyAll(BorderSide(color: Colors.grey.shade300)),
                  textStyle: const MaterialStatePropertyAll(
                    TextStyle(fontWeight: FontWeight.w600)
                  ),
                  foregroundColor: MaterialStatePropertyAll(Colors.grey.shade600)
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(width: 4),
                    const Text('extra'),
                    const SizedBox(width: 4),
                    Icon(Icons.more_horiz, size: 16, color: Colors.grey.shade700),
                  ],
                ),
              ),
            ] + List.generate(listItems.length, (index) {
              return Visibility(
                visible: isSelected[listItems[index]],
                child: Padding(
                  padding: const EdgeInsets.only(left: 4),
                  child: Theme(
                    data: ThemeData(
                      useMaterial3: true,
                      chipTheme: ChipThemeData(
                        side: isSelected[listItems[index]] 
                          ? BorderSide.none 
                          : BorderSide(color: Colors.grey.shade300),
                        labelPadding: EdgeInsets.zero,
                        labelStyle: const TextStyle(fontSize: 12),
                      )
                    ).copyWith(
                      splashColor: Colors.blueGrey,
                      canvasColor: isSelected[listItems[index]]
                        ? listItems[index] == 'Blender'
                          ? Colors.orangeAccent
                          : Colors.blueGrey.shade400
                        : Colors.transparent
                    ),
                    child: Tooltip(
                      message: listItems[index],
                      child: ActionChip(
                        onPressed: () {
                          changePage(1);
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
                        visualDensity: const VisualDensity(vertical: -4, horizontal: -4),
                        label: Padding(
                          padding: const EdgeInsets.only(left: 4, right: 4),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(listItemsIcon[index], size: 14, opticalSize: 14, color: isSelected[listItems[index]] 
                                ? Colors.white : Colors.grey.shade700
                              ),
                              const SizedBox(width: 6),
                              Text('${listItemsSize[index]} MB', style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey.shade50)
                              )
                            ],
                          ),
                        )
                      ),
                    ),
                  ),
                ),
              );
            })
          ),
        ),
        (() { 
          switch (mainItems) {
            case 'Blender':
              return ItemRenderEngine(useVerticalLayout: useVerticalLayout, 
                updateItem: updateItem, isSelected: isSelected['Blender']);
            case 'Image':
              return ItemImage(updateItem: updateItem, isSelected: isSelected['Image'], 
                useVerticalLayout: useVerticalLayout);
            case 'Video':
              return ItemVideo(updateItem: updateItem, useVerticalLayout: useVerticalLayout,
                isSelected: isSelected['Video']);
            default: 
              return const SizedBox();
          }
        }()),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.all(4),
          child: CheckboxListTile(
            value: onAgreement, 
            onChanged: (value) {
              updateAgreement(value);
            },
            shape: RoundedRectangleBorder(
              side: BorderSide(color: onAgreement
                ? Colors.blue.shade200 : Colors.grey.shade300,
                width: onAgreement ? 2 : 1
              ),
              borderRadius: BorderRadius.circular(12)
            ),
            tileColor: onAgreement ? Colors.blue.shade50 : null,
            // checkColor: Colors.green,
            activeColor: Colors.blue.shade400,
            checkboxShape: RoundedRectangleBorder(
              side: const BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(3)
            ),
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
                        if (onAgreement) {
                          return states.contains(MaterialState.hovered)
                            ? Colors.blue.shade700
                            : Colors.blue;
                        }

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
                          return AgreementsDialogHero(updateAgreement: updateAgreement);
                        },
                      );
                    }, 
                    icon: const Icon(Icons.policy, size: 16), 
                    label: Text('Help', style: GoogleFonts.roboto(fontWeight: FontWeight.w600))
                  ),
                ),
              ),
            ),
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
            TooltipVisibility(
              visible: !onAgreement || !isSelected.containsValue(true),
              child: Tooltip(
                key: keyTooltip,
                richMessage: TextSpan(
                  style: TextStyle(fontSize: 14, color: Colors.grey.shade400),
                  text: ' ${
                    onAgreement || isSelected.containsValue(true) ? 'One' 
                    : !onAgreement && !isSelected.containsValue(true) ? 'Two' : 'One'
                  } of the following requirements need to be made \n',
                  children: [
                    WidgetSpan(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(12, 8, 8, 2),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(onAgreement 
                                  ? Icons.check_box
                                  : Icons.check_box_outline_blank, size: 16, color: Colors.grey.shade200),
                                const SizedBox(width: 8),
                                Text('Terms and Conditions', style: TextStyle(fontSize: 14, color: Colors.grey.shade200))
                              ],
                            ),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(isSelected.containsValue(true)
                                  ? Icons.check_box
                                  : Icons.check_box_outline_blank, size: 16, color: Colors.grey.shade200
                                ),
                                const SizedBox(width: 8),
                                Text('Project files', style: TextStyle(fontSize: 14, color: Colors.grey.shade200))
                              ],
                            ),
                          ],
                        ),
                      )
                    ),
                  ]
                ),
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                decoration: BoxDecoration(
                  color: Colors.grey.shade800,
                  borderRadius: BorderRadius.circular(12)
                ),
                child: ElevatedButton(
                  style: ButtonStyle(
                    elevation: const MaterialStatePropertyAll(0),
                    shape: MaterialStatePropertyAll(
                      RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))
                    ),
                    backgroundColor: MaterialStateProperty.resolveWith((states) {
                      return isSelected.containsValue(true) && onAgreement 
                        ? states.contains(MaterialState.hovered) 
                          ? Colors.deepPurple.shade400
                          : Colors.deepPurple.shade600
                        : Colors.deepPurple.shade200;
                    }),
                    foregroundColor: const MaterialStatePropertyAll(Colors.white),
                  ),
                  onPressed: isSelected.containsValue(true) && onAgreement ? () {
                    // Download Commands []
                  } : () => keyTooltip.currentState?.ensureTooltipVisible(),
                  child: Text(
                    'Download',
                    style: GoogleFonts.roboto(fontWeight: FontWeight.w600),
                  ),
                ),
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
    required this.title,
    required this.mainItems
  });

  final bool useVerticalLayout;
  final String title;
  final String mainItems;

  @override
  State<DialogHero> createState() => _DialogHeroState();
}


class _DialogHeroState extends State<DialogHero> {
  late PageController _pageController;
  final Map<String, dynamic> itemSelected = {
    'Blender' : false,
    'Image' : false,
    'Video' : false
  }; 

  bool onAgreement = false;
  void updateAgreement(bool value) {
    setState(() {
      onAgreement = value;     
    });
  }

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

  void setSelectionItem(bool selection) {
    setState(() {
      itemSelected.updateAll((key, value) => selection);
    });
  }

  void updateItem(String item, bool selected) {
    setState(() {      
      itemSelected.update(item, (value) => selected);
    });
  }

  void changePage(int i) {
    setState(() {
      _pageController.animateToPage(i,
        duration: const Duration(milliseconds: 600), 
        curve: Curves.ease
      );
      i == 0 ? addMenu = false : addMenu = true;       
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
                                  changePage(0);
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
                    onPageChanged: (value) {
                      setState(() {
                        value == 1 
                          ? addMenu = true 
                          : addMenu = false;                       
                      });
                    },
                    itemBuilder: (context, index) => dialogsHero(
                      widget.title, widget.mainItems, widget.useVerticalLayout, 
                      _pageController, changePage, updateItem, setSelectionItem, onAgreement, updateAgreement, itemSelected)[index]
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

downloadDialogHero(BuildContext context, String title, String mainItems, bool useVerticalLayout) {
  Navigator.push(context, PageRouteBuilder(
    fullscreenDialog: false,
    opaque: false,
    barrierDismissible: true,
    barrierColor: Colors.black38,
    pageBuilder: (BuildContext context, animation, secondaryAnimation) {
      return DialogHero(
        useVerticalLayout: useVerticalLayout, 
        title: title, 
        mainItems: mainItems
      ); 
    }
  ));
}


class AgreementsDialogHero extends StatelessWidget {
  const AgreementsDialogHero({
    super.key, 
    required this.updateAgreement, 
  });

  final Function updateAgreement;

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
                                        onPressed: () {
                                          updateAgreement(false);
                                          context.pop();
                                        }, 
                                        child: Text('Disagree', 
                                          style: GoogleFonts.roboto(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.grey
                                          )
                                        )
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          updateAgreement(true);
                                          context.pop();
                                        }, 
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
