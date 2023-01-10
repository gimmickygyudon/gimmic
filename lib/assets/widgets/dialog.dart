import 'package:flutter/material.dart';
import 'package:gimmic/assets/label.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../icons.dart';
import 'menu.dart';

downloadDialogHero(context, title, useVerticalLayout) {
  Navigator.push(context, PageRouteBuilder(
    fullscreenDialog: false,
    opaque: false,
    barrierDismissible: true,
    barrierColor: Colors.black38,
    pageBuilder: (BuildContext context, animation, secondaryAnimation) {
      return Align(
        alignment: FractionalOffset.center,
        child: Hero(
          tag: "download",
          child: OverflowBox(
            maxWidth: 400,
            child: Card(
              elevation: 0,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Row(
                            children: [
                              Icon(Icons.download, color: Colors.grey.shade800),
                              const SizedBox(width: 12),
                              Text(
                                'Download', 
                                style: TextStyle(
                                  color: Colors.grey.shade800,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                )
                              )
                            ],
                          ),
                        ),
                        IconButton(
                          onPressed:() => context.pop(), 
                          icon: const Icon(Icons.close)
                        )
                      ],
                    ),
                    const SizedBox(height: 4),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        'Download ready. You can re-download this project for free at any time.',
                        style: TextStyle(
                          color: Colors.grey.shade700
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        children: [
                          const Text(
                           'Files',
                            style: TextStyle(
                              color: Colors.grey
                            ),
                          ),
                          Expanded(
                            child: Divider(color: Colors.grey.shade200, indent: 8)
                          ),
                        ],
                      ),
                    ),
                    Card(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.orangeAccent.shade100, width: 1),
                        borderRadius: BorderRadius.circular(8)
                      ),
                      color: Colors.orange.shade50,
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Checkbox(
                                  fillColor: const MaterialStatePropertyAll(Colors.orangeAccent),
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                                  value: true, 
                                  onChanged: (value) {}
                                ),
                                const SizedBox(width: 8),
                                Padding(
                                  padding: const EdgeInsets.only(top: 3),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          const Icon(IconSoftware.blender3dfilled, color: Colors.orangeAccent),
                                          const SizedBox(width: 8),
                                          Text('.blend', style: TextStyle(
                                            height: -1,
                                            color: Colors.grey.shade700,
                                            fontWeight: FontWeight.w600)
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 4),
                                      Row(
                                        children: const [
                                          Padding(
                                            padding: EdgeInsets.only(left: 4),
                                            child: Icon(Icons.code, color: Colors.grey, size: 16),
                                          ),
                                          SizedBox(width: 10),
                                          Text('3.2.2 | bcfdb14560e7', style: TextStyle(
                                            color: Colors.grey,
                                            wordSpacing: 1,
                                            fontWeight: FontWeight.w500)
                                          ),
                                        ],
                                      ), 
                                      const SizedBox(height: 2),
                                      Row(
                                        children: const [
                                          Padding(
                                            padding: EdgeInsets.only(left: 4),
                                            child: Icon(Icons.crop_square_rounded, color: Colors.grey, size: 16),
                                          ),
                                          SizedBox(width: 10),
                                          Text('115,835 Face Counts', style: TextStyle(
                                            color: Colors.grey,
                                            wordSpacing: 1,
                                            fontWeight: FontWeight.w500)
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 2),
                                      Row(
                                        children: const [
                                          Padding(
                                            padding: EdgeInsets.only(left: 5),
                                            child: Icon(Icons.inventory_2_outlined, color: Colors.grey, size: 14),
                                          ),
                                          SizedBox(width: 11),
                                          Text('19 Objects', style: TextStyle(
                                            color: Colors.grey,
                                            wordSpacing: 1,
                                            fontWeight: FontWeight.w500)
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(4),
                              child: Align(
                                alignment: Alignment.topRight,
                                child: Text('28 MB', style: TextStyle(
                                  color: Colors.grey.shade700,
                                  fontWeight: FontWeight.w600)
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.all(4),
                      child: CheckboxListTile(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.green.shade50),
                          borderRadius: BorderRadius.circular(12)
                        ),
                        checkboxShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.7)),
                        checkColor: Colors.green.shade400,
                        activeColor: Colors.transparent,
                        contentPadding: const EdgeInsets.only(left: 16, right: 8),
                        controlAffinity: ListTileControlAffinity.trailing,
                        title: Text('Terms and Conditions', 
                          style: TextStyle(
                            color: Colors.grey.shade700,
                            wordSpacing: -0.75,
                            fontWeight: FontWeight.w600
                          )
                        ),
                        subtitle: Center(
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Tooltip(
                              message: 'Click to read terms and conditions',
                              child: TextButton.icon(
                                style: ButtonStyle(
                                  padding: const MaterialStatePropertyAll(EdgeInsets.zero),
                                  visualDensity: const VisualDensity(vertical: -4, horizontal: -4),
                                  alignment: Alignment.centerLeft,
                                  overlayColor: const MaterialStatePropertyAll(Colors.transparent),
                                  foregroundColor: MaterialStateProperty.resolveWith((states) {
                                    return states.contains(MaterialState.hovered)
                                      ? Colors.lightBlue
                                      : Colors.grey;
                                  })
                                ),
                                onPressed: () {
                                  showDialog(
                                    barrierDismissible: true,
                                    barrierColor: Colors.black26,
                                    context: context, 
                                    builder: (BuildContext context) {
                                      return AgreementsDialogHero(useVerticalLayout: useVerticalLayout);
                                  });
                                }, 
                                icon: const Icon(Icons.help, size: 16), 
                                label: Text('Help', style: GoogleFonts.roboto(fontWeight: FontWeight.w600))
                              ),
                            ),
                          ),
                        ),
                        value: true, 
                        onChanged: (value) {}
                      ),
                    ),
                    const SizedBox(height: 16),
                    ButtonBar(
                      buttonPadding: const EdgeInsets.only(left: 16),
                      children: [
                        OutlinedButton(
                          onPressed: () => context.pop(), 
                          style: ButtonStyle(
                            side: MaterialStatePropertyAll(BorderSide(color: Colors.grey.shade300)),
                            shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)
                              )
                            ),
                          ),
                          child: const Text(
                            'Cancel',
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),                        
                        ),
                        ElevatedButton(
                          style: ButtonStyle(
                            elevation: const MaterialStatePropertyAll(0),
                            shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))
                            ),
                            backgroundColor: MaterialStateProperty.resolveWith((states) {
                              return states.contains(MaterialState.hovered) 
                                ? Colors.deepPurple.shade600
                                : Colors.deepPurple.shade400;
                            }),
                            foregroundColor: const MaterialStatePropertyAll(Colors.white),
                          ),
                          onPressed: () {},
                          child: const Text(
                            'Download',
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    }
  ));
}

class AgreementsDialogHero extends StatelessWidget {
  const AgreementsDialogHero({
    super.key, 
    required this.useVerticalLayout
  });

  final bool useVerticalLayout;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Padding(
        padding: EdgeInsets.all(useVerticalLayout ? 8 : 0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Visibility(
              visible: useVerticalLayout ? true : false,
              child: Column(
                children: [
                  const SizedBox(height: 8),
                  IconButton(
                    style: ButtonStyle(
                      shape: MaterialStatePropertyAll(
                        RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))
                      ),
                      backgroundColor: const MaterialStatePropertyAll(Colors.white)
                    ),
                    onPressed: () => context.pop(), icon: const Icon(Icons.arrow_back)
                  ),
                  const SizedBox(height: 16),
                  IconButton(
                    style: ButtonStyle(
                      shape: MaterialStatePropertyAll(
                        RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))
                      ),
                      backgroundColor: const MaterialStatePropertyAll(Colors.white)
                    ),
                    onPressed: () => context.pop(), icon: const Icon(Icons.print)
                  )
                ],
              ),
            ),
            const SizedBox(width: 16),
            Flexible(
              child: SingleChildScrollView(
                child: Container(
                  width: 800,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12)
                  ),
                  child: InkWell(
                    onTap: () => context.pop(),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: <Widget>[
                          const Text('Last Updated: 10 Januari 2023'),
                          const SizedBox(height: 8),
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: Text(StringResource.terms_header,
                              style: GoogleFonts.roboto(
                                fontSize: 16,
                                fontWeight: FontWeight.w600
                              ),
                            ),
                          ),
                        ] + List.generate(StringResource.terms_and_conditions.length, (index) {
                          return ListTile(
                            dense: true,
                            leading: Text((index + 1).toString(), style: const TextStyle(fontSize: 16)),
                            title: Text(StringResource.terms_and_conditions[index],
                              style: GoogleFonts.roboto(fontSize: 14),
                            ),
                          );
                        }) +
                        [ 
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: Text(StringResource.terms_footer, 
                              style: GoogleFonts.roboto(fontWeight: FontWeight.w600),
                            ),
                          ),
                          ButtonBar(
                            children: [
                               TextButton(
                                onPressed: () => context.pop(), 
                                child: Text('Disagree', 
                                  style: GoogleFonts.roboto(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.grey
                                  )
                                )
                              ),
                              TextButton(
                                onPressed: () => context.pop(), 
                                child: Text('Agree', style: GoogleFonts.roboto(fontWeight: FontWeight.w600))
                              )
                            ]
                          )
                        ],
                      ),
                    ),
                  )
                ),
              )
            ),
          ],
        ),
      ),
    );
  }
}

imageDialogHero(context, images, hero, pagePosition) {
  Navigator.of(context).push(PageRouteBuilder(
    fullscreenDialog: false,
    opaque: false,
    barrierDismissible: true,
    barrierColor: Colors.black54,
    transitionDuration: const Duration(milliseconds: 200),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      final tween = Tween(begin: begin, end: end);
      final offsetAnimation = animation.drive(tween);
      return SlideTransition(
        position: offsetAnimation,
        child: child,
      );
    },
    pageBuilder: (BuildContext context, animation, secondaryAnimation) {
      return Scaffold(
        backgroundColor: Colors.transparent,
        body: GestureDetector(
          onLongPress: () => onRightClickImageMenu(context, images),
          onLongPressDown: (details) => onTapPosition(details),
          onSecondaryTapDown: (details) =>
              onRightClickImageMenu(context, images, details),
          onTap: () => Navigator.pop(context),
          child: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Hero(
              tag: pagePosition == null
                  ? hero
                  : hero['hero'] + pagePosition.toString(),
              child: InteractiveViewer(
                panEnabled: true,
                minScale: 1,
                maxScale: 6,
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Stack(children: [
                    Center(
                      child: Image(image: AssetImage(images)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(25.7)),
                        child: IconButton(
                            onPressed: () => Navigator.pop(context),
                            icon: const Icon(
                              Icons.close,
                              color: Colors.white,
                              size: 24,
                            )),
                      ),
                    ),
                  ]),
                ),
              ),
            ),
          ),
        ),
      );
    })
  );
}

imageDialog(context, images, pagePosition) {
  showGeneralDialog(
    barrierDismissible: true,
    barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
    context: context,
    pageBuilder: (context, animation, secondaryAnimation) {
      return Padding(
        padding: const EdgeInsets.all(0.0),
        child: InteractiveViewer(
          panEnabled: true,
          minScale: 1,
          maxScale: 6,
          child: GestureDetector(
            onTap: () => Navigator.pop(context, false), // passing false
            child: Image(
              image: pagePosition == null
                  ? AssetImage(images)
                  : AssetImage(images[pagePosition]),
            ),
          ),
        ),
      );
    },
  );
}

void aboutDialog(BuildContext context) {
  showAboutDialog(
    children: [ const SizedBox(height: 45) ],
    applicationName: StringResource.title,
    applicationVersion: StringResource.version,
    applicationIcon: const Padding(
      padding: EdgeInsets.only(top: 12),
      child: FlutterLogo(),
    ),
    applicationLegalese: StringResource.paragraph,
    context: context
  );
}
