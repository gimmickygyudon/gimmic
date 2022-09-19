import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gimmic/assets/label.dart';
import 'package:gimmic/assets/widgets/button.dart';
import 'package:gimmic/assets/widgets/card.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../assets/functions/platform.dart';

class Resource {
  const Resource({
    required this.name,
    required this.subname,
    required this.image,
    required this.index,
    required this.hero,
  });

  final String name;
  final String subname;
  final String image;
  final int index;
  final String hero;

  @override
  String toString() {
    return name;
  }
}

class SearchBarMain extends StatefulWidget {
  const SearchBarMain(
      {super.key,
      required this.useVHideDetails,
      required this.timenow,
      required this.rowConstraints});
  final BoxConstraints rowConstraints;
  final bool useVHideDetails;
  final String timenow;

  @override
  State<SearchBarMain> createState() => _SearchBarMainState();
}

class _SearchBarMainState extends State<SearchBarMain> {
  late TextEditingController _textEditingController;
  late FocusNode _focusNode;
  late FocusAttachment _nodeAttachment;
  bool searching = false;

  @override
  void initState() {
    _focusNode = FocusNode();
    _textEditingController = TextEditingController();
    _textEditingController.addListener(() {
      if (_textEditingController.text.trim().isNotEmpty) {
        setState(() {
          searching = true;
        });
      } else {
        setState(() {
          searching = false;
        });
      }
    });
    _nodeAttachment = _focusNode.attach(context, onKey: _handleKeyPress);
    super.initState();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    _nodeAttachment.detach();
    _focusNode.dispose();
    super.dispose();
  }

  KeyEventResult _handleKeyPress(FocusNode node, RawKeyEvent event) {
    if (event is RawKeyDownEvent) {
      /* debugPrint(searchIndex.toString());
      debugPrint(searchKeyword); */
      /* debugPrint(
          'Focus node ${node.debugLabel} got key event: ${event.logicalKey}'); */
      if (event.logicalKey == LogicalKeyboardKey.arrowUp) {
        setState(() {
          selectedIndex -= 1;
        });

        return KeyEventResult.handled;
      } else if (event.logicalKey == LogicalKeyboardKey.arrowDown) {
        setState(() {
          selectedIndex += 1;
        });

        return KeyEventResult.handled;
      } else if (event.logicalKey == LogicalKeyboardKey.escape) {
        setState(() {
          _textEditingController.clear();
        });
        return KeyEventResult.handled;
      }
    }
    return KeyEventResult.ignored;
  }

  final List<Map<String, dynamic>> _allResource = [
    {
      "id": 1,
      "index": 0,
      "hero": "catHero",
      "name": "Andy",
      "subname": "Legends of Zelda",
      "image": "images/hellocat.jpg",
      "size": "29.0 MB"
    },
    {
      "id": 2,
      "index": 1,
      "hero": "dogHero",
      "name": "Aragon Malay",
      "subname": "Cross Code",
      "image": "images/hellocat1.jpg",
      "size": "40.2 MB"
    },
    {
      "id": 3,
      "index": 0,
      "hero": "lizardHero",
      "name": "Cross",
      "subname": "Cross Code",
      "image": "images/hellocat.jpg",
      "size": "5.5 MB"
    },
    {
      "id": 4,
      "index": 1,
      "hero": "monkeyHero",
      "name": "Barbara",
      "subname": "Zenity",
      "image": "images/hellocat1.jpg",
      "size": "35.2 MB"
    },
  ];

  int selectedIndex = 0, searchIndex = 0;
  String searchHero = '', searchKeyword = '';
  bool notFound = true;
  @override
  Widget build(BuildContext context) {
    _nodeAttachment.reparent();
    return RawAutocomplete<Resource>(
      textEditingController: _textEditingController,
      focusNode: _focusNode,
      fieldViewBuilder:
          (context, textEditingController, focusNode, onFieldSubmitted) {
        return TextField(
          controller: textEditingController,
          focusNode: focusNode,
          onSubmitted: (value) async {
            if (selectedIndex == -1 || notFound && searching) {
              context.push('/resource?search=${searchKeyword.trim()}');
            } else if (notFound == false && searching) {
              context.pushNamed('details', params: {
                'name': searchKeyword.toLowerCase(),
              }, extra: {
                "name": searchKeyword,
                "hero": searchHero,
                "index": '$searchIndex'
              });
            }
          },
          style: GoogleFonts.roboto(fontWeight: FontWeight.w500),
          decoration: InputDecoration(
            isDense: false,
            filled: true,
            fillColor: Colors.white,
            prefixIcon: searching ? null : const Icon(Icons.search),
            prefixIconConstraints: const BoxConstraints(minWidth: 55),
            suffixIcon: Padding(
              padding: EdgeInsets.only(
                  right: searching
                      ? 5
                      : widget.useVHideDetails
                          ? 10
                          : 0),
              child: searching
                  ? IntrinsicHeight(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                              onPressed: () {
                                _textEditingController.clear();
                              },
                              icon: const Icon(
                                Icons.close,
                                color: Colors.black54,
                              )),
                          isWebMobile
                              ? const VerticalDivider(
                                  width: 8,
                                  thickness: 1,
                                  indent: 12,
                                  endIndent: 12,
                                  color: Colors.black26,
                                )
                              : const VerticalDivider(
                                  width: 8,
                                  thickness: 1,
                                  indent: 4,
                                  endIndent: 4,
                                  color: Colors.black26),
                          IconButton(
                              onPressed: () async {
                                if (searching) {
                                  context.push(
                                      '/resource?search=${textEditingController.text}');
                                }
                              },
                              icon: const Icon(
                                Icons.search,
                                color: Colors.blue,
                              )),
                        ],
                      ),
                    )
                  : widget.useVHideDetails
                      ? Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            AnimatedSwitcher(
                              switchInCurve: Curves.ease,
                              switchOutCurve: Curves.ease,
                              duration: const Duration(milliseconds: 100),
                              child: _focusNode.hasFocus
                                  ? null
                                  : Chip(
                                      backgroundColor:
                                          Colors.black.withOpacity(0.025),
                                      labelStyle: GoogleFonts.roboto(
                                        fontSize: 14,
                                        color: Colors.black54,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      label:
                                          const Text(StringResource.greetings),
                                    ),
                            ),
                            const SizedBox(width: 6),
                            buttonNotification(context),
                          ],
                        )
                      : Padding(
                          padding: isWebMobile
                              ? const EdgeInsets.only(right: 6)
                              : const EdgeInsets.only(right: 8),
                          child: ButtonLinks(
                            bgcolor: Colors.red.shade100,
                          )),
            ),
            suffixStyle: GoogleFonts.roboto(
              fontWeight: FontWeight.w500,
            ),
            hintText: 'Search...',
            hintStyle: GoogleFonts.roboto(
              fontWeight: FontWeight.w500,
            ),
            labelText: widget.useVHideDetails ? null : StringResource.greetings,
            contentPadding: searching
                ? const EdgeInsets.symmetric(horizontal: 16)
                : EdgeInsets.zero,
            suffixIconConstraints: const BoxConstraints(minWidth: 40),
            focusedBorder: OutlineInputBorder(
                borderSide: searching
                    ? BorderSide.none
                    : const BorderSide(width: 2, color: Colors.blue),
                borderRadius: searching
                    ? const BorderRadius.only(
                        topRight: Radius.circular(12),
                        topLeft: Radius.circular(12))
                    : BorderRadius.circular(25.7)),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(25.7),
            ),
          ),
        );
      },
      optionsViewBuilder: (context, onSelected, options) {
        if (selectedIndex < -1) {
          selectedIndex = options.length - 1;
        } else if (selectedIndex >= options.length) {
          selectedIndex = -1;
        }
        if (selectedIndex == -1) {
          searchKeyword = _textEditingController.text;
        }

        if (selectedIndex >= 0 && selectedIndex <= options.length) {
          searchKeyword = options.elementAt(selectedIndex).name;
          searchHero = options.elementAt(selectedIndex).hero;
          searchIndex = options.elementAt(selectedIndex).index;
        }

        return Align(
          alignment: Alignment.topLeft,
          child: Material(
            color: Colors.transparent,
            child: Card(
              clipBehavior: Clip.antiAlias,
              margin: EdgeInsets.zero,
              color: Colors.white,
              elevation: 1,
              shape: const RoundedRectangleBorder(
                side: BorderSide.none,
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(12),
                    bottomLeft: Radius.circular(12)),
              ),
              child: SizedBox(
                width: widget.rowConstraints.maxWidth,
                child: ListView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  itemCount: options.length + 1,
                  itemBuilder: (context, index) {
                    index -= 1;
                    if (index == -1) {
                      return InkWell(
                        onTap: () async {
                          context.push(
                              '/resource?search=${_textEditingController.text}');
                        },
                        onHover: (value) {},
                        child: ListTile(
                            selected: selectedIndex == index ? true : false,
                            selectedTileColor: selectedIndex == index
                                ? Colors.lightBlue.shade50
                                : null,
                            minLeadingWidth: 4,
                            leading: const Icon(
                              Icons.search,
                              size: 22,
                              color: Colors.blue,
                            ),
                            trailing: selectedIndex == index
                                ? const Icon(
                                    Icons.question_mark_rounded,
                                    size: 18,
                                  )
                                : null,
                            title: RichText(
                                text: TextSpan(
                                    text: _textEditingController.text,
                                    style: GoogleFonts.roboto(
                                        color: Colors.black87,
                                        fontWeight: FontWeight.w500),
                                    children: [
                                  TextSpan(
                                      text: ' - Search',
                                      style: GoogleFonts.roboto(
                                          color: Colors.black54,
                                          wordSpacing: 2,
                                          fontWeight: FontWeight.w500))
                                ]))),
                      );
                    }
                    if (index == -1) {
                      index = 0;
                    }

                    final Resource option = options.elementAt(index);

                    if (option.name == option.subname &&
                        option.name == option.image) {
                      notFound = true;
                    } else {
                      notFound = false;
                    }
                    return Visibility(
                      visible: notFound ? false : true,
                      child: InkWell(
                        onTap: () async {
                          context.pushNamed('details', params: {
                            'name': option.name.toLowerCase(),
                          }, extra: {
                            "name": option.name,
                            "hero": option.hero,
                            "index": '${option.index}'
                          });
                        },
                        onHover: (value) {},
                        child: ListTile(
                          selected: selectedIndex == index ? true : false,
                          selectedTileColor: selectedIndex == index
                              ? Colors.lightBlue.shade100
                              : null,
                          selectedColor: Colors.lightBlue.shade900,
                          dense: true,
                          leading: Hero(
                            tag: option.hero + option.index.toString(),
                            child: AspectRatio(
                              aspectRatio: 1 / 1,
                              child: Container(
                                  height: 36,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage(option.image)))),
                            ),
                          ),
                          trailing: selectedIndex == index
                              ? const Icon(Icons.chevron_right)
                              : null,
                          title: Text(
                            option.name,
                            style: GoogleFonts.roboto(fontSize: 16),
                          ),
                          subtitle: Text(
                            option.subname,
                            style: GoogleFonts.roboto(fontSize: 12, height: 1),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        );
      },
      optionsBuilder: (TextEditingValue textEditingValue) {
        if (textEditingValue.text.trim() == '') {
          selectedIndex = 0;
          return const Iterable<Resource>.empty();
        }

        List<Resource> resource = <Resource>[];

        /* for (var element in _allResource) {
          suggestionsName.add(element["name"]);
        } */

        for (final item in _allResource) {
          resource.add(Resource(
              name: item["name"],
              subname: item["subname"],
              image: item['image'],
              index: item['index'],
              hero: item['hero']));
        }

        final suggestionsName = resource
            .where((Resource resource) => resource.name
                .toLowerCase()
                .contains(textEditingValue.text.toLowerCase()))
            .toList();

        final suggestionsSubName = resource
            .where((Resource resource) => resource.subname
                .toLowerCase()
                .contains(textEditingValue.text.toLowerCase()))
            .toList();

        var finalSuggestionsName = suggestionsName..addAll(suggestionsSubName);
        finalSuggestionsName = finalSuggestionsName.toSet().toList();
        if (finalSuggestionsName.isEmpty) {
          finalSuggestionsName.add(Resource(
            name: textEditingValue.text,
            subname: textEditingValue.text,
            image: textEditingValue.text,
            index: 0,
            hero: textEditingValue.text,
          ));
        }

        return finalSuggestionsName;
      },
      onSelected: (Resource selection) {
        // debugPrint('You just selected $selection');
      },
    );
  }
}

class LayoutDesktop extends StatelessWidget {
  LayoutDesktop({super.key});
  final String timenow = DateFormat("EEEE, MMMM dd").format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      bool useVLayout = constraints.maxWidth > 900;
      bool usePhoneLayout = constraints.maxWidth > 550;
      bool useVHideDetails = constraints.maxWidth > 1200;

      return Scaffold(
          backgroundColor: Colors.grey.shade200,
          appBar: AppBar(
            backgroundColor: Colors.grey.shade200,
            surfaceTintColor: Colors.grey.shade200,
            elevation: 0,
            toolbarHeight: 100,
            title: AnimatedPadding(
              curve: Curves.fastOutSlowIn,
              duration: const Duration(milliseconds: 600),
              padding: EdgeInsets.only(left: usePhoneLayout ? 0 : 20),
              child: Builder(builder: (context) {
                return Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Tooltip(
                        message: StringResource.version,
                        child: Text(StringResource.title,
                            style: GoogleFonts.raleway(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Colors.black87)),
                      ),
                      const SizedBox(width: 8),
                    ]);
              }),
            ),
            actions: [
              Builder(builder: (context) {
                return AnimatedPadding(
                  curve: Curves.fastOutSlowIn,
                  duration: const Duration(milliseconds: 600),
                  padding:
                      EdgeInsets.only(right: usePhoneLayout ? 40 : 20, top: 5),
                  child: Row(
                    children: [
                      Row(
                        children: [
                          AnimatedSwitcher(
                              duration: const Duration(milliseconds: 200),
                              child: usePhoneLayout
                                  ? TextButton.icon(
                                      icon: const Icon(Icons.light_mode_rounded,
                                          size: 20),
                                      onPressed: null,
                                      label: Text(
                                        'Light Mode',
                                        style: GoogleFonts.roboto(
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    )
                                  : null),
                          const IconButton(
                            icon: Icon(Icons.settings_outlined),
                            onPressed: null,
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              })
            ],
          ),
          body: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: AnimatedPadding(
              curve: Curves.fastOutSlowIn,
              duration: const Duration(milliseconds: 600),
              padding: usePhoneLayout
                  ? const EdgeInsets.only(left: 8, right: 48)
                  : const EdgeInsets.only(left: 24, right: 24),
              child: Column(
                children: [
                  const Padding(
                    padding:
                        EdgeInsets.only(top: 0, left: 4, right: 12, bottom: 0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Hi',
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 48,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 0, left: 4, right: 12, bottom: 32),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        useVHideDetails ? timenow : timenow,
                        style: const TextStyle(
                          color: Colors.black54,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  Flex(
                    direction: useVLayout ? Axis.horizontal : Axis.vertical,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        flex: 3,
                        child: Padding(
                          padding: useVLayout
                              ? const EdgeInsets.only(right: 12)
                              : EdgeInsets.zero,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                children: [
                                  Flexible(
                                      child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 2),
                                    child: LayoutBuilder(
                                      builder: (BuildContext context,
                                          BoxConstraints rowConstraints) {
                                        return SearchBarMain(
                                            rowConstraints: rowConstraints,
                                            useVHideDetails: useVHideDetails,
                                            timenow: timenow);
                                      },
                                    ),
                                  )),
                                ],
                              ),
                              Flexible(
                                child: Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 8),
                                    child: cardUpdateLog()),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AnimatedContainer(
                              curve: Curves.ease,
                              duration: const Duration(milliseconds: 400),
                              height: useVHideDetails ? 48 : 0,
                              child: AnimatedOpacity(
                                opacity: useVHideDetails ? 1 : 0,
                                curve: Curves.ease,
                                duration: const Duration(milliseconds: 400),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(24),
                                    color: Colors.blue.shade100,
                                  ),
                                  child: Padding(
                                    padding: isWebMobile
                                        ? const EdgeInsets.only(
                                            left: 12, right: 4)
                                        : const EdgeInsets.only(
                                            left: 12, right: 8),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(children: [
                                          buttonGithub(),
                                        ]),
                                        Row(
                                          children: [
                                            ButtonLinks(bgcolor: Colors.white),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            AnimatedSize(
                                duration: const Duration(milliseconds: 300),
                                child: SizedBox(
                                    height: useVHideDetails
                                        ? 12
                                        : useVLayout
                                            ? null
                                            : 6)),
                            Visibility(
                              visible: useVLayout ? false : true,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: const [
                                    Expanded(
                                      child: Divider(
                                        thickness: 0.2,
                                        endIndent: 20,
                                        indent: 10,
                                        color: Colors.black54,
                                        height: 36,
                                      ),
                                    ),
                                    Icon(Icons.layers_outlined,
                                        color: Colors.black54),
                                    Expanded(
                                      child: Divider(
                                        thickness: 0.2,
                                        endIndent: 10,
                                        indent: 20,
                                        color: Colors.black54,
                                        height: 36,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            LayoutBuilder(builder: (BuildContext context,
                                BoxConstraints rowConstraints) {
                              return Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: useVLayout
                                          ? const EdgeInsets.only(
                                              left: 2, right: 2, bottom: 12)
                                          : const EdgeInsets.only(
                                              left: 12, right: 12, bottom: 12),
                                      child: CardBig(
                                          rowConstraints: rowConstraints,
                                          useVHideDetails: useVHideDetails,
                                          useVLayout: useVLayout),
                                    ),
                                  ),
                                ],
                              );
                            }),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ));
    });
  }
}
