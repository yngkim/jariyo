import 'package:flutter_secure_storage/flutter_secure_storage.dart';

//아래 주석처리된 플랫폼 따라 ip 설정할때 필요함
import 'dart:io';

const ACCESS_TOKEN_KEY = 'ACCESS_TOKEN';
const REFRESH_TOKEN_KEY = 'REFRESH_TOKEN';

//토큰값을 저장하기 위해 FlutterSecureStorage 사용

const storage = FlutterSecureStorage();

const SimulatorIp = '127.0.0.1:3000';
const emulatorIp = '10.0.2.2:3000';

//시뮬레이터인지 에뮬레이터인지에 따라 ip 다르게 설정
// 여기서는 오류때문에 그냥 시뮬레이터 ip로 설정
// final ip = Platform.isIOS ? SimulatotIp : emulatorIp;

const ip = SimulatorIp;
