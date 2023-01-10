import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:gimmic/assets/label.dart';
import 'package:gimmic/src/view/grid.dart';
import 'package:gimmic/src/view/list.dart';
import 'package:gimmic/src/view/list_big.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../assets/functions/colors.dart';
import '../../assets/functions/platform.dart';
import '../../assets/functions/resource.dart';
import '../../assets/widgets/appbar.dart';
import '../../assets/widgets/menu.dart';
import '../../assets/widgets/shimmer.dart';

class PopupItem {
  int index;
  String name;
  IconData icon;
  PopupItem(this.index, this.name, this.icon);
}

/// Local Variables
List<Map<String, dynamic>> _foundResource = []; // This list holds the data for the list view
final List<bool> _layouts = [false, true, false];
late bool _useVerticalLayout;
late bool _useVerticalLayout2x;
late bool _useVerticalLayout3x;
late bool _hideDetailHorizontal;
late bool parallax;
int gridRowCount = 1;
late ScrollController _scrollGridViewController;
late ScrollController _scrollListViewController;
bool _loading = true;
final FocusNode _searchBarFocusNode = FocusNode();

class Resource extends StatefulWidget {
  const Resource({Key? key, this.arguments}) : super(key: key);
  final String? arguments;

  @override
  State<Resource> createState() => _ResourceState();
}

TextEditingController _searchController = TextEditingController();

class _ResourceState extends State<Resource> {
  bool _showAppbar = true;
  bool isScrollingDown = false;
  bool initated = false;
  bool _showBackToTopButton = false;

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();
  final GlobalKey<State<StatefulWidget>> _appBarKey = GlobalKey<State<StatefulWidget>>();
  final GlobalKey<State<StatefulWidget>> _bodyStateKey = GlobalKey<State<StatefulWidget>>();
  final GlobalKey<State<StatefulWidget>> _floatingButtonKey = GlobalKey<State<StatefulWidget>>();

  final GlobalKey<PopupMenuButtonState> _openTagsMenuKey = GlobalKey();
  final GlobalKey<PopupMenuButtonState> _openSortMenuKey = GlobalKey();

  final FocusNode _buttonTagsFocusNode = FocusNode();
  final FocusNode _buttonSortFocusNode = FocusNode();

  late Future _loadItems;
  late AsyncSnapshot snapshots;
  /// This holds a list of fiction users
  /// You can use data fetched from a database or a server as well

  List<Map<String, dynamic>> json = [];
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
    isWebMobile ? parallax = false : parallax = true;
    super.initState();
    _loadItems = loadItems().then((value) async {
      json = value;
      // print('load items runs: $json');
      if (widget.arguments == null && _searchController.text.trim().isEmpty) {
        _runFilter(""); // at the beginning, all users are shown
      } else {
          if (widget.arguments != null) {
            _searchController.text = widget.arguments!;
            _runFilter(widget.arguments!);
          } else {
            _runFilter(_searchController.text);
          }
      }
    });


    final random = Random();
    randomEmoji = StringResource.emoji[random.nextInt(StringResource.emoji.length)];
    Timer.periodic(const Duration(seconds: 45), (Timer timer) {
      final random = Random();
      randomEmoji = StringResource.emoji[random.nextInt(StringResource.emoji.length)];
    });

    initated = true;

    // GridView Controller
    _scrollGridViewController = ScrollController();
    _scrollGridViewController.addListener(() {
      if (_scrollGridViewController.offset >= 200 && !_showBackToTopButton) {
        _floatingButtonKey.currentState?.setState(() { 
          _showBackToTopButton = true; 
        });
      } else if (_scrollGridViewController.offset < 200 && _showBackToTopButton) {
        _floatingButtonKey.currentState?.setState(() { 
          _showBackToTopButton = false; 
        });
      }

      if (_scrollGridViewController.offset == 0 && !_showAppbar) {
        _appBarKey.currentState?.setState(() {
          isScrollingDown = false;
          _showAppbar = true;
        });
      }

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

    // ListView Controller
    _scrollListViewController = ScrollController();
    _scrollListViewController.addListener(() {
      if (_scrollListViewController.offset >= 200 && !_showBackToTopButton) {
        _floatingButtonKey.currentState?.setState(() { 
          _showBackToTopButton = true; 
        });
        } else if (_scrollListViewController.offset < 200 && _showBackToTopButton) {
        _floatingButtonKey.currentState?.setState(() { 
          _showBackToTopButton = false; 
        });
      }

      if (_scrollListViewController.offset == 0 && !_showAppbar) {
        _appBarKey.currentState?.setState(() {
          isScrollingDown = false;
          _showAppbar = true;
        });     
      } 

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
    
    // SearchBar FocusNode
    _searchBarFocusNode.addListener(() { 
      if (_searchBarFocusNode.hasFocus && _useVerticalLayout3x) {
        _appBarKey.currentState?.setState(() {});
      }
      else if(_useVerticalLayout3x) {
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
    // List<Map<String, dynamic>> json = snapshots.data as List<Map<String, dynamic>>;
    setState(() {
      _loading = true;
    });
    if (enteredKeyword.trim().isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      // results = _allResource;
      results = json;
    } else {
     final name = json.where((element) => element["name"]
              .toLowerCase()
              .contains(enteredKeyword.trim().toLowerCase()))
          .toList();

      final subname = json.where((element) => element["brand"]
              .toLowerCase()
              .contains(enteredKeyword.trim().toLowerCase()))
          .toList();

      results = name..addAll(subname);
      results = results.toSet().toList();
      // we use the toLowerCase() method to make it case-insensitive

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

  String randomEmoji = '';
  String sortbyValue = 'Most Updated';

  final List<PopupItem> _listTags = [
    PopupItem(0, "Any Categories", Icons.view_in_ar_outlined),
    PopupItem(1, "Animal", Icons.cruelty_free),
    PopupItem(2, "Sci-fi", Icons.smart_toy_outlined),
  ];

  final List<PopupItem> _listSort = [
    PopupItem(0, "Most Popular", Icons.leaderboard),
    PopupItem(1, "Newest", Icons.new_releases),
    PopupItem(2, "Name", Icons.sort_by_alpha),
    PopupItem(3, "Size", Icons.signal_cellular_alt),
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      _useVerticalLayout = constraints.maxWidth > 1000;
      _useVerticalLayout2x = constraints.maxWidth > 620;
      _useVerticalLayout3x = constraints.maxWidth > 460;
      _hideDetailHorizontal = constraints.maxWidth > 550;

      _useVerticalLayout3x ? gridRowCount = 1 : null;
      _useVerticalLayout2x ? gridRowCount = 2 : null;
      _useVerticalLayout ? gridRowCount = 3 : null;

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
          child: Scaffold(
            floatingActionButton: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: StatefulBuilder(
              key: _floatingButtonKey,
              builder: (context, setState) =>
                AnimatedSlide(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.fastOutSlowIn,
                  offset: _showBackToTopButton ? Offset.zero : const Offset(0, 1.5),
                  child: FloatingActionButton(
                    mini: true,
                    tooltip: 'Go back to Top',
                    onPressed: () {
                      Future.delayed(const Duration(milliseconds: 200)).whenComplete(() {
                        _appBarKey.currentState?.setState(() {
                        isScrollingDown = false;
                        _showAppbar = true;                      
                        });
                      });     

                      if (_layouts[0] || _layouts[1]) {
                        _scrollGridViewController.animateTo(0, duration: const Duration(milliseconds: 800), curve: Curves.ease);
                      } else {
                        _scrollListViewController.animateTo(0, duration: const Duration(milliseconds: 800), curve: Curves.ease);
                      }
                    },
                    child: const Icon(Icons.arrow_upward)),
                ),
              )
          ),
            body: Container(
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
                              padding: _useVerticalLayout
                                  ? const EdgeInsets.only(
                                      top: 24, bottom: 8, left: 20, right: 20)
                                  : const EdgeInsets.only(
                                      top: 24, bottom: 8, left: 24, right: 24),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    tooltip: 'Click to Go Back',
                                    style: ButtonStyle(
                                      foregroundColor: const MaterialStatePropertyAll(Colors.black54),
                                      backgroundColor: MaterialStateProperty.resolveWith((states) {
                                        return states.contains(MaterialState.hovered)
                                          ? Colors.deepPurple.withOpacity(0.015)
                                          : Colors.white;
                                      })
                                    ),
                                    onPressed: () => context.pop(),
                                    icon: const Icon(Icons.arrow_back)
                                  ),
                                  const SizedBox(width: 8),
                                  _useVerticalLayout
                                    ? IconButton(
                                      tooltip: 'Open the Home Page',
                                      style: ButtonStyle(
                                        foregroundColor: const MaterialStatePropertyAll(Colors.black54),
                                        backgroundColor: MaterialStateProperty.resolveWith((states) {
                                          return states.contains(MaterialState.hovered)
                                            ? Colors.deepPurple.withOpacity(0.015)
                                            : Colors.white;
                                        })
                                      ),
                                      onPressed: () => context.go('/'),
                                      icon: const Icon(Icons.home)
                                    ) 
                                    : const SizedBox(),
                                  SizedBox(width: _useVerticalLayout ? 100 : 12),
                                  Flexible(
                                    child: Material(
                                      elevation: 2,
                                      shadowColor: Colors.black38,
                                      borderRadius: _searchBarFocusNode.hasFocus 
                                        ? BorderRadius.circular(12) 
                                        : BorderRadius.circular(25.7),
                                      child: TextField(
                                        onChanged: (value) => _runFilter(value),
                                        focusNode: _searchBarFocusNode,
                                        controller: _searchController,
                                        autofocus: false,
                                        style: const TextStyle(fontWeight: FontWeight.w600),
                                        decoration: InputDecoration(
                                          isDense: false,
                                          filled: true,
                                          fillColor: Colors.white70,
                                          hoverColor: Colors.white,
                                          prefixIcon: Icon(
                                            Icons.search, 
                                            color: _searchBarFocusNode.hasFocus 
                                              ? Colors.deepPurple.shade600
                                              : Colors.black54
                                          ),
                                          prefixIconConstraints: const BoxConstraints(minWidth: 55),
                                          suffixIcon: _searchController.text.isEmpty
                                            ? Visibility(
                                                visible: _useVerticalLayout2x ? false : true,
                                                child: PopupMenuButton(
                                                  tooltip: '',
                                                  key: _openSortMenuKey,
                                                  enabled: true,
                                                  elevation: 4,
                                                  offset: const Offset(0, 45),
                                                  color: Colors.grey.shade50,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(12)
                                                  ),
                                                  onSelected: (value) => _buttonSortFocusNode.requestFocus(),
                                                  onCanceled: () => _buttonSortFocusNode.requestFocus(),
                                                  itemBuilder: (context) {
                                                    return _listSort.map((PopupItem value) {
                                                      return menuSort(value);
                                                    }).toList();
                                                  },
                                                  child: IconButton(
                                                      onPressed: () {
                                                        dynamic state = _openSortMenuKey.currentState;
                                                        state.showButtonMenu();
                                                      },
                                                      icon: const Icon(Icons.sort, color: Colors.black54)),
                                                ),
                                              )
                                            : Row(
                                              mainAxisAlignment: MainAxisAlignment.end,
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Visibility(
                                                  visible: _useVerticalLayout2x ? false : true,
                                                  child: Padding(
                                                    padding: const EdgeInsets.only(right: 8),
                                                    child: Chip(
                                                      visualDensity: const VisualDensity(vertical: -4, horizontal: -4),
                                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.7)),
                                                      side: BorderSide.none,
                                                      backgroundColor: Colors.blue.shade50,
                                                      deleteIcon: _foundResource.isEmpty 
                                                      ? _loading
                                                        ? const SizedBox(
                                                            height: 12,
                                                            width: 12,
                                                            child: CircularProgressIndicator(strokeWidth: 2, color: Colors.blue),
                                                          )
                                                        : Icon(Icons.close, color: Colors.blue.shade700, size: 16)
                                                      : Icon(Icons.close, color: Colors.blue.shade700, size: 16),
                                                      onDeleted: () {
                                                          _searchController.clear();
                                                        _runFilter(_searchController.text);                                                     
                                                      },
                                                  label: Text(_foundResource.isEmpty 
                                                    ? _loading 
                                                      ? 'Please Wait' 
                                                      : resultCount(_foundResource.length)
                                                    : resultCount(_foundResource.length), 
                                                          style: TextStyle(
                                                              color: Colors.blue.shade700, 
                                                              fontSize: 12, 
                                                              fontWeight: FontWeight.w600)),
                                                    ),
                                                  ),
                                                ),
                                                Visibility(
                                                  visible: _useVerticalLayout2x ? true : false,
                                                  child: Padding(
                                                    padding: const EdgeInsets.only(right: 4),
                                                    child: IconButton(
                                                      visualDensity: VisualDensity.compact,
                                                      icon: const Icon(Icons.clear, color: Colors.black54),
                                                      onPressed: () {
                                                        GoRouter.of(context).replace('/resource');
                                                        _searchController.clear();
                                                        _runFilter(_searchController.text);
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ]
                                            ),
                                          suffixIconConstraints: const BoxConstraints(minWidth: 50, minHeight: 50),
                                          hintText: _searchBarFocusNode.hasFocus ? null : 'Search...',
                                          hintStyle: TextStyle(fontWeight: FontWeight.w600, height: isWebMobile ? 2.55 : null),
                                          contentPadding: isWebMobile 
                                            ? const EdgeInsets.fromLTRB(0, 0, 0, 0)
                                            : const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(color: Colors.transparent),
                                            borderRadius: BorderRadius.circular(25.7),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(width: 2, color: Colors.deepPurple),
                                            borderRadius: BorderRadius.circular(12)
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: _useVerticalLayout ? 80 : 0),
                                  AnimatedSize(
                                    curve: Curves.ease,
                                    duration: const Duration(milliseconds: 300),
                                    child: SizedBox(
                                      width: _useVerticalLayout 
                                        ? null 
                                        : _searchBarFocusNode.hasFocus ? 0 : null,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          const SizedBox(width: 8),
                                          appbarSetting(_useVerticalLayout2x)
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const AnimatedSize(
                          duration: Duration(milliseconds: 300),
                          child: SizedBox(height: 4)),
                        AnimatedPadding(
                          curve: Curves.fastOutSlowIn,
                          duration: const Duration(milliseconds: 600),
                          padding: _useVerticalLayout
                            ? _showAppbar
                                ? EdgeInsets.symmetric(
                                    vertical: _useVerticalLayout ? 0 : 8, horizontal: 48)
                                : const EdgeInsets.symmetric(
                                    vertical: 0, horizontal: 12)
                            : _useVerticalLayout2x
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
                                                  foregroundColor: MaterialStatePropertyAll(Colors.black54),
                                                  backgroundColor: MaterialStatePropertyAll(Colors.white70)),
                                              onPressed: () => context.pop(),
                                              icon: const Icon(Icons.arrow_back)),
                                        ),
                                      ),
                                    ),
                                  ),
                                  AnimatedSize(
                                      duration: const Duration(milliseconds: 300),
                                      child: SizedBox(width: _showAppbar ? 0 : 4)),
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
                                      onSelected: (value) => _buttonTagsFocusNode.requestFocus(),
                                      onCanceled: () => _buttonTagsFocusNode.requestFocus(),
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
                                                    alignment: Alignment.centerRight,
                                                    child: TextButton(
                                                      onPressed: () {
                                                        setState(() {
                                                          List.filled(checkedTags.length, false, growable: true);
                                                        });
                                                      },
                                                      child: const Text('Reset')),
                                                ))
                                            ];
                                      },
                                      child: ElevatedButton.icon(
                                          style: ButtonStyle(
                                              padding: const MaterialStatePropertyAll(
                                                EdgeInsets.fromLTRB(12, 0, 4, 0)),
                                              elevation: const MaterialStatePropertyAll(0),
                                              side: const MaterialStatePropertyAll(BorderSide.none), 
                                              shape: MaterialStatePropertyAll(
                                                RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(25.7))),
                                              backgroundColor: MaterialStateProperty.resolveWith((states) {
                                                if (states.contains(MaterialState.focused)) {
                                                  return Colors.deepPurple.withOpacity(0.005);
                                                }
                                                return Colors.transparent;
                                              }),
                                          ),
                                          onPressed: () {
                                            dynamic state =
                                                _openTagsMenuKey.currentState;
                                            state.showButtonMenu();
                                          },
                                          focusNode: _buttonTagsFocusNode,
                                          icon: const Icon(Icons.view_in_ar_outlined, color: Colors.black87, size: 18),
                                          label: Row(
                                            children: [
                                              Text('Any Categories',
                                                  style: GoogleFonts.roboto(
                                                      fontWeight: FontWeight.w500,
                                                      color: Colors.black87)),
                                              const SizedBox(width: 8),
                                              const Icon(Icons.arrow_drop_down,
                                                  color: Colors.black87),
                                            ],
                                          ))),
                                  const SizedBox(width: 8),
                                  AnimatedSwitcher(
                                      duration: const Duration(milliseconds: 200),
                                      child: _useVerticalLayout2x
                                          ? ElevatedButton.icon(
                                              style: const ButtonStyle(
                                                  backgroundColor: MaterialStatePropertyAll(Colors.transparent),
                                                  elevation: MaterialStatePropertyAll(0)),
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
                                                      child: CircularProgressIndicator(
                                                        strokeWidth: 2, color: Colors.deepPurple),
                                                    ),
                                                  )
                                                  : _showAppbar 
                                                    ? const Icon(Icons.bar_chart, color: Colors.deepPurple)
                                                    : const Icon(Icons.search, color: Colors.deepPurple, size: 18)
                                                : _showAppbar 
                                                    ? const Icon(Icons.bar_chart, color: Colors.deepPurple)
                                                    : const Icon(Icons.search, color: Colors.deepPurple, size: 18),
                                              label: Text(
                                                _foundResource.isEmpty
                                                ? _loading
                                                  ? 'Please Wait'
                                                  : resultCount(_foundResource.length)
                                                : resultCount(_foundResource.length),
                                                style: const TextStyle(
                                                  color: Colors.deepPurple,
                                                  fontWeight: FontWeight.w600
                                                ),
                                              ),
                                            )
                                          : null)
                                ],
                              ),
                              Row(
                                children: [
                                  AnimatedSwitcher(
                                      duration: const Duration(milliseconds: 200),
                                      child: _useVerticalLayout2x
                                          ? PopupMenuButton(
                                              tooltip: '',
                                              key: _openSortMenuKey,
                                              enabled: true,
                                              elevation: 4,
                                              offset: const Offset(0, 45),
                                              color: Colors.grey.shade50,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(12)),
                                              onSelected: (value) => _buttonSortFocusNode.requestFocus(),
                                              onCanceled: () => _buttonSortFocusNode.requestFocus(),
                                              itemBuilder: (context) {
                                                return _listSort.map((PopupItem value) {
                                                  return menuSort(value);
                                                }).toList();
                                              },
                                              child: ElevatedButton.icon(
                                                  style: ButtonStyle(
                                                      padding: const MaterialStatePropertyAll(
                                                        EdgeInsets.fromLTRB(12, 0, 4, 0)),
                                                      elevation: const MaterialStatePropertyAll(0),
                                                      side: const MaterialStatePropertyAll(BorderSide.none), 
                                                      shape: MaterialStatePropertyAll(
                                                        RoundedRectangleBorder(
                                                          borderRadius: BorderRadius.circular(25.7))),
                                                      backgroundColor: MaterialStateProperty.resolveWith((states) {
                                                        if (states.contains(MaterialState.focused)) {
                                                          return Colors.deepPurple.withOpacity(0.005);
                                                        }
                                                        return Colors.transparent;
                                                      }),
                                                  ),
                                                  onPressed: () {
                                                    dynamic state = _openSortMenuKey.currentState;
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
                                                        style: GoogleFonts.roboto(
                                                          fontWeight: FontWeight.w500,
                                                          color: Colors.black87)
                                                      ),
                                                      const SizedBox(width: 6),
                                                      const Icon(
                                                          Icons.arrow_drop_down,
                                                          color: Colors.black87
                                                      ),
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
                                          child: Icon(Icons.view_module_outlined)),
                                      Tooltip(
                                          message: 'List Mode',
                                          child: Icon(Icons.view_list_outlined)),
                                    ],
                                  ),
                                  SizedBox(width: !isWebMobile ? 4 : null),
                                  !isWebMobile 
                                  ? IconButton(
                                      tooltip: parallax 
                                        ? "Disable Parallax Mode" 
                                        : "Enable Parallax Mode",
                                      onPressed: () {
                                        setState(() {
                                          parallax ? parallax = false : parallax = true;
                                        });
                                        _bodyStateKey.currentState?.setState(() {});
                                      },
                                      icon: Icon(
                                        parallax 
                                          ? Icons.style_outlined
                                          : Icons.burst_mode_outlined,
                                        color: parallax 
                                          ? Colors.deepPurple
                                          : Colors.black54))
                                  : const SizedBox(),
                                  const SizedBox(width: 10),
                                  Visibility(
                                    visible: _useVerticalLayout2x ? false : true,
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
                    child: StatefulBuilder(
                      key: _bodyStateKey,
                      builder: (context, setState) => 
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 700),
                        transitionBuilder: (child, animation) {
                          const begin = Offset(0, 1.5);
                          const end = Offset.zero;
                          final tween = Tween(begin: begin, end: end).animate(
                            CurvedAnimation(
                              parent: animation,
                              curve: const Interval(0, 1, curve: Curves.fastOutSlowIn)
                            )
                          );
                          return SlideTransition(
                            position: tween,
                            child: child,
                          );
                        },
                       child: FutureBuilder(
                         future: _loadItems,
                         builder: (context, AsyncSnapshot snapshot) {
                           return ShimmerLoading(
                             duration: const Duration(seconds: 3),
                             isLoading: snapshot.connectionState == ConnectionState.waiting,
                             builder: _layouts[0] || _layouts[1] 
                               ? ShimmerResourceGrid(
                                   useVerticalLayout: _useVerticalLayout,
                                   layouts: _layouts,
                                   isWebMobile: isWebMobile,
                                   gridRowCount: gridRowCount,
                                 )
                               : ShimmerResourceList(
                                   useVerticalLayout: _useVerticalLayout, 
                                   hideDetailHorizontal: _hideDetailHorizontal, 
                                   layouts: _layouts
                                 ),
                             border: BorderRadius.circular(12),
                             child: _foundResource.isNotEmpty
                               ? _layouts[0] || _layouts[1]
                                 ? GridResource(
                                     layouts: _layouts,
                                     useVerticalLayout: _useVerticalLayout,
                                     useVerticalLayout2x: _useVerticalLayout2x,
                                     useVerticalLayout3x: _useVerticalLayout3x,
                                     parallax: parallax,
                                     gridRowCount: gridRowCount,
                                     foundResource: _foundResource,
                                     scrollViewController: _scrollGridViewController,
                                   )
                                 : _useVerticalLayout3x
                                     ? _useVerticalLayout2x
                                         ? ListBigResource(
                                             foundResource: _foundResource,
                                             layouts: _layouts[0],
                                             useVerticalLayout: _useVerticalLayout,
                                             hideDetailHorizontal: _hideDetailHorizontal,
                                             scrollViewController:_scrollListViewController,
                                           )
                                         : ListBigResource(
                                             foundResource: _foundResource,
                                             layouts: _layouts[0],
                                             useVerticalLayout: _useVerticalLayout,
                                             hideDetailHorizontal: _hideDetailHorizontal,
                                             scrollViewController: _scrollListViewController,
                                           )
                                     : ListResource(foundResource: _foundResource)
                              : Padding(
                                 padding: const EdgeInsets.all(20),
                                 child: AnimatedCrossFade(
                                   layoutBuilder: ((topChild, topChildKey, bottomChild, bottomChildKey) {
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
                                     const SizedBox(height: 20),
                                     Text(
                                       "No result found for '${_searchController.text.trim()}'",
                                       style: const TextStyle(
                                         color: Colors.black54,
                                         fontSize: 24,
                                         fontWeight: FontWeight.w400,
                                       ),
                                       textAlign: TextAlign.center,
                                     ),
                                     SelectableText(randomEmoji,
                                       style: TextStyle(
                                           fontSize: _useVerticalLayout2x ? 124 : 100,
                                           color: Colors.black54,
                                           letterSpacing: 10)),
                                     const SizedBox(height: 36),
                                     OutlinedButton(
                                         style: OutlinedButton.styleFrom(
                                             padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 15),
                                             side: const BorderSide(color: Colors.deepPurple),
                                             shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(4))),
                                         onPressed: () {
                                           _searchController.clear();
                                           _runFilter(_searchController.text);
                                           _searchBarFocusNode.requestFocus();
                                         },
                                         child: const Text(
                                           'Clear your search and try again',
                                           style: TextStyle(fontWeight: FontWeight.w600)
                                         )
                                     )
                                   ]),
                                 ),
                              ),
                           );
                         }
                       )
                      ),
                    ),
                  ),
                ])),
          ),
        )),
      );
    });
  }
}
