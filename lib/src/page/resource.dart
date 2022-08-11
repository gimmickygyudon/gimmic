import 'package:flutter/material.dart';
import 'package:gimmic/src/view/grid.dart';
import 'package:gimmic/src/view/list.dart';
import 'package:gimmic/src/view/list_big.dart';

class Resource extends StatefulWidget {
  const Resource({super.key});

  @override
  State<Resource> createState() => _ResourceState();
}

bool gridLayout = true;
var _searchController = TextEditingController();

class _ResourceState extends State<Resource> {
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

  // This list holds the data for the list view
  List<Map<String, dynamic>> _foundResource = [];
  @override
  void initState() {
    // at the beginning, all users are shown
    _foundResource = _allResource;
    super.initState();
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

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      bool useVerticalLayout = constraints.maxWidth > 1000;
      bool useVerticalLayout2x = constraints.maxWidth > 620;
      bool useVerticalLayout3x = constraints.maxWidth > 440;
      bool hideDetailHorizontal = constraints.maxWidth > 550;

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
                children: <Widget>[
                  const Text('Resource'),
                  Visibility(
                    visible: useVerticalLayout ? false : false,
                    child: Flexible(
                      child: Padding(
                        padding: useVerticalLayout
                            ? const EdgeInsets.only(
                                top: 5.0, left: 150.0, right: 150.0)
                            : const EdgeInsets.only(
                                top: 5.0, left: 75.0, right: 75.0),
                        child: TextField(
                          onChanged: (value) => _runFilter(value),
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
                          child: TextButton.icon(
                            icon: const Icon(Icons.light_mode_rounded,
                                size: 20.0),
                            onPressed: null,
                            label: const Text('Light Mode'),
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
                Visibility(
                  visible: useVerticalLayout ? true : true,
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
                            decoration: InputDecoration(
                              isDense: false,
                              filled: true,
                              fillColor: Colors.white,
                              prefixIcon: const Icon(Icons.search),
                              prefixIconConstraints:
                                  const BoxConstraints(minWidth: 50.0),
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
                      ],
                    ),
                  ),
                ),
                _foundResource.isNotEmpty
                    ? gridLayout
                        ? GridResource(
                            useVerticalLayout: useVerticalLayout,
                            useVerticalLayout2x: useVerticalLayout2x,
                            useVerticalLayout3x: useVerticalLayout3x,
                            gridRowCount: gridRowCount,
                            foundResource: _foundResource,
                          )
                        : useVerticalLayout3x
                            ? useVerticalLayout2x
                                ? ListBigResource(
                                    foundResource: _foundResource,
                                    gridLayout: gridLayout,
                                    useVerticalLayout: useVerticalLayout,
                                    hideDetailHorizontal: hideDetailHorizontal,
                                  )
                                : ListBigResource(
                                    foundResource: _foundResource,
                                    gridLayout: gridLayout,
                                    useVerticalLayout: useVerticalLayout,
                                    hideDetailHorizontal: hideDetailHorizontal,
                                  )
                            : ListResource(foundResource: _foundResource)
                    : Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Text(
                                'No results found',
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.w300),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 10),
                              Icon(
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
