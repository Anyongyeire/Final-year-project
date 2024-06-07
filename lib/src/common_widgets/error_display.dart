import 'package:login_app/src/common_widgets/app_button/exporter.dart';
import 'package:login_app/src/common_widgets/logo.dart';

import '../../droidcon_exporter.dart';
import '../constants/exporter.dart';
import '../functions/exporter.dart';
import '../utils/theme/colors.dart';
import 'dividers.dart';
import 'leading_text.dart';
import 'spaces.dart';

class ErrorDisplay extends StatelessWidget {
  const ErrorDisplay({
    super.key,
    required this.stackTrace,
    required this.error,
  });

  final StackTrace stackTrace;
  final Object error;

  @override
  Widget build(BuildContext context) {
    printer("Error: $error");
    printer("Happened During: $stackTrace");

    //
    return Scaffold(
        backgroundColor: errorColor,
        appBar: AppBar(
          backgroundColor: errorColor,
          leading: CloseButton(
            color: white,
            onPressed: () {
              // pop off the whatsapp screen
              context.go(welcomePath);
            },
          ),
          title: const PaddedLogo(logoSize: 48),
        ),
        body: Padding(
          padding: horizontalPadding16,
          child: ListView(
            children: [
              const VerticalSpace(of: spacing64),
              const LeadingText(
                padding: padding0,
                textAlign: TextAlign.center,
                textColor: white,
                crossAxisAlignment: CrossAxisAlignment.start,
                title: "Oops! Something went wrong",
                description:
                    "No worries, we'll get right on it. It's probably just a temporary glitch on our end.",
              ),
              const VerticalSpace(of: spacing32),
              ErrorText(error: error),
              StackTraceWidget(stackTrace: stackTrace),
              const VerticalSpace(of: spacing16),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          color: errorColor,
          padding: padding16,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const ThickHorizontalDivider(
                thickness: 1.5,
                dividerWidth: double.infinity,
                dividerColor: white,
                margin: margin0,
              ),
              const VerticalSpace(of: spacing8),

              // go to safety
              AppButton(
                label: "Go to Safety",
                buttonColor: white,
                textColor: primaryColor,
                iconWidget: const AppLogo(logoSize: 24, color: primaryColor),
                onTap: () {
                  context.go(homePath);
                },
              ),
            ],
          ),
        ));
  }
}

class ErrorText extends StatelessWidget {
  const ErrorText({
    super.key,
    required this.error,
  });

  final Object error;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: white,
        borderRadius: borderRadius8,
      ),
      padding: padding16,
      child: Column(
        children: [
          const Text(
            "ERROR",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: errorColor,
              fontWeight: FontWeight.bold,
              fontSize: fontSize20,
            ),
          ),
          // divider
          const ThickHorizontalDivider(
            thickness: 1.5,
            dividerWidth: double.infinity,
            dividerColor: errorColor,
          ),

          Text(
            "$error",
            style: const TextStyle(color: errorColor),
          ),
        ],
      ),
    );
  }
}

class StackTraceWidget extends StatelessWidget {
  const StackTraceWidget({
    super.key,
    required this.stackTrace,
  });

  final StackTrace stackTrace;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: borderRadius8,
        color: errorYellow.withOpacity(.1),
        border: Border.all(color: errorYellow, width: 1),
      ),
      margin: verticalPadding16,
      padding: padding16,
      child: Column(
        children: [
          const Text(
            "STACK TRACE",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: errorYellow,
              fontWeight: FontWeight.bold,
              fontSize: fontSize20,
            ),
          ),
          // divider
          const ThickHorizontalDivider(
            thickness: 1.5,
            dividerWidth: double.infinity,
            dividerColor: errorYellow,
          ),

          Text(
            "$stackTrace",
            style: TextStyle(
              color: errorYellow.withOpacity(.8),
            ),
          ),
        ],
      ),
    );
  }
}
