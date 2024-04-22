import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Smart Home'),
        ),
        body: const Device(),
      ),
    );
  }
}

class Device extends StatefulWidget {
  const Device({super.key});

  @override
  State<Device> createState() => _DeviceState();
}

class _DeviceState extends State<Device> {
  bool _isEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180.0,
      width: 180.0,
      padding: const EdgeInsets.all(10.0),
      margin: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color(0xffb3e5fc),
            Color(0xff0288d1)
          ], //0xFF is translucency last 6 is clr code
        ),
        boxShadow: const <BoxShadow>[
          BoxShadow(
            blurRadius: 20,
            offset: Offset(15, 15),
            color: Colors.black12,
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Icon(Icons.lightbulb, color: Colors.yellow, size: 46),
              Switch(
                value: _isEnabled,
                onChanged: (newValue) {
                  setState(() {
                    _isEnabled = newValue;
                  });
                },
              ),
            ],
          ),
          const SizedBox(height: 50),
          const Text(
            'Light',
            style: TextStyle(
                color: Colors.white, fontSize: 21, fontWeight: FontWeight.w500),
          ),
          const Text(
            'Living Room',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ],
      ),
    );
  }
}
