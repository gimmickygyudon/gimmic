import 'dart:async';

import 'package:async/async.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';

import 'package:gimmic/assets/functions/string.dart';
import 'package:gimmic/assets/functions/time.dart';

final AsyncMemoizer _memoizer = AsyncMemoizer();
final Completer itemLoaded = Completer();

Future loadItems() async {
  return _memoizer.runOnce(() async {
  final FirebaseStorage storageRef = FirebaseStorage.instance;
  final FirebaseFirestore db = FirebaseFirestore.instance;

  List<Map<String, dynamic>> items = [];

  await db.collection('resource').doc('item').get().then(
      (DocumentSnapshot doc) async {
    var data = doc.data() as Map<String, dynamic>;
    for (List element in data.values) {
      for (String brand in element) {
        // print(brand.toString());
        //...

        await db
            .collection("resource")
            .doc('item')
            .collection(brand)
            .get()
            .then(
          (value) async {
            var result = value.docs.map((e) => e.data()).toList();
            for (var item in result) {
              String name = item['name'];

              DateTime timestamp =
                  DateTime.fromMillisecondsSinceEpoch(item['timestamp'] * 1000);
              String time = timeAgo(timestamp);
              // print(' name: $name \n brand: ${brand.toTitleCase()} \n time: $time');
              //...

              String categoryId = item['category'];
              String imagePath = item['type'];
              imagePath = imagePath.substring(imagePath.indexOf('/'));
              // print(imagePath);

              final Reference pathRef =
                  storageRef.ref().child("images$imagePath");
              final listImage = await pathRef.listAll();

              /* for (var item in listImage.items) {
                print(item.name.toString());
              } */

              // List of image
              List<Uint8List?> images = [];
              for (var item in listImage.items) {
                // The items under storageRef.

              final Reference imageRef = storageRef
                  .ref()
                  .child("images$imagePath/${item.name}");

                Uint8List? image;
                // print("image names: ${item.name}");
                try {
                  const oneMegabyte = 1024 * 1024;
                  final Uint8List? imageData = await imageRef.getData(oneMegabyte);
                  image = imageData;
                  
                  images.add(image);
                } on FirebaseException catch (e) {
                  // ignore: avoid_print
                  kReleaseMode ? null : print(e);
                }
              }

              await db.doc("resource/category/$categoryId").get().then((doc) {
                var data = doc.data() as Map<String, dynamic>;
                //...

                String category =
                    categoryId.substring(0, categoryId.indexOf('/'));
                category = category.toTitleCase();
                // print(' category: $category');
                // print(' icon: ${data['icons'].first}');
                // print(' tags: ${data['tags']}');

                final List<Map<String, dynamic>> snapshots = [
                  {
                    "timestamp": timestamp,
                    "name": name,
                    "images" : images,
                    "brand": brand,
                    "time": time,
                    "category": category,
                    "icon": data['icons'],
                    "tags": data['tags'],
                  }
                ];
                items.addAll(snapshots);
              });
            }
          },
          onError: (e) { debugPrint(e.toString()); },
        );
      }
    }
  }, onError: (e) { debugPrint(e.toString()); });
  items.sort((a, b) {
    var atime = a['timestamp'];
    var btime = b['timestamp'];
    return btime.compareTo(atime);
  });

  itemLoaded.complete();
  debugPrint("itemLoaded = ${itemLoaded.isCompleted}");
  return items;
  });
}
