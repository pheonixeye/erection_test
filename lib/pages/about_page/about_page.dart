import 'package:erection_test/core/providers/px_theme.dart';
import 'package:erection_test/core/router/app_router.dart';
import 'package:erection_test/extensions/context_ext.dart';
import 'package:erection_test/widgets/neumorphic_btn.dart';
import 'package:erection_test/widgets/neumorphic_card.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        listTileTheme: ListTileThemeData(
          contentPadding: const EdgeInsets.all(0),
        ),
      ),
      child: ListView(
        padding: EdgeInsets.all(8),
        children: [
          NeumorphicCard(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    context.loc.guidlinesTitle,
                    style: Theme.of(context).textTheme.headlineMedium,
                    textAlign: TextAlign.start,
                  ),
                ),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    context.loc.guidlinesSubtitle,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: ListTile(
                        leading: const CircleAvatar(radius: 5),
                        title: Text(context.loc.domainOne),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        leading: const CircleAvatar(radius: 5),
                        title: Text(context.loc.domainTwo),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: ListTile(
                        leading: const CircleAvatar(radius: 5),
                        title: Text(context.loc.domainThree),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        leading: const CircleAvatar(radius: 5),
                        title: Text(context.loc.domainFour),
                      ),
                    ),
                  ],
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    context.loc.guidelinesEnd,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                const Divider(),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    context.loc.clinicalApplications,
                    style: Theme.of(context).textTheme.headlineMedium,
                    textAlign: TextAlign.start,
                  ),
                ),
                const Divider(),
                ListTile(
                  leading: const CircleAvatar(radius: 5),
                  title: Text(context.loc.cAppOne),
                ),
                ListTile(
                  leading: const CircleAvatar(radius: 5),
                  title: Text(context.loc.cAppTwo),
                ),
                ListTile(
                  leading: const CircleAvatar(radius: 5),
                  title: Text(context.loc.cAppThree),
                ),
                ListTile(
                  leading: const CircleAvatar(radius: 5),
                  title: Text(context.loc.cAppFour),
                ),
                const Divider(),
                const Divider(),
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      context.loc.definitions,
                      style: Theme.of(context).textTheme.headlineMedium,
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
                const Divider(),
                ListTile(
                  leading: const CircleAvatar(radius: 5),
                  title: Text(context.loc.defOne),
                ),
                ListTile(
                  leading: const CircleAvatar(radius: 5),
                  title: Text(context.loc.defTwo),
                ),
                ListTile(
                  leading: const CircleAvatar(radius: 5),
                  title: Text(context.loc.defThree),
                ),
                ListTile(
                  leading: const CircleAvatar(radius: 5),
                  title: Text(context.loc.defFour),
                ),
                ListTile(
                  leading: const CircleAvatar(radius: 5),
                  title: Text(context.loc.defFive),
                ),
                const Divider(),
                SizedBox(height: 10),
                NeumorphicButton(
                  onTap: () {
                    GoRouter.of(context).goNamed(
                      AppRouter.home,
                      pathParameters: context.defaultPathParameters,
                    );
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Consumer<PxTheme>(
                        builder: (context, t, _) {
                          return Text(
                            context.loc.home,
                            style: Theme.of(context).textTheme.bodyLarge
                                ?.copyWith(
                                  color: t.isDark ? Colors.black : null,
                                ),
                          );
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: const Icon(Icons.home),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
