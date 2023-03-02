import 'package:easy_puzzle_game/src/dashatar/colors/colors.dart';
import 'package:easy_puzzle_game/src/dashatar/theme/bloc/theme_bloc.dart';
import 'package:easy_puzzle_game/src/dashatar/theme/themes/puzzle_theme.dart';
import 'package:easy_puzzle_game/src/dashatar/theme/themes/puzzle_theme_animations.dart';
import 'package:easy_puzzle_game/src/dashatar/theme/widgets/animated_text_button.dart';
import 'package:easy_puzzle_game/src/dashatar/typography/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// {@template puzzle_button}
/// Displays the puzzle action button.
/// {@endtemplate}
class PuzzleButton extends StatelessWidget {
  /// {@macro puzzle_button}
  const PuzzleButton({
    Key? key,
    required this.child,
    required this.onPressed,
    this.backgroundColor,
    this.textColor,
  }) : super(key: key);

  /// The background color of this button.
  /// Defaults to [PuzzleTheme.buttonColor].
  final Color? backgroundColor;

  /// The text color of this button.
  /// Defaults to [PuzzleColors.white].
  final Color? textColor;

  /// Called when this button is tapped.
  final VoidCallback? onPressed;

  /// The label of this button.
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final theme = context.select((ThemeBloc bloc) => bloc.state.theme);
    final buttonTextColor = textColor ?? PuzzleColors.white;
    final buttonBackgroundColor = backgroundColor ?? theme.buttonColor;

    return SizedBox(
      width: 145,
      height: 44,
      child: AnimatedTextButton(
        duration: PuzzleThemeAnimationDuration.textStyle,
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
          textStyle: PuzzleTextStyle.headline5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
        ).copyWith(
          backgroundColor: MaterialStateProperty.all(buttonBackgroundColor),
          foregroundColor: MaterialStateProperty.all(buttonTextColor),
        ),
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}