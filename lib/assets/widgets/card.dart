import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import 'package:gimmic/assets/widgets/builder.dart';
import 'package:gimmic/assets/widgets/button.dart';
import '../functions/colors.dart';
import '../functions/platform.dart';
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
            color: Colors.blue.shade200,
            margin: const EdgeInsets.all(0),
            elevation: cardSelected ? 8 : 0,
            shadowColor: Colors.black,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: cardSelected ? BorderSide.none : BorderSide.none),
            clipBehavior: Clip.antiAlias,
            semanticContainer: true,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: widget.rowConstraints.maxWidth,
                maxHeight: widget.useVLayout
                    ? MediaQuery.of(context).size.width / 3.5
                    : MediaQuery.of(context).size.width / 1.5,
              ),
              child: AspectRatio(
                aspectRatio: 1 / 1,
                child: Stack(fit: StackFit.expand, children: [
                  AnimatedCrossFade(
                    layoutBuilder:
                        ((topChild, topChildKey, bottomChild, bottomChildKey) {
                      return Stack(
                        fit: StackFit.expand,
                        clipBehavior: Clip.none,
                        alignment: Alignment.center,
                        children: [
                          Positioned(key: bottomChildKey, child: bottomChild),
                          Positioned(key: topChildKey, child: topChild)
                        ],
                      );
                    }),
                    duration: const Duration(milliseconds: 300),
                    crossFadeState: widget.useVHideDetails
                        ? CrossFadeState.showFirst
                        : CrossFadeState.showSecond,
                    firstChild: ClipRect(
                      child: AnimatedScale(
                        curve: Curves.easeOut,
                        duration: const Duration(milliseconds: 600),
                        scale: cardSelected ? 1.025 : 1,
                        child: Image.network(
                          'https://source.unsplash.com/random',
                          // image: const AssetImage("images/hellocat1.jpg"),
                          fit: BoxFit.cover,
                          frameBuilder: (BuildContext context, Widget child,
                                  int? frame, bool wasSynchronouslyLoaded) =>
                              imageFrameBulilder(
                                  child, frame, wasSynchronouslyLoaded),
                          loadingBuilder: (BuildContext context, Widget child,
                                  ImageChunkEvent? loadingProgress) =>
                              imageLoadingBuilder(child, loadingProgress),
                        ),
                      ),
                    ),
                    secondChild: ClipRect(
                      child: AnimatedScale(
                        curve: Curves.easeOut,
                        duration: const Duration(milliseconds: 600),
                        scale: cardSelected ? 1.025 : 1,
                        child: Image.network(
                          'https://source.unsplash.com/random',
                          // image: const AssetImage("images/hellocat.jpg"),
                          fit: BoxFit.cover,
                          frameBuilder: (BuildContext context, Widget child,
                                  int? frame, bool wasSynchronouslyLoaded) =>
                              imageFrameBulilder(
                                  child, frame, wasSynchronouslyLoaded),
                          loadingBuilder: (BuildContext context, Widget child,
                                  ImageChunkEvent? loadingProgress) =>
                              imageLoadingBuilder(child, loadingProgress),
                        ),
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
                                      style: GoogleFonts.roboto(
                                          shadows: [
                                            const Shadow(
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
                                                style: GoogleFonts.roboto(
                                                    shadows: [
                                                      const Shadow(
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
                                style: GoogleFonts.roboto(
                                    fontSize: widget.useVHideDetails ? 24 : 18,
                                    fontWeight: FontWeight.w300,
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
                                              '0.0.3+0',
                                              style: GoogleFonts.roboto(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500,
                                                  color: isWebMobile
                                                      ? Colors.blue
                                                      : Colors.blue),
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
                                            const Icon(Icons.fiber_new_outlined,
                                                color: Colors.blue, size: 28),
                                            const SizedBox(width: 8),
                                            Chip(
                                                side: BorderSide.none,
                                                backgroundColor:
                                                    Colors.grey.shade50,
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
                                                Colors.grey.shade50,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(6)),
                                            label: Text(
                                              '0.0.2+6',
                                              style: GoogleFonts.roboto(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500,
                                                  color: isWebMobile
                                                      ? Colors.black54
                                                      : Colors.black54),
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
                                                Colors.grey.shade50,
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
                                                Colors.grey.shade50,
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
                                                Colors.grey.shade50,
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
Widget cardYoutube(thumbnails, palettecolor, colorindex) {
  return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
    return Card(
      color: palettecolor.isEmpty
          ? Colors.grey.shade100
          : colorLight(palettecolor[colorindex].color, .1),
      elevation: 0,
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        hoverColor: palettecolor.isEmpty
            ? Colors.grey.shade200
            : colorLight(palettecolor[colorindex].color, .0),
        splashColor: palettecolor.isEmpty
            ? Colors.grey.shade50
            : colorLightText(palettecolor[colorindex].color, .2),
        onTap: () {},
        child: Padding(
          padding: constraints.maxWidth > 320
              ? const EdgeInsets.symmetric(vertical: 12, horizontal: 12)
              : EdgeInsets.zero,
          child: IntrinsicHeight(
            child: Flex(
              direction:
                  constraints.maxWidth > 320 ? Axis.horizontal : Axis.vertical,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                AspectRatio(
                  aspectRatio: constraints.maxWidth > 320 ? 1.2 : 16 / 9,
                  child: Stack(fit: StackFit.expand, children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image(
                          height: 70,
                          image: AssetImage(thumbnails),
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
                                style:
                                    GoogleFonts.roboto(color: Colors.white))))
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
                              children: const <Widget>[
                                Text(
                                  'Sheep Overflow Easy Tutorial',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Padding(padding: EdgeInsets.only(bottom: 2.0)),
                                Text(
                                  'An complete tutorial for Beginner to Adapt into',
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.black54,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                              height: constraints.maxWidth > 320 ? null : 8),
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                const Text(
                                  "Raze Im",
                                  style: TextStyle(
                                    fontSize: 12,
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
  });
}

// Comment Card
class CardComment extends StatefulWidget {
  const CardComment(
      {Key? key, this.palettecolor, this.dominantcolor, this.colorindex})
      : super(key: key);
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
    return Card(
      elevation: 0,
      color: widget.palettecolor == null
          ? Colors.grey.shade100
          : colorLight(widget.palettecolor![widget.colorindex!].color, .2),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        hoverColor: widget.palettecolor == null
            ? Colors.grey.shade200
            : colorLight(widget.palettecolor![widget.colorindex!].color, .0),
        splashColor: widget.palettecolor == null
            ? Colors.grey.shade50
            : colorLightText(
                widget.palettecolor![widget.colorindex!].color, .1),
        onTap: () {
          if (expandComment == false) {
            setState(() {
              expandComment = true;
            });
          } else {
            setState(() {
              expandComment = false;
            });
          }
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
              horizontalTitleGap: 10,
              leading: CircleAvatar(
                  foregroundColor: widget.dominantcolor == null
                      ? null
                      : colorDark(
                          widget.dominantcolor![widget.colorindex!].color, .8),
                  backgroundColor: widget.palettecolor == null
                      ? null
                      : colorLight(
                          widget.palettecolor![widget.colorindex!].color),
                  maxRadius: 18,
                  child: const Icon(Icons.face, size: 36)),
              title: Text('Comment Bots',
                  style: GoogleFonts.roboto(fontWeight: FontWeight.w600)),
              subtitle: Text('August 30, 7:27PM',
                  style: GoogleFonts.roboto(
                      fontSize: 12, fontWeight: FontWeight.w600)),
              trailing: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Icon(
                        expandComment ? Icons.expand_less : Icons.expand_more),
                  ),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 20, right: 20, bottom: 0, top: 2),
              child: Text(
                maxLines: expandComment ? 10 : 2,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.roboto(
                    color: Colors.black87,
                    fontWeight: FontWeight.w400,
                    height: 1.4),
                "I'm dedicating every day to you Domestic life was never quite my style When you smile, you knock me out, I fall apart! And I thought I was so smart",
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ButtonBar(
                buttonPadding: EdgeInsets.zero,
                buttonMinWidth: 0,
                children: [
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 600),
                    child: expandComment
                        ? IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {},
                            icon: TextButton(
                                onPressed: () {},
                                child: const Text('Add Reaction')))
                        : IconButton(
                            tooltip: 'Add Reaction',
                            onPressed: () {},
                            icon: const Icon(Icons.add_reaction,
                                color: Colors.black54, size: 22)),
                  ),
                  AnimatedSwitcher(
                      duration: const Duration(milliseconds: 600),
                      child: expandComment
                          ? IconButton(
                              padding: EdgeInsets.zero,
                              onPressed: () {},
                              icon: TextButton(
                                  onPressed: () {}, child: const Text('Reply')))
                          : IconButton(
                              tooltip: 'Reply',
                              onPressed: () {},
                              icon: const Icon(
                                Icons.reply,
                                color: Colors.black54,
                              )))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

// Resource Tile Card
bool isListHovered = false;
Widget cardResourceListTile(widget) {
  return StatefulBuilder(
    builder: (context, setState) {
      return SizedBox(
        height: widget.smalllayouts ? 110 : 90,
        child: Theme(
          data: ThemeData(useMaterial3: true),
          child: InkWell(
            onHover: (value) => setState(() => isListHovered = value),
            onTap: () => context.push('/resource'),
            splashColor: Colors.blueGrey.shade50,
            borderRadius: BorderRadius.circular(12),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 200),
                        child: widget.smalllayouts
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: AnimatedScale(
                                    curve: Curves.easeOutQuart,
                                    duration: const Duration(milliseconds: 600),
                                    scale: isListHovered ? 1.05 : 1,
                                    child:
                                        Image(image: AssetImage(widget.image))))
                            : ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: AspectRatio(
                                  aspectRatio: 1 / 1,
                                  child: AnimatedScale(
                                    curve: Curves.easeOutQuart,
                                    duration: const Duration(milliseconds: 600),
                                    scale: isListHovered ? 1.025 : 1,
                                    child: Image(
                                        image: AssetImage(widget.image),
                                        fit: BoxFit.cover),
                                  ),
                                ),
                              ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: widget.smalllayouts ? 2 : 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.name,
                                  style: GoogleFonts.roboto(
                                      letterSpacing: -0.25,
                                      height: 0.0,
                                      fontSize: widget.smalllayouts ? 22 : 18,
                                      color: Colors.black87),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 1),
                                  child: Text(widget.subname,
                                      style: GoogleFonts.roboto(
                                          color: Colors.black54,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500)),
                                ),
                              ],
                            ),
                            Text(
                              '${"A cat is a furry animal that has a long tail and sharp claws. Cats are often kept as pets. Cats are lions, tigers, and other wild animals in the same family.".substring(0, widget.layouts ? 45 : 24).trim()}.',
                              style: GoogleFonts.robotoFlex(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black54),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Chip(
                          backgroundColor: Colors.white38,
                          side: BorderSide.none,
                          avatar: widget.smalllayouts
                              ? Icon(widget.icon,
                                  size: 14,
                                  color: isListHovered
                                      ? Colors.black54
                                      : Colors.black38)
                              : null,
                          label: Text(
                              widget.smalllayouts
                                  ? '${widget.tag} · $date'
                                  : date,
                              style: GoogleFonts.roboto(
                                  color: isListHovered
                                      ? Colors.black54
                                      : Colors.black38,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12))),
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 200),
                        child: isListHovered || isWebMobile
                            ? buttonResourceItem()
                            : null,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}

class CardResource extends StatefulWidget {
  const CardResource(
      {super.key,
      required this.image,
      required this.name,
      required this.subname,
      required this.tag,
      required this.icon,
      required this.layouts,
      required this.smalllayouts});
  final String image;
  final String name;
  final String subname;
  final String tag;
  final IconData icon;
  final bool layouts;
  final bool smalllayouts;

  @override
  State<CardResource> createState() => _CardResourceState();
}

final String date = DateFormat("MMMM dd").format(DateTime.now());
bool isHovered = false;
bool isHeaderHovered = false;
bool isTileExpanded = false;

class _CardResourceState extends State<CardResource> {
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
            child: Padding(
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
                      onExpansionChanged: (value) =>
                          setState(() => isTileExpanded = value),
                      initiallyExpanded: true,
                      leading: MouseRegion(
                        onEnter: (event) =>
                            setParentState(() => isHeaderHovered = true),
                        onExit: (event) =>
                            setParentState(() => isHeaderHovered = false),
                        child: Icon(
                            isHovered
                                ? Icons.view_in_ar_outlined
                                : Icons.view_in_ar,
                            color: isHovered ? Colors.black87 : Colors.black54,
                            size: 22),
                      ),
                      title: MouseRegion(
                        onEnter: (event) =>
                            setParentState(() => isHeaderHovered = true),
                        onExit: (event) =>
                            setParentState(() => isHeaderHovered = false),
                        child: Text('Resource'.toUpperCase(),
                            style: GoogleFonts.roboto(
                                color:
                                    isHovered ? Colors.black87 : Colors.black54,
                                fontSize: 14,
                                fontWeight: FontWeight.w500)),
                      ),
                      trailing: MouseRegion(
                        onEnter: (event) =>
                            setParentState(() => isHeaderHovered = true),
                        onExit: (event) =>
                            setParentState(() => isHeaderHovered = false),
                        child: Theme(
                          data: ThemeData(useMaterial3: true),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.more_horiz,
                                      size: 18, color: Colors.black54)),
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.tune,
                                      size: 18, color: Colors.black54)),
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
                                              color: Colors.black54)),
                                    ),
                                  ))
                            ],
                          ),
                        ),
                      ),
                      children: [
                        Column(
                          children: [
                            ListView(
                                shrinkWrap: true,
                                children: [cardResourceListTile(widget)]),
                            AnimatedSize(
                              curve: Curves.easeOut,
                              duration: const Duration(milliseconds: 200),
                              child: SizedBox(
                                height: isHovered ? null : 0,
                                child: Column(
                                  children: [
                                    const SizedBox(height: 8),
                                    ElevatedButton.icon(
                                        style: ButtonStyle(
                                            foregroundColor:
                                                MaterialStateProperty
                                                    .resolveWith((states) {
                                              if (states.contains(
                                                      MaterialState.hovered) ||
                                                  states.contains(
                                                      MaterialState.pressed)) {
                                                return Colors.black54;
                                              }
                                              return Colors.black38;
                                            }),
                                            backgroundColor:
                                                MaterialStatePropertyAll(
                                                    Colors.grey.shade50),
                                            elevation:
                                                const MaterialStatePropertyAll(
                                                    0)),
                                        onPressed: () =>
                                            context.push('/resource'),
                                        icon:
                                            const Icon(Icons.refresh, size: 14),
                                        label: Text('Load More',
                                            style: GoogleFonts.roboto(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 12))),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ]),
                ),
              ),
            )),
      ),
    );
  }
}
