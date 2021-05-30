import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_theming/blocs/theme/theme_bloc.dart';
import 'package:flutter_theming/theme/app_themes.dart';
import 'package:flutter_theming/utils/shared_prefs.dart';

import 'home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedRefs().init();
  // SharedPreferences prefs = await SharedPreferences.getInstance();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ThemeBloc>(
      create: (context) => ThemeBloc(),
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          print('---------- ${SharedRefs().theme}');
          // if (prefs != null) {
          //   if (prefs!.containsKey('theme')) {
          //     print('${prefs?.getInt('theme')} ---------------');
          //     print('${prefs?.getInt('theme').runtimeType} -------------');
          //     print(AppTheme.values.elementAt(prefs!.getInt('theme')!));
          //     print('${state.themeData} -------------');
          //   }
          // }

          print('${appThemeData[SharedRefs().theme]} -------------');
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: HomeScreen(),
            theme: appThemeData[AppTheme.values.elementAt(SharedRefs().theme)],

            // SharedRefs().checkPrefsNull
            //     ? appThemeData[SharedRefs().theme]
            //     : state.themeData,

            //theme: state.themeData,
            // theme: prefs != null && !prefs!.containsKey('theme')
            //     ? state.themeData
            //     : appThemeData[
            //         AppTheme.values.elementAt(prefs!.getInt('theme')!)],
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
