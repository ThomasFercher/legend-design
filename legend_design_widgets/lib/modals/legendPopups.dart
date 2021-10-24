import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:legend_design_widgets/modals/legendAlert.dart';
import 'package:legend_design_widgets/modals/modal.dart';

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
    required LegendAlert alert,
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
    required Modal modal,
  }) {
    showModal(
      context: context,
      builder: (context) {
        return modal;
      },
      configuration: _modalConfiguration,
    );
  }
}
