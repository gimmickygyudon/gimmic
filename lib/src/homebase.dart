import 'package:flutter/material.dart';
import 'package:gimmic/src/page/homepage.dart';
import 'package:google_fonts/google_fonts.dart';

import '../assets/widgets/menu.dart';

class HomeBase extends StatefulWidget {
  const HomeBase({super.key});

  @override
  State<HomeBase> createState() => _HomeBaseState();
}

final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
    GlobalKey<RefreshIndicatorState>();

int _selectedIndex = 0;
NavigationRailLabelType labelType = NavigationRailLabelType.all;
bool showLeading = true;
bool showTrailing = false;
bool showExtended = false;
double groupAligment = -0.45;

class _HomeBaseState extends State<HomeBase> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool useVerticalLayout =
            constraints.maxWidth < constraints.maxHeight / 1.5;
        return Scaffold(
            backgroundColor: Colors.grey.shade200,
            body: RefreshIndicator(
              displacement: 72,
              key: _refreshIndicatorKey,
              onRefresh: () async {
                return Future<void>.delayed(const Duration(seconds: 1));
              },
              child: GestureDetector(
                onLongPressDown: (details) => onTapPosition(details),
                onLongPress: () =>
                    onRightClickPageMenu(context, _refreshIndicatorKey),
                onSecondaryTapDown: (details) => onRightClickPageMenu(
                    context, _refreshIndicatorKey, details),
                child: Row(
                  children: [
                    useVerticalLayout
                        ? const SizedBox()
                        : AnimatedSwitcher(
                            duration: const Duration(milliseconds: 400),
                            child: NavigationRail(
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
                                      padding: const EdgeInsets.only(top: 22),
                                      child: showExtended
                                          ? TextButton.icon(
                                              style: const ButtonStyle(
                                                  foregroundColor:
                                                      MaterialStatePropertyAll(
                                                          Colors.black87)),
                                              onPressed: () {
                                                setState(() {
                                                  if (showExtended == true) {
                                                    labelType =
                                                        NavigationRailLabelType
                                                            .all;
                                                    showExtended = false;
                                                  } else {
                                                    labelType =
                                                        NavigationRailLabelType
                                                            .none;
                                                    showExtended = true;
                                                  }
                                                });
                                              },
                                              icon: const Icon(Icons.menu),
                                              label: const Text('Menu'))
                                          : IconButton(
                                              tooltip: 'Show Menu',
                                              onPressed: () {
                                                setState(() {
                                                  if (showExtended == true) {
                                                    labelType =
                                                        NavigationRailLabelType
                                                            .selected;
                                                    showExtended = false;
                                                  } else {
                                                    labelType =
                                                        NavigationRailLabelType
                                                            .none;
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
                                      icon:
                                          const Icon(Icons.more_horiz_rounded),
                                    )
                                  : const SizedBox(),
                              destinations: <NavigationRailDestination>[
                                NavigationRailDestination(
                                  padding:
                                      const EdgeInsets.fromLTRB(8, 0, 0, 0),
                                  icon: const Icon(Icons.house_outlined,
                                      color: Colors.black54),
                                  selectedIcon: const Icon(Icons.house),
                                  label: Text(
                                    'Home',
                                    style: GoogleFonts.roboto(
                                      color: Colors.black87,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                NavigationRailDestination(
                                  padding:
                                      const EdgeInsets.fromLTRB(8, 0, 0, 0),
                                  icon: const Icon(Icons.view_in_ar,
                                      color: Colors.black54),
                                  selectedIcon:
                                      const Icon(Icons.view_in_ar_outlined),
                                  label: Text('Resource',
                                      style: GoogleFonts.roboto(
                                        color: Colors.black87,
                                        fontWeight: FontWeight.w500,
                                      )),
                                ),
                                NavigationRailDestination(
                                  padding:
                                      const EdgeInsets.fromLTRB(8, 0, 0, 0),
                                  icon: const Icon(Icons.logo_dev_outlined,
                                      color: Colors.black54),
                                  selectedIcon: const Icon(Icons.logo_dev),
                                  label: Text('Update',
                                      style: GoogleFonts.roboto(
                                        color: Colors.black87,
                                        fontWeight: FontWeight.w500,
                                      )),
                                ),
                              ],
                            ),
                          ),
                    Expanded(child: LayoutDesktop()),
                  ],
                ),
              ),
            ));
      },
    );
  }
}
