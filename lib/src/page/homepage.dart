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
                  bgcolor: Colors.red.shade100,
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
                      Text('Gimmicky Gyudon',
                          style: GoogleFonts.raleway(
                              fontSize: 20,
                              fontWeight: FontWeight.w300,
                              color: Colors.black87)),
                      const SizedBox(width: 8),
                      Tooltip(
                        message:
                            "0.1a : New Update: Added animation on rezising display scale -22 Aug 2022-",
                        child: Text('ver. 0.0.1+2',
                            style: GoogleFonts.roboto(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Colors.black54)),
                      )
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
                              duration: const Duration(milliseconds: 600),
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
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Flexible(
                                      child: searchbarMain(useVHideDetails)),
                                ],
                              ),
                              AnimatedPadding(
                                curve: Curves.ease,
                                duration: const Duration(milliseconds: 600),
                                padding: useVLayout
                                    ? const EdgeInsets.only(
                                        top: 16,
                                        bottom: 32,
                                        left: 15,
                                        right: 15)
                                    : const EdgeInsets.only(
                                        top: 16,
                                        bottom: 84,
                                        left: 15,
                                        right: 15),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      maxLines: 3,
                                      overflow: TextOverflow.fade,
                                      "0.1a : (new update: added animation on rezising display scale)",
                                      style: GoogleFonts.jetBrainsMono(
                                          fontSize: 9,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black),
                                    ),
                                  ],
                                ),
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
                                    padding: const EdgeInsets.only(
                                        left: 16, right: 8),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        buttonGithub(),
                                        Row(
                                          children: [
                                            ButtonLinks(bgcolor: Colors.white),
                                            /* Alert Button
                                            const SizedBox(width: 6),
                                            Material(
                                                color: Colors.redAccent.shade100,
                                                type: MaterialType.circle,
                                                child: const Padding(
                                                  padding: EdgeInsets.all(4),
                                                  child: Icon(
                                                      Icons
                                                          .notifications_off_outlined,
                                                      color: Colors.white),
                                                )), */
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Visibility(
                                visible: useVHideDetails ? true : false,
                                child: const SizedBox(height: 24)),
                            LayoutBuilder(builder: (BuildContext context,
                                BoxConstraints rowConstraints) {
                              return Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(bottom: 12.0),
                                    child: CardBig(
                                        rowConstraints: rowConstraints,
                                        useVHideDetails: useVHideDetails),
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
