import 'package:flutter/material.dart';
//import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HW1',
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
        primarySwatch: Colors.green,
      ),
      debugShowCheckedModeBanner: false,
      home: const FirstRoute(title: 'Login Page'),
    );
  }
}

class FirstRoute extends StatefulWidget {
  const FirstRoute({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<FirstRoute> createState() => _FirstRouteState();
}

class _FirstRouteState extends State<FirstRoute> {
  bool _isHidden = true;
  late FocusNode myFocusNode;

  @override
  void initState() {
    super.initState();

    myFocusNode = FocusNode();
  }

  @override
  void dispose() {
    // Clean up the focus node when the Form is disposed.
    myFocusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, //avoid pixel overflow when using keyboard
      body: Column(
        children: <Widget>[
          Stack(
            fit: StackFit.loose,  // Fit all un-positioned children.
            children: <Widget>[
              Container(
                  padding: const EdgeInsets.only(top: 130.0, left: 130),
                  child: const Text.rich(
                    TextSpan(
                      children: <TextSpan>[
                        TextSpan(text: ' my',
                            style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontSize: 28.0,
                              color: Colors.green,
                            )
                        ),
                        TextSpan(text: 'Home ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 36.0,
                              color: Colors.green,

                            )
                        ),
                      ],
                    ),
                  )
              ),
              Container(  // E-mail or Username
                padding: const EdgeInsets.only(top: 250.0, left: 40.0, right: 50.0),
                child: TextFormField(
                  cursorColor: Theme.of(context).textSelectionTheme.cursorColor,
                  initialValue: '',
                  maxLength: 320,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.account_circle_rounded),
                    labelText: 'USERNAME / EMAIL',
                    labelStyle: TextStyle(
                      color: Colors.grey,
                    ),
                    helperText: 'E.g: Smith21; John.Smith21@domain.com',
                    hintText: '',
                    /*suffixIcon: Icon(
                      Icons.check_circle,
                    ),*/
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                    ),
                  ),
                ),
              ),
              Container(  // Password
                padding: const EdgeInsets.only(top: 350.0, left: 40.0, right: 50.0),
                child: TextFormField(
                  cursorColor: Theme.of(context).textSelectionTheme.cursorColor,
                  initialValue: '',
                  maxLength: 128,
                  obscureText: _isHidden,
                  decoration:  InputDecoration(
                    icon: Icon(Icons.lock),
                    labelText: 'PASSWORD',
                    labelStyle: const TextStyle(
                      color: Colors.grey,
                    ),
                    helperText: '',
                    suffixIcon: IconButton(
                      icon: Icon(
                          _isHidden ? Icons.visibility : Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          _isHidden = !_isHidden;
                        });
                      },
                    ),
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                    ),
                  ),
                ),
              ),
              Container(  // Phone number
                padding: const EdgeInsets.only(top: 450.0, left: 40.0, right: 50.0),
                child: TextFormField(
                  cursorColor: Theme.of(context).textSelectionTheme.cursorColor,
                  initialValue: '+40',
                  maxLength: 12,
                  decoration:  InputDecoration(
                    icon: const Icon(Icons.phone),
                    labelText: 'PHONE NUMBER',
                    labelStyle: const TextStyle(
                      color: Colors.grey,
                    ),
                    helperText: '',
                    suffixIcon: IconButton(
                        icon: const Icon(
                            Icons.send
                        ),
                        onPressed: () {
                          myFocusNode.requestFocus();
                          print('1234');}

                    ),
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                    ),
                  ),
                ),
              ),
              Container(  // SMS
                padding: const EdgeInsets.only(top: 520.0, left: 285.0, right: 50.0),
                child: TextFormField(
                  focusNode: myFocusNode,
                  cursorColor: Theme.of(context).textSelectionTheme.cursorColor,
                  initialValue: '',
                  maxLength: 4,
                  decoration:  const InputDecoration(
                    helperText: '4-digit',
                    labelStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 1,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              Container(  // Login button
                  padding: const EdgeInsets.only(top: 650.0, left: 300.0, right: 0.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                    ),
                    onPressed: () {
                      // Navigate to the second route
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SecondRoute()),
                      );
                    },
                    child: const Text('Login'),
                  )
              ),
              Container(  // Register button
                  padding: const EdgeInsets.only(top: 650.0, left: 120.0, right: 0.0),
                  child: TextButton.icon(
                    icon: const Icon(Icons.mail_outlined, size: 18),
                    label: const Text("Register with Gmail"),
                    onPressed: () {

                    },
                  )
              ),
            ],
          )
        ],
      ),
    );

  }
}

class SecondRoute extends StatefulWidget {
  @override
  _SecondRouteState createState() => _SecondRouteState();
}

class _SecondRouteState extends State<SecondRoute> {
  //setting all the switches to off
  bool _livingRoom = true;
  bool _kitchen = false;
  bool _bathroom = true;
  bool _bedroom1 = false;
  bool _bedroom2 = false;
  bool _selectAll = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, //avoid pixel overflow when using keyboard
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
                padding: const EdgeInsets.only(top: 120.0, bottom: 30.0),
                child: const Text.rich(
                  TextSpan(
                    children: <TextSpan>[
                      TextSpan(text: ' my',
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontSize: 28.0,
                            color: Colors.green,
                          )
                      ),
                      TextSpan(text: 'Home ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 36.0,
                            color: Colors.green,
                          )
                      ),
                    ],
                  ),
                )
            ),
            Column(
              children: <Widget>[
                const Align(
                  alignment: Alignment.topLeft,
                ),
                SizedBox(  //container to add a room
                  width: 200.0,
                  child: TextFormField(

                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },

                    cursorColor: Theme.of(context).textSelectionTheme.cursorColor,
                    decoration:  const InputDecoration(
                      labelText: 'Add a room',
                      labelStyle: TextStyle(
                        color: Colors.grey,
                      ),
                      helperText: '',
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                      ),
                    ),
                  ),
                ),

                TextButton.icon( // Add Button
                  onPressed: () => showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: const Text('Do you want to add a room?'),
                      content: const Text('Please confirm.'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () => Navigator.pop(context, 'Cancel'),
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const ThirdRoute(title: 'hi')),
                            );
                          },
                          child: const Text('Yes'),
                        ),
                      ],
                    ),
                  ),
                  icon: const Icon(Icons.add),
                  label: const Text('Add'),
                ),
              ],
            ),
            SwitchListTile(
              title: const Text('Living room', style: TextStyle(color: Colors.black54, fontWeight: FontWeight.w700, fontSize: 16
              ),
              ),
              activeColor:  Colors.green,
              activeTrackColor: Colors.greenAccent[100],
              inactiveThumbColor: Colors.black45,
              inactiveTrackColor: Colors.black26,
              onChanged: (bool value) => setState(() => _livingRoom = value),
              value: _livingRoom,
              secondary: Icon(_livingRoom ? Icons.chair_outlined : Icons.chair_rounded),
            ),
            SwitchListTile(
              title: const Text('Kitchen', style: TextStyle(color: Colors.black54, fontWeight: FontWeight.w700, fontSize: 16
              ),
              ),
              activeColor:  Colors.green,
              activeTrackColor: Colors.greenAccent[100],
              inactiveThumbColor: Colors.black45,
              inactiveTrackColor: Colors.black26,
              onChanged: (bool value) => setState(() => _kitchen = value),
              value: _kitchen,
              secondary: Icon(_kitchen ? Icons.dining_outlined : Icons.dining_rounded),
            ),
            SwitchListTile(
              title: const Text('Bathroom', style: TextStyle(color: Colors.black54, fontWeight: FontWeight.w700, fontSize: 16
              ),
              ),
              activeColor:  Colors.green,
              activeTrackColor: Colors.greenAccent[100],
              inactiveThumbColor: Colors.black45,
              inactiveTrackColor: Colors.black26,
              onChanged: (bool value) => setState(() => _bathroom = value),
              value: _bathroom,
              secondary: Icon(_bathroom ? Icons.bathtub_outlined : Icons.bathtub_rounded),
            ),
            SwitchListTile(
              title: const Text('Bedroom 1', style: TextStyle(color: Colors.black54, fontWeight: FontWeight.w700, fontSize: 16
              ),
              ),
              activeColor:  Colors.green,
              activeTrackColor: Colors.greenAccent[100],
              inactiveThumbColor: Colors.black45,
              inactiveTrackColor: Colors.black26,
              onChanged: (bool value) => setState(() => _bedroom1 = value),
              value: _bedroom1,
              secondary: Icon(_bedroom1 ? Icons.bedroom_parent_outlined : Icons.bedroom_parent_rounded),
            ),
            SwitchListTile(
              title: const Text('Bedroom 2', style: TextStyle(color: Colors.black54, fontWeight: FontWeight.w700, fontSize: 16
              ),
              ),
              activeColor:  Colors.green,
              activeTrackColor: Colors.greenAccent[100],
              inactiveThumbColor: Colors.black45,
              inactiveTrackColor: Colors.black26,
              onChanged: (bool value) => setState(() => _bedroom2 = value),
              value: _bedroom2,
              secondary: Icon(_bedroom2 ? Icons.bedroom_child_outlined : Icons.bedroom_child_rounded),
            ),
            SwitchListTile(
              title: const Text('Select All', style: TextStyle(color: Colors.black54, fontWeight: FontWeight.w900, fontSize: 17),
              ),
              activeColor:  Colors.green,
              activeTrackColor: Colors.greenAccent[100],
              inactiveThumbColor: Colors.black45,
              inactiveTrackColor: Colors.black26,
              onChanged: (bool value) => setState(() {
                _selectAll = value;
                _livingRoom = value;
                _kitchen = value;
                _bathroom = value;
                _bedroom1 = value;
                _bedroom2 = value;
              }),
              value: _selectAll,
            ),
            Container(  // Logout button
                padding: const EdgeInsets.only(top: 40.0, left: 250.0),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const FirstRoute(title: 'hi')),
                    );
                  },
                  child: const Text('Logout'),
                )
            ),
          ],
        ),
      ),
    );
  }
}



class ThirdRoute extends StatefulWidget {
  const ThirdRoute({Key? key, required this.title}) : super(key: key);



  final String title;

  @override
  State<ThirdRoute> createState() => _ThirdRouteState();
}

class _ThirdRouteState extends State<ThirdRoute> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      resizeToAvoidBottomInset: false, //avoid pixel overflow when using keyboard
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                    padding: const EdgeInsets.only(top: 130.0, left: 130),
                    child: const Text.rich(
                      TextSpan(
                        children: <TextSpan>[
                          TextSpan(text: ' my',
                              style: TextStyle(
                                fontStyle: FontStyle.italic,
                                fontSize: 28.0,
                                color: Colors.green,
                              )
                          ),
                          TextSpan(text: 'Home ',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 36.0,
                                color: Colors.green,
                              )
                          ),
                        ],
                      ),
                    )
                ),
                Container( // Description
                    padding: const EdgeInsets.only(top: 250.0, left: 40.0, right: 50.0),
                    child:  TextField(
                      controller: _controller,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      maxLength: 200,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText: 'Description',
                        hintText: 'Second floor living room spotlights...' ,
                        suffixIcon: IconButton(
                          onPressed: _controller.clear,
                          icon: const Icon(Icons.clear),
                        ),
                      ),
                    )
                ),
                Container(  // Energy consumption
                  padding: const EdgeInsets.only(top: 520.0, left: 150.0, right: 50.0),
                  child:  TextFormField(
                    cursorColor: Theme.of(context).textSelectionTheme.cursorColor,
                    decoration:  const InputDecoration(
                      icon: Icon(Icons.power_outlined),
                      labelText: 'Energy Consumption',
                      hintText: 'kWh',
                      labelStyle: TextStyle(
                        color: Colors.green,
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                      ),
                    ),
                  ),
                ),
                Stack(
                  children: <Widget>[
                    Container(  // Submit Button
                      padding: const EdgeInsets.only(top: 650.0, left: 260.0,),
                      child: TextButton.icon(
                        onPressed: () => showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: const Text('Done!'),
                            content: const Text('Room added successfully.'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => SecondRoute()),
                                  );
                                },
                                child: const Text('Ok'),
                              ),
                            ],
                          ),
                        ),
                        icon: const Icon(Icons.done),
                        label: const Text('Submit'),
                      ),
                    ),
                    Container(  // Return Button
                        padding: const EdgeInsets.only(top: 650.0, left: 170.0,),
                        child: TextButton.icon(
                          onPressed: () {
                            // Navigate to the second route
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => SecondRoute()),
                            );
                          },
                          icon: const Icon(Icons.arrow_back, size: 18),
                          label: const Text('Return'),
                        )
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}