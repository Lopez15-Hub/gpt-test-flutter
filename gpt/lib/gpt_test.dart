import 'package:flutter/material.dart';
import 'package:gpt/core/services/services.dart';
import 'package:gpt/presentation/presentation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/core.dart';

class GptTest extends StatelessWidget {
  const GptTest({super.key});

  @override
  Widget build(BuildContext context) {
    final blocProviders = [
        BlocProvider(
          create: (_) => GptFormCubit(),
        ),
        BlocProvider(
          create: (_) => NavigationCubit(),
        ),
        BlocProvider(
          create: (context) => PreferencesCubit(
              PreferencesRepository(PreferencesService()),
              context.read<GptFormCubit>(),
              context.read<NavigationCubit>()),
        ),
        BlocProvider(
            create: (context) => GptCubit(
                  repository: GptRepository(GptService(
                      PreferencesService().getLocalString("gptKey"))),
                )),
        BlocProvider(
          create: (context) =>
              ChatCubit(context.read<GptFormCubit>(), context.read<GptCubit>()),
        ),
      ];
   
    return MultiBlocProvider(
      providers: blocProviders,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        darkTheme: ThemeData.dark(),
        routes: <String, WidgetBuilder>{
          "enterKey": (BuildContext context) => const EnterKey(),
          "chat": (BuildContext context) => const ChatView(),
        },
        initialRoute: "enterKey",
      ),
    );
  }
}
