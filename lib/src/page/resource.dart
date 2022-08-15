import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:gimmic/src/view/grid.dart';
import 'package:gimmic/src/view/list.dart';
import 'package:gimmic/src/view/list_big.dart';
=======
import 'package:flutter/rendering.dart';
import 'package:gimmic/src/view/grid.dart';
import 'package:gimmic/src/view/list.dart';
import 'package:gimmic/src/view/list_big.dart';
import 'package:google_fonts/google_fonts.dart';
>>>>>>> dev

class Resource extends StatefulWidget {
  const Resource({super.key});

  @override
  State<Resource> createState() => _ResourceState();
}

<<<<<<< HEAD
bool gridLayout = false;

class _ResourceState extends State<Resource> {
=======
var _searchController = TextEditingController();

class _ResourceState extends State<Resource> {
  late ScrollController _scrollViewController;
  bool _showAppbar = true;
  bool isScrollingDown = false;

  // This holds a list of fiction users
  //// You can use data fetched from a database or a server as well
  final List<Map<String, dynamic>> _allResource = [
    {"id": 1, "name": "Andy", "subname": "Legends of Zelda", "size": "29.0 MB"},
    {
      "id": 2,
      "name": "Aragon Malay",
      "subname": "Cross Code",
      "size": "40.2 MB"
    },
    {"id": 3, "name": "Cross", "subname": "Cross Code", "size": "5.5 MB"},
    {"id": 4, "name": "Barbara", "subname": "Zenity", "size": "35.2 MB"},
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

>>>>>>> dev
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      bool useVerticalLayout = constraints.maxWidth > 1000;
      bool useVerticalLayout2x = constraints.maxWidth > 620;
<<<<<<< HEAD
      bool useVerticalLayout3x = constraints.maxWidth > 440;
=======
      bool useVerticalLayout3x = constraints.maxWidth > 460;
      bool hideDetailHorizontal = constraints.maxWidth > 550;
>>>>>>> dev

      int gridRowCount = 1;
      useVerticalLayout3x == true ? gridRowCount = 1 : null;
      useVerticalLayout2x == true ? gridRowCount = 2 : null;
      useVerticalLayout == true ? gridRowCount = 3 : null;

      return Scaffold(
          appBar: AppBar(
              automaticallyImplyLeading: true,
              centerTitle: false,
              backgroundColor: Colors.grey.shade200,
              surfaceTintColor: Colors.grey.shade200,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
<<<<<<< HEAD
                children: <Widget>[
                  const Text('Resource'),
                  Visibility(
                    visible: useVerticalLayout ? true : false,
=======
                children: [
                  const Text('Resource'),
                  // TODO: need improvement for this search bar
                  // undecorated search box - currently hidden.
                  Visibility(
                    visible: useVerticalLayout ? false : false,
>>>>>>> dev
                    child: Flexible(
                      child: Padding(
                        padding: useVerticalLayout
                            ? const EdgeInsets.only(
                                top: 5.0, left: 150.0, right: 150.0)
                            : const EdgeInsets.only(
                                top: 5.0, left: 75.0, right: 75.0),
                        child: TextField(
<<<<<<< HEAD
=======
                          onChanged: (value) => _runFilter(value),
>>>>>>> dev
                          decoration: InputDecoration(
                            isDense: true,
                            filled: true,
                            fillColor: Colors.white,
                            prefixIcon: const Icon(Icons.search),
                            prefixIconConstraints:
                                const BoxConstraints(minWidth: 55.0),
                            suffixIcon: IconButton(
                              icon: const Icon(Icons.clear),
                              onPressed: () {
                                /* Clear the search field */
                              },
                            ),
                            suffixIconConstraints:
                                const BoxConstraints(minWidth: 55.0),
                            hintText: 'Search...',
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 0.0, horizontal: 0.0),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Colors.transparent),
                              borderRadius: BorderRadius.circular(25.7),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Colors.transparent),
                              borderRadius: BorderRadius.circular(25.7),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Row(
                      children: [
                        Visibility(
                          visible: useVerticalLayout3x ? true : false,
<<<<<<< HEAD
                          child: OutlinedButton.icon(
                            icon: const Icon(Icons.light_mode_rounded,
                                size: 20.0),
                            onPressed: null,
                            label: const Text('Light Mode'),
=======
                          child: TextButton.icon(
                            icon: const Icon(Icons.light_mode_rounded,
                                size: 20.0),
                            onPressed: null,
                            label: Text(
                              'Light Mode',
                              style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.w500),
                            ),
>>>>>>> dev
                          ),
                        ),
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
<<<<<<< HEAD
                Visibility(
                  visible: useVerticalLayout ? false : true,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 12.0, bottom: 12.0, left: 24.0, right: 24.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Flexible(
                          child: TextField(
                            decoration: InputDecoration(
                              isDense: false,
                              filled: true,
                              fillColor: Colors.white,
                              prefixIcon: const Icon(Icons.search),
                              prefixIconConstraints:
                                  const BoxConstraints(minWidth: 55.0),
                              suffixIcon: IconButton(
                                icon: const Icon(Icons.clear),
                                onPressed: () {
                                  /* Clear the search field */
                                },
                              ),
                              suffixIconConstraints:
                                  const BoxConstraints(minWidth: 55.0),
                              hintText: 'Search...',
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 0.0, horizontal: 0.0),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(25.7),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(25.7),
                              ),
                            ),
                          ),
                        ),
                        Tooltip(
                          message: gridLayout ? 'Grid Mode' : 'List Mode',
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Container(
                              height: 50.0,
                              width: 50.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(24.0),
                                color: Colors.amber.shade100,
                              ),
                              child: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      gridLayout
                                          ? gridLayout = false
                                          : gridLayout = true;
                                    });
                                  },
                                  icon: gridLayout
                                      ? const Icon(Icons.grid_view_outlined)
                                      : const Icon(Icons.view_list_outlined)),
                            ),
                          ),
                        )
=======
                AnimatedContainer(
                  curve: Curves.fastOutSlowIn,
                  duration: const Duration(milliseconds: 200),
                  height: _showAppbar ? 70.0 : 0.0,
                  child: Visibility(
                    visible: _showAppbar ? true : false,
                    child: Padding(
                      padding: useVerticalLayout
                          ? const EdgeInsets.only(
                              top: 12.0, bottom: 12.0, left: 48.0, right: 48.0)
                          : const EdgeInsets.only(
                              top: 12.0, bottom: 12.0, left: 24.0, right: 24.0),
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
                                    const BoxConstraints(minWidth: 55.0),
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
                                    minWidth: 50.0, minHeight: 50.0),
                                hintText: 'Search...',
                                hintStyle: GoogleFonts.roboto(
                                    fontWeight: FontWeight.w500),
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 0.0, horizontal: 0.0),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.blue, width: 2),
                                  borderRadius: BorderRadius.circular(25.7),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.white),
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
                Padding(
                  padding: useVerticalLayout
                      ? _showAppbar
                          ? const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 48.0)
                          : const EdgeInsets.symmetric(
                              vertical: 0.0, horizontal: 48.0)
                      : _showAppbar
                          ? const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 24.0)
                          : const EdgeInsets.symmetric(
                              vertical: 0.0, horizontal: 24.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            width: 175.0,
                            child: DropdownButtonFormField(
                              isDense: true,
                              decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.only(
                                      top: 8.0,
                                      bottom: 8.0,
                                      right: 4.0,
                                      left: 0.0),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.transparent, width: 2),
                                    borderRadius: BorderRadius.circular(6.0),
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.transparent, width: 2),
                                    borderRadius: BorderRadius.circular(6.0),
                                  ),
                                  filled: false,
                                  fillColor: Colors.white,
                                  isDense: true,
                                  prefixIcon: const Icon(
                                    Icons.category_outlined,
                                    size: 20.0,
                                    color: Colors.black87,
                                  )),
                              style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16.0,
                                  color: Colors.black87),
                              value: tagResults,
                              elevation: 1,
                              borderRadius: BorderRadius.circular(8.0),
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
                          const SizedBox(width: 10.0),
                          Visibility(
                            visible: useVerticalLayout2x ? true : false,
                            child: Text(
                                'About ${_foundResource.toList().length} Results'),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Visibility(
                            visible: useVerticalLayout3x ? true : false,
                            child: SizedBox(
                              width: useVerticalLayout2x ? 145.0 : 100.0,
                              child: DropdownButtonFormField(
                                isDense: true,
                                elevation: 1,
                                decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.only(
                                        top: 8.0,
                                        bottom: 8.0,
                                        right: 4.0,
                                        left: 12.0),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Colors.transparent, width: 2),
                                      borderRadius: BorderRadius.circular(6.0),
                                    ),
                                    border: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Colors.transparent, width: 2),
                                      borderRadius: BorderRadius.circular(6.0),
                                    ),
                                    filled: false,
                                    fillColor: Colors.white,
                                    isDense: true,
                                    labelText:
                                        useVerticalLayout2x ? null : 'Sort By',
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
                                borderRadius: BorderRadius.circular(8.0),
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
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10.0),
                          ToggleButtons(
                            color: Colors.black54,
                            fillColor: Colors.transparent,
                            constraints: const BoxConstraints(
                                minWidth: 32.0, minHeight: 32.0),
                            borderRadius: BorderRadius.circular(4.0),
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
                        ],
                      ),
                    ],
                  ),
                ),
                Visibility(
                  visible: _showAppbar ? true : false,
                  child: Padding(
                    padding: useVerticalLayout
                        ? const EdgeInsets.only(
                            left: 48.0, right: 48.0, bottom: 12.0)
                        : const EdgeInsets.only(
                            left: 24.0, right: 24.0, bottom: 6.0),
                    child: const Divider(
                      color: Colors.black,
                      thickness: 0.1,
                      indent: 0,
                      endIndent: 0,
                    ),
                  ),
                ),
                Visibility(
                  visible: useVerticalLayout2x ? false : true,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24.0, vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                              'About ${_foundResource.toList().length} Results',
                              style: GoogleFonts.roboto(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w400,
                              )),
                        ),
                        Visibility(
                          visible: useVerticalLayout3x ? false : true,
                          child: SizedBox(
                            width: useVerticalLayout3x ? 145.0 : 100.0,
                            child: DropdownButtonFormField(
                              isDense: true,
                              elevation: 1,
                              decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.only(
                                      top: 8.0,
                                      bottom: 8.0,
                                      right: 4.0,
                                      left: 12.0),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.transparent, width: 2),
                                    borderRadius: BorderRadius.circular(6.0),
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.transparent, width: 2),
                                    borderRadius: BorderRadius.circular(6.0),
                                  ),
                                  filled: false,
                                  fillColor: Colors.white,
                                  isDense: true,
                                  labelText:
                                      useVerticalLayout3x ? null : 'Sort By',
                                  labelStyle: GoogleFonts.roboto(
                                    fontWeight: FontWeight.w500,
                                  ),
                                  prefixText:
                                      useVerticalLayout3x ? 'Sort By: ' : null,
                                  prefixStyle: GoogleFonts.roboto(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey.shade600)),
                              style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black87),
                              borderRadius: BorderRadius.circular(8.0),
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
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
>>>>>>> dev
                      ],
                    ),
                  ),
                ),
<<<<<<< HEAD
                gridLayout
                    ? GridResource(
                        useVerticalLayout: useVerticalLayout,
                        useVerticalLayout2x: useVerticalLayout2x,
                        useVerticalLayout3x: useVerticalLayout3x,
                        gridRowCount: gridRowCount,
                      )
                    : useVerticalLayout3x
                        ? useVerticalLayout2x
                            ? const ListBigResource()
                            : const ListBigResource()
                        : const ListResource()
=======
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
                        padding: const EdgeInsets.all(20.0),
                        child:
                            Column(mainAxisSize: MainAxisSize.min, children: [
                          Text(
                            'No results found',
                            style: GoogleFonts.roboto(
                              color: Colors.black87,
                              fontSize: 24.0,
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
>>>>>>> dev
              ])));
    });
  }
}
