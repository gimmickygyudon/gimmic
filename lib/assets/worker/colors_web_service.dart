import 'dart:async';
import 'dart:math';
import 'dart:typed_data';

import 'package:squadron/squadron.dart';
import 'package:image/image.dart' as imagelib;

// this abstract class represents the functionality you want to support in your service
//
// in this example, there is only one functionality: given an image represented by imageData,
// compute a thumbnail of size (thumbWidth, thumbHeight)
abstract class ThumbnailService {
  Future getThumbnail(Uint8List imagedata, int width, int height);

  // this constant is used to identify the method to call when communicating with isolates / web workers
  static const getThumbnailCommand = 1;
}

// this class is the actual implementation of the service defined above
class ThumbnailServiceImpl implements ThumbnailService, WorkerService {
  @override
  Future getThumbnail(Uint8List imagedata, int width, int height) async {
    imagelib.Image? image;
    List colors = [];
    int noOfPixelsPerAxis = 12;
    int noOfPaletteColors = 10;

    int abgrToArgb(int argbColor) {
      int r = (argbColor >> 16) & 0xFF;
      int b = argbColor & 0xFF;
      int argb = (argbColor & 0xFF00FF00) | (b << 16) | r;
      return argb;
    }

    double grayscale(int argbColor) {
      int r = argbColor & 0xFF;
      int g = (argbColor >> 8) & 0xFF;
      int b = (argbColor >> 16) & 0xFF;
      // grayscale = (0.299 * Red) + (0.587 * Green) + (0.114 * Blue)
      double grayscale = (0.299 * r) + (0.587 * g) + (0.114 * b);
      return grayscale;
    }

    int hexOfRGBA(int r, int g, int b, {double opacity = 1}) {
      r = (r < 0) ? -r : r;
      g = (g < 0) ? -g : g;
      b = (b < 0) ? -b : b;
      opacity = (opacity < 0) ? -opacity : opacity;
      opacity = (opacity > 1) ? 255 : opacity * 255;
      r = (r > 255) ? 255 : r;
      g = (g > 255) ? 255 : g;
      b = (b > 255) ? 255 : b;
      int a = opacity.toInt();
      return int.parse(
          '0x${a.toRadixString(16)}${b.toRadixString(16)}${g.toRadixString(16)}${r.toRadixString(16)}');
    }

    getAverageColor(List colors) {
      int r = 0, g = 0, b = 0;

      for (int i = 0; i < colors.length; i++) {
        int red = colors[i] & 0xFF;
        int green = (colors[i] >> 8) & 0xFF;
        int blue = (colors[i] >> 16) & 0xFF;

        r += red;
        g += green;
        b += blue;
      }

      r = r ~/ colors.length;
      g = g ~/ colors.length;
      b = b ~/ colors.length;

      int hex = hexOfRGBA(r, g, b);
      Squadron.info("Show #RGBA Color: $r $g $b 255");
      Squadron.info("Convert #RGBA to hex: $hex");
      return hex;
    }

    void setImageBytes(imageBytes) => image = imagelib.decodeImage(imageBytes);

    List sortColors(List colors) {
      List sorted = [];

      sorted.addAll(colors);
      sorted.sort((a, b) => grayscale(b).compareTo(grayscale(a)));

      Squadron.info("sorted #argbColor to: $sorted from $colors");
      return sorted;
    }

    List<int?> pixels = [];

    int xChunk = width ~/ (noOfPixelsPerAxis + 1);
    int yChunk = height ~/ (noOfPixelsPerAxis + 1);

    setImageBytes(imagedata);

    for (int j = 1; j < noOfPixelsPerAxis + 1; j++) {
      for (int i = 1; i < noOfPixelsPerAxis + 1; i++) {
        int? pixel = image?.getPixel(xChunk * i, yChunk * j);
        pixels.add(pixel);
        colors.add(abgrToArgb(pixel!));
      }
    }

    List generatePalette(List params) {
      List colors = [];
      List palette = [];
      Random random = Random();

      colors.addAll(sortColors(params));
      noOfPaletteColors = random.nextInt(noOfPaletteColors) + 2;

      int noOfItems = noOfPaletteColors;

      if (noOfItems <= colors.length) {
        int chunkSize = colors.length ~/ noOfItems;

        for (int i = 0; i < noOfItems; i++) {
          palette.add(getAverageColor(
              colors.sublist(i * chunkSize, (i + 1) * chunkSize)));
        }
      }
      return palette;
    }

    List palette = generatePalette(colors);
    Squadron.info("Generating palette color from image: $palette ");
    return palette;
  }

  // this map creates the correspondance between the service constants from ThumbnailService
  // and the method implementations in ThumbnailServiceImpl
  @override
  late final Map<int, CommandHandler> operations = {
    ThumbnailService.getThumbnailCommand: (WorkerRequest r) {
      Squadron.info('Received getThumbnailCommand in ${r.travelTime} µs');
      return getThumbnail(r.args[0], r.args[1], r.args[2]);
    }
  };
}
