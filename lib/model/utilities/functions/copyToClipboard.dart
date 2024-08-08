import '../imports/general_import.dart';

void copyToClipboard(
    {required BuildContext context,
    required String? text,
    String successText = 'Copied to clipboard'}) {
  Clipboard.setData(ClipboardData(text: text ?? "")).then((_) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(successText)));
  });
}
