import 'package:cinebox/ui/core/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

mixin LoaderMessage<T extends ConsumerStatefulWidget> on ConsumerState<T> {
  var isOpen = false;

  void showLoader() {
    //senao esta aberto
    if (!isOpen) {
      isOpen = true;
      showDialog(
        context: context,
        //Nao pode fechar o dialog com o toque fora
        barrierDismissible: true,
        builder: (_) {
          return LoadingAnimationWidget.threeArchedCircle(
            color: Colors.white,
            size: 60.0,
          );
        },
      );
    }
  }

  void hideLoader() {
    if (isOpen) {
      isOpen = false;
      Navigator.of(context).pop();
    }
  }

  void _showSnackBar(String message, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: color,
      ),
    );
  }

  void showErrorSnackBar(String message) =>
      _showSnackBar(message, AppColors.redColor);
  void showSuccessSnackBar(String message) =>
      _showSnackBar(message, Colors.green);
  void showInfoSnackBar(String message) =>
      _showSnackBar(message, Colors.blueGrey);
}
