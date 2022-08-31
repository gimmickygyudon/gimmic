import 'package:flutter/material.dart';
import 'package:gimmic/assets/colors.dart';
import 'package:gimmic/assets/widgets/button.dart';
import 'package:gimmic/assets/widgets/card.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class LayoutDesktop extends StatelessWidget {
  LayoutDesktop({super.key});
  final String timenow = DateFormat("EEEE, MMMM dd").format(DateTime.now());

  Widget searchbarMain(useVHideDetails) {
    return TextField(
      onChanged: (value) => {},
      style: GoogleFonts.roboto(fontWeight: FontWeight.w500),
      decoration: InputDecoration(
        isDense: false,
        filled: true,
        fillColor: Colors.white,
        prefixIcon: const Icon(Icons.search),
        prefixIconConstraints: const BoxConstraints(minWidth: 55),
        suffixIcon: useVHideDetails
            ? Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Text(timenow,
                    style: GoogleFonts.roboto(
                      color: Colors.black54,
                      fontWeight: FontWeight.w500,
                    )),
              )
            : Padding(
                padding: const EdgeInsets.only(right: 10),
                child: ButtonLinks(
                  bgcolor: Colors.blue.shade50,
                )),
        suffixStyle: GoogleFonts.roboto(
          fontWeight: FontWeight.w500,
        ),
        hintText: 'Search...',
        hintStyle: GoogleFonts.roboto(
          fontWeight: FontWeight.w500,
        ),
        labelText: useVHideDetails ? null : 'How are you today?',
        contentPadding: EdgeInsets.zero,
        suffixIconConstraints:
            BoxConstraints(minWidth: useVHideDetails ? 150 : 40),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.blue, width: 2),
          borderRadius: BorderRadius.circular(25.7),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(25.7),
        ),
      ),
    );
  }

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
                                    child: searchbarMain(useVHideDetails),
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
