// ignore_for_file: non_constant_identifier_names

import 'package:islami/core/theme/MyTheme.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class DialogUtils {
  static void CustomLoadingAnimation() {
    LoadingAnimationWidget.staggeredDotsWave(
      color: MyTheme.defulteColorLight,
      size: 200,
    );
  }
}
