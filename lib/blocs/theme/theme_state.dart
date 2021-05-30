part of 'theme_bloc.dart';

class ThemeState extends Equatable {
  final ThemeData? themeData;

  ThemeState(this.themeData);

  factory ThemeState.initial() {
    return ThemeState(appThemeData[AppTheme.GreenLight]);
  }

  @override
  List<Object?> get props => [themeData];
}
