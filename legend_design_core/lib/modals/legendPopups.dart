import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LegendPopups {
  static final ModalConfiguration _modalConfiguration =
      FadeScaleTransitionConfiguration(
    transitionDuration: Duration(milliseconds: 250),
    barrierDismissible: true,
    reverseTransitionDuration: Duration(milliseconds: 250),
  );

  static final ModalConfiguration _alertConfiguration =
      FadeScaleTransitionConfiguration(
    transitionDuration: Duration(milliseconds: 250),
    barrierDismissible: true,
    reverseTransitionDuration: Duration(milliseconds: 250),
    barrierColor: Colors.transparent,
  );

  static void showAlert({
    required BuildContext context,
    required Widget alert,
  }) {
    showModal(
      context: context,
      builder: (context) {
        return alert;
      },
      configuration: _alertConfiguration,
    );
  }

  static void showLegendModal({
    required BuildContext context,
    required Widget modal,
    ModalConfiguration? config,
  }) {
    /*  showModal(
      context: context,
      builder: (context) {
        return modal;
      },
      configuration: config ?? _modalConfiguration,
    );*/

    showDialog(
      context: context,
      builder: (context) => modal,
      barrierColor: Colors.transparent,
    );
  }
}
