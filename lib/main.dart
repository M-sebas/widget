import 'package:flutter/material.dart';
import 'package:pruevas_widget/presentation/router/go_router.dart';
import 'package:sizer/sizer.dart';

main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    /* sizer se utiliza para darle a un diseño unico a todas las pantalla  sea grande o pequeña su tamaño va ser igual.*/
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Sizer',
        theme: ThemeData.light(),
        routerConfig: AppRouter.router,
      );
    });
  }
}
