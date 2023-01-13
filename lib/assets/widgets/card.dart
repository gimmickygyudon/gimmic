import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gimmic/assets/widgets/shimmer.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import 'package:gimmic/assets/widgets/builder.dart';
import 'package:gimmic/assets/widgets/button.dart';
import 'package:gimmic/assets/functions/icon.dart';
import 'package:gimmic/assets/functions/string.dart';
import '../colors_web.dart';
import '../functions/colors.dart';
import '../functions/platform.dart';
import '../functions/resource.dart';
import '../functions/scroll.dart';
import '../functions/url.dart';
import 'menu.dart';

// Big Card
class CardBig extends StatefulWidget {
  final BoxConstraints rowConstraints;
  final bool useVHideDetails;
  final bool useVLayout;
  const CardBig(
      {super.key,
      required this.rowConstraints,
      required this.useVHideDetails,
      required this.useVLayout});

  @override
  State<CardBig> createState() => _CardBigState();
}

class _CardBigState extends State<CardBig> {
  final String timecard = DateFormat("MMMM dd").format(DateTime.now());
  /* final Shader linearGradient = const LinearGradient(
    colors: <Color>[Colors.white, Colors.lightBlue],
  ).createShader(const Rect.fromLTWH(0, 0, 200, 70)); */
  bool cardSelected = false;
  bool imageLoaded = false;

  @override
  Widget build(BuildContext context) {
    void push() => context.push('/resource');

    return GestureDetector(
      onSecondaryTapDown: (details) => onRightClickMenu(
          context,
          currentUrl(context, 'resource'),
          widget.useVHideDetails
              ? "images/hellocat1.jpg"
              : "images/hellocat.jpg",
          'catHello',
          push,
          details),
      onLongPress: () => onRightClickMenu(
          context,
          currentUrl(context, 'resource'),
          widget.useVHideDetails
              ? "images/hellocat1.jpg"
              : "images/hellocat.jpg",
          'catHello',
          push),
      onTapDown: (details) => onTapPosition(details),
      onTap: () => push(),
      child: MouseRegion(
        onEnter: ((value) => setState(() => cardSelected = true)),
        onExit: ((value) => setState(() => cardSelected = false)),
        child: Hero(
          tag: 'catHello',
          child: Card(
            color: Colors.blue,
            margin: const EdgeInsets.all(0),
            elevation: cardSelected ? 8 : 0,
            shadowColor: Colors.black,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: cardSelected ? BorderSide.none : BorderSide.none),
            clipBehavior: Clip.antiAlias,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: widget.rowConstraints.maxWidth,
                maxHeight: widget.useVLayout
                    ? MediaQuery.of(context).size.width / 3.5
                    : MediaQuery.of(context).size.width / 1.5,
              ),
              child: AspectRatio(
                aspectRatio: 1 / 1,
                child: Stack(
                  fit: StackFit.expand, 
                  children: [
                  ClipRect(
                    child: AnimatedScale(
                      curve: Curves.easeOut,
                      duration: const Duration(milliseconds: 600),
                      scale: cardSelected ? 1.025 : 1,
                      child: Image.network(
                        'https://source.unsplash.com/random',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  AnimatedContainer(
                    curve: Curves.easeOut,
                    duration: const Duration(milliseconds: 200),
                    padding: EdgeInsets.only(
                        bottom: 20,
                        left: 20,
                        right: 20,
                        top: isWebMobile ? 10 : 15),
                    decoration: BoxDecoration(
                      border: cardSelected
                          ? const Border(
                              bottom: BorderSide(color: Colors.blue, width: 4))
                          : null,
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [0, 0.5, cardSelected ? 0.85 : 1.0],
                        colors: const <Color>[
                          Colors.transparent,
                          Colors.black12,
                          Colors.black87
                        ],
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        ButtonBar(
                          alignment: MainAxisAlignment.spaceBetween,
                          buttonPadding: EdgeInsets.zero,
                          buttonHeight: 12,
                          children: [
                            Row(
                              children: [
                                AnimatedCrossFade(
                                  firstCurve: Curves.ease,
                                  secondCurve: Curves.fastOutSlowIn,
                                  sizeCurve: Curves.fastOutSlowIn,
                                  layoutBuilder: ((topChild, topChildKey,
                                      bottomChild, bottomChildKey) {
                                    return Stack(
                                      clipBehavior: Clip.none,
                                      alignment: Alignment.center,
                                      children: [
                                        Positioned(
                                            key: bottomChildKey,
                                            top: 0,
                                            child: bottomChild),
                                        Positioned(
                                            key: topChildKey, child: topChild)
                                      ],
                                    );
                                  }),
                                  crossFadeState: widget.useVHideDetails
                                      ? CrossFadeState.showSecond
                                      : CrossFadeState.showFirst,
                                  duration: const Duration(milliseconds: 400),
                                  firstChild: iconImageDialog(
                                      context,
                                      widget.useVHideDetails
                                          ? "images/hellocat1.jpg"
                                          : "images/hellocat.jpg",
                                      'catHello',
                                      Colors.grey.shade200,
                                      push),
                                  secondChild: Padding(
                                    padding: const EdgeInsets.only(left: 6),
                                    child: Text(
                                      'Updated · $timecard',
                                      style: TextStyle(
                                          shadows: const [
                                            Shadow(
                                                color: Colors.black45,
                                                offset: Offset(1, 1),
                                                blurRadius: 2),
                                          ],
                                          fontSize:
                                              widget.useVHideDetails ? 14 : 12,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.grey.shade200),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            ElevatedButton(
                              style: ButtonStyle(
                                visualDensity: const VisualDensity(
                                    horizontal: -2, vertical: -2),
                                backgroundColor:
                                    MaterialStateProperty.resolveWith(
                                  (states) {
                                    return states
                                            .contains(MaterialState.hovered)
                                        ? Colors.white
                                        : Colors.black54;
                                  },
                                ),
                                foregroundColor: MaterialStateProperty.all(
                                    Colors.orange.shade300),
                                elevation: const MaterialStatePropertyAll(0),
                              ),
                              onPressed: () {
                                context.push('/resource');
                              },
                              child: Text("Get Started",
                                  style: GoogleFonts.roboto(
                                      fontWeight: FontWeight.w600)),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AnimatedDefaultTextStyle(
                                        duration:
                                            const Duration(milliseconds: 200),
                                        style: GoogleFonts.poppins(
                                          fontSize:
                                              widget.useVHideDetails ? 32 : 28,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.blue,
                                          letterSpacing: -0.5,
                                        ),
                                        child: const Text('Resource')),
                                    AnimatedSwitcher(
                                      duration:
                                          const Duration(milliseconds: 200),
                                      child: widget.useVHideDetails
                                          ? null
                                          : Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 14, top: 8),
                                              child: Text(
                                                'Updated · $timecard',
                                                style: TextStyle(
                                                    shadows: const [
                                                      Shadow(
                                                          color: Colors.black45,
                                                          offset: Offset(1, 1),
                                                          blurRadius: 2),
                                                    ],
                                                    fontSize:
                                                        widget.useVHideDetails
                                                            ? 14
                                                            : 12,
                                                    fontWeight: FontWeight.w400,
                                                    color:
                                                        Colors.grey.shade300),
                                              ),
                                            ),
                                    ),
                                  ],
                                ),
                                AnimatedSwitcher(
                                    duration: const Duration(milliseconds: 200),
                                    child: widget.useVHideDetails
                                        ? iconImageDialog(
                                            context,
                                            widget.useVHideDetails
                                                ? "images/hellocat1.jpg"
                                                : "images/hellocat.jpg",
                                            'catHello',
                                            Colors.grey.shade200,
                                            push)
                                        : null),
                              ],
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            AnimatedDefaultTextStyle(
                                curve: Curves.fastOutSlowIn,
                                duration: const Duration(milliseconds: 400),
                                maxLines: 2,
                                style: TextStyle(
                                    fontSize: widget.useVHideDetails ? 24 : 18,
                                    fontWeight: FontWeight.w100,
                                    color: Colors.white),
                                overflow: TextOverflow.ellipsis,
                                child: const Text(
                                    "Welcome, You made it here! let's enjoy our time together")),
                          ],
                        ),
                      ],
                    ),
                  ),
                ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Upate Log Card
GlobalKey<TooltipState> _updateLogKey = GlobalKey<TooltipState>();
Widget cardUpdateLog() {
  return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
    bool isHover = false;
    return StatefulBuilder(
      builder: (context, setState) {
        return Card(
          color: isHover ? Colors.white : Colors.grey.shade50,
          surfaceTintColor: isHover ? Colors.white : Colors.grey.shade50,
          elevation: isHover ? 0 : 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide.none,
          ),
          child: InkWell(
            mouseCursor: SystemMouseCursors.basic,
            splashFactory: NoSplash.splashFactory,
            hoverColor: Colors.transparent,
            borderRadius: BorderRadius.circular(12),
            onTap: () {},
            onHover: (value) => setState(() => isHover = value),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Theme(
                data: ThemeData(
                  hoverColor: Colors.transparent,
                  splashFactory: NoSplash.splashFactory,
                  useMaterial3: true,
                ).copyWith(dividerColor: Colors.transparent),
                child: ListTileTheme(
                  horizontalTitleGap: -6,
                  contentPadding: const EdgeInsets.only(left: 6),
                  dense: true,
                  child: ExpansionTile(
                      leading: Icon(Icons.logo_dev,
                          color: isHover ? Colors.black87 : Colors.black54),
                      title: Text('Update Log'.toUpperCase(),
                          style: GoogleFonts.roboto(
                              color: isHover ? Colors.black87 : Colors.black54,
                              fontSize: 14,
                              fontWeight: FontWeight.w500)),
                      trailing: Tooltip(
                          key: _updateLogKey,
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              color: Colors.grey.shade800,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(4))),
                          message:
                              "These log basically where i update everything on the app. \nYou can freely clone this project on github.",
                          triggerMode: TooltipTriggerMode.tap,
                          child: TextButton.icon(
                            style: ButtonStyle(foregroundColor:
                                MaterialStateProperty.resolveWith((states) {
                              if (states.contains(MaterialState.hovered) ||
                                  states.contains(MaterialState.pressed)) {
                                return Colors.black87;
                              }
                              return Colors.black38;
                            })),
                            onPressed: () {
                              _updateLogKey.currentState
                                  ?.ensureTooltipVisible();
                            },
                            label: const Icon(Icons.info_outline),
                            icon: Text(' About these updates',
                                style: GoogleFonts.roboto(
                                    fontWeight: FontWeight.w500)),
                          )),
                      children: [
                        Theme(
                          data: ThemeData(useMaterial3: true),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 6),
                                ListTileTheme(
                                  child: ListView(
                                    keyboardDismissBehavior:
                                        ScrollViewKeyboardDismissBehavior
                                            .onDrag,
                                    physics: const ClampingScrollPhysics(),
                                    shrinkWrap: true,
                                    padding: EdgeInsets.zero,
                                    children: <Widget>[
                                      ExpansionTile(
                                        tilePadding: constraints.maxWidth > 600
                                            ? null
                                            : EdgeInsets.zero,
                                        childrenPadding: EdgeInsets.zero,
                                        leading: Chip(
                                            side: BorderSide.none,
                                            backgroundColor:
                                                Colors.blue.shade50,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(6)),
                                            label: Text(
                                              '0.0.3+8',
                                              style: GoogleFonts.roboto(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500,
                                                  color: isWebMobile
                                                      ? Colors.blue
                                                      : Colors.blue),
                                            )),
                                        title: Text(
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          'Small Patch',
                                          style: GoogleFonts.roboto(
                                              fontWeight: FontWeight.w400,
                                              fontSize:
                                                  constraints.maxWidth > 460
                                                      ? null
                                                      : 14),
                                        ),
                                        trailing: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            const Icon(Icons.fiber_new_outlined,
                                                color: Colors.blue, size: 28),
                                            const SizedBox(width: 8),
                                            Chip(
                                                side: BorderSide.none,
                                                backgroundColor:
                                                    Colors.grey.shade100,
                                                label: Text(
                                                  constraints.maxWidth > 460
                                                      ? 'October 18'
                                                      : 'Oct 18',
                                                  style: GoogleFonts.roboto(
                                                      fontSize: 12,
                                                      color: Colors.black54),
                                                )),
                                          ],
                                        ),
                                        children: <Widget>[
                                          ListTile(
                                              horizontalTitleGap: 6,
                                              dense: true,
                                              leading:
                                                  const Icon(Icons.arrow_right),
                                              title: Text(
                                                  'Compact header bar in resource page',
                                                  style: GoogleFonts.roboto(
                                                      fontSize: 14))),
                                          ListTile(
                                              horizontalTitleGap: 6,
                                              dense: true,
                                              leading:
                                                  const Icon(Icons.arrow_right),
                                              title: Text(
                                                  'Reduce lag spike while scrolling in resource page',
                                                  style: GoogleFonts.roboto(
                                                      fontSize: 14))),
                                          ListTile(
                                              horizontalTitleGap: 6,
                                              dense: true,
                                              leading:
                                                  const Icon(Icons.arrow_right),
                                              title: Text(
                                                  'New page transition Animations',
                                                  style: GoogleFonts.roboto(
                                                      fontSize: 14))),
                                        ],
                                      ),
                                      ExpansionTile(
                                        tilePadding: constraints.maxWidth > 600
                                            ? null
                                            : EdgeInsets.zero,
                                        childrenPadding: EdgeInsets.zero,
                                        leading: Chip(
                                            side: BorderSide.none,
                                            backgroundColor:
                                                Colors.grey.shade100,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(6)),
                                            label: Text(
                                              '0.0.3+5',
                                              style: GoogleFonts.roboto(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black54),
                                            )),
                                        title: Tooltip(
                                          message:
                                              "We will uploading a lots of content soon!",
                                          child: Text(
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            'New clean UI',
                                            style: GoogleFonts.roboto(
                                                fontWeight: FontWeight.w400,
                                                fontSize:
                                                    constraints.maxWidth > 460
                                                        ? null
                                                        : 14),
                                          ),
                                        ),
                                        subtitle: Text(
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          'With performance improvement',
                                          style: GoogleFonts.roboto(
                                              color: Colors.black54,
                                              fontSize:
                                                  constraints.maxWidth > 460
                                                      ? null
                                                      : 12),
                                        ),
                                        trailing: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Chip(
                                                side: BorderSide.none,
                                                backgroundColor:
                                                    Colors.grey.shade100,
                                                label: Text(
                                                  constraints.maxWidth > 460
                                                      ? 'October 1'
                                                      : 'Oct 1',
                                                  style: GoogleFonts.roboto(
                                                      fontSize: 12,
                                                      color: Colors.black54),
                                                )),
                                          ],
                                        ),
                                        children: <Widget>[
                                          ListTile(
                                              horizontalTitleGap: 6,
                                              dense: true,
                                              leading:
                                                  const Icon(Icons.arrow_right),
                                              title: Text(
                                                  'Added new minimal mode',
                                                  style: GoogleFonts.roboto(
                                                      fontSize: 14))),
                                          ListTile(
                                              horizontalTitleGap: 6,
                                              dense: true,
                                              leading:
                                                  const Icon(Icons.arrow_right),
                                              title: Text('Expandable cards',
                                                  style: GoogleFonts.roboto(
                                                      fontSize: 14))),
                                          ListTile(
                                              horizontalTitleGap: 6,
                                              dense: true,
                                              leading:
                                                  const Icon(Icons.arrow_right),
                                              title: Text(
                                                  'New random emoticons when no results found',
                                                  style: GoogleFonts.roboto(
                                                      fontSize: 14))),
                                          ListTile(
                                              horizontalTitleGap: 6,
                                              dense: true,
                                              leading:
                                                  const Icon(Icons.arrow_right),
                                              title: Text(
                                                  'Start using firestore to uploading content',
                                                  style: GoogleFonts.roboto(
                                                      fontSize: 14))),
                                        ],
                                      ),
                                      ExpansionTile(
                                        tilePadding: constraints.maxWidth > 600
                                            ? null
                                            : EdgeInsets.zero,
                                        childrenPadding: EdgeInsets.zero,
                                        leading: Chip(
                                            side: BorderSide.none,
                                            backgroundColor:
                                                Colors.grey.shade100,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(6)),
                                            label: Text(
                                              '0.0.3+0',
                                              style: GoogleFonts.roboto(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black87),
                                            )),
                                        title: Tooltip(
                                          message:
                                              "Try the new right click menu!!",
                                          child: Text(
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            'New Right Click UI and Snackbar',
                                            style: GoogleFonts.roboto(
                                                fontWeight: FontWeight.w400,
                                                fontSize:
                                                    constraints.maxWidth > 460
                                                        ? null
                                                        : 14),
                                          ),
                                        ),
                                        subtitle: Text(
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          'Added a nice notification snackbar',
                                          style: GoogleFonts.roboto(
                                              color: Colors.black54,
                                              fontSize:
                                                  constraints.maxWidth > 460
                                                      ? null
                                                      : 12),
                                        ),
                                        trailing: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Chip(
                                                side: BorderSide.none,
                                                backgroundColor:
                                                    Colors.grey.shade100,
                                                label: Text(
                                                  constraints.maxWidth > 460
                                                      ? 'September 24'
                                                      : 'Sep 24',
                                                  style: GoogleFonts.roboto(
                                                      fontSize: 12,
                                                      color: Colors.black54),
                                                )),
                                          ],
                                        ),
                                        children: <Widget>[
                                          ListTile(
                                              horizontalTitleGap: 6,
                                              dense: true,
                                              leading:
                                                  const Icon(Icons.arrow_right),
                                              title: Text(
                                                  'New Notification for Link copy ',
                                                  style: GoogleFonts.roboto(
                                                      fontSize: 14))),
                                          ListTile(
                                              horizontalTitleGap: 6,
                                              dense: true,
                                              leading:
                                                  const Icon(Icons.arrow_right),
                                              title: Text(
                                                  'Indicator for creating palette color',
                                                  style: GoogleFonts.roboto(
                                                      fontSize: 14))),
                                          ListTile(
                                              horizontalTitleGap: 6,
                                              dense: true,
                                              leading:
                                                  const Icon(Icons.arrow_right),
                                              title: Text(
                                                  'Update url route method',
                                                  style: GoogleFonts.roboto(
                                                      fontSize: 14))),
                                          ListTile(
                                              horizontalTitleGap: 6,
                                              dense: true,
                                              leading:
                                                  const Icon(Icons.arrow_right),
                                              title: Text(
                                                  'Add right click menu',
                                                  style: GoogleFonts.roboto(
                                                      fontSize: 14))),
                                        ],
                                      ),
                                      ExpansionTile(
                                        tilePadding: constraints.maxWidth > 600
                                            ? null
                                            : EdgeInsets.zero,
                                        childrenPadding: EdgeInsets.zero,
                                        leading: Chip(
                                            side: BorderSide.none,
                                            backgroundColor:
                                                Colors.grey.shade100,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(6)),
                                            label: Text(
                                              '0.0.2+6',
                                              style: GoogleFonts.roboto(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black54),
                                            )),
                                        title: Tooltip(
                                          message: "Go to detail's page",
                                          child: Text(
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            'New palette color mode',
                                            style: GoogleFonts.roboto(
                                                fontWeight: FontWeight.w400,
                                                fontSize:
                                                    constraints.maxWidth > 460
                                                        ? null
                                                        : 14),
                                          ),
                                        ),
                                        subtitle: Text(
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          'Using url path strategy to retain history',
                                          style: GoogleFonts.roboto(
                                              color: Colors.black54,
                                              fontSize:
                                                  constraints.maxWidth > 460
                                                      ? null
                                                      : 12),
                                        ),
                                        trailing: Chip(
                                            side: BorderSide.none,
                                            backgroundColor:
                                                Colors.grey.shade100,
                                            label: Text(
                                              constraints.maxWidth > 460
                                                  ? 'September 19'
                                                  : 'Sep 19',
                                              style: GoogleFonts.roboto(
                                                  fontSize: 12,
                                                  color: Colors.black54),
                                            )),
                                        children: <Widget>[
                                          ListTile(
                                              horizontalTitleGap: 6,
                                              dense: true,
                                              leading:
                                                  const Icon(Icons.arrow_right),
                                              title: Text('Items Card Revamped',
                                                  style: GoogleFonts.roboto(
                                                      fontSize: 14))),
                                          ListTile(
                                              horizontalTitleGap: 6,
                                              dense: true,
                                              leading:
                                                  const Icon(Icons.arrow_right),
                                              title: Text(
                                                  'New 2 items on popup menu',
                                                  style: GoogleFonts.roboto(
                                                      fontSize: 14))),
                                          ListTile(
                                              horizontalTitleGap: 6,
                                              dense: true,
                                              leading:
                                                  const Icon(Icons.arrow_right),
                                              title: Text(
                                                  'Image indicators added',
                                                  style: GoogleFonts.roboto(
                                                      fontSize: 14))),
                                          ListTile(
                                              horizontalTitleGap: 6,
                                              dense: true,
                                              leading:
                                                  const Icon(Icons.arrow_right),
                                              title: Text(
                                                  'Added ability to retain url history',
                                                  style: GoogleFonts.roboto(
                                                      fontSize: 14))),
                                          ListTile(
                                              horizontalTitleGap: 6,
                                              dense: true,
                                              leading:
                                                  const Icon(Icons.arrow_right),
                                              title: Text(
                                                  'Navigation rail added',
                                                  style: GoogleFonts.roboto(
                                                      fontSize: 14))),
                                          ListTile(
                                              horizontalTitleGap: 6,
                                              dense: true,
                                              leading:
                                                  const Icon(Icons.arrow_right),
                                              title: Text(
                                                  'Detail page environment color now match selected image',
                                                  style: GoogleFonts.roboto(
                                                      fontSize: 14)))
                                        ],
                                      ),
                                      ExpansionTile(
                                        tilePadding: constraints.maxWidth > 600
                                            ? null
                                            : EdgeInsets.zero,
                                        childrenPadding: EdgeInsets.zero,
                                        leading: Chip(
                                            side: BorderSide.none,
                                            backgroundColor:
                                                Colors.grey.shade100,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(6)),
                                            label: Text(
                                              '0.0.2+0',
                                              style: GoogleFonts.roboto(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500,
                                                  color: isWebMobile
                                                      ? Colors.black54
                                                      : Colors.black54),
                                            )),
                                        title: Text(
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          'Add Support Up To 4K Monitor or above',
                                          style: GoogleFonts.roboto(
                                              fontWeight: FontWeight.w400,
                                              fontSize:
                                                  constraints.maxWidth > 460
                                                      ? null
                                                      : 14),
                                        ),
                                        subtitle: Text(
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          'Responsive Framework',
                                          style: GoogleFonts.roboto(
                                              color: Colors.black54,
                                              fontSize:
                                                  constraints.maxWidth > 460
                                                      ? null
                                                      : 12),
                                        ),
                                        trailing: Chip(
                                            side: BorderSide.none,
                                            backgroundColor:
                                                Colors.grey.shade100,
                                            label: Text(
                                              constraints.maxWidth > 460
                                                  ? 'September 6'
                                                  : 'Sep 6',
                                              style: GoogleFonts.roboto(
                                                  fontSize: 12,
                                                  color: Colors.black54),
                                            )),
                                        children: <Widget>[
                                          ListTile(
                                              horizontalTitleGap: 6,
                                              dense: true,
                                              leading:
                                                  const Icon(Icons.arrow_right),
                                              title: Text(
                                                  'Fix inconsistent text and button on some devices',
                                                  style: GoogleFonts.roboto(
                                                      fontSize: 14))),
                                          ListTile(
                                              horizontalTitleGap: 6,
                                              dense: true,
                                              leading:
                                                  const Icon(Icons.arrow_right),
                                              title: Text(
                                                  'Ipad and Surface product display fixed',
                                                  style: GoogleFonts.roboto(
                                                      fontSize: 14))),
                                          ListTile(
                                              horizontalTitleGap: 6,
                                              dense: true,
                                              leading:
                                                  const Icon(Icons.arrow_right),
                                              title: Text(
                                                  'Dragging or Scrolling in description and comments section now will expand it',
                                                  style: GoogleFonts.roboto(
                                                      fontSize: 14))),
                                          ListTile(
                                              horizontalTitleGap: 6,
                                              dense: true,
                                              leading:
                                                  const Icon(Icons.arrow_right),
                                              title: Text(
                                                  'Using CanvasKit as default renderer',
                                                  style: GoogleFonts.roboto(
                                                      fontSize: 14))),
                                          ListTile(
                                              horizontalTitleGap: 6,
                                              dense: true,
                                              leading:
                                                  const Icon(Icons.arrow_right),
                                              title: Text(
                                                  'Html renderer removed (cause lag issue on some devices)',
                                                  style: GoogleFonts.roboto(
                                                      fontSize: 14))),
                                        ],
                                      ),
                                      ExpansionTile(
                                        tilePadding: constraints.maxWidth > 600
                                            ? null
                                            : EdgeInsets.zero,
                                        childrenPadding: EdgeInsets.zero,
                                        leading: Chip(
                                            side: BorderSide.none,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(4)),
                                            backgroundColor:
                                                Colors.grey.shade100,
                                            label: Text(
                                              '0.0.1+4',
                                              style: GoogleFonts.roboto(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500,
                                                  color: isWebMobile
                                                      ? Colors.black54
                                                      : Colors.black54),
                                            )),
                                        title: Text(
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          'Added Card Widget for Update Log',
                                          style: GoogleFonts.roboto(
                                              fontWeight: FontWeight.w400,
                                              fontSize:
                                                  constraints.maxWidth > 460
                                                      ? null
                                                      : 14),
                                        ),
                                        subtitle: Text(
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          'Trailing expansion list model',
                                          style: GoogleFonts.roboto(
                                              color: Colors.black54,
                                              fontSize:
                                                  constraints.maxWidth > 460
                                                      ? null
                                                      : 12),
                                        ),
                                        trailing: Chip(
                                            side: BorderSide.none,
                                            backgroundColor:
                                                Colors.grey.shade100,
                                            label: Text(
                                              constraints.maxWidth > 460
                                                  ? 'August 29'
                                                  : 'Aug 29',
                                              style: GoogleFonts.roboto(
                                                  fontSize: 12,
                                                  color: Colors.black54),
                                            )),
                                        children: <Widget>[
                                          ListTile(
                                              horizontalTitleGap: 6,
                                              dense: true,
                                              leading:
                                                  const Icon(Icons.arrow_right),
                                              title: Text(
                                                  'Added comment section',
                                                  style: GoogleFonts.roboto(
                                                      fontSize: 14))),
                                          ListTile(
                                              horizontalTitleGap: 6,
                                              dense: true,
                                              leading:
                                                  const Icon(Icons.arrow_right),
                                              title: Text(
                                                  'Tagged item now has an icon',
                                                  style: GoogleFonts.roboto(
                                                      fontSize: 14))),
                                          ListTile(
                                              horizontalTitleGap: 6,
                                              dense: true,
                                              leading:
                                                  const Icon(Icons.arrow_right),
                                              title: Text(
                                                  'Proper Description implemented',
                                                  style: GoogleFonts.roboto(
                                                      fontSize: 14))),
                                          ListTile(
                                              horizontalTitleGap: 6,
                                              dense: true,
                                              leading:
                                                  const Icon(Icons.arrow_right),
                                              title: Text(
                                                  'Visual improvement on no search result',
                                                  style: GoogleFonts.roboto(
                                                      fontSize: 14))),
                                          ListTile(
                                              horizontalTitleGap: 6,
                                              dense: true,
                                              leading:
                                                  const Icon(Icons.arrow_right),
                                              title: Text(
                                                  'Apps dependencies updated',
                                                  style: GoogleFonts.roboto(
                                                      fontSize: 14))),
                                          ListTile(
                                              horizontalTitleGap: 6,
                                              dense: true,
                                              leading:
                                                  const Icon(Icons.arrow_right),
                                              title: Text(
                                                  'Search function in homepage is working for now',
                                                  style: GoogleFonts.roboto(
                                                      fontSize: 14))),
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              ]),
                        ),
                      ]),
                ),
              ),
            ),
          ),
        );
      },
    );
  });
}

// YouTube Card
class CardYoutube extends StatelessWidget {
  const CardYoutube({
    super.key, 
    required this.thumbnails, 
    required this.paletteColor, 
    required this.colorIndex, 
    required this.paletteLoaded
  });

  final String thumbnails;
  final List<dynamic> paletteColor;
  final int colorIndex;
  final bool paletteLoaded;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Card(
          color: paletteLoaded
              ? colorLightButton(paletteColor[colorIndex].color)
              : Colors.grey.shade100,
          elevation: 0,
          child: InkWell(
            borderRadius: BorderRadius.circular(12),
            hoverColor: paletteLoaded
                ? colorLight(paletteColor[colorIndex].color, .7)
                : Colors.grey.shade200,
            splashColor: paletteLoaded
                ? colorLight(paletteColor[colorIndex].color, .8)
                : Colors.grey.shade50,
            onTap: () {},
            child: Padding(
              padding: constraints.maxWidth > 320
                  ? const EdgeInsets.symmetric(vertical: 12, horizontal: 12)
                  : EdgeInsets.zero,
              child: IntrinsicHeight(
                child: Flex(
                  direction: constraints.maxWidth > 320 ? Axis.horizontal : Axis.vertical,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    AspectRatio(
                      aspectRatio: constraints.maxWidth > 320 ? 1.2 : 16 / 9,
                      child: Stack(fit: StackFit.expand, children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image(
                              height: 70,
                              image: ResizeImage(AssetImage(thumbnails), height: 300, width: 450),
                              fit: BoxFit.cover),
                        ),
                        Align(
                            alignment: Alignment.bottomRight,
                            child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    color: Colors.grey.shade800),
                                margin: const EdgeInsets.all(10),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 1),
                                child: Text('12:53',
                                    style: GoogleFonts.roboto(color: Colors.white))))
                      ]),
                    ),
                    Flexible(
                      child: Padding(
                          padding: constraints.maxWidth > 320
                              ? const EdgeInsets.fromLTRB(15, 4, 2, 4)
                              : const EdgeInsets.fromLTRB(15, 8, 2, 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Flexible(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      'Sheep Overflow Easy Tutorial',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.roboto(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const Padding(padding: EdgeInsets.only(bottom: 2.0)),
                                    Text(
                                      'An complete tutorial for Beginner to Adapt into',
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.roboto(
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black54,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: constraints.maxWidth > 320 ? null : 8),
                              Flexible(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    Text(
                                      "Raze Im",
                                      style: GoogleFonts.roboto(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black87,
                                      ),
                                    ),
                                    RichText(
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: 'Sep 2 • 12 min  ',
                                            style: GoogleFonts.roboto(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black54)),
                                          const WidgetSpan(
                                            child: Padding(
                                              padding: EdgeInsets.only(bottom: 1),
                                              child: Icon(Icons.star,
                                                  size: 12, color: Colors.black54),
                                            ),
                                          ),
                                          const WidgetSpan(
                                            child: Padding(
                                              padding: EdgeInsets.only(bottom: 1),
                                              child: Icon(Icons.star,
                                                  size: 12, color: Colors.black54),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }
    );
  }
}

// Comment Card
class CardComment extends StatefulWidget {
  const CardComment({
    Key? key, 
    required this.paletteLoaded,
    this.palettecolor, 
    this.dominantcolor, 
    this.colorindex,
  }) : super(key: key);

  final bool paletteLoaded;
  final List? palettecolor;
  final List? dominantcolor;
  final int? colorindex;

  @override
  State<CardComment> createState() => _CardCommentState();
}

bool expandComment = false;

class _CardCommentState extends State<CardComment> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        useMaterial3: true,
        iconButtonTheme: IconButtonThemeData(
          style: ButtonStyle(
              foregroundColor: MaterialStatePropertyAll(
                widget.paletteLoaded
                  ? colorLightButton(paletteDominantColors[widget.colorindex!].color, .15)
                  : Colors.black54,
              )
          )
        ),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.7))),
            foregroundColor: MaterialStateProperty.resolveWith((states) {
              return states.contains(MaterialState.hovered)
                ? widget.paletteLoaded
                  ? colorLight(paletteDominantColors[widget.colorindex!].color, .1)
                  : Colors.white
                : widget.paletteLoaded
                  ? colorLight(paletteDominantColors[widget.colorindex!].color, .2)
                  : null;
            }),
            backgroundColor: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.pressed)) {
                widget.paletteLoaded
                  ? colorLight(paletteDominantColors[widget.colorindex!].color, .75)
                  : Colors.white;
              }
              return states.contains(MaterialState.hovered)
                ? widget.paletteLoaded
                  ? colorLight(paletteDominantColors[widget.colorindex!].color, .7)
                  : Colors.white
                : widget.paletteLoaded
                  ? colorLight(paletteDominantColors[widget.colorindex!].color)
                  : null;
            })
          ),
        )
      ),
      child: Card(
        elevation: 0,
        color: widget.paletteLoaded
            ? colorLight(widget.dominantcolor![widget.colorindex!].color)
            : Colors.grey.shade100,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          hoverColor: widget.paletteLoaded
              ? colorLightButton(widget.dominantcolor![widget.colorindex!].color)
              : Colors.grey.shade200,
          splashColor: widget.paletteLoaded
              ? colorLight(widget.dominantcolor![widget.colorindex!].color, .7)
              : Colors.grey.shade50,
          onTap: () {
            expandComment == false
              ? setState(() => expandComment = true)
              : setState(() => expandComment = false);          
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                tileColor: Colors.transparent,
                contentPadding:  const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                horizontalTitleGap: 14,
                leading: CircleAvatar(
                  foregroundColor: widget.paletteLoaded
                      ? colorLight(widget.dominantcolor![widget.colorindex!].color, .125)
                      : null,
                  backgroundColor: widget.paletteLoaded
                      ? colorLight(widget.dominantcolor![widget.colorindex!].color)
                      : null,
                  maxRadius: 18,
                  child: const Icon(Icons.face, size: 40)),
                title: Text('Chat Bots',
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w600
                  )
                ),
                subtitle: Text('December 12, 7:27 PM'.toUpperCase(),
                  style: GoogleFonts.roboto(
                    color: Colors.grey.shade700,                    
                    letterSpacing: 0.4,
                    fontSize: 12, 
                    fontWeight: FontWeight.w600
                  )
                ),
                trailing: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: Icon(expandComment ? Icons.expand_less : Icons.expand_more),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 0, top: 2),
                child: Text(
                  maxLines: expandComment ? 10 : 3,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.grey.shade800,
                    height: 1.4),
                  "I'm dedicating every day to you Domestic life was never quite my style When you smile, " 
                  "you knock me out, I fall apart! And I thought I was so smart. It's great to think highly of yourself and to believe in your abilities. " 
                  "Intelligence is not a fixed trait, and it can vary from situation to situation. It's important to continue learning and growing in order to develop your intelligence and become the best version of yourself.",
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(12, expandComment ? 12 : 8, 16, 8),
                child: ButtonBar(
                  buttonPadding: EdgeInsets.zero,
                  buttonMinWidth: 0,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: expandComment
                        ? null
                        : widget.paletteLoaded
                          ? colorLight(widget.dominantcolor![widget.colorindex!].color, .825)
                          : Colors.white,
                        borderRadius: BorderRadius.circular(25.7)
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          AnimatedSwitcher(
                            duration: const Duration(milliseconds: 600),
                            child: expandComment
                              ? TextButton.icon(
                                  style: const ButtonStyle(
                                    padding: MaterialStatePropertyAll(
                                      EdgeInsets.only(left: 8, right: 10))
                                  ),
                                  onPressed: () {},
                                  icon: const Icon(Icons.add_reaction, size: 20),
                                  label: const Text('Add Reaction', 
                                    style: TextStyle(fontWeight: FontWeight.w600))
                                )
                              : IconButton(
                                  visualDensity: VisualDensity.compact,
                                  tooltip: 'Add Reaction',
                                  onPressed: () {},
                                  icon: const Icon(Icons.add_reaction, size: 20)
                                ),
                          ),
                          SizedBox(width: expandComment ? 8 : null),
                          AnimatedSwitcher(
                            duration: const Duration(milliseconds: 600),
                            child: expandComment
                              ? TextButton.icon(
                                  style: const ButtonStyle(
                                    padding: MaterialStatePropertyAll(
                                      EdgeInsets.only(left: 8, right: 10))
                                  ),
                                  onPressed: () {}, 
                                  icon: const Icon(Icons.comment, size: 20),
                                  label: const Text('Reply', 
                                    style: TextStyle(fontWeight: FontWeight.w600))
                                )
                              : IconButton(
                                  visualDensity: VisualDensity.compact,
                                  tooltip: 'Reply',
                                  onPressed: () {},
                                  icon: const Icon(Icons.comment, size: 20)
                                )
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CardResourceList extends StatefulWidget {
  const CardResourceList({
    super.key, 
    required this.index, 
    required this.smallLayouts, 
    required this.snapshots
  });

  final int index;
  final bool smallLayouts; 
  final AsyncSnapshot snapshots;

  @override
  State<CardResourceList> createState() => _CardResourceListState();
}

class _CardResourceListState extends State<CardResourceList> {
  bool isListHovered = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String name = widget.snapshots.data[widget.index]['name'];
    String shorten(String name) {
      return name = "${name.substring(0, 15)}...";
    }

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return AnimatedSlide(
          curve: Curves.easeOutExpo,
          duration: const Duration(milliseconds: 600),
          offset: isListHovered
            ? const Offset(0.0, -0.03)
            : const Offset(0.0, 0.0),
          child: InkWell(
            onHover: (value) => setState(() => isListHovered = value),
            onTap: () => context.push('/resource'),
            overlayColor: const MaterialStatePropertyAll(Colors.transparent),
            child: Card(
              color: Colors.transparent,
              surfaceTintColor: Colors.transparent,
              elevation: isListHovered ? 4 : 0,
              shadowColor: isListHovered ? Colors.blue : Colors.black,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 600),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(isListHovered ? 0.0 : 0.5), 
                      BlendMode.saturation),
                    image: MemoryImage(widget.snapshots.data[widget.index]['images'].last))
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: const [0, 0.5, 1.0],
                          colors: <Color>[
                            isListHovered ? Colors.black26 : Colors.black12,
                            isListHovered ? Colors.black38 : Colors.black26,
                            isListHovered ? Colors.black87 : Colors.black54
                          ],
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 500),
                        decoration: BoxDecoration(
                          border: isListHovered
                            ? const Border(bottom: BorderSide(color: Colors.blue, width: 4))
                            : const Border(bottom: BorderSide(color: Colors.blue, width: 3)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: SizedBox(
                            height: widget.smallLayouts ? 120 : 90,
                            child: Flex(
                              direction: Axis.horizontal,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(12),
                                      child: AnimatedScale(
                                        curve: Curves.easeOut,
                                        duration: const Duration(milliseconds: 800),
                                        scale: isListHovered ? 1.05 : 1,
                                        child: AspectRatio(
                                          aspectRatio: widget.smallLayouts ? 1 / 0.8 : 1 / 0.85,
                                          child: Image(
                                            image: MemoryImage(widget.snapshots.data[widget.index]['images'].first),
                                            frameBuilder: (BuildContext context,
                                                Widget child,
                                                int? frame,
                                                bool wasSynchronouslyLoaded) {
                                              return imageFrameBulilder(child, frame, wasSynchronouslyLoaded);
                                            },
                                            loadingBuilder: (BuildContext context,
                                                Widget child,
                                                ImageChunkEvent? loadingProgress) {
                                              return imageLoadingBuilder(child, loadingProgress);
                                            },
                                            fit: BoxFit.cover
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 2, left: 12),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(left: 1),
                                                child: Text(
                                                  widget.snapshots.data[widget.index]['brand']
                                                    .toString()
                                                    .toTitleCase(),
                                                  style: TextStyle(
                                                    color: Colors.grey.shade300,
                                                    fontSize: widget.smallLayouts ? 14 : 12,
                                                    fontWeight: FontWeight.w500,
                                                    shadows: const [
                                                      Shadow(
                                                        color: Colors.black45,
                                                        offset: Offset(1, 1),
                                                        blurRadius: 2
                                                      ),
                                                    ],
                                                  )
                                                ),
                                              ),
                                              Text(
                                                widget.smallLayouts ? name : shorten(name),
                                                style: TextStyle(
                                                  letterSpacing: -0.25,
                                                  height: isWebMobile ? null : 0.0,
                                                  fontSize: widget.smallLayouts ? 20 : 16,
                                                  color: Colors.white,
                                                  shadows: const [
                                                    Shadow(
                                                      color: Colors.black45,
                                                      offset: Offset(1, 1),
                                                      blurRadius: 2
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Visibility(
                                                visible: widget.smallLayouts ? true : false,
                                                child: Padding(
                                                  padding: const EdgeInsets.only(top: 6),
                                                  child: Theme(
                                                    data: Theme.of(context).copyWith(
                                                      splashColor: Colors.blue.shade300,
                                                      canvasColor: Colors.blue.shade600,
                                                      hoverColor: Colors.blue.shade700
                                                    ),
                                                    child: ActionChip(
                                                      onPressed: () {},
                                                      padding: const EdgeInsets.only(left:8, right: 8),
                                                      labelPadding: EdgeInsets.zero,
                                                      visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
                                                      side: BorderSide.none,
                                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                                                      label: Text(
                                                        '${widget.snapshots.data[widget.index]['category']}',
                                                        style: TextStyle(
                                                            color: Colors.grey.shade200,
                                                            fontWeight: FontWeight.w500,
                                                            fontSize: 12)
                                                        )
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          widget.smallLayouts 
                                          ? AnimatedSize(
                                            curve: Curves.ease,
                                            duration: const Duration(milliseconds: 300),
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.circular(25.7),
                                              child: SizedBox(
                                                width: widget.smallLayouts 
                                                  ? constraints.maxWidth - 290
                                                  : constraints.maxWidth - 270,
                                                child: ScrollConfiguration(
                                                  behavior: DragOnScroll(),
                                                  child: SingleChildScrollView(
                                                    scrollDirection: Axis.horizontal,
                                                    child: Wrap(
                                                      spacing: 8,
                                                      children: List.generate(widget.snapshots.data[widget.index]['tags'].length, (i) {
                                                        return Theme(
                                                          data: Theme.of(context).copyWith(
                                                            splashColor: Colors.grey.shade300,
                                                            canvasColor: Colors.grey.shade800,
                                                            hoverColor: Colors.grey.shade700,
                                                          ),
                                                          child: FilterChip(
                                                            visualDensity: const VisualDensity(vertical: -4, horizontal: -4),
                                                            padding: const EdgeInsets.symmetric(horizontal: 1),
                                                            side: BorderSide.none,
                                                            shape: RoundedRectangleBorder(
                                                              borderRadius: BorderRadius.circular(25.7)),
                                                            onSelected: (value) {},
                                                            label: Text(
                                                              widget.snapshots.data[widget.index]['tags'][i],
                                                              style: TextStyle(
                                                                letterSpacing: 0.6,
                                                                fontWeight: FontWeight.w500,
                                                                color: Colors.grey.shade200,
                                                                fontSize: 10)
                                                            ),
                                                          ),
                                                        );
                                                      }),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          )
                                          : Chip(
                                              padding: const EdgeInsets.only(right: 8),
                                              labelPadding: EdgeInsets.zero,
                                              visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
                                              backgroundColor: Colors.grey.shade600,
                                              side: BorderSide.none,
                                              avatar: Icon(widget.snapshots.data[widget.index]['icon'].first
                                                      .toString()
                                                      .iconParse,
                                                    size: 16,
                                                    color: isListHovered
                                                      ? Colors.grey.shade300
                                                      : Colors.grey.shade200),
                                              label: Text(
                                                '${widget.snapshots.data[widget.index]['category']}',
                                                style: TextStyle(
                                                    color: isListHovered
                                                        ? Colors.grey.shade300
                                                        : Colors.grey.shade200,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 12)
                                                )
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(right: 8),
                                      child: Text(
                                        widget.snapshots.data[widget.index]['time'],
                                        style: TextStyle(
                                            color: isListHovered
                                                ? Colors.grey.shade100
                                                : Colors.grey.shade200,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12,
                                            shadows: const [
                                              Shadow(
                                                color: Colors.black45,
                                                offset: Offset(1, 1),
                                                blurRadius: 2
                                              ),
                                            ],
                                        )
                                      ),
                                    ),
                                    AnimatedSwitcher(
                                      duration: const Duration(milliseconds: 200),
                                      child: widget.smallLayouts
                                        ? buttonResourceItem()
                                        : buttonResourceItemSmall(),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}  

class CardResource extends StatefulWidget {
  const CardResource(
      {super.key, required this.layouts, required this.smalllayouts});
  final bool layouts;
  final bool smalllayouts;

  @override
  State<CardResource> createState() => _CardResourceState();
}

final String date = DateFormat("MMMM dd").format(DateTime.now());
bool isHovered = false;
bool isHeaderHovered = false;
bool isTileExpanded = false;
bool _loading = true;
AsyncSnapshot _data = const AsyncSnapshot.nothing();

String resultCount(int data) {    
  String count = 'No Result';
  if (data == 1) {
    count = 'About $data Results';
    return count;
  } else if (data > 1) {
    count = 'About $data Results';
    return count;
  }
  return count;
}
    

class _CardResourceState extends State<CardResource> {
  late Future _loadItems;

  @override
  void initState() {
    super.initState();
    _loadItems = loadItems().whenComplete(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        setState(() {
          _loading = false;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, setParentState) => InkWell(
        hoverColor: Colors.transparent,
        splashFactory: NoSplash.splashFactory,
        mouseCursor: SystemMouseCursors.basic,
        onTap: () {},
        onHover: (value) {
          setParentState(() {
            isHovered = value;
          });
        },
        child: Card(
          color: isHovered ? Colors.white : Colors.white70,
          elevation: 0,
          clipBehavior: Clip.antiAlias,
          child: Column(
            children: [
              /* Visibility(
                visible: _loading ? true : false,
                child: const LinearProgressIndicator()
              ), */
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Theme(
                  data: ThemeData(
                    hoverColor: Colors.transparent,
                    splashFactory: NoSplash.splashFactory,
                    useMaterial3: true,
                  ).copyWith(dividerColor: Colors.transparent),
                  child: ListTileTheme(
                    horizontalTitleGap: -6,
                    contentPadding: const EdgeInsets.only(left: 6),
                    dense: true,
                    child: ExpansionTile(
                      expandedAlignment: Alignment.topLeft,
                      expandedCrossAxisAlignment: CrossAxisAlignment.start,
                      onExpansionChanged: (value) => setState(() => isTileExpanded = value),
                      initiallyExpanded: true,
                      leading: MouseRegion(
                        onEnter: (event) => setParentState(() => isHeaderHovered = true),
                        onExit: (event) => setParentState(() => isHeaderHovered = false),
                        child: Icon(
                            isHovered
                              ? Icons.view_in_ar_outlined
                              : Icons.view_in_ar,
                            color: isHovered 
                              ? Colors.black87 
                              : Colors.black54,
                            size: 22),
                      ),
                      title: MouseRegion(
                        onEnter: (event) => setParentState(() => isHeaderHovered = true),
                        onExit: (event) => setParentState(() => isHeaderHovered = false),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(_loading
                              ? 'Resource'.toUpperCase()
                              : 'Resource   · '.toUpperCase(),
                              style: TextStyle(
                                color: isHovered 
                                  ? Colors.black87 
                                  : Colors.black54,
                                fontSize: 14,
                                fontWeight: FontWeight.w600)
                              ),
                              TextButton(
                                style: ButtonStyle(
                                  foregroundColor: MaterialStateProperty.resolveWith((states) {
                                    return states.contains(MaterialState.hovered)
                                      ? Colors.blue.shade700
                                      : Colors.blue.shade500;
                                  }),
                                  visualDensity: const VisualDensity(horizontal: -4, vertical: -4)
                                ),
                                onPressed: () {},
                                child: Text(!_data.hasData 
                                ? _loading 
                                  ? 'Please Wait' 
                                  : resultCount(_data.data.length)
                                : resultCount(_data.data.length), 
                                    style: GoogleFonts.roboto(
                                      fontSize: 12, 
                                      fontWeight: FontWeight.w500
                                    )
                                ),
                              ),
                          ],
                        ),
                      ),
                      trailing: MouseRegion(
                        onEnter: (event) => setParentState(() => isHeaderHovered = true),
                        onExit: (event) => setParentState(() => isHeaderHovered = false),
                        child: Theme(
                          data: ThemeData(useMaterial3: true),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.more_horiz, size: 18, color: Colors.black54)
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.tune, size: 18, color: Colors.black54)
                              ),
                              AnimatedSize(
                                duration: const Duration(milliseconds: 200),
                                child: AnimatedOpacity(
                                  duration: const Duration(milliseconds: 100),
                                  opacity: isHeaderHovered ? 1 : 0,
                                  child: SizedBox(
                                    width: isHeaderHovered ? null : 0,
                                    child: IconButton(
                                      mouseCursor: SystemMouseCursors.click,
                                      onPressed: null,
                                      icon: Icon(
                                        isTileExpanded
                                          ? Icons.remove_circle
                                          : Icons.expand_circle_down,
                                        size: 18,
                                        color: Colors.black54
                                      )
                                    ),
                                  ),
                                )
                              )
                            ],
                          ),
                        ),
                      ),
                      children: [
                        FutureBuilder(
                          future: _loadItems,
                          builder: (context, AsyncSnapshot snapshot) {
                            if (snapshot.connectionState == ConnectionState.done) _data = snapshot;
                            
                            return ShimmerLoading(
                              duration: const Duration(seconds: 5),
                              isLoading: snapshot.connectionState == ConnectionState.waiting,
                              border: BorderRadius.circular(12),
                              builder: ShimmerCardResourceList(smallLayouts: widget.smalllayouts),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ListView.builder(
                                    physics: const ClampingScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: snapshot.connectionState == ConnectionState.done 
                                      ? snapshot.data.length
                                      : 2,
                                    itemBuilder: (context, index) {
                                      return Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          const SizedBox(height: 6),
                                          CardResourceList(
                                            index: index, 
                                            smallLayouts: widget.smalllayouts, 
                                            snapshots: snapshot),
                                          const SizedBox(height: 6)
                                        ],
                                      );
                                    }
                                  ),
                                  AnimatedSize(
                                    curve: Curves.easeOut,
                                    duration: const Duration(milliseconds: 200),
                                    child: SizedBox(
                                      height: isHovered || isWebMobile ? null : 0,
                                      child: Column(
                                        children: [
                                          const SizedBox(height: 8),
                                          ElevatedButton.icon(
                                            style: ButtonStyle(
                                              visualDensity: VisualDensity.compact,
                                              foregroundColor: MaterialStateProperty.resolveWith((states) {
                                                if (states.contains(MaterialState.hovered) 
                                                || states.contains(MaterialState.pressed)) {
                                                  return Colors.black54;
                                                }
                                                return Colors.black38;
                                              }),
                                              backgroundColor: MaterialStatePropertyAll(Colors.grey.shade50),
                                              elevation: const MaterialStatePropertyAll(0)),
                                            onPressed: () => context.push('/resource'),
                                            icon: const Icon(Icons.refresh, size: 14),
                                            label: Text(
                                              'Load More',
                                              style: GoogleFonts.roboto(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 12
                                              ),
                                            )
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ]
                              ),
                            );
                          },
                        ),
                      ]
                    ),
                  ),
                ),
              ),
            ],
          )
        ),
      ),
    );
  }
}
