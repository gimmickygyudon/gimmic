import 'dart:async';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:gimmic/assets/functions/platform.dart';
import 'package:gimmic/src/view/grid.dart';
import 'package:gimmic/src/view/list.dart';
import 'package:gimmic/src/view/list_big.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../assets/widgets/appbar.dart';
import '../../assets/widgets/menu.dart';

class PopupItem {
  int index;
  String name;
  IconData icon;
  PopupItem(this.index, this.name, this.icon);
}

class Resource extends StatefulWidget {
  const Resource({Key? key, this.arguments}) : super(key: key);
  final String? arguments;

  @override
  State<Resource> createState() => _ResourceState();
}

TextEditingController _searchController = TextEditingController();

class _ResourceState extends State<Resource> {
  late ScrollController _scrollGridViewController;
  late ScrollController _scrollListViewController;
  bool _showAppbar = true;
  bool _loading = true;
  bool isScrollingDown = false;
  bool initated = false;

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();
  final GlobalKey<State<StatefulWidget>> _appBarKey =
      GlobalKey<State<StatefulWidget>>();
  final GlobalKey<State<StatefulWidget>> _bodyStateKey =
      GlobalKey<State<StatefulWidget>>();

  final GlobalKey<PopupMenuButtonState> _openTagsMenuKey = GlobalKey();
  final GlobalKey<PopupMenuButtonState> _openSortMenuKey = GlobalKey();

  final FocusNode _buttonTagsFocusNode = FocusNode();
  final FocusNode _buttonSortFocusNode = FocusNode();
  final FocusNode _searchBarFocusNode = FocusNode();

  /// This holds a list of fiction users
  /// You can use data fetched from a database or a server as well
  final List<Map<String, dynamic>> _allResource = [
    {
      "id": 1,
      "hero": "catHero",
      "index": 0,
      "name": "Andy",
      "subname": "Legends of Zelda",
      "size": "29.0 MB"
    },
    {
      "id": 2,
      "index": 1,
      "hero": "dogHero",
      "name": "Aragon Malay",
      "subname": "Cross Code",
      "size": "40.2 MB"
    },
    {
      "id": 3,
      "index": 0,
      "hero": "lizardHero",
      "name": "Cross",
      "subname": "Cross Code",
      "size": "5.5 MB"
    },
    {
      "id": 4,
      "index": 1,
      "hero": "monkeyHero",
      "name": "Barbara",
      "subname": "Zenity",
      "size": "35.2 MB"
    },
  ];

  List<Map<String, dynamic>> _foundResource = []; // This list holds the data for the list view
  String resultCount(int data) {    
      String count = 'No Result';
      if (data == 1) {
            count = 'About ${_foundResource.toList().length} Results';
            return count;
      } else if (data > 1) {
            count = 'About ${_foundResource.toList().length} Results';
            return count;
      }
      return count;
  }

  @override
  void initState() {
    super.initState();
    if (widget.arguments == null) {
      _foundResource = _allResource; // at the beginning, all users are shown
    } else {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _searchController.text = widget.arguments!;
        _runFilter(widget.arguments!);
      });
    }

    final random = Random();
    randomEmoji = emoji[random.nextInt(emoji.length)];
    Timer.periodic(const Duration(seconds: 45), (Timer timer) {
      final random = Random();
      randomEmoji = emoji[random.nextInt(emoji.length)];
    });

    initated = true;

    _scrollGridViewController = ScrollController();
    _scrollGridViewController.addListener(() {
      if (_scrollGridViewController.position.userScrollDirection ==
          ScrollDirection.reverse) {
          Future.delayed(const Duration(milliseconds: 50)).whenComplete(() {
            if (!isScrollingDown && _showAppbar == true) {
              _appBarKey.currentState?.setState(() {
              isScrollingDown = true;
              _showAppbar = false;
              });
            }
          return null;
          });
      }

      if (_scrollGridViewController.position.userScrollDirection ==
          ScrollDirection.forward) {
          Future.delayed(const Duration(milliseconds: 50)).whenComplete(() {
            if (isScrollingDown && _showAppbar == false) {
              _appBarKey.currentState?.setState(() {
              isScrollingDown = false;
              _showAppbar = true;
              });
            }
          return null;
          });
      }
    });

    _scrollListViewController = ScrollController();
    _scrollListViewController.addListener(() {
      if (_scrollListViewController.position.userScrollDirection ==
          ScrollDirection.reverse) {
          Future.delayed(const Duration(milliseconds: 50)).whenComplete(() {
            if (!isScrollingDown && _showAppbar == true) {
              _appBarKey.currentState?.setState(() {
              isScrollingDown = true;
              _showAppbar = false;
              });
            }
          return null;
          });
      }

      if (_scrollListViewController.position.userScrollDirection ==
          ScrollDirection.forward) {
          Future.delayed(const Duration(milliseconds: 50)).whenComplete(() {
            if (isScrollingDown && _showAppbar == false) {
              _appBarKey.currentState?.setState(() {
              isScrollingDown = false;
              _showAppbar = true;
              });
            }
          return null;
          });
      }
    });
    
    _searchBarFocusNode.addListener(() { 
      if (_searchBarFocusNode.hasFocus && useVerticalLayout3x) {
        _appBarKey.currentState?.setState(() {});
      }
      else if(useVerticalLayout3x) {
        _appBarKey.currentState?.setState(() {});
      }
    });
  }

  @override
  void dispose() {
    _scrollGridViewController.removeListener(() {});
    _scrollGridViewController.dispose();
    _scrollListViewController.removeListener(() {});
    _scrollListViewController.dispose();
    _buttonTagsFocusNode.dispose();
    _buttonSortFocusNode.dispose();
    super.dispose();
  }

  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    setState(() {
      _loading = true;
    });
    if (enteredKeyword.trim().isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = _allResource;

      if (kIsWeb) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (initated) GoRouter.of(context).replace('/resource');
        });
      }
    } else {
      final name = _allResource
          .where((name) => name["name"]
              .toLowerCase()
              .contains(enteredKeyword.trim().toLowerCase()))
          .toList();

      final subname = _allResource
          .where((subname) => subname["subname"]
              .toLowerCase()
              .contains(enteredKeyword.trim().toLowerCase()))
          .toList();

      results = name..addAll(subname);
      results = results.toSet().toList();
      // we use the toLowerCase() method to make it case-insensitive

      if (kIsWeb) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (initated && enteredKeyword.trim().isNotEmpty) {
            GoRouter.of(context)
                .replace('/resource?search=${enteredKeyword.trim()}');
          }
        });
      }

      Future.delayed(const Duration(milliseconds: 600), () async {
        if (results.isEmpty) {
          setState(() {
            _loading = false;
          });
        }
      });
    }

    // Refresh the UI
    setState(() {
      _foundResource = results;
    });
  }

  List<bool> checkedTags = [true, false, false];
  final List<bool> _layouts = [false, true, false];
  final List<String> emoji = [
    "(^_^)b",
    "(>_<)",
    "(ง'̀-'́)ง",
    "(•◡•)",
    "(¬‿¬)",
    "(•_•)",
    "~(˘▾˘~)",
    "(~˘▾˘)~",
    "(._.)",
    "(⇀‸↼‶)",
    "(Ò_Óˇ)",
    "⚆ _ ⚆",
    "(˚▽˚)",
    ":')",
    "(ಠ_ಠ)",
    "(˘⌣˘)",
    "(¬_¬)",
    "(~_^)",
    "(°,,°)",
    "(^-^*)",
    "(;-;)"
  ];
  String randomEmoji = '';
  String sortbyValue = 'Most Updated';

  final List<PopupItem> _listTags = [
    PopupItem(0, "Any Categories", Icons.grid_view),
    PopupItem(1, "Animal", Icons.cruelty_free),
    PopupItem(2, "Sci-fi", Icons.smart_toy_outlined),
  ];

  final List<PopupItem> _listSort = [
    PopupItem(0, "Most Popular", Icons.leaderboard),
    PopupItem(1, "Newest", Icons.new_releases),
    PopupItem(2, "Name", Icons.sort_by_alpha),
    PopupItem(3, "Size", Icons.signal_cellular_alt),
  ];

  late bool useVerticalLayout;
  late bool useVerticalLayout2x;
  late bool useVerticalLayout3x;
  late bool hideDetailHorizontal;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      useVerticalLayout = constraints.maxWidth > 1000;
      useVerticalLayout2x = constraints.maxWidth > 620;
      useVerticalLayout3x = constraints.maxWidth > 460;
      hideDetailHorizontal = constraints.maxWidth > 550;

      int gridRowCount = 1;
      useVerticalLayout3x ? gridRowCount = 1 : null;
      useVerticalLayout2x ? gridRowCount = 2 : null;
      useVerticalLayout ? gridRowCount = 3 : null;

      return GestureDetector(
        onLongPressDown: (details) => onTapPosition(details),
        onLongPress: () => onRightClickPageMenu(context, _refreshIndicatorKey),
        onSecondaryTapDown: (details) =>
            onRightClickPageMenu(context, _refreshIndicatorKey, details),
        child: Scaffold(
            body: RefreshIndicator(
          key: _refreshIndicatorKey,
          notificationPredicate: (ScrollNotification notification) {
            return notification.depth == 1;
          },
          onRefresh: () async {
            return Future<void>.delayed(const Duration(seconds: 1));
          },
          child: Container(
              color: Colors.grey.shade200,
              child: Column(children: [
                StatefulBuilder(
                  key: _appBarKey,
                  builder: (context, setState) => Column(
                    children: [
                      AnimatedContainer(
                        curve: Curves.fastOutSlowIn,
                        duration: const Duration(milliseconds: 300),
                        height: _showAppbar ? 70 : 0,
                        child: Visibility(
                          visible: _showAppbar ? true : false,
                          child: AnimatedPadding(
                            curve: Curves.fastOutSlowIn,
                            duration: const Duration(milliseconds: 600),
                            padding: useVerticalLayout
                                ? const EdgeInsets.only(
                                    top: 24, bottom: 8, left: 20, right: 20)
                                : const EdgeInsets.only(
                                    top: 24, bottom: 8, left: 24, right: 24),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                    style: const ButtonStyle(
                                        foregroundColor:
                                            MaterialStatePropertyAll(
                                                Colors.black54),
                                        backgroundColor:
                                            MaterialStatePropertyAll(
                                                Colors.white70)),
                                    onPressed: () => context.pop(),
                                    icon: const Icon(Icons.arrow_back)),
                                const SizedBox(width: 12),
                                Flexible(
                                  child: TextField(
                                    onChanged: (value) => _runFilter(value),
                                    focusNode: _searchBarFocusNode,
                                    controller: _searchController,
                                    autofocus: isWebMobile ? false : true,
                                    style: GoogleFonts.roboto(
                                        fontWeight: FontWeight.w500),
                                    decoration: InputDecoration(
                                      isDense: false,
                                      filled: true,
                                      fillColor: Colors.white70,
                                      hoverColor: Colors.white,
                                      prefixIcon: const Icon(Icons.search,
                                          color: Colors.black54),
                                      prefixIconConstraints:
                                          const BoxConstraints(minWidth: 55),
                                      suffixIcon: _searchController.text.isEmpty
                                          ? Visibility(
                                              visible: useVerticalLayout2x
                                                  ? false
                                                  : true,
                                              child: PopupMenuButton(
                                                tooltip: '',
                                                key: _openSortMenuKey,
                                                enabled: true,
                                                elevation: 4,
                                                offset: const Offset(0, 45),
                                                color: Colors.grey.shade50,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12)),
                                                onSelected: (value) =>
                                                    _buttonSortFocusNode
                                                        .requestFocus(),
                                                onCanceled: () =>
                                                    _buttonSortFocusNode
                                                        .requestFocus(),
                                                itemBuilder: (context) {
                                                  return _listSort
                                                      .map((PopupItem value) {
                                                    return menuSort(value);
                                                  }).toList();
                                                },
                                                child: IconButton(
                                                    onPressed: () {
                                                      dynamic state =
                                                          _openSortMenuKey
                                                              .currentState;
                                                      state.showButtonMenu();
                                                    },
                                                    icon: const Icon(Icons.sort,
                                                        color: Colors.black54)),
                                              ),
                                            )
                                          : Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Visibility(
                                                visible: useVerticalLayout2x ? false : true,
                                                child: Text(resultCount(_foundResource.length), 
                                                    style: GoogleFonts.roboto(
                                                        color: Colors.black54, 
                                                        fontSize: 12, 
                                                        fontWeight: FontWeight.w500)),
                                              ),
                                              IconButton(
                                                  icon: const Icon(
                                                    Icons.clear,
                                                    color: Colors.black54,
                                                  ),
                                                  onPressed: () {
                                                    GoRouter.of(context)
                                                        .replace('/resource');
                                                    _searchController.clear();
                                                    _runFilter(
                                                        _searchController.text);
                                                  },
                                                ),
                                            ],
                                          ),
                                      suffixIconConstraints:
                                          const BoxConstraints(
                                              minWidth: 50, minHeight: 50),
                                      hintText: 'Search...',
                                      hintStyle: GoogleFonts.roboto(
                                          fontWeight: FontWeight.w500),
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              vertical: 0, horizontal: 0),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Colors.blue, width: 2),
                                        borderRadius:
                                            BorderRadius.circular(25.7),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Colors.transparent),
                                        borderRadius:
                                            BorderRadius.circular(25.7),
                                      ),
                                    ),
                                  ),
                                ),
                                AnimatedSize(
                                  curve: Curves.ease,
                                  duration: const Duration(milliseconds: 300),
                                  child: SizedBox(
                                    width: _searchBarFocusNode.hasFocus ? 0 : null,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const SizedBox(width: 8),
                                        appbarSetting(useVerticalLayout2x)
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      AnimatedSize(
                        duration: const Duration(milliseconds: 300),
                        child: SizedBox(height: useVerticalLayout && _showAppbar ? 0 : 4)),
                      AnimatedPadding(
                        curve: Curves.fastOutSlowIn,
                        duration: const Duration(milliseconds: 600),
                        padding: useVerticalLayout
                            ? _showAppbar
                                ? EdgeInsets.symmetric(
                                    vertical: useVerticalLayout ? 0 : 8, horizontal: 48)
                                : const EdgeInsets.symmetric(
                                    vertical: 0, horizontal: 12)
                            : useVerticalLayout2x
                                ? _showAppbar
                                    ? const EdgeInsets.symmetric(
                                        vertical: 0,
                                        horizontal: 24)
                                    : const EdgeInsets.symmetric(
                                        vertical: 0,
                                        horizontal: 6)
                                : _showAppbar
                                    ? const EdgeInsets.only(
                                        top: 0, right: 24, left: 24)
                                    : const EdgeInsets.only(
                                        top: 0, right: 6, left: 6),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                AnimatedSize(
                                  curve: Curves.ease,
                                  duration: const Duration(milliseconds: 300),
                                  child: SizedBox(
                                    width: _showAppbar ? 0 : null,
                                    child: Visibility(
                                      visible: _showAppbar ? false : true,
                                      child: Transform.scale(
                                        scale: 0.85,
                                        child: IconButton(
                                            style: const ButtonStyle(
                                                foregroundColor:
                                                    MaterialStatePropertyAll(
                                                        Colors.black54),
                                                backgroundColor:
                                                    MaterialStatePropertyAll(
                                                        Colors.white70)),
                                            onPressed: () => context.pop(),
                                            icon: const Icon(Icons.arrow_back)),
                                      ),
                                    ),
                                  ),
                                ),
                                PopupMenuButton(
                                    tooltip: '',
                                    key: _openTagsMenuKey,
                                    enabled: true,
                                    elevation: 4,
                                    offset: const Offset(0, 45),
                                    color: Colors.grey.shade50,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    onSelected: (value) =>
                                        _buttonTagsFocusNode.requestFocus(),
                                    onCanceled: () =>
                                        _buttonTagsFocusNode.requestFocus(),
                                    itemBuilder: (context) {
                                      return _listTags.map((PopupItem value) {
                                            return menuTags(value, checkedTags);
                                          }).toList() +
                                          [
                                            // Reset button
                                            PopupMenuItem(
                                                height: 0,
                                                enabled: false,
                                                child: Align(
                                                  alignment:
                                                      Alignment.centerRight,
                                                  child: TextButton(
                                                      onPressed: () {
                                                        setState(() {
                                                          List.filled(
                                                              checkedTags
                                                                  .length,
                                                              false,
                                                              growable: true);
                                                        });
                                                      },
                                                      child:
                                                          const Text('Reset')),
                                                ))
                                          ];
                                    },
                                    child: ElevatedButton.icon(
                                        style: ButtonStyle(
                                            padding: const MaterialStatePropertyAll(
                                                EdgeInsets.fromLTRB(
                                                    12, 16, 8, 16)),
                                            elevation:
                                                const MaterialStatePropertyAll(
                                                    0),
                                            side: MaterialStateProperty.resolveWith(
                                                (states) {
                                              if (states.contains(
                                                  MaterialState.focused)) {
                                                return const BorderSide(
                                                    color: Colors.blue,
                                                    width: 2);
                                              }
                                              return const BorderSide(
                                                  color: Colors.transparent,
                                                  width: 2);
                                            }),
                                            shape: MaterialStatePropertyAll(
                                                RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            25.7))),
                                            backgroundColor:
                                                const MaterialStatePropertyAll(
                                                    Colors.transparent)),
                                        onPressed: () {
                                          dynamic state =
                                              _openTagsMenuKey.currentState;
                                          state.showButtonMenu();
                                        },
                                        focusNode: _buttonTagsFocusNode,
                                        icon: const Icon(Icons.grid_view, color: Colors.black87, size: 18),
                                        label: Row(
                                          children: [
                                            Text('Any Categories',
                                                style: GoogleFonts.roboto(
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.black87)),
                                            const SizedBox(width: 10),
                                            const Icon(Icons.arrow_drop_down,
                                                color: Colors.black87),
                                          ],
                                        ))),
                                const SizedBox(width: 10),
                                AnimatedSwitcher(
                                    duration: const Duration(milliseconds: 200),
                                    child: useVerticalLayout2x
                                        ? ElevatedButton.icon(
                                            style: const ButtonStyle(
                                                backgroundColor:
                                                    MaterialStatePropertyAll(
                                                        Colors.white70),
                                                elevation:
                                                    MaterialStatePropertyAll(
                                                        0)),
                                            onPressed: () {
                                              _appBarKey.currentState?.setState(() {
                                                  isScrollingDown = false;
                                                  _showAppbar = true;
                                              });
                                              _searchBarFocusNode.requestFocus();
                                            },
                                            icon: _foundResource.isEmpty 
                                              ? _loading 
                                                ? const Padding(
                                                  padding: EdgeInsets.only(left: 4, right: 5),
                                                  child: SizedBox(
                                                    height: 12,
                                                    width: 12,
                                                    child: CircularProgressIndicator(strokeWidth: 2),
                                                  ),
                                                )
                                                : Icon(_showAppbar ? Icons.bar_chart : Icons.search)
                                              : Icon(_showAppbar ? Icons.bar_chart : Icons.search),
                                            label: Text(
                                              _foundResource.isEmpty
                                              ? _loading
                                                ? 'Loading'
                                                : resultCount(_foundResource.length)
                                              : resultCount(_foundResource.length),
                                              style: GoogleFonts.roboto(
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          )
                                        : null)
                              ],
                            ),
                            Row(
                              children: [
                                AnimatedSwitcher(
                                    duration: const Duration(milliseconds: 200),
                                    child: useVerticalLayout2x
                                        ? PopupMenuButton(
                                            tooltip: '',
                                            key: _openSortMenuKey,
                                            enabled: true,
                                            elevation: 4,
                                            offset: const Offset(0, 45),
                                            color: Colors.grey.shade50,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(12)),
                                            onSelected: (value) =>
                                                _buttonSortFocusNode
                                                    .requestFocus(),
                                            onCanceled: () =>
                                                _buttonSortFocusNode
                                                    .requestFocus(),
                                            itemBuilder: (context) {
                                              return _listSort
                                                  .map((PopupItem value) {
                                                return menuSort(value);
                                              }).toList();
                                            },
                                            child: ElevatedButton.icon(
                                                style: ButtonStyle(
                                                    padding:
                                                        const MaterialStatePropertyAll(
                                                            EdgeInsets.fromLTRB(
                                                                16, 16, 8, 16)),
                                                    elevation:
                                                        const MaterialStatePropertyAll(
                                                            0),
                                                    side: MaterialStateProperty.resolveWith(
                                                        (states) {
                                                      if (states.contains(
                                                          MaterialState
                                                              .focused)) {
                                                        return const BorderSide(
                                                            color: Colors.blue,
                                                            width: 2);
                                                      }
                                                      return const BorderSide(
                                                          color: Colors
                                                              .transparent,
                                                          width: 2);
                                                    }),
                                                    shape: MaterialStatePropertyAll(
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius.circular(
                                                                    25.7))),
                                                    backgroundColor: const MaterialStatePropertyAll(
                                                        Colors.transparent)),
                                                onPressed: () {
                                                  dynamic state =
                                                      _openSortMenuKey
                                                          .currentState;
                                                  state.showButtonMenu();
                                                },
                                                focusNode: _buttonSortFocusNode,
                                                icon: const Icon(Icons.sort,
                                                    color: Colors.black87,
                                                    size: 18),
                                                label: Row(
                                                  children: [
                                                    Text(
                                                        'Sort by: Most Popular',
                                                        style:
                                                            GoogleFonts.roboto(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                color: Colors
                                                                    .black87)),
                                                    const SizedBox(width: 10),
                                                    const Icon(
                                                        Icons.arrow_drop_down,
                                                        color: Colors.black87),
                                                  ],
                                                )),
                                          )
                                        : null),
                                const SizedBox(width: 10),
                                ToggleButtons(
                                  renderBorder: false,
                                  color: Colors.black54,
                                  fillColor: Colors.transparent,
                                  constraints: const BoxConstraints(
                                      minWidth: 32, minHeight: 32),
                                  borderRadius: BorderRadius.circular(4),
                                  onPressed: (int index) {
                                    _bodyStateKey.currentState?.setState(() {
                                     for (int buttonIndex = 0;
                                          buttonIndex < _layouts.length;
                                          buttonIndex++) {
                                        if (buttonIndex == index) {
                                          _layouts[buttonIndex] = true;
                                        } else {
                                          _layouts[buttonIndex] = false;
                                        }
                                      }                                     
                                    });
                                    _appBarKey.currentState?.setState(() {});
                                 },
                                  isSelected: _layouts,
                                  children: const <Widget>[
                                    Tooltip(
                                        message: 'Minimal Mode',
                                        child: Icon(Icons.web_asset)),
                                    Tooltip(
                                        message: 'Grid Mode',
                                        child:
                                            Icon(Icons.view_module_outlined)),
                                    Tooltip(
                                        message: 'List Mode',
                                        child: Icon(Icons.view_list_outlined)),
                                  ],
                                ),
                                const SizedBox(width: 10),
                                Visibility(
                                  visible: useVerticalLayout2x ? false : true,
                                  child: AnimatedSize(
                                    duration: const Duration(milliseconds: 300),
                                    child: AnimatedOpacity(
                                      duration: const Duration(milliseconds: 200),
                                      opacity: _showAppbar ? 0 : 1,
                                      child: SizedBox(
                                        width: _showAppbar ? 0 : null,
                                        child: IconButton(
                                          style: const ButtonStyle(visualDensity: VisualDensity.compact),
                                          onPressed: () {
                                            _appBarKey.currentState?.setState(() {
                                              isScrollingDown = false;
                                              _showAppbar = true;
                                            });
                                            _searchBarFocusNode.requestFocus();
                                          }, 
                                          icon: const Icon(Icons.search, color: Colors.black54)),
                                      ),
                                    )),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  child: AnimatedSwitcher(
                    switchInCurve: Curves.fastOutSlowIn,
                    duration: const Duration(milliseconds: 300),
                    transitionBuilder: (child, animation) {
                      const begin = Offset(0,
                          2); // maybe point 2 offset is out from given frame that probably cause the issue
                      const end = Offset.zero;
                      final tween =
                          Tween(begin: begin, end: end).animate(animation);
                      return SlideTransition(
                        position: tween,
                        child: child,
                      );
                    },
                    child: StatefulBuilder(
                      key: _bodyStateKey,
                      builder: (context, setState) => 
                      _foundResource.isNotEmpty
                          ? _layouts[0] || _layouts[1]
                              ? GridResource(
                                  layouts: _layouts,
                                  useVerticalLayout: useVerticalLayout,
                                  useVerticalLayout2x: useVerticalLayout2x,
                                  useVerticalLayout3x: useVerticalLayout3x,
                                  gridRowCount: gridRowCount,
                                  foundResource: _foundResource,
                                  scrollViewController: _scrollGridViewController,
                                )
                              : useVerticalLayout3x
                                  ? useVerticalLayout2x
                                      ? ListBigResource(
                                          foundResource: _foundResource,
                                          layouts: _layouts[0],
                                          useVerticalLayout: useVerticalLayout,
                                          hideDetailHorizontal:
                                              hideDetailHorizontal,
                                          scrollViewController:
                                              _scrollListViewController,
                                        )
                                      : ListBigResource(
                                          foundResource: _foundResource,
                                          layouts: _layouts[0],
                                          useVerticalLayout: useVerticalLayout,
                                          hideDetailHorizontal:
                                              hideDetailHorizontal,
                                          scrollViewController:
                                              _scrollListViewController,
                                        )
                                  : ListResource(foundResource: _foundResource)
                          : Padding(
                              padding: const EdgeInsets.all(20),
                              child: AnimatedCrossFade(
                                layoutBuilder: ((topChild, topChildKey,
                                    bottomChild, bottomChildKey) {
                                  return Stack(
                                    clipBehavior: Clip.none,
                                    alignment: Alignment.topCenter,
                                    children: [
                                      Positioned(
                                          key: bottomChildKey,
                                          child: bottomChild),
                                      Positioned(
                                          key: topChildKey, child: topChild)
                                    ],
                                  );
                                }),
                                crossFadeState: _loading
                                    ? CrossFadeState.showFirst
                                    : CrossFadeState.showSecond,
                                duration: const Duration(milliseconds: 200),
                                firstChild: Padding(
                                  padding: const EdgeInsets.only(top: 46),
                                  child: Transform.scale(
                                      scale: 2,
                                      child: const CircularProgressIndicator(
                                          strokeWidth: 2)),
                                ),
                                secondChild: Column(children: [
                                  const SizedBox(height: 12),
                                  Text(
                                    "No result found for '${_searchController.text.trim()}'",
                                    style: GoogleFonts.roboto(
                                      color: Colors.black54,
                                      fontSize: 24,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  SelectableText(randomEmoji,
                                      style: GoogleFonts.robotoMono(
                                          fontSize: 124,
                                          color: Colors.black54,
                                          letterSpacing: -10)),
                                  const SizedBox(height: 36),
                                  OutlinedButton(
                                      style: OutlinedButton.styleFrom(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 24, vertical: 15),
                                          side: const BorderSide(
                                              color: Colors.blue),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4))),
                                      onPressed: () {
                                        _searchController.clear();
                                        _runFilter(_searchController.text);
                                      },
                                      child: const Text(
                                          'Clear your search and try again'))
                                ]),
                              ),
                            ),
                    ),
                  ),
                ),
              ])),
        )),
      );
    });
  }
}
