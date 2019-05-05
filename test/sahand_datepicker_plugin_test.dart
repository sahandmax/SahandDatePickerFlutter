import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sahand_datepicker_plugin/sahand_datepicker.dart';

void main() {
  const MethodChannel channel = MethodChannel('sahand_datepicker_plugin');

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await SahandDatePicker.platformVersion, '42');
  });
}
