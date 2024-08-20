import 'package:job_search/di_container.dart' as di;
import 'package:job_search/provider/home_provider.dart';
import 'package:job_search/provider/sign_in_provider.dart';
import 'package:job_search/provider/sign_up_provider.dart';
import 'package:provider/provider.dart';

MultiProvider multiProvider({required child}) {
  return MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => di.sl<SignUpProvider>()),
      ChangeNotifierProvider(create: (_) => di.sl<SignInProvider>()),
      ChangeNotifierProvider(create: (_) => di.sl<HomeProvider>()),
    ],
    child: child,
  );
}
