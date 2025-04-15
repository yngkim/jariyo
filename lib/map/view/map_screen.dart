import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:jariyo/common/layout/default_layout.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';

Future<void> initializeMap() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NaverMapSdk.instance.initialize(
      clientId: 'nkcv2p47d6', // 클라이언트 ID 설정
      onAuthFailed: (e) => log("네이버맵 인증오류 : $e", name: "onAuthFailed"));
}

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const cameraPosition = NCameraPosition(
      target: NLatLng(37.4944751, 126.9587558),
      zoom: 15,
      bearing: 45,
      tilt: 30,
    );
    // NaverMapController 객체의 비동기 작업 완료를 나타내는 Completer 생성
    final Completer<NaverMapController> mapControllerCompleter = Completer();

    return Scaffold(
      body: NaverMap(
        options: const NaverMapViewOptions(
          initialCameraPosition: cameraPosition,
          indoorEnable: true, // 실내 맵 사용 가능 여부 설정
          locationButtonEnable: true, // 위치 버튼 표시 여부 설정
          consumeSymbolTapEvents: false, // 심볼 탭 이벤트 소비 여부 설정
        ),
        onMapReady: (controller) async {
          final marker1 = NMarker(
              id: 'test1', position: const NLatLng(37.4944751, 126.9587558));
          final marker2 = NMarker(
              id: 'test2', position: const NLatLng(37.4949602, 126.9568592));
          controller.addOverlayAll({marker1, marker2});

          final onMarkerInfoWindow =
              NInfoWindow.onMarker(id: marker1.info.id, text: "추억과 김밥");
          marker1.openInfoWindow(onMarkerInfoWindow);

          // 지도 준비 완료 시 호출되는 콜백 함수
          mapControllerCompleter
              .complete(controller); // Completer에 지도 컨트롤러 완료 신호 전송
          log("onMapReady", name: "onMapReady");
        },
      ),
    );
  }
}
