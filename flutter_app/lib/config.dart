import 'dart:ui' show Color;

/// 앱이 띄우는 게임 주소. 게임은 웹(GitHub Pages)에서 업데이트되므로
/// 밸런스·디자인 변경은 앱을 다시 배포하지 않아도 반영된다.
/// `source=app`으로 웹 쪽에서 앱 실행인지 구분할 수 있다.
const kGameUrl = 'https://shark-keeper.github.io/?source=app';
const kGameHost = 'shark-keeper.github.io';

/// 브랜드명(가칭). 바꿀 때는 tool/setup.dart의 kDisplayName도 같이 바꾼다.
const kAppTitle = '부캉이 키우기';

const kPageColor = Color(0xFFE7F6FD);
const kSeaColor = Color(0xFF1B8FD6);
const kInkColor = Color(0xFF0D3557);

/// 앱 안(WebView)에서 열어도 되는 주소인지. 나머지는 기기 브라우저로 넘긴다.
bool isInAppUrl(Uri uri) {
  if (uri.scheme == 'about' || uri.scheme == 'data' || uri.scheme == 'blob') return true;
  return (uri.scheme == 'https' || uri.scheme == 'http') && uri.host == kGameHost;
}
