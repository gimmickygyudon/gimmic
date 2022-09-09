import 'package:flutter/material.dart';
import 'package:gimmic/src/page/homepage.dart';

class HomeBase extends StatefulWidget {
  const HomeBase({super.key, required this.title});
  final String title;

  @override
  State<HomeBase> createState() => _HomeBaseState();
}

int _selectedIndex = 0;
NavigationRailLabelType labelType = NavigationRailLabelType.all;
bool showLeading = true;
bool showTrailing = false;
bool showExtended = false;
double groupAligment = -0.45;

class _HomeBaseState extends State<HomeBase> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade200,
        body: Row(
          children: [
            NavigationRail(
              selectedIndex: _selectedIndex,
              groupAlignment: groupAligment,
              onDestinationSelected: (int index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              backgroundColor: Colors.transparent,
              extended: showExtended,
              minExtendedWidth: 158,
              indicatorColor: Colors.black54,
              labelType: labelType,
              leading: showLeading
                  ? Padding(
                      padding: const EdgeInsets.only(top: 26),
                      child: showExtended
                          ? TextButton.icon(
                              style: const ButtonStyle(
                                  foregroundColor:
                                      MaterialStatePropertyAll(Colors.black87)),
                              onPressed: () {
                                setState(() {
                                  if (showExtended == true) {
                                    labelType = NavigationRailLabelType.all;
                                    showExtended = false;
                                  } else {
                                    labelType = NavigationRailLabelType.none;
                                    showExtended = true;
                                  }
                                });
                              },
                              icon: const Icon(Icons.menu_open),
                              label: const Text('Side Menu'))
                          : IconButton(
                              tooltip: 'Show Menu',
                              onPressed: () {
                                setState(() {
                                  if (showExtended == true) {
                                    labelType =
                                        NavigationRailLabelType.selected;
                                    showExtended = false;
                                  } else {
                                    labelType = NavigationRailLabelType.none;
                                    showExtended = true;
                                  }
                                });
                              },
                              icon: const Icon(Icons.menu)),
                    )
                  : const SizedBox(),
              trailing: showTrailing
                  ? IconButton(
                      onPressed: () {
                        // Add your onPressed code here!
                      },
                      icon: const Icon(Icons.more_horiz_rounded),
                    )
                  : const SizedBox(),
              destinations: const <NavigationRailDestination>[
                NavigationRailDestination(
                  padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
                  icon: Icon(Icons.home_outlined),
                  selectedIcon: Icon(Icons.home),
                  label: Text('Home'),
                ),
                NavigationRailDestination(
                  padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
                  icon: Icon(Icons.bookmark_border),
                  selectedIcon: Icon(Icons.book),
                  label: Text('Resource'),
                ),
                NavigationRailDestination(
                  padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
                  icon: Icon(Icons.star_border),
                  selectedIcon: Icon(Icons.star),
                  label: Text('Update'),
                ),
              ],
            ),
            Expanded(child: LayoutDesktop()),
          ],
        ));
  }
}
