import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../icons.dart';

class ItemRenderEngine extends StatelessWidget {
  const ItemRenderEngine({super.key, 
    required this.updateItem, 
    required this.isSelected, 
    required this.useVerticalLayout
  });

  final Function updateItem;
  final bool isSelected, useVerticalLayout;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 0,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: isSelected 
          ? Colors.orangeAccent.shade200
          : Colors.grey.shade300, width: isSelected ? 2 : 1),
        borderRadius: BorderRadius.circular(8)
      ),
      color: isSelected ? Colors.orange.shade50 : Colors.grey.shade50,
      child: InkWell(
        hoverColor: isSelected 
          ? Colors.orange.shade100.withOpacity(0.25)
          : Colors.grey.shade200,
        splashColor: Colors.orange.shade100,
        onTap: () {
          bool value;
          isSelected
            ? value = false 
            : value = true;

          updateItem('Blender', value);
        },
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
                    visualDensity: useVerticalLayout ? null : const VisualDensity(horizontal: -4, vertical: -4),
                    fillColor: MaterialStatePropertyAll(isSelected ? Colors.orangeAccent : Colors.grey),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
                    value: isSelected, 
                    onChanged: (value) {
                      updateItem('Blender', value);
                    }
                  ),
                  const SizedBox(width: 8),
                  Padding(
                    padding: EdgeInsets.only(top: useVerticalLayout ? 4 : 3),
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
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 4),
                              child: Icon(Icons.code, color: Colors.grey, size: 16),
                            ),
                            const SizedBox(width: 10),
                            Text('3.2.2 | bcfdb14560e7',
                              style: GoogleFonts.roboto(
                                color: Colors.grey.shade500,
                                wordSpacing: 1,
                                fontSize: 12,
                                fontWeight: FontWeight.w500
                              )
                            ),
                          ],
                        ), 
                        const SizedBox(height: 2),
                        Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 4),
                              child: Icon(Icons.crop_square_rounded, color: Colors.grey, size: 16),
                            ),
                            const SizedBox(width: 10),
                            Text('115,835 Face Counts',
                              style: GoogleFonts.roboto(
                                color: Colors.grey.shade500,
                                wordSpacing: 1,
                                fontSize: 12,
                                fontWeight: FontWeight.w500
                              )
                            ),
                          ],
                        ),
                        const SizedBox(height: 2),
                        Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 5),
                              child: Icon(Icons.inventory_2_outlined, color: Colors.grey, size: 14),
                            ),
                            const SizedBox(width: 11),
                            Text('19 Objects',
                              style: GoogleFonts.roboto(
                                color: Colors.grey.shade500,
                                wordSpacing: 1,
                                fontSize: 12,
                                fontWeight: FontWeight.w500
                              )
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
    );
  }
}

class ItemImage extends StatefulWidget {
  const ItemImage({super.key,
    required this.updateItem, 
    required this.isSelected, 
    required this.useVerticalLayout
  });

  final Function updateItem;
  final bool isSelected, useVerticalLayout;

  @override
  State<ItemImage> createState() => _ItemImageState();
}


class _ItemImageState extends State<ItemImage> {
  List<bool> imageSelected = [false, false];

  void updateSelectedImage(value) {
    setState(() {
      for(int i = 0; i < imageSelected.length; i++) {
        imageSelected[i] = value;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    widget.isSelected 
      ? updateSelectedImage(true) 
      : updateSelectedImage(false);

    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 0,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: widget.isSelected
          ? Colors.blueGrey
          : Colors.grey.shade300, width: widget.isSelected ? 2 : 1),
        borderRadius: BorderRadius.circular(8)
      ),
      color: widget.isSelected ? Colors.blueGrey.shade50 : Colors.grey.shade50,
      child: InkWell(
        hoverColor: widget.isSelected 
          ? Colors.blueGrey.shade100.withOpacity(0.25)
          : Colors.grey.shade200,
        splashColor: Colors.blueGrey.shade100,
        onTap: () {
          bool value;
          widget.isSelected
            ? value = false 
            : value = true;

          widget.updateItem('Image', value);
        },
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
                    visualDensity: widget.useVerticalLayout ? null : const VisualDensity(horizontal: -4, vertical: -4),
                    fillColor: MaterialStatePropertyAll(widget.isSelected ? Colors.blueGrey.shade400 : Colors.grey),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
                    value: widget.isSelected, 
                    onChanged: (value) {
                      widget.updateItem('Image', value);
                    }
                  ),
                  const SizedBox(width: 8),
                  Padding(
                    padding: EdgeInsets.only(top: widget.useVerticalLayout ? 6 : 6),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.image_outlined, size: 18, color: Colors.blueGrey.shade600),
                            const SizedBox(width: 8),
                            Text('Image', style: TextStyle(
                              height: -1,
                              color: Colors.grey.shade700,
                              fontWeight: FontWeight.w600)
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Padding(
                          padding: const EdgeInsets.all(3),
                          child: Text('${imageSelected.where((element) => element == true).length} out of ${imageSelected.length} selected', 
                            style: GoogleFonts.roboto(
                              color: Colors.grey.shade500,
                              wordSpacing: 1,
                              fontSize: 12,
                              fontWeight: FontWeight.w500
                            )
                          ),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            SizedBox(
                              height: 84,
                              child: AspectRatio(
                                aspectRatio: 1 / 1,
                                child: AnimatedPadding(
                                  duration: const Duration(milliseconds: 400),
                                  curve: Curves.fastOutSlowIn,
                                  padding: EdgeInsets.all(imageSelected[0] == true ? 2 : 4),
                                  child: Card(
                                    margin: EdgeInsets.zero,
                                    elevation: imageSelected[0] == true ? 5 : 3,
                                    shadowColor: imageSelected[0] == true ? Colors.black87 :Colors.black45,
                                    surfaceTintColor: Colors.transparent,
                                    shape: RoundedRectangleBorder(
                                      side: imageSelected[0] == true
                                        ? const BorderSide(width: 2, color: Colors.blueGrey)
                                        : BorderSide.none,
                                      borderRadius: BorderRadius.circular(6)
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(6),
                                      child: Image.asset('images/hellocat1.jpg', fit: BoxFit.cover),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            SizedBox(
                              height: 84,
                              child: AspectRatio(
                                aspectRatio: 1 / 1,
                                child: AnimatedPadding(
                                  duration: const Duration(milliseconds: 400),
                                  curve: Curves.fastOutSlowIn,
                                  padding: EdgeInsets.all(imageSelected[1] == true ? 2 : 4),
                                  child: Card(
                                    margin: EdgeInsets.zero,
                                    elevation: imageSelected[1] == true ? 5 : 3,
                                    shadowColor: imageSelected[1] == true ? Colors.black87 :Colors.black45,
                                    surfaceTintColor: Colors.transparent,
                                    shape: RoundedRectangleBorder(
                                      side: imageSelected[1] == true
                                        ? const BorderSide(width: 2, color: Colors.blueGrey)
                                        : BorderSide.none,
                                      borderRadius: BorderRadius.circular(6)
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(6),
                                      child: Image.asset('images/hellocat.jpg', fit: BoxFit.cover),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(4),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Text('3 MB', style: TextStyle(
                    color: Colors.grey.shade700,
                    fontWeight: FontWeight.w600)
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ItemVideo extends StatefulWidget {
  const ItemVideo({
    super.key, 
    required this.isSelected, 
    required this.useVerticalLayout, 
    required this.updateItem
  });

  final bool isSelected, useVerticalLayout;
  final Function updateItem;

  @override
  State<ItemVideo> createState() => _ItemVideoState();
}

class _ItemVideoState extends State<ItemVideo> {
  List<bool> videoSelected = [false];

  void updateSelectedVideo(value) {
    setState(() {
      for(int i = 0; i < videoSelected.length; i++) {
        videoSelected[i] = value;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    widget.isSelected 
      ? updateSelectedVideo(true) 
      : updateSelectedVideo(false);

    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 0,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: widget.isSelected
          ? Colors.blueGrey
          : Colors.grey.shade300, width: widget.isSelected ? 2 : 1),
        borderRadius: BorderRadius.circular(8)
      ),
      color: widget.isSelected ? Colors.blueGrey.shade50 : Colors.grey.shade50,
      child: InkWell(
        hoverColor: widget.isSelected 
          ? Colors.blueGrey.shade100.withOpacity(0.25)
          : Colors.grey.shade200,
        splashColor: Colors.blueGrey.shade100,
        onTap: () {
          bool value;
          widget.isSelected
            ? value = false 
            : value = true;

          widget.updateItem('Video', value);
        },
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
                    visualDensity: widget.useVerticalLayout ? null : const VisualDensity(horizontal: -4, vertical: -4),
                    fillColor: MaterialStatePropertyAll(widget.isSelected ? Colors.blueGrey.shade400 : Colors.grey),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
                    value: widget.isSelected, 
                    onChanged: (value) {
                      widget.updateItem('Video', value);
                    }
                  ),
                  const SizedBox(width: 8),
                  Padding(
                    padding: EdgeInsets.only(top: widget.useVerticalLayout ? 6 : 6),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.play_circle_outline, size: 18, color: Colors.grey.shade600),
                            const SizedBox(width: 8),
                            Text('Video', style: TextStyle(
                              height: -1,
                              color: Colors.grey.shade700,
                              fontWeight: FontWeight.w600)
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Padding(
                          padding: const EdgeInsets.all(3),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('${videoSelected.where((element) => element == true).length} out of ${videoSelected.length} selected',
                                style: GoogleFonts.roboto(
                                  color: Colors.grey.shade500,
                                  wordSpacing: 1,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500
                                )
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            SizedBox(
                              height: 84,
                              child: AspectRatio(
                                aspectRatio: 1 / 1,
                                child: AnimatedPadding(
                                  duration: const Duration(milliseconds: 400),
                                  curve: Curves.fastOutSlowIn,
                                  padding: EdgeInsets.all(videoSelected[0] == true ? 2 : 4),
                                  child: Card(
                                    margin: EdgeInsets.zero,
                                    elevation: videoSelected[0] == true ? 5 : 3,
                                    shadowColor: videoSelected[0] == true ? Colors.black87 :Colors.black45,
                                    surfaceTintColor: Colors.transparent,
                                    shape: RoundedRectangleBorder(
                                      side: videoSelected[0] == true
                                        ? const BorderSide(width: 2, color: Colors.blueGrey)
                                        : BorderSide.none,
                                      borderRadius: BorderRadius.circular(6)
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(6),
                                      child: Stack(
                                        fit: StackFit.expand,
                                        children: [
                                          Image.asset('images/hellocat1.jpg', fit: BoxFit.cover),
                                          Align(
                                            alignment: Alignment.bottomRight,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(4),
                                                color: Colors.grey.shade800),
                                              margin: const EdgeInsets.all(6),
                                              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
                                              child: Text('0:13', 
                                                style: GoogleFonts.roboto(
                                                  color: Colors.white,
                                                  fontSize: 12
                                                )
                                              )
                                            )
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: Text('45 MB', style: TextStyle(
                        color: Colors.grey.shade700,
                        fontWeight: FontWeight.w600)
                      ),
                    ),
                    Text('0:13 mins',
                      style: GoogleFonts.roboto(
                        color: Colors.grey.shade500,
                        wordSpacing: 1,
                        fontSize: 12,
                        fontWeight: FontWeight.w500
                      )
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
