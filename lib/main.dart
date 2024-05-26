import 'package:concentrate_factory_mes/regrind_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      title: 'شارژ گلوله',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const DashboardMenu(),
    );
  }
}

class DashboardMenu extends StatefulWidget {
  const DashboardMenu({super.key});

  @override
  State<DashboardMenu> createState() => _DashboardMenuState();
}

class _DashboardMenuState extends State<DashboardMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("کارخانه تغلیظ ۲"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              "شارژ گلوله کارخانه تغلیظ",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(
              height: 25,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const RegrindView(
                              title: "شارژ گلوله ریگرند ۱", regrindName: 'ریگرند۱', regrindPower: 1300,
                            )),
                  );
                },
                child: SizedBox(
                    width: 200,
                    height: 60,
                    child: Center(
                        child: Text(
                      "شارژ گلوله ریگرند ۱",
                      style: Theme.of(context).textTheme.headlineSmall,
                    )))),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const RegrindView(
                          title: "شارژ گلوله ریگرند ۲", regrindName: 'ریگرند۲', regrindPower: 1180,
                        )),
                  );
                },
                child: SizedBox(
                    width: 200,
                    height: 60,
                    child: Center(
                        child: Text(
                          "شارژ گلوله ریگرند ۲",
                          style: Theme.of(context).textTheme.headlineSmall,
                        )))),
          ],
        ),
      ),
    );
  }
}
