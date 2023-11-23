import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Suhu Converter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double c = 0.0;
  double r = 0.0;
  double k = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Konverter Suhu"),
      ),
      body: SingleChildScrollView(
        // Container
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),

          // Column
          child: Column(
            children: [
              // Input Text
              TextFormField(
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Masukkan Suhu Dalam Celcius',
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  validator: (angka) {
                    if (angka!.isEmpty) {
                      return 'Masukkan sushu terlebih dahulu';
                    }
                  },
                  onChanged: (angka) {
                    setState(() {
                      c = double.tryParse(angka) ?? 0.0;
                    });
                  }),
              // SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(top: 200),

                // Row
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Column1
                    Column(
                      children: [
                        // Text 1
                        Text(
                          'Suhu Dalam Kelvin',
                          style: TextStyle(fontSize: 15),
                        ),
                        SizedBox(height: 10),

                        // Text2
                        Text(
                          "$k",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 30),
                        ),
                      ],
                    ),

                    // Column 2
                    Column(
                      children: [
                        // Text 1
                        Text(
                          'Suhu Dalam Reamor',
                          style: TextStyle(fontSize: 15),
                        ),
                        SizedBox(height: 10),

                        // Text 2
                        Text(
                          "$r",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 30),
                        ),
                      ],
                    )
                  ],
                ),
              ),

              // Button
              SizedBox(height: 100),
              Container(
                margin: EdgeInsets.only(top: 220),
                child: InkWell(
                  onTap: () {
                    k = c + 273.15;
                    r = c * 4 / 5;
                    setState(() {});
                  },
                  child: Container(
                    width: 460,
                    height: 47,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(5)),
                    alignment: Alignment.center,
                    child: Text(
                      "Konversi Suhu",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
