import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:gimmic/src/view/grid.dart';
import 'package:gimmic/src/view/list.dart';
import 'package:gimmic/src/view/list_big.dart';
import 'package:google_fonts/google_fonts.dart';

class Resource extends StatefulWidget {
  const Resource({super.key});

  @override
  State<Resource> createState() => _ResourceState();
}

var _searchController = TextEditingController();

class _ResourceState extends State<Resource> {
  late ScrollController _scrollViewController;
  bool _showAppbar = true;
  bool isScrollingDown = false;

  // This holds a list of fiction users
  //// You can use data fetched from a database or a server as well
  final List<Map<String, dynamic>> _allResource = [
    //TODO: (quick fix demo) [index] might be unrelevant and removed in future release
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

  List<Map<String, dynamic>> _foundResource =
      []; // This list holds the data for the list view

  @override
  void initState() {
    super.initState();
    _foundResource = _allResource; // at the beginning, all users are shown
    _scrollViewController = ScrollController();
    _scrollViewController.addListener(() {
      if (_scrollViewController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (!isScrollingDown) {
          isScrollingDown = true;
          _showAppbar = false;
          setState(() {});
        }
      }

      if (_scrollViewController.position.userScrollDirection ==
          ScrollDirection.forward) {
        if (isScrollingDown) {
          isScrollingDown = false;
          _showAppbar = true;
          setState(() {});
        }
      }
    });
  }

  @override
  void dispose() {
    _scrollViewController.dispose();
    _scrollViewController.removeListener(() {});
    super.dispose();
  }

  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = _allResource;
    } else {
      final name = _allResource
          .where((name) =>
              name["name"].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();

      final subname = _allResource
          .where((subname) => subname["subname"]
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();

      results = name..addAll(subname);
      results = results.toSet().toList();
      // we use the toLowerCase() method to make it case-insensitive

    }

    // Refresh the UI
    setState(() {
      _foundResource = results;
    });
  }

  String sortbyValue = 'Name';
  String tagResults = 'All Categories';

  final List<bool> _layouts = [true, false];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      bool useVerticalLayout = constraints.maxWidth > 1000;
      bool useVerticalLayout2x = constraints.maxWidth > 620;
      bool useVerticalLayout3x = constraints.maxWidth > 460;
      bool hideDetailHorizontal = constraints.maxWidth > 550;

      int gridRowCount = 1;
      useVerticalLayout3x ? gridRowCount = 1 : null;
      useVerticalLayout2x ? gridRowCount = 2 : null;
      useVerticalLayout ? gridRowCount = 3 : null;

      return Scaffold(
          appBar: AppBar(
              automaticallyImplyLeading: true,
              centerTitle: false,
              backgroundColor: Colors.grey.shade200,
              surfaceTintColor: Colors.grey.shade200,
              toolbarHeight: useVerticalLayout
                  ? null
                  : _showAppbar
                      ? 70
                      : 0,
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
                            child: useVerticalLayout3x
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
              child: Column(children: [
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
                              top: 12, bottom: 12, left: 48, right: 48)
                          : const EdgeInsets.only(
                              top: 12, bottom: 12, left: 24, right: 24),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Flexible(
                            child: TextField(
                              onChanged: (value) => _runFilter(value),
                              controller: _searchController,
                              autofocus: true,
                              style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.w500),
                              decoration: InputDecoration(
                                isDense: false,
                                filled: true,
                                fillColor: Colors.white,
                                prefixIcon: const Icon(Icons.search),
                                prefixIconConstraints:
                                    const BoxConstraints(minWidth: 55),
                                suffixStyle: GoogleFonts.roboto(
                                  fontWeight: FontWeight.w500,
                                ),
                                suffixText: useVerticalLayout3x
                                    ? _searchController.text.isEmpty
                                        ? null
                                        : 'Found ${_foundResource.toList().length} Results'
                                    : null,
                                suffixIcon: _searchController.text.isEmpty
                                    ? null
                                    : IconButton(
                                        icon: const Icon(Icons.clear),
                                        onPressed: () {
                                          /* Clear the search field */
                                          _searchController.clear();
                                          _runFilter(_searchController.text);
                                        },
                                      ),
                                suffixIconConstraints: const BoxConstraints(
                                    minWidth: 50, minHeight: 50),
                                hintText: 'Search...',
                                hintStyle: GoogleFonts.roboto(
                                    fontWeight: FontWeight.w500),
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 0, horizontal: 0),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.blue, width: 2),
                                  borderRadius: BorderRadius.circular(25.7),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.transparent),
                                  borderRadius: BorderRadius.circular(25.7),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                AnimatedPadding(
                  curve: Curves.fastOutSlowIn,
                  duration: const Duration(milliseconds: 600),
                  padding: useVerticalLayout
                      ? _showAppbar
                          ? const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 48)
                          : const EdgeInsets.symmetric(
                              vertical: 0, horizontal: 48)
                      : _showAppbar
                          ? const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 24)
                          : useVerticalLayout3x
                              ? const EdgeInsets.only(
                                  top: 8, right: 24, left: 24)
                              : const EdgeInsets.symmetric(
                                  vertical: 12, horizontal: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            width: 175,
                            child: DropdownButtonFormField(
                              isDense: true,
                              decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.only(
                                      top: 8, bottom: 8, right: 4, left: 0),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.transparent, width: 2),
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.transparent, width: 2),
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  filled: false,
                                  fillColor: Colors.white,
                                  isDense: true,
                                  prefixIcon: const Icon(
                                    Icons.category_outlined,
                                    size: 20,
                                    color: Colors.black87,
                                  )),
                              style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: Colors.black87),
                              value: tagResults,
                              elevation: 1,
                              borderRadius: BorderRadius.circular(8),
                              onChanged: (String? newValue) {
                                setState(() {
                                  tagResults = newValue!;
                                });
                              },
                              items: <String>[
                                'All Categories',
                                'Animal',
                                'Sci-fi'
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                          const SizedBox(width: 10),
                          AnimatedSwitcher(
                              duration: const Duration(milliseconds: 200),
                              child: useVerticalLayout2x
                                  ? Text(
                                      'About ${_foundResource.toList().length} Results')
                                  : null)
                        ],
                      ),
                      Row(
                        children: [
                          AnimatedSwitcher(
                              duration: const Duration(milliseconds: 200),
                              child: useVerticalLayout3x
                                  ? AnimatedSize(
                                      curve: Curves.ease,
                                      duration:
                                          const Duration(milliseconds: 600),
                                      child: SizedBox(
                                        width: useVerticalLayout2x ? 145 : 100,
                                        child: DropdownButtonFormField(
                                          isDense: true,
                                          elevation: 1,
                                          decoration: InputDecoration(
                                              contentPadding:
                                                  const EdgeInsets.only(
                                                      top: 8,
                                                      bottom: 8,
                                                      right: 4,
                                                      left: 12),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                    color: Colors.transparent,
                                                    width: 2),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              border: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                    color: Colors.transparent,
                                                    width: 2),
                                                borderRadius:
                                                    BorderRadius.circular(6),
                                              ),
                                              filled: false,
                                              fillColor: Colors.white,
                                              isDense: true,
                                              labelText: useVerticalLayout3x
                                                  ? null
                                                  : 'Sort By',
                                              labelStyle: GoogleFonts.roboto(
                                                fontWeight: FontWeight.w500,
                                              ),
                                              prefixText: useVerticalLayout2x
                                                  ? 'Sort By: '
                                                  : null,
                                              prefixStyle: GoogleFonts.roboto(
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.grey.shade600)),
                                          style: GoogleFonts.roboto(
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black87),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          dropdownColor: Colors.white,
                                          value: sortbyValue,
                                          onChanged: (String? newValue) {
                                            setState(() {
                                              sortbyValue = newValue!;
                                            });
                                          },
                                          items: <String>[
                                            'Name',
                                            'Upload',
                                            'Size'
                                          ].map<DropdownMenuItem<String>>(
                                              (String value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: Text(value),
                                            );
                                          }).toList(),
                                        ),
                                      ),
                                    )
                                  : null),
                          const SizedBox(width: 10),
                          ToggleButtons(
                            color: Colors.black54,
                            fillColor: Colors.transparent,
                            constraints: const BoxConstraints(
                                minWidth: 32, minHeight: 32),
                            borderRadius: BorderRadius.circular(4),
                            onPressed: (int index) {
                              setState(() {
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
                            },
                            isSelected: _layouts,
                            children: const <Widget>[
                              Tooltip(
                                  message: 'Grid Mode',
                                  child: Icon(Icons.view_module_outlined)),
                              Tooltip(
                                  message: 'List Mode',
                                  child: Icon(Icons.view_list_outlined)),
                            ],
                          ),
                          const SizedBox(width: 10),
                        ],
                      ),
                    ],
                  ),
                ),
                Visibility(
                  visible: _showAppbar ? true : false,
                  child: AnimatedPadding(
                    curve: Curves.fastOutSlowIn,
                    duration: const Duration(milliseconds: 600),
                    padding: useVerticalLayout
                        ? const EdgeInsets.only(left: 48, right: 48, bottom: 12)
                        : const EdgeInsets.only(left: 24, right: 24, bottom: 6),
                    child: const Divider(
                      color: Colors.black,
                      thickness: 0.1,
                      indent: 0,
                      endIndent: 0,
                    ),
                  ),
                ),
                AnimatedContainer(
                  height: useVerticalLayout2x ? 0 : 42,
                  curve: Curves.ease,
                  duration: const Duration(milliseconds: 400),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('About ${_foundResource.toList().length} Results',
                            style: GoogleFonts.roboto(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            )),
                        AnimatedSwitcher(
                          duration: const Duration(milliseconds: 400),
                          child: useVerticalLayout3x
                              ? null
                              : SizedBox(
                                  width: useVerticalLayout3x ? 145 : 100,
                                  child: DropdownButtonFormField(
                                    isDense: true,
                                    elevation: 1,
                                    decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.only(
                                            top: 8,
                                            bottom: 8,
                                            right: 4,
                                            left: 12),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Colors.transparent,
                                              width: 2),
                                          borderRadius:
                                              BorderRadius.circular(6),
                                        ),
                                        border: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Colors.transparent,
                                              width: 2),
                                          borderRadius:
                                              BorderRadius.circular(6),
                                        ),
                                        filled: false,
                                        fillColor: Colors.white,
                                        isDense: true,
                                        labelText: useVerticalLayout3x
                                            ? null
                                            : 'Sort By',
                                        labelStyle: GoogleFonts.roboto(
                                          fontWeight: FontWeight.w500,
                                        ),
                                        prefixText: useVerticalLayout3x
                                            ? 'Sort By: '
                                            : null,
                                        prefixStyle: GoogleFonts.roboto(
                                            fontWeight: FontWeight.w500,
                                            color: Colors.grey.shade600)),
                                    style: GoogleFonts.roboto(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black87),
                                    borderRadius: BorderRadius.circular(8),
                                    dropdownColor: Colors.white,
                                    value: sortbyValue,
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        sortbyValue = newValue!;
                                      });
                                    },
                                    items: <String>['Name', 'Upload', 'Size']
                                        .map<DropdownMenuItem<String>>(
                                            (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                  ),
                                ),
                        ),
                      ],
                    ),
                  ),
                ),
                _foundResource.isNotEmpty
                    ? _layouts[0]
                        ? GridResource(
                            useVerticalLayout: useVerticalLayout,
                            useVerticalLayout2x: useVerticalLayout2x,
                            useVerticalLayout3x: useVerticalLayout3x,
                            gridRowCount: gridRowCount,
                            foundResource: _foundResource,
                            scrollViewController: _scrollViewController,
                          )
                        : useVerticalLayout3x
                            ? useVerticalLayout2x
                                ? ListBigResource(
                                    foundResource: _foundResource,
                                    layouts: _layouts[0],
                                    useVerticalLayout: useVerticalLayout,
                                    hideDetailHorizontal: hideDetailHorizontal,
                                    scrollViewController: _scrollViewController,
                                  )
                                : ListBigResource(
                                    foundResource: _foundResource,
                                    layouts: _layouts[0],
                                    useVerticalLayout: useVerticalLayout,
                                    hideDetailHorizontal: hideDetailHorizontal,
                                    scrollViewController: _scrollViewController,
                                  )
                            : ListResource(foundResource: _foundResource)
                    : Padding(
                        padding: const EdgeInsets.all(20),
                        child:
                            Column(mainAxisSize: MainAxisSize.min, children: [
                          Text(
                            'No results found',
                            style: GoogleFonts.roboto(
                              color: Colors.black87,
                              fontSize: 24,
                              fontWeight: FontWeight.w300,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 10),
                          const Icon(
                            Icons.sentiment_very_dissatisfied,
                            size: 48,
                            color: Colors.black54,
                          )
                        ]),
                      ),
              ])));
    });
  }
}
