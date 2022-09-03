import 'package:flutter/material.dart';
import 'package:gimmic/assets/colors.dart';
import 'package:gimmic/assets/widgets/button.dart';
import 'package:gimmic/assets/widgets/card.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class Resource {
  const Resource({
    required this.name,
    required this.subname,
    required this.image,
  });

  final String name;
  final String subname;
  final String image;

  @override
  String toString() {
    return '$name $subname';
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
  final TextEditingController _textEditingController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  bool searching = false;

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _textEditingController.addListener(() {
      if (_textEditingController.text.isNotEmpty) {
        setState(() {
          searching = true;
        });
      } else {
        setState(() {
          searching = false;
        });
      }
    });
    super.initState();
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
      "index": 1,
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

  @override
  Widget build(BuildContext context) {
    return RawAutocomplete<Resource>(
      textEditingController: _textEditingController,
      focusNode: _focusNode,
      fieldViewBuilder:
          (context, textEditingController, focusNode, onFieldSubmitted) {
        return TextField(
          controller: textEditingController,
          focusNode: focusNode,
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
                          ? 20
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
                          const VerticalDivider(
                            width: 8,
                            thickness: 1,
                            indent: 2,
                            endIndent: 2,
                            color: Colors.black38,
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.search,
                                color: Colors.blue,
                              )),
                        ],
                      ),
                    )
                  : widget.useVHideDetails
                      ? Text(widget.timenow,
                          style: GoogleFonts.roboto(
                            color: Colors.black54,
                            fontWeight: FontWeight.w500,
                          ))
                      : Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: ButtonLinks(
                            bgcolor: Colors.blue.shade50,
                          )),
            ),
            suffixStyle: GoogleFonts.roboto(
              fontWeight: FontWeight.w500,
            ),
            hintText: 'Search...',
            hintStyle: GoogleFonts.roboto(
              fontWeight: FontWeight.w500,
            ),
            labelText: widget.useVHideDetails ? null : 'How are you today?',
            contentPadding: searching
                ? const EdgeInsets.symmetric(horizontal: 16)
                : EdgeInsets.zero,
            suffixIconConstraints: const BoxConstraints(minWidth: 40),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
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
        bool notFound = false;

        return Align(
          alignment: Alignment.topLeft,
          child: Material(
            color: Colors.transparent,
            child: Card(
              margin: EdgeInsets.zero,
              color: Colors.white,
              elevation: 1,
              shape: const RoundedRectangleBorder(
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
                    if (index == 0) {
                      return ListTile(
                          minLeadingWidth: 4,
                          leading: const Icon(
                            Icons.search,
                            size: 22,
                            color: Colors.blue,
                          ),
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
                              ])));
                    }
                    index -= 1;
                    final Resource option = options.elementAt(index);

                    if (option.name == option.subname &&
                        option.name == option.image) {
                      notFound = true;
                    }
                    return Visibility(
                      visible: notFound ? false : true,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 4),
                        child: GestureDetector(
                          onTap: () {
                            onSelected(option);
                          },
                          child: ListTile(
                            dense: true,
                            leading: Padding(
                              padding: const EdgeInsets.only(top: 4),
                              child: CircleAvatar(
                                  radius: 18,
                                  backgroundImage: AssetImage(option.image)),
                            ),
                            title: Text(
                              option.name,
                              style:
                                  GoogleFonts.roboto(fontSize: 16, height: 0),
                            ),
                            subtitle: Text(
                              option.subname,
                              style: GoogleFonts.roboto(fontSize: 12),
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
        if (textEditingValue.text == '') {
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
              image: item['image']));
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
              image: textEditingValue.text));
        }

        return finalSuggestionsName;
      },
      onSelected: (Resource selection) {
        debugPrint('You just selected $selection');
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
              padding: EdgeInsets.only(left: usePhoneLayout ? 40 : 20),
              child: Builder(builder: (context) {
                return Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Tooltip(
                        message: 'Version 0.0.1+4',
                        child: Text('Gimmicky Gyudon',
                            style: GoogleFonts.raleway(
                                fontSize: 20,
                                fontWeight: FontWeight.w300,
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
            child: AnimatedPadding(
              curve: Curves.fastOutSlowIn,
              duration: const Duration(milliseconds: 600),
              padding: usePhoneLayout
                  ? const EdgeInsets.only(left: 48, right: 48)
                  : const EdgeInsets.only(left: 24, right: 24),
              child: Column(
                children: [
                  const Padding(
                    padding:
                        EdgeInsets.only(top: 0, left: 12, right: 12, bottom: 0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Hi',
                        style: TextStyle(
                          color: ColorsResources.primarytextcolor,
                          fontSize: 48,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 0, left: 12, right: 12, bottom: 32),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        useVHideDetails ? 'How are you today?' : timenow,
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
                                    padding: const EdgeInsets.only(
                                        left: 16, right: 8),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(children: [
                                          buttonNotification(),
                                          const SizedBox(width: 8),
                                          buttonGithub(),
                                        ]),
                                        Row(
                                          children: [
                                            const SizedBox(width: 8),
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
                                        color: Colors.black,
                                        height: 36,
                                      ),
                                    ),
                                    Icon(Icons.layers, color: Colors.black54),
                                    Expanded(
                                      child: Divider(
                                        thickness: 0.2,
                                        endIndent: 10,
                                        indent: 20,
                                        color: Colors.black,
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
                                      padding: const EdgeInsets.only(
                                          left: 2, right: 2, bottom: 12),
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
