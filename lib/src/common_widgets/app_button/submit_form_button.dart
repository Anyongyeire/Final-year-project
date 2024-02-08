// Project imports:
import '../../../droidcon_exporter.dart';
import '../../features/authentication/models/exporter.dart';
import '../../functions/exporter.dart';
import '../../routing/exporter.dart';
import '../../utils/theme/colors.dart';
import '../toast.dart';
import 'exporter.dart';

class SubmitFormButton extends ConsumerStatefulWidget {
  const SubmitFormButton({
    super.key,
    required this.form,
  });

  // form
  final AppForm form;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SubmitFormButtonState();
}

class _SubmitFormButtonState extends ConsumerState<SubmitFormButton> {
  // istapped
  bool isButtonTapped = false;

  @override
  Widget build(BuildContext context) {
    // current form
    final thisForm = widget.form;

    final formKey = ref.watch(thisForm.formKeyProvider);

    // show error telling user to fill in all fields
    final cantSubmit = "Can't Submit ${thisForm.title} Form!";

    // TODO add a submit provider that checks if all these fields of this form are filled up
    //  since each form has a different set of fields, we need to check if all the fields are filled up
    //  we will do this in the providers class of this function and thats where we shall check for the form too whether its filled up
    //  so here we shall call is as is form filled up, then we act accordingly

    return CircularProgressAppButton(
      isTapped: isButtonTapped,
      onTap: () async {
        // Unfocus Keyboard
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }

        if (formKey.currentState!.validate()) {
          enableTap();

          // call the api or firebase to submit the form
          await futureCallSimulator().then(
            (_) {
              printer('Request successful!');

              showToast(
                context: context,
                text: "${thisForm.title} Submitted!",
                message:
                    "Thank you for your submission. You will be notified when your request is processed.",
              );
              disableTap();
              // clear the form after sign in
              formKey.currentState!.reset();

              // TODO go to the home page
              ref.read(goRouterProvider).go(homePath);
            },
          );
        } else {
          disableTap();
          showErrorToast(
            context: context,
            text: cantSubmit,
            message: "Please fill in all fields in the form!",
          );
        }
      },
      text: "SUBMIT",
      textColor: white,
      buttonColor: primaryColor,
    );
  }

  /// Disable the button tap
  void disableTap() {
    if (mounted) {
      setState(() {
        isButtonTapped = false;
      });
    }
  }

  void enableTap() {
    setState(() {
      isButtonTapped = true;
    });
  }
}
