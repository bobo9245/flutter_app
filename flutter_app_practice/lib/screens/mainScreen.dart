import 'package:flutter/material.dart';

class mainScreen extends StatefulWidget {
  const mainScreen({super.key});

  @override
  State<mainScreen> createState() => _mainScreenState();
}

class _mainScreenState extends State<mainScreen> {
  int count = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    count = 0;
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
        appBar: AppBar(
          title: Text('나혼자', style: TextStyle(color: Colors.black)),
        ),
        body: Center(
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Count is',
                  style: textTheme.bodyMedium,
                ),
                Text('$count'),
                TextButton(
                  onPressed: addNum,
                  child: const Text(
                    'Click me!',
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  void addNum() {
    setState(() {
      count = count + 1;
    });
  }
}
