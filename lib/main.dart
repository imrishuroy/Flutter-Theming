import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_theming/blocs/theme/theme_bloc.dart';
import 'package:flutter_theming/theme/app_themes.dart';
import 'package:flutter_theming/utils/shared_prefs.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await sharedRefs.init();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  runApp(MyApp(prefs: prefs));
}

class MyApp extends StatelessWidget {
  final SharedPreferences? prefs;

  const MyApp({Key? key, this.prefs}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ThemeBloc>(
      create: (context) => ThemeBloc(),
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          if (prefs != null) {
            if (prefs!.containsKey('theme')) {
              print('${prefs?.getInt('theme')} ---------------');
              print('${prefs?.getInt('theme').runtimeType} -------------');
              print(AppTheme.values.elementAt(prefs!.getInt('theme')!));
              print('${state.themeData} -------------');
            }
          }

          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: HomeScreen(),
            //theme: state.themeData,
            theme: prefs != null && !prefs!.containsKey('theme')
                ? state.themeData
                : appThemeData[
                    AppTheme.values.elementAt(prefs!.getInt('theme')!)],
            // theme:
            //  appThemeData[
            //         AppTheme.values.elementAt(prefs!.getInt('theme')!)] ??
            //     state.themeData,
          );
        },
      ),
    );
  }
}
