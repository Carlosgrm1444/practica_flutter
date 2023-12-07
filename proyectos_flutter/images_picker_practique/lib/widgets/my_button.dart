import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String textButton;
  final Color buttonColor1;
  final Color buttonColor2;
  final double textPaddingHorizontal;
  final double textPaddingVertical;
  final double fontSize;
  final double buttonPadding;
  final Future Function() onPressedButton;

  const MyButton({
    super.key,
    required this.textButton,
    required this.buttonColor1,
    required this.buttonColor2,
    required this.textPaddingHorizontal,
    required this.textPaddingVertical,
    required this.fontSize,
    required this.buttonPadding,
    required this.onPressedButton,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: EdgeInsets.all(buttonPadding),
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(buttonColor1.withOpacity(0.9)),
            foregroundColor: MaterialStateProperty.all<Color>(
                Theme.of(context).brightness == Brightness.dark
                    ? Colors.black
                    : Colors.white),
            side: MaterialStateProperty.all<BorderSide>(
                BorderSide(color: buttonColor1.withOpacity(1))),
            overlayColor:
                MaterialStateProperty.all<Color>(buttonColor2.withOpacity(0.4)),
          ),
          onPressed: () async {
            await onPressedButton();
          },
          child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: textPaddingHorizontal,
                  vertical: textPaddingVertical),
              child: Text(
                textButton,
                style: TextStyle(fontSize: fontSize),
              )),
        ),
      ),
    );
  }
}
