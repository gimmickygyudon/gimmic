import 'package:flutter/material.dart';
import 'package:gimmic/assets/colors.dart';
import 'package:gimmic/assets/widgets/button.dart';
import 'package:gimmic/assets/widgets/card.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

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
            elevation: 0.0,
            toolbarHeight: 100,
            title: Padding(
              padding: EdgeInsets.only(left: usePhoneLayout ? 40.0 : 20.0),
              child: Builder(builder: (context) {
                return Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Gimmicky Gyudon',
                          style: GoogleFonts.raleway(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w300,
                              color: Colors.black87)),
                      const SizedBox(width: 8.0),
                      Text('ver. 1.01',
                          style: GoogleFonts.roboto(
                              fontSize: 12.0,
                              fontWeight: FontWeight.w600,
                              color: Colors.black54))
                    ]);
              }),
            ),
            /* title: const Text(
            StringResource.logoName,
            style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w300),
          ), */
            actions: [
              Builder(builder: (context) {
                return Padding(
                  padding: EdgeInsets.only(
                      right: usePhoneLayout ? 40.0 : 20.0, top: 5.0),
                  child: Row(
                    children: [
                      Row(
                        children: [
                          Visibility(
                            visible: usePhoneLayout ? true : false,
                            child: TextButton.icon(
                              icon: const Icon(Icons.light_mode_rounded,
                                  size: 20.0),
                              onPressed: null,
                              label: Text(
                                'Light Mode',
                                style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
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
            child: Padding(
              padding: usePhoneLayout
                  ? const EdgeInsets.only(left: 48.0, right: 48.0)
                  : const EdgeInsets.only(left: 24.0, right: 24.0),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(
                        top: 0.0, left: 12.0, right: 12.0, bottom: 0.0),
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
                        top: 0.0, left: 12.0, right: 12.0, bottom: 32.0),
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
                              ? const EdgeInsets.only(right: 12.0)
                              : EdgeInsets.zero,
                          child: Column(
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Flexible(
                                    child: TextField(
                                      onChanged: (value) => {},
                                      style: GoogleFonts.roboto(
                                          fontWeight: FontWeight.w500),
                                      decoration: InputDecoration(
                                        isDense: false,
                                        filled: true,
                                        fillColor: Colors.white,
                                        prefixIcon: const Icon(Icons.search),
                                        prefixIconConstraints:
                                            const BoxConstraints(
                                                minWidth: 55.0),
                                        suffixIcon: useVHideDetails
                                            ? Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 20.0),
                                                child: Text(timenow,
                                                    style: GoogleFonts.roboto(
                                                      color: Colors.black54,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    )),
                                              )
                                            : Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 10.0),
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
                                        labelText: useVHideDetails
                                            ? null
                                            : 'How are you today?',
                                        contentPadding: EdgeInsets.zero,
                                        suffixIconConstraints: BoxConstraints(
                                            minWidth:
                                                useVHideDetails ? 150.0 : 40.0),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Colors.blue, width: 2),
                                          borderRadius:
                                              BorderRadius.circular(25.7),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Colors.transparent),
                                          borderRadius:
                                              BorderRadius.circular(25.7),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(32.0),
                                child: Text(
                                  "It's bit rainy here...",
                                  style: GoogleFonts.roboto(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black54),
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
                            Visibility(
                              visible: useVHideDetails ? true : false,
                              child: Container(
                                height: 48.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(24.0),
                                  color: Colors.red.shade100,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 16.0, right: 8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      buttonGithub(),
                                      Row(
                                        children: [
                                          ButtonLinks(bgcolor: Colors.white),
                                          /* const SizedBox(width: 6.0),
                                          Material(
                                              color: Colors.redAccent.shade100,
                                              type: MaterialType.circle,
                                              child: const Padding(
                                                padding: EdgeInsets.all(4.0),
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
                            Visibility(
                                visible: useVHideDetails ? true : false,
                                child: const SizedBox(height: 12.0)),
                            LayoutBuilder(builder: (BuildContext context,
                                BoxConstraints rowConstraints) {
                              return Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  CardBig(
                                      rowConstraints: rowConstraints,
                                      useVHideDetails: useVHideDetails)
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
