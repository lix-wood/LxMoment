import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lxmoment/lx_moment.dart';

void main() {
  const MethodChannel channel = MethodChannel('lxmoment');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await LxMoment.getDateTime(DateTime.now()), '42');
  });
}
