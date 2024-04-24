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
            backgroundColor: Colors.blueAccent,
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                const Device(
                  title: 'Light',
                  subTitle: 'Living Room',
                  icon: Icons.lightbulb,
                  color: Colors.yellow,
                  gradientBeginColor: Color(0xffb3e5fc),
                  gradientEndColor: Color(0xff0288d1),
                  disabledGradientBeginColor: Color(0xffe0e0e0),
                  disabledGradientEndColor: Color(0xffc8c8c8),
                ),
                const Device(
                  title: 'Aircon',
                  subTitle: 'Study Room',
                  icon: Icons.ac_unit,
                  color: Colors.cyan,
                  gradientBeginColor: Color(0xffb3e5fc),
                  gradientEndColor: Color(0xff0288d1),
                  disabledGradientBeginColor: Color(0xffe0e0e0),
                  disabledGradientEndColor: Color(0xffc8c8c8),
                ),
                const Device(
                  title: 'Fan',
                  subTitle: 'Bedroom',
                  icon: Icons.air,
                  color: Colors.green,
                  gradientBeginColor: Color(0xff4caf50),
                  gradientEndColor: Color(0xff2e7d32),
                  disabledGradientBeginColor: Color(0xffe0e0e0),
                  disabledGradientEndColor: Color(0xffc8c8c8),
                ),
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
          )),
    );
  }
}

class Device extends StatefulWidget {
  const Device({
    super.key,
    required this.title,
    required this.subTitle,
    required this.icon,
    required this.color,
    required this.gradientBeginColor,
    required this.gradientEndColor,
    required this.disabledGradientBeginColor,
    required this.disabledGradientEndColor,
  });

  final String title;
  final String subTitle;
  final IconData icon;
  final Color color;
  final Color gradientBeginColor;
  final Color gradientEndColor;
  final Color disabledGradientBeginColor;
  final Color disabledGradientEndColor;

  @override
  State<Device> createState() => _DeviceState();
}

class _DeviceState extends State<Device> {
  bool _isEnabled = true;

  List<Color> get gradientColors {
    if (_isEnabled) {
      return [widget.gradientBeginColor, widget.gradientEndColor];
    } else {
      return [
        widget.disabledGradientBeginColor,
        widget.disabledGradientEndColor
      ];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180.0,
      width: 180.0,
      padding: const EdgeInsets.all(10.0),
      margin: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: gradientColors,
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
              Icon(widget.icon,
                  color: _isEnabled ? widget.color : Colors.black54, size: 46),
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
            widget.title,
            style: TextStyle(
                color: _isEnabled ? Colors.white : Colors.black54,
                fontSize: 21,
                fontWeight: FontWeight.w500),
          ),
          Text(
            widget.subTitle,
            style: TextStyle(
                color: _isEnabled ? Colors.white : Colors.black54,
                fontSize: 16),
          ),
        ],
      ),
    );
  }
}
