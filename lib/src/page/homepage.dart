import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gimmic/assets/functions/string.dart';
import 'package:gimmic/assets/label.dart';
import 'package:gimmic/assets/widgets/button.dart';
import 'package:gimmic/assets/widgets/card.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../assets/functions/platform.dart';
import '../../assets/functions/resource.dart';
import '../../assets/widgets/appbar.dart';

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
  final Uint8List image;
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
  late Future _loadItems;
  
  bool _isLoading = true;
  bool isSearching = false;

  @override
  void initState() {
    _focusNode = FocusNode();
    _textEditingController = TextEditingController();
    _textEditingController.addListener(() {
      if (_textEditingController.text.trim().isNotEmpty) {
        setState(() {
          isSearching = true;
        });
      } else {
        setState(() {
          isSearching = false;
        });
      }
    });
    _nodeAttachment = _focusNode.attach(context, onKey: _handleKeyPress);
    super.initState();
    _loadItems = loadItems().then((value) {
      setState(() {
        _allResource = value;
        _isLoading = false;  
      });
    });

    _loadItems;
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

  List<Map<String, dynamic>> _allResource = [];

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
        return Material(
          elevation: 2,
          shadowColor: Colors.black38,
          borderRadius: isSearching
              ? focusNode.hasFocus
                  ? const BorderRadius.only(
                      topRight: Radius.circular(12),
                      topLeft: Radius.circular(12))
                  : BorderRadius.circular(25.7)
              : BorderRadius.circular(focusNode.hasFocus ? 12 : 25.7),
          child: TextField(
            controller: textEditingController,
            focusNode: focusNode,
            onSubmitted: (value) async {
              if (selectedIndex == -1 || notFound && isSearching) {
                context.push('/resource?search=${searchKeyword.trim()}');
              } else if (notFound == false && isSearching) {
                context.pushNamed('details', params: {
                  'name': searchKeyword.toLowerCase(),
                }, extra: {
                  "name": searchKeyword,
                  "hero": searchHero,
                  "index": '$searchIndex'
                });
              }
            },
            style: const TextStyle(fontWeight: FontWeight.w600),
            decoration: InputDecoration(
              isDense: false,
              filled: true,
              fillColor: Colors.white70,
              hoverColor: Colors.white,
              prefixIcon: isSearching
                  ? null
                  : Icon(Icons.search, color: focusNode.hasFocus 
                    ? Colors.deepPurple 
                    : Colors.black54),
              prefixIconConstraints: const BoxConstraints(minWidth: 55),
              suffixIcon: Padding(
                padding: EdgeInsets.only(
                    right: isSearching
                        ? 5
                        : widget.useVHideDetails
                            ? 10
                            : 0),
                child: isSearching
                    ? IntrinsicHeight(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                                onPressed: () => _textEditingController.clear(),
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
                                  if (isSearching) {
                                    context.push('/resource?search=${textEditingController.text}');
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
                                    : Theme(
                                      data: Theme.of(context).copyWith(
                                        splashColor: Colors.deepPurple.withOpacity(0.025),
                                        canvasColor: Colors.deepPurple.withOpacity(0.05),
                                        hoverColor: Colors.deepPurple.withOpacity(0.0525)
                                      ),
                                      child: ActionChip(
                                        onPressed: () => focusNode.requestFocus(),
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(25.7)),
                                        side: BorderSide.none,
                                        avatar: Icon(
                                            Icons.sentiment_very_satisfied_outlined,
                                            color: Colors.deepPurple.shade300),
                                        labelStyle: const TextStyle(
                                          fontSize: 14,
                                          color: Colors.black54,
                                          fontWeight: FontWeight.w400,
                                        ),
                                        label: Text(
                                          StringResource.greetings,
                                          style: TextStyle(
                                              color: Colors.deepPurple.shade300,
                                              fontWeight: FontWeight.w500
                                          ),
                                        ),
                                      ),
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
                              fgcolor: Colors.blue.shade700,
                              bgcolor: Colors.blue.shade50,
                            )),
              ),
              suffixStyle: const TextStyle(
                fontWeight: FontWeight.w600,
              ),
              hintText: focusNode.hasFocus ? null : 'Search...',
              hintStyle: const TextStyle(
                fontWeight: FontWeight.w600,
              ),
              labelText:  widget.useVHideDetails ? null : StringResource.greetings,
              contentPadding: isSearching
                  ? const EdgeInsets.symmetric(horizontal: 16)
                  : EdgeInsets.zero,
              suffixIconConstraints: const BoxConstraints(minWidth: 40),
              focusedBorder: OutlineInputBorder(
                  borderSide: isSearching
                      ? BorderSide.none
                      : const BorderSide(width: 2, color: Colors.deepPurple),
                  borderRadius: isSearching
                      ? const BorderRadius.only(
                          topRight: Radius.circular(12),
                          topLeft: Radius.circular(12))
                      : BorderRadius.circular(12)),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(25.7),
              ),
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
                          context.push('/resource?search=${_textEditingController.text}');
                        },
                        onHover: (value) {},
                        child: Container(
                          decoration: BoxDecoration(
                            border: selectedIndex == index 
                              ? Border(left: BorderSide(color: Colors.blue.shade200, width: 3))
                              : null
                          ),
                          child: ListTile(
                            contentPadding: selectedIndex == index 
                              ? const EdgeInsets.symmetric(horizontal: 13.0)
                              : null,
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
                                text: _textEditingController.text.trim(),
                                style: const TextStyle(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.w600),
                                children: const [
                                  TextSpan(
                                    text: ' - Search',
                                    style: TextStyle(
                                      color: Colors.black54,
                                      wordSpacing: 2,
                                      fontWeight: FontWeight.w600)
                                  )
                                ]
                              )
                            )
                          ),
                        ),
                      );
                    }

                    if (index == -1) index = 0;
                    final Resource option = options.elementAt(index);

                    if (option.name == option.subname && option.name == option.hero) {
                      notFound = true;
                    } else {
                      notFound = false;
                    }

                    if(_isLoading) {
                      return const LinearProgressIndicator();
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
                        child: Container(
                          decoration: BoxDecoration(
                            border: selectedIndex == index 
                              ? const Border(left: BorderSide(color: Colors.blue, width: 3))
                              : null
                          ),
                          child: ListTile(
                            contentPadding: selectedIndex == index 
                              ? const EdgeInsets.symmetric(horizontal: 13.0)
                              : null,
                            selected: selectedIndex == index ? true : false,
                            selectedTileColor: selectedIndex == index
                                ? Colors.lightBlue.shade50
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
                                            image: MemoryImage(option.image)))),
                              ),
                            ),
                            trailing: selectedIndex == index
                                ? const Icon(Icons.chevron_right)
                                : null,
                            title: Text(
                              option.name,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            subtitle: Text(
                              option.subname.toTitleCase(),
                              style: const TextStyle(
                                fontSize: 12, 
                                fontWeight: FontWeight.w600,
                                height: 1
                              ),
                            ),
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
        int i = 0;
        for (final item in _allResource) {
          resource.add(Resource(
              name: item["name"],
              subname: item["brand"],
              image: item['images'].first,
              index: i,
              hero: "hero$i"));
          i++;
        }

        final suggestionsName = resource
            .where((Resource resource) => resource.name
                .toLowerCase()
                .contains(textEditingValue.text.trim().toLowerCase()))
            .toList();

        final suggestionsSubName = resource
            .where((Resource resource) => resource.subname
                .toLowerCase()
                .contains(textEditingValue.text.trim().toLowerCase()))
            .toList();

        var finalSuggestionsName = suggestionsName..addAll(suggestionsSubName);
        finalSuggestionsName = finalSuggestionsName.toSet().toList();
        if (finalSuggestionsName.isEmpty) {
          finalSuggestionsName.add(Resource(
            name: textEditingValue.text.trim(),
            subname: textEditingValue.text.trim(),
            image: Uint8List.fromList(List.empty()),
            index: 0,
            hero: textEditingValue.text.trim(),
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
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Tooltip(
                      message: StringResource.version,
                      child: Text(StringResource.title,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500
                          )
                      ),
                    ),
                    SizedBox(width: 8),
                  ]),
            ),
            actions: [
              AnimatedPadding(
                curve: Curves.fastOutSlowIn,
                duration: const Duration(milliseconds: 600),
                padding:
                    EdgeInsets.only(right: usePhoneLayout ? 40 : 20, top: 5),
                child: Row(
                  children: [appbarSetting(usePhoneLayout)],
                ),
              )
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
                                padding: const EdgeInsets.only(top: 8),
                                child: CardResource(
                                  layouts: useVHideDetails,
                                  smalllayouts: usePhoneLayout,
                                ),
                              )),
                              Flexible(
                                child: Padding(
                                    padding: const EdgeInsets.only(top: 40),
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
                                    color: Colors.red.shade100,
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
                                          buttonGithub(context),
                                        ]),
                                        Row(
                                          children: [
                                            ButtonLinks(
                                                bgcolor: Colors.white,
                                                fgcolor: Colors.black87),
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
