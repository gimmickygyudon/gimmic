import 'package:flutter/material.dart';

import '../icons.dart';

class ItemRenderEngine extends StatelessWidget {
  const ItemRenderEngine({super.key});


  @override
  Widget build(BuildContext context) {
    return Card(
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
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
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
                            fontSize: 12,
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
                            fontSize: 12,
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
                            fontSize: 12,
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
    );
  }
}

class ItemImage extends StatelessWidget {
  ItemImage({super.key});

  final List<bool> imageSelected = [false, false];

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: imageSelected.every((e) => e) 
          ? Colors.blueGrey
          : Colors.grey.shade300, width: 1),
        borderRadius: BorderRadius.circular(8)
      ),
      color: imageSelected.every((e) => e) 
        ? Colors.blueGrey.shade50
        : Colors.grey.shade50,
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
                  tristate: imageSelected.every((e) => e) ? true : false,
                  fillColor: MaterialStatePropertyAll(Colors.blueGrey.shade400),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
                  value: imageSelected.every((e) => e) ? true : false, 
                  onChanged: (value) {}
                ),
                const SizedBox(width: 8),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.image_outlined, size: 18, color: Colors.blueGrey.shade400),
                          const SizedBox(width: 8),
                          Text('Image', style: TextStyle(
                            height: -1,
                            color: Colors.grey.shade700,
                            fontWeight: FontWeight.w600)
                          ),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.all(3),
                        child: Text('0 out of 2 selected', style: TextStyle(
                          color: Colors.grey,
                          wordSpacing: 1,
                          fontSize: 12,
                          fontWeight: FontWeight.w600)
                        ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          SizedBox(
                            height: 84,
                            child: AspectRatio(
                              aspectRatio: 1 / 1,
                              child: Card(
                                elevation: imageSelected[0] ? 5 : 3,
                                shadowColor: Colors.black45,
                                surfaceTintColor: Colors.transparent,
                                shape: RoundedRectangleBorder(
                                  side: imageSelected[0] 
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
                          SizedBox(
                            height: 84,
                            child: AspectRatio(
                              aspectRatio: 1 / 1,
                              child: Card(
                                elevation: imageSelected[0] ? 5 : 3,
                                shadowColor: Colors.black45,
                                surfaceTintColor: Colors.transparent,
                                shape: RoundedRectangleBorder(
                                  side: imageSelected[1] 
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
    );
  }
}
