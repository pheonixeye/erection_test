import 'package:erection_test/extensions/loc_ext.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class ShellScaffold extends StatelessWidget {
  const ShellScaffold({
    super.key,
    required this.child,
  });
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Consumer<GoRouteInformationProvider>(
            builder: (context, r, _) {
              return Text.rich(
                TextSpan(
                  text: context.loc.erectionTest,
                  children: [
                    TextSpan(text: '\n'),
                    TextSpan(
                      text: r.value.uri.path,
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          automaticallyImplyLeading: false,
        ),
        body: child,
      ),
    );
  }
}
