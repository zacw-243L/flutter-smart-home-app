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
  bool _isDefault = false;
  List<String> rooms = ['Living Room', 'Bedroom', 'Kitchen'];
  String _selectedRoom = 'Living Room';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Smart Home'),
        ),
        body: Column(
          children: [
            const Device(),
            CheckboxListTile(
              title: const Text('Default home?'),
              controlAffinity: ListTileControlAffinity.leading,
              value: _isDefault,
              onChanged: (newValue) {
                setState(() {
                  _isDefault = newValue!;
                });
              },
            ),
            RadioListTile(
              title: Text(rooms[0]),
              value: rooms[0],
              groupValue: _selectedRoom,
              onChanged: (value) {
                setState(() {
                  _selectedRoom = value!;
                });
              },
            ),
            RadioListTile(
              title: Text(rooms[1]),
              value: rooms[1],
              groupValue: _selectedRoom,
              onChanged: (value) {
                setState(() {
                  _selectedRoom = value!;
                });
              },
            ),
            RadioListTile(
              title: Text(rooms[2]),
              value: rooms[2],
              groupValue: _selectedRoom,
              onChanged: (value) {
                setState(() {
                  _selectedRoom = value!;
                });
              },
            ),
            DropdownButton(
              value: _selectedRoom,
              items: [
                DropdownMenuItem<String>(
                  value: rooms[0],
                  child: Text(rooms[0]),
                ),
                DropdownMenuItem<String>(
                  value: rooms[1],
                  child: Text(rooms[1]),
                ),
                DropdownMenuItem<String>(
                  value: rooms[2],
                  child: Text(rooms[2]),
                ),
              ],
              onChanged: (newValue) {
                setState(() {
                  _selectedRoom = newValue!;
                });
              },
            ),
          ],
        ),
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
        gradient: _isEnabled
            ? const LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Color(0xffb3e5fc), Color(0xff0288d1)],
              )
            : const LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Color(0xffffffff), Color(0xfffaf9f6)],
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
              Icon(Icons.lightbulb,
                  color: _isEnabled ? Colors.yellow : Colors.black54, size: 46),
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
          Text(
            'Light',
            style: TextStyle(
                color: _isEnabled ? Colors.white : Colors.black54,
                fontSize: 21,
                fontWeight: FontWeight.w500),
          ),
          Text(
            'Living Room',
            style: TextStyle(
                color: _isEnabled ? Colors.white : Colors.black54,
                fontSize: 16),
          ),
        ],
      ),
    );
  }
}
