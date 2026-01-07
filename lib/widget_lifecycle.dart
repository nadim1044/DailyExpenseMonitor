import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDark = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: isDark ? ThemeData.dark() : ThemeData.light(),
      home: DemoScreen(
        toggleTheme: () {
          setState(() {
            isDark = !isDark;
          });
        },
      ),
    );
  }
}

class DemoScreen extends StatefulWidget {
  final VoidCallback toggleTheme;

  const DemoScreen({super.key, required this.toggleTheme});

  @override
  State<DemoScreen> createState() => _DemoScreenState();
}

class _DemoScreenState extends State<DemoScreen> {
  String titleA = "Counter A";
  bool showCounterB = true;

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print("DemoScreen → build");
    }

    return Scaffold(
      appBar: AppBar(title: const Text("Lifecycle Demo")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: widget.toggleTheme,
              child: const Text("Toggle Theme (InheritedWidget)"),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  titleA = "Counter A (Updated)";
                });
              },
              child: const Text("Update Counter A Title"),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  showCounterB = !showCounterB;
                });
              },
              child: const Text("Add / Remove Counter B"),
            ),
            const SizedBox(height: 20),
            LifecycleCounter(title: titleA),
            if (showCounterB) const LifecycleCounter(title: "Counter B"),
          ],
        ),
      ),
    );
  }
}

class LifecycleCounter extends StatefulWidget {
  final String title;

  const LifecycleCounter({super.key, required this.title});

  @override
  State<LifecycleCounter> createState() {
    return _LifecycleCounterState();
  }
}

class _LifecycleCounterState extends State<LifecycleCounter> {
  int count = 0;

  @override
  void initState() {
    super.initState();
    if (kDebugMode) print("initState → ${widget.title}");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final brightness = Theme.of(context).brightness;

    if (kDebugMode) print("didChangeDependencies → $brightness");
  }

  @override
  void didUpdateWidget(covariant LifecycleCounter oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (kDebugMode) {
      print("didUpdateWidget → ${oldWidget.title} → ${widget.title}");
    }
  }

  @override
  void deactivate() {
    if (kDebugMode) print("deactivate → ${widget.title}");
    super.deactivate();
  }

  @override
  void dispose() {
    if (kDebugMode) print("dispose → ${widget.title}");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) print("build → ${widget.title}");

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(widget.title, style: const TextStyle(fontSize: 18)),
            Text("Count: $count"),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  count++;
                });
              },
              child: const Text("Increment"),
            ),
          ],
        ),
      ),
    );
  }
}
