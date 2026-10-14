import 'package:bukanggochi/config.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('게임 주소는 앱 안에서 연다', () {
    expect(isInAppUrl(Uri.parse(kGameUrl)), isTrue);
    expect(isInAppUrl(Uri.parse('https://bukanggochi.github.io/manifest.json')), isTrue);
    expect(isInAppUrl(Uri.parse('about:blank')), isTrue);
  });

  test('외부 주소는 기기 브라우저로 넘긴다', () {
    expect(isInAppUrl(Uri.parse('https://fonts.googleapis.com/css2')), isFalse);
    expect(isInAppUrl(Uri.parse('https://example.com/')), isFalse);
    expect(isInAppUrl(Uri.parse('https://evil.bukanggochi.github.io.example.com/')), isFalse);
    expect(isInAppUrl(Uri.parse('intent://scan/#Intent;end')), isFalse);
  });
}
