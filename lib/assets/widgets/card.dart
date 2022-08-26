import 'package:flutter/material.dart';
import 'package:gimmic/assets/widgets/button.dart';
import 'package:gimmic/src/page/details.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../src/page/resource.dart';

const _shimmerGradient = LinearGradient(
  colors: [
    Color(0xFFEBEBF4),
    Color(0xFFF4F4F4),
    Color(0xFFEBEBF4),
  ],
  stops: [
    0.1,
    0.3,
    0.4,
  ],
  begin: Alignment(-1, -0.3),
  end: Alignment(1, 0.3),
  tileMode: TileMode.clamp,
);

class ShimmerLoading extends StatefulWidget {
  const ShimmerLoading({
    super.key,
    required this.isLoading,
    required this.child,
  });

  final bool isLoading;
  final Widget child;

  @override
  State<ShimmerLoading> createState() => _ShimmerLoadingState();
}

class _ShimmerLoadingState extends State<ShimmerLoading> {
  @override
  Widget build(BuildContext context) {
    if (!widget.isLoading) {
      return widget.child;
    }

    return ShaderMask(
      blendMode: BlendMode.srcATop,
      shaderCallback: (bounds) {
        return _shimmerGradient.createShader(bounds);
      },
      child: widget.child,
    );
  }
}

class SlideInRoute extends PageRouteBuilder {
  final Widget page;

  SlideInRoute({required this.page, required String routeName})
      : super(
          settings: RouteSettings(name: routeName), // set name here
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) {
            const begin = Offset(0, 1);
            const end = Offset.zero;
            final tween = Tween(begin: begin, end: end).animate(CurvedAnimation(
                parent: animation,
                curve: const Interval(
                  0,
                  1,
                  curve: Curves.fastOutSlowIn,
                )));
            return SlideTransition(
              position: tween,
              child: child,
            );
          },
          transitionDuration: const Duration(milliseconds: 300),
        );
}

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
  final Shader linearGradient = const LinearGradient(
    colors: <Color>[Colors.white, Colors.lightBlue],
  ).createShader(const Rect.fromLTWH(0, 0, 200, 70));
  bool cardSelected = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.white54,
      hoverColor: Colors.white12,
      highlightColor: Colors.white30,
      onTap: () async {
        await Navigator.push(context,
            SlideInRoute(page: const Resource(), routeName: '/resource'));
      },
      child: MouseRegion(
        onEnter: ((value) => setState(() => cardSelected = true)),
        onExit: ((value) => setState(() => cardSelected = false)),
        child: Hero(
          tag: 'catHello',
          child: Card(
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
                    firstChild: const Image(
                        image: AssetImage("images/hellocat1.jpg"),
                        fit: BoxFit.cover),
                    secondChild: const Image(
                        image: AssetImage("images/hellocat.jpg"),
                        fit: BoxFit.cover),
                  ),
                  AnimatedContainer(
                    curve: Curves.easeOut,
                    duration: const Duration(milliseconds: 200),
                    padding: const EdgeInsets.only(
                        bottom: 20, left: 20, right: 20, top: 20),
                    alignment: Alignment.bottomCenter,
                    decoration: BoxDecoration(
                      border: cardSelected
                          ? const Border(
                              bottom: BorderSide(color: Colors.blue, width: 4))
                          : null,
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [0.3, 0.5, cardSelected ? 0.85 : 1.0],
                        colors: <Color>[
                          Colors.black.withAlpha(0),
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
                                      Colors.black.withOpacity(0.7)),
                                  secondChild: Padding(
                                    padding: const EdgeInsets.only(left: 6),
                                    child: Text(
                                      'Updated · $timecard',
                                      style: GoogleFonts.roboto(
                                          fontSize:
                                              widget.useVHideDetails ? 14 : 12,
                                          fontWeight: FontWeight.w300,
                                          color: Colors.grey.shade300),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            ElevatedButton(
                              style: ButtonStyle(
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
                                /* minimumSize: MaterialStateProperty.all(
                                                                          const Size(220, 50)), */
                                elevation: const MaterialStatePropertyAll(0),
                              ),
                              onPressed: () async {
                                await Navigator.push(
                                    context,
                                    SlideInRoute(
                                        page: const Resource(),
                                        routeName: '/resource'));
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
                                          foreground: Paint()
                                            ..shader = linearGradient,
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
                                                    fontSize:
                                                        widget.useVHideDetails
                                                            ? 14
                                                            : 12,
                                                    fontWeight: FontWeight.w300,
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
                                            Colors.grey.shade200)
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
