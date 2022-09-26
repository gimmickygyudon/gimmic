import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pasteboard/pasteboard.dart';

import '../functions/url.dart';
import 'dialog.dart';
import 'snackbar.dart';

List<PopupMenuEntry<int>> openDividerMenu = <PopupMenuEntry<int>>[
  const PopupMenuDivider(),
];

// Tap Position
// ignore: prefer_typing_uninitialized_variables
var tapPosition;
void onTapPosition(details) {
  tapPosition = details;
}

// Image Main Menu
onRightClickImageMainMenu(BuildContext context, image, command, [details]) {
  final overlay = Overlay.of(context).context.findRenderObject() as RenderBox;
  details ??= tapPosition;
  showMenu<int>(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      context: context,
      items: openImageMainMenu(context, image, command),
      position: RelativeRect.fromSize(
          details.globalPosition & const Size(48, 48), overlay.size));
}

// Image Dialog Menu
onRightClickImageMenu(BuildContext context, image, [details]) {
  final overlay = Overlay.of(context).context.findRenderObject() as RenderBox;
  details ??= tapPosition;
  showMenu<int>(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      context: context,
      items: openImageMenu(context, image),
      position: RelativeRect.fromSize(
          details.globalPosition & const Size(48, 48), overlay.size));
}

// Page Menu
onRightClickPageMenu(BuildContext context, key, [details]) {
  final overlay = Overlay.of(context).context.findRenderObject() as RenderBox;
  details ??= tapPosition;
  showMenu<int>(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      context: context,
      items: openPageMenu(context, key),
      position: RelativeRect.fromSize(
          details.globalPosition & const Size(48, 48), overlay.size));
}

// Item Menu
onRightClickMenu(BuildContext context, url, image, hero, command, [details]) {
  final overlay = Overlay.of(context).context.findRenderObject() as RenderBox;
  details ??= tapPosition;
  showMenu<int>(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      context: context,
      items: openPopMenu(context, url, command) +
          openImagePopMenu(context, image, hero) +
          openDividerMenu +
          openItemMenu(context, url),
      position: RelativeRect.fromSize(
          details.globalPosition & const Size(48, 48), overlay.size));
}

/// List of menus entries start here...

List<PopupMenuEntry<int>> openPageMenu(
    context, GlobalKey<RefreshIndicatorState> key) {
  return [
    PopupMenuItem(
      height: 0,
      onTap: () {
        key.currentState?.show();
        GoRouter.of(context).refresh();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 4),
        child: Row(
          children: [
            const Icon(Icons.refresh, color: Colors.black54),
            const SizedBox(
              width: 10,
            ),
            Text("Reload",
                style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w500, color: Colors.grey.shade800))
          ],
        ),
      ),
    ),
    const PopupMenuDivider(),
    PopupMenuItem(
      height: 0,
      enabled: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 4),
        child: Row(
          children: [
            const Icon(Icons.history, color: Colors.black54),
            const SizedBox(
              width: 10,
            ),
            Text("History...",
                style: GoogleFonts.roboto(fontWeight: FontWeight.w500))
          ],
        ),
      ),
    ),
    const PopupMenuDivider(),
    PopupMenuItem(
      height: 0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
        child: Row(
          children: [
            Icon(Icons.flag, color: Colors.red.shade800),
            const SizedBox(
              width: 10,
            ),
            Text("Report",
                style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w500, color: Colors.red.shade800))
          ],
        ),
      ),
    ),
    PopupMenuItem(
      height: 0,
      onTap: () {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          aboutDialog(context);
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
        child: Row(
          children: [
            const Icon(Icons.info_outline, color: Colors.black54),
            const SizedBox(
              width: 10,
            ),
            Text("About...",
                style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w500, color: Colors.grey.shade800))
          ],
        ),
      ),
    ),
  ];
}

// TODO: Change it into acceptable menu
List<PopupMenuEntry<int>> openTextMenu = <PopupMenuEntry<int>>[
  PopupMenuItem(
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
      child: Row(
        children: [
          const Icon(Icons.content_copy, color: Colors.black54, size: 20),
          const SizedBox(
            width: 10,
          ),
          Text("Copy",
              style: GoogleFonts.roboto(
                  fontWeight: FontWeight.w500, color: Colors.grey.shade800))
        ],
      ),
    ),
  ),
  PopupMenuItem(
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
      child: Row(
        children: [
          const Icon(Icons.cut, color: Colors.black54, size: 20),
          const SizedBox(
            width: 10,
          ),
          Text("Cut",
              style: GoogleFonts.roboto(
                  fontWeight: FontWeight.w500, color: Colors.grey.shade800))
        ],
      ),
    ),
  ),
  PopupMenuItem(
    child: Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, top: 0, bottom: 0),
      child: Row(
        children: [
          const Icon(Icons.content_paste, color: Colors.black54),
          const SizedBox(
            width: 10,
          ),
          Text("Paste",
              style: GoogleFonts.roboto(
                  fontWeight: FontWeight.w500, color: Colors.grey.shade800))
        ],
      ),
    ),
  ),
];

// Page Menu
List<PopupMenuEntry<int>> openPopMenu(context, String url, command) {
  return <PopupMenuEntry<int>>[
    PopupMenuItem(
        onTap: () {
          command();
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
          child: Row(
            children: [
              const Icon(Icons.arrow_outward, color: Colors.blue),
              const SizedBox(
                width: 10,
              ),
              Text('Open',
                  style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w500, color: Colors.blue))
            ],
          ),
        )),
    PopupMenuItem(
        onTap: () => urlLink(url),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
          child: Row(
            children: [
              const Icon(kIsWeb ? Icons.open_in_new : Icons.open_in_browser,
                  color: Colors.black54),
              const SizedBox(
                width: 10,
              ),
              Text(kIsWeb ? 'Open in new tab' : 'Open in browser',
                  style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w500, color: Colors.grey.shade800))
            ],
          ),
        )),
  ];
}

// Item Menu
List<PopupMenuEntry<int>> openItemMenu(context, item) {
  return <PopupMenuEntry<int>>[
    PopupMenuItem(
      onTap: () {
        Clipboard.setData(ClipboardData(text: item));
        ScaffoldMessenger.of(context)
            .showSnackBar(snackbarCopyItem(context, item));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
        child: Row(
          children: [
            const Icon(Icons.link_outlined, color: Colors.black54),
            const SizedBox(
              width: 10,
            ),
            Text("Copy Link",
                style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w500, color: Colors.grey.shade800))
          ],
        ),
      ),
    ),
    PopupMenuItem(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
        child: Row(
          children: [
            const Icon(Icons.share_outlined, color: Colors.black54),
            const SizedBox(
              width: 10,
            ),
            Text("Share",
                style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w500, color: Colors.grey.shade800))
          ],
        ),
      ),
    ),
    PopupMenuItem(
      child: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8, top: 0, bottom: 0),
        child: Row(
          children: [
            const Icon(Icons.favorite_border, color: Colors.black54),
            const SizedBox(
              width: 10,
            ),
            Text("Add to Favorites",
                style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w500, color: Colors.grey.shade800))
          ],
        ),
      ),
    ),
    const PopupMenuDivider(),
    PopupMenuItem(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
        child: Row(
          children: [
            Icon(Icons.not_interested_outlined, color: Colors.yellow.shade800),
            const SizedBox(
              width: 10,
            ),
            Text("Not Interested",
                style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w500, color: Colors.yellow.shade800))
          ],
        ),
      ),
    ),
    PopupMenuItem(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
        child: Row(
          children: [
            Icon(Icons.flag, color: Colors.red.shade800),
            const SizedBox(
              width: 10,
            ),
            Text("Report Item",
                style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w500, color: Colors.red.shade800))
          ],
        ),
      ),
    ),
  ];
}

// Image Main Menu
List<PopupMenuEntry<int>> openImageMainMenu(context, image, command) {
  return [
    PopupMenuItem(
      onTap: () {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          command();
        });
      },
      height: 0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
        child: Row(
          children: [
            const Icon(Icons.fullscreen, color: Colors.black54),
            const SizedBox(
              width: 12,
            ),
            Text("Fullscreen",
                style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w500, color: Colors.grey.shade800))
          ],
        ),
      ),
    ),
    PopupMenuItem(
      onTap: () {
        List<String> location =
            GoRouter.of(context).location.split('/').toList();
        GoRouter.of(context)
            .pushNamed('viewer', params: {'name': location.last.toString()});
      },
      height: 0,
      child: ListTile(
          dense: true,
          isThreeLine: false,
          horizontalTitleGap: 0,
          contentPadding: const EdgeInsets.only(left: 1),
          minVerticalPadding: 0,
          leading: const Icon(Icons.view_in_ar, color: Colors.black54),
          trailing:
              const Icon(Icons.model_training_outlined, color: Colors.black54),
          title: Text("3D View",
              style: GoogleFonts.roboto(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey.shade800))),
    ),
    const PopupMenuDivider(),
    PopupMenuItem(
      onTap: () async {
        ByteData bytes = await rootBundle.load(image);
        Uint8List imagebytes = bytes.buffer.asUint8List();

        Pasteboard.writeImage(imagebytes).whenComplete(() {
          rootScaffoldMessengerKey.currentState?.hideCurrentSnackBar();
          rootScaffoldMessengerKey.currentState
              ?.showSnackBar(snackbarCopyImage(context, image, null));
        });
      },
      height: 0,
      child: ListTile(
        dense: true,
        isThreeLine: false,
        horizontalTitleGap: 0,
        minVerticalPadding: 0,
        contentPadding: EdgeInsets.zero,
        leading: const Icon(Icons.content_copy_rounded, color: Colors.black54),
        title: Text('Copy Image',
            style: GoogleFonts.roboto(
                height: -2,
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.grey.shade800)),
        subtitle: Text('Copy image content to Clipboard',
            style: GoogleFonts.roboto(
                height: -2, fontSize: 12, color: Colors.grey)),
      ),
    ),
    PopupMenuItem(
      height: 0,
      child: ListTile(
        dense: true,
        isThreeLine: false,
        horizontalTitleGap: 0,
        minVerticalPadding: 0,
        contentPadding: EdgeInsets.zero,
        leading: const Icon(Icons.link, color: Colors.black54),
        title: Text('Get Link',
            style: GoogleFonts.roboto(
                height: -2,
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.grey.shade800)),
        subtitle: Text('Get link address from the Image',
            style: GoogleFonts.roboto(
                height: -2, fontSize: 12, color: Colors.grey)),
      ),
    ),
    const PopupMenuDivider(),
    PopupMenuItem(
      height: 0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 4),
        child: Row(
          children: [
            Icon(Icons.flag, color: Colors.red.shade800),
            const SizedBox(
              width: 12,
            ),
            Text("Report",
                style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w500, color: Colors.red.shade800))
          ],
        ),
      ),
    ),
  ];
}

// Image Dialog Menu
List<PopupMenuEntry<int>> openImageMenu(context, image) {
  return [
    PopupMenuItem(
      onTap: () async {
        await Future.delayed(const Duration(milliseconds: 100))
            .whenComplete(() => Navigator.pop(context));
      },
      height: 0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
        child: Row(
          children: [
            const Icon(Icons.close,
                color: Colors.black54, size: 22, weight: 700),
            const SizedBox(
              width: 14,
            ),
            Text("Close",
                style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w500, color: Colors.grey.shade800))
          ],
        ),
      ),
    ),
    PopupMenuItem(
      onTap: () async {
        ByteData bytes = await rootBundle.load(image);
        Uint8List imagebytes = bytes.buffer.asUint8List();

        Pasteboard.writeImage(imagebytes).whenComplete(() {
          rootScaffoldMessengerKey.currentState?.hideCurrentSnackBar();
          rootScaffoldMessengerKey.currentState
              ?.showSnackBar(snackbarCopyImage(context, image, null));
        });
      },
      height: 0,
      child: ListTile(
        dense: true,
        isThreeLine: false,
        horizontalTitleGap: 0,
        minVerticalPadding: 0,
        contentPadding: EdgeInsets.zero,
        leading: const Icon(Icons.content_copy_rounded, color: Colors.black54),
        title: Text('Copy Image',
            style: GoogleFonts.roboto(
                height: -2,
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.grey.shade800)),
        subtitle: Text('Copy image content to Clipboard',
            style: GoogleFonts.roboto(
                height: -2, fontSize: 12, color: Colors.grey)),
      ),
    ),
    PopupMenuItem(
      height: 0,
      child: ListTile(
        dense: true,
        isThreeLine: false,
        horizontalTitleGap: 0,
        minVerticalPadding: 0,
        contentPadding: EdgeInsets.zero,
        leading: const Icon(Icons.link, color: Colors.black54),
        title: Text('Get Link',
            style: GoogleFonts.roboto(
                height: -2,
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.grey.shade800)),
        subtitle: Text('Get link address from the Image',
            style: GoogleFonts.roboto(
                height: -2, fontSize: 12, color: Colors.grey)),
      ),
    ),
    const PopupMenuDivider(),
    PopupMenuItem(
      height: 0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 4),
        child: Row(
          children: [
            Icon(Icons.flag, color: Colors.red.shade800),
            const SizedBox(
              width: 12,
            ),
            Text("Report",
                style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w500, color: Colors.red.shade800))
          ],
        ),
      ),
    ),
  ];
}

// Image Pop Menu
List<PopupMenuEntry<int>> openImagePopMenu(context, image, hero) {
  return <PopupMenuEntry<int>>[
    PopupSubMenuItem<int>(
      widget: Padding(
        padding: const EdgeInsets.only(left: 24, right: 8, top: 12, bottom: 12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            const Icon(Icons.add_photo_alternate, color: Colors.black54),
            const SizedBox(width: 10),
            Expanded(
              child: Text('Image...',
                  style: GoogleFonts.roboto(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey.shade800)),
            ),
            Icon(
              Icons.arrow_right_rounded,
              size: 24,
              color: Colors.grey.shade800,
            ),
            const SizedBox(width: 4)
          ],
        ),
      ),
      items: const [
        {
          'name': 'Open Image',
          'tooltip': null,
          'icon': Icons.image_search,
        },
        {
          'name': 'Copy Image',
          'tooltip': 'Copy image content to Clipboard',
          'icon': Icons.content_copy,
        },
        {
          'name': 'Get Link',
          'tooltip': 'Copy link address from the Image',
          'icon': Icons.link,
        }
      ],
      index: const [1, 2, 3],
      onSelected: (value) async {
        // Do something with selected child value
        switch (value) {
          case 1:
            imageDialogHero(context, image, hero, null);
            break;
          case 2:
            // TODO: [Warning] Using a public plugin (Only work for iOS and web)
            // if (kIsWeb) {
            ByteData bytes = await rootBundle.load(image);
            // File imagefile = File(image);
            // Uint8List imagebytes = await imagefile.readAsBytes();
            Uint8List imagebytes = bytes.buffer.asUint8List();

            Pasteboard.writeImage(imagebytes).whenComplete(() {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
              ScaffoldMessenger.of(context)
                  .showSnackBar(snackbarCopyImage(context, image, hero));
            });
            // }
            break;
          default:
        }
      },
    ),
  ];
}

/// An item with sub menu for using in popup menus
///
/// [title] is the text which will be displayed in the pop up
/// [index] is the list of items to populate the sub menu
/// [onSelected] is the callback to be fired if specific item is pressed
///
/// Selecting items from the submenu will automatically close the parent menu
/// Closing the sub menu by clicking outside of it, will automatically close the parent menu
class PopupSubMenuItem<T> extends PopupMenuEntry<T> {
  const PopupSubMenuItem(
      {Key? key,
      this.onSelected,
      required this.index,
      required this.items,
      required this.widget})
      : super(key: key);

  final List<T> index;
  final List<Map<String, dynamic>> items;
  final Widget widget;
  final Function(T)? onSelected;

  @override
  double get height =>
      kMinInteractiveDimension; // Does not actually affect anything

  @override
  bool represents(T? value) =>
      false; // Our submenu does not represent any specific value for the parent menu

  @override
  State createState() => _PopupSubMenuState<T>();
}

/// The [State] for [PopupSubMenuItem] subclasses.
class _PopupSubMenuState<T> extends State<PopupSubMenuItem<T>> {
  @override
  Widget build(BuildContext context) {
    int i = 0;
    return PopupMenuButton<T>(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        tooltip: '',
        onCanceled: () {
          i = 0; // Set index to default when sub menu is closing

          /* Close the parent menu
          if (Navigator.canPop(context)) {
            Navigator.pop(context);
          } */
        },
        onSelected: (T value) {
          if (Navigator.canPop(context)) {
            Navigator.pop(context);
          }
          widget.onSelected?.call(value);
        },
        offset: const Offset(125, 0),
        itemBuilder: (BuildContext context) {
          return widget.index.map(
            (index) {
              PopupMenuItem<T> item = PopupMenuItem<T>(
                value: index,
                child: ListTile(
                  isThreeLine: false,
                  horizontalTitleGap: 0,
                  contentPadding: const EdgeInsets.only(left: 8),
                  minVerticalPadding: 0,
                  leading: Icon(widget.items[i]['icon'], color: Colors.black54),
                  title: Text(widget.items[i]['name'],
                      style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w500,
                          color: Colors.grey.shade800)),
                  subtitle: widget.items[i]['tooltip'] == null
                      ? null
                      : Text(widget.items[i]['tooltip'],
                          style: GoogleFonts.roboto(
                              fontSize: 12, color: Colors.grey)),
                ),
              );
              i++;
              return item;
            },
          ).toList();
        },
        child: widget.widget);
  }
}
