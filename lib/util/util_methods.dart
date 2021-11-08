import 'package:flutter/material.dart';

Future<T?> showDefaultDialog<T>(BuildContext context,
    {required Widget child, bool dismissible = true}) {
  return showDialog(
    context: context,
    barrierDismissible: dismissible,
    builder: (_) => WillPopScope(
      onWillPop: () => Future.value(dismissible),
      child: StatefulBuilder(
        builder: (context, setStater) {
          return Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Dialog(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Container(
                  color: Color(0xFFeae8e8),
                  child: child,
                ),
              ),
            ),
          );
        },
      ),
    ),
  );
}
