import 'dart:ffi';

typedef F1 = Void Function(Pointer<Void> ptr, Pointer<Uint8> buffer, Int len,
    Int32 width, Int32 height, Int strideAlign);
typedef F1Dart = void Function(Pointer<Void> ptr, Pointer<Uint8> buffer,
    int len, int width, int height, int strideAlign);

class TextureRgbaRendererNative {
  TextureRgbaRendererNative._();

  static TextureRgbaRendererNative get _instance => TextureRgbaRendererNative._()..init();
  static TextureRgbaRendererNative get instance => _instance;

  late F1Dart onRgba;

  init() {
    final lib = DynamicLibrary.process();
    onRgba = lib.lookupFunction<F1, F1Dart>("FlutterRgbaRendererPluginOnRgba");
  }
}
