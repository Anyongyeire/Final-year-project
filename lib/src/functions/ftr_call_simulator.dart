// auth simulator is a function that waits for 2 seconds
import '../../droidcon_exporter.dart';
import '../constants/exporter.dart';

Future<void> futureCallSimulator() {
  return Future.delayed(twoSeconds);
}
