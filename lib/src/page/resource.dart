import 'package:flutter/material.dart';
import 'package:gimmic/src/view/grid.dart';
import 'package:gimmic/src/view/list.dart';
import 'package:gimmic/src/view/list_big.dart';

class Resource extends StatefulWidget {
  const Resource({super.key});

  @override
  State<Resource> createState() => _ResourceState();
}

bool gridLayout = false;

class _ResourceState extends State<Resource> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      bool useVerticalLayout = constraints.maxWidth > 1000;
      bool useVerticalLayout2x = constraints.maxWidth > 620;
      bool useVerticalLayout3x = constraints.maxWidth > 440;

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
                    visible: useVerticalLayout ? true : false,
                    child: Flexible(
                      child: Padding(
                        padding: useVerticalLayout
                            ? const EdgeInsets.only(
                                top: 5.0, left: 150.0, right: 150.0)
                            : const EdgeInsets.only(
                                top: 5.0, left: 75.0, right: 75.0),
                        child: TextField(
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
                          child: OutlinedButton.icon(
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
                      ],
                    ),
                  ),
                ),
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
              ])));
    });
  }
}
