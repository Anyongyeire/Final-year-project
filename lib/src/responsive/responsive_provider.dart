import '../../droidcon_exporter.dart';
import 'exporter.dart';

//* this provides the overall responsiveness of our app

final droidconResponsiveProvider =
    Provider.family<DroidconResponsive, BuildContext>((ref, ctx) {
  return DroidconResponsive(context: ctx);
});
