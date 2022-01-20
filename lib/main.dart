import 'package:flutter/material.dart';
import 'package:calorie_tracker/end_screen.dart';

Gender? _gender = Gender.Male;
String dropdownValue = 'Basal Metabolic Rate (BMR)';
TextEditingController yourAge = TextEditingController();
TextEditingController yourHeight = TextEditingController();
TextEditingController yourWeight = TextEditingController();
String personAge = "";
String personHeight = "";
String personWeight = "";
double BMR = 0;
double calories = 0;
int age = 0;
int height = 0;
int weight = 0;
bool isMale = true;
bool isFemale = false;
bool isBMR = false;
bool isSedentary = false;
bool isLight = false;
bool isModerate = false;
bool isActive = false;
bool isVeryActive = false;
bool isExtraActive = false;
enum Gender { Male, Female }


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calorie Tracker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Calorie Tracker'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      backgroundColor: Colors.orange[500],
      title: const Text('Calorie Tracker',style: TextStyle(color: Colors.black),),
      iconTheme: const IconThemeData(color: Colors.black,),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Row(
                children: const [
                  Text(
                    "Select Gender",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w800,
                    ),
                    ),
                ],
              ),
              ListTile(
                title: const Text('Male'),
                leading: Radio<Gender>(
                  value: Gender.Male,
                  groupValue: _gender,
                  activeColor: Colors.blue,
                  onChanged: (Gender? value) {
                    setState(() {
                      isMale = true;
                      isFemale = false;
                      _gender = value;
                    });
                   
                  },
                ),
              ),
              ListTile(
                title: const Text('Female'),
                leading: Radio<Gender>(
                  value: Gender.Female,
                  groupValue: _gender,
                  activeColor: Colors.blue,
                  onChanged: (Gender? value) {
                    setState(() {
                      isMale = false;
                      isFemale = true;
                      _gender = value;
                    });
                  },
                ),
              ),
              const SizedBox(height: 20,),
              Row(
                children: const [
                  Text("Input age: ",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
              const Padding(padding: EdgeInsets.only(bottom: 10)),
              TextField(
                controller: yourAge,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "Age",
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(9),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              
              Row(
                children: const [
                  Text("Input height(cm): ",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
              const Padding(padding: EdgeInsets.only(bottom: 10)),
              TextField(
                controller: yourHeight,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "Height(cm)",
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              Row(
                children: const [
                  Text(
                    "Input Weight(kg): ",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
              const Padding(padding: EdgeInsets.only(bottom: 10)),
              TextField(
                controller: yourWeight,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "Weight(kg)",
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              const Text("Select Activity:  ",
                style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w800,
                    ),
              ),
              DropdownButton<String>(
                value: dropdownValue,
                icon: const Icon(Icons.arrow_downward),
                elevation: 16,
                style: const TextStyle(fontWeight: FontWeight.w800,
                      color: Colors.black),
                underline: Container(
                  height: 2,
                  color: Colors.grey,
                ),
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownValue = newValue!;
                  });
                },
                items: <String>[
                  'Basal Metabolic Rate (BMR)',
                  'Sedentary (Little or No Exercise)',
                  'Light (1-3 times exercise/week)',
                  'Moderate (4-5 times exercise/week)',
                  'Active (daily exercise)',
                  'Very Active (intense daily exercise)',
                  'Extra Active (very intense daily exercise)',
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w800,
                    ),
                    ),
                  );
                }).toList(),
              ),
              
              const SizedBox(height: 20,),
              TextButton(
                child: const Text('Proceed'),
                style: TextButton.styleFrom(
                    primary: Colors.black,
                    backgroundColor: const Color(0xffffac30),
                    onSurface: Colors.grey,
                    textStyle: const TextStyle(fontSize: 18),
                    padding: const EdgeInsets.all(15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    )),
                onPressed: () {
                  if(yourAge.text.isNotEmpty && yourHeight.text.isNotEmpty && yourWeight.text.isNotEmpty){
                    setState(() {
                    personAge = yourAge.text;
                    personWeight = yourWeight.text;
                    personHeight = yourHeight.text;
                    age = int.parse(personAge);
                    weight = int.parse(personWeight);
                    height = int.parse(personHeight);
                  });
                  if (isMale) {
                    setState(() {
                      BMR = 88.362 +
                          (13.397 * weight) +
                          (4.799 * height) -
                          (5.677 * age);
                    });
                    if (dropdownValue.length == 33) {
                      setState(() {
                        calories = BMR * 1.2;
                      });
                    } else if (dropdownValue.length == 31) {
                      setState(() {
                        calories = BMR * 1.375;
                      });
                    } else if (dropdownValue.length == 34) {
                      setState(() {
                        calories = BMR * 1.464;
                      });
                    } else if (dropdownValue.length == 23) {
                      setState(() {
                        calories = BMR * 1.55;
                      });
                    } else if (dropdownValue.length == 36) {
                      setState(() {
                        calories = BMR * 1.724;
                      });
                    } else if (dropdownValue.length == 42) {
                      setState(() {
                        calories = BMR * 1.899;
                      });
                    }
                  }
                  if (isFemale) {
                    setState(() {
                      BMR = 447.593 +
                          (9.247 * weight) +
                          (3.098 * height) -
                          (4.330 * age);
                    });
                    if (dropdownValue.length == 33) {
                      setState(() {
                        calories = BMR * 1.2;
                      });
                    } else if (dropdownValue.length == 31) {
                      setState(() {
                        calories = BMR * 1.375;
                      });
                    } else if (dropdownValue.length == 34) {
                      setState(() {
                        calories = BMR * 1.464;
                      });
                    } else if (dropdownValue.length == 23) {
                      setState(() {
                        calories = BMR * 1.55;
                      });
                    } else if (dropdownValue.length == 36) {
                      setState(() {
                        calories = BMR * 1.724;
                      });
                    } else if (dropdownValue.length == 42) {
                      setState(() {
                        calories = BMR * 1.899;
                      });
                    }
                  }
                   Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const EndScreen()),
                  );
                    } 
                    else if(yourAge.text.isEmpty && yourHeight.text.isNotEmpty && yourWeight.text.isNotEmpty){
                      SnackBar snackBar = SnackBar(
                      content: const Text('Input Your Age'),
                      action: SnackBarAction(label: 'Close', onPressed: () {}));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    } 
                    else if(yourAge.text.isNotEmpty && yourHeight.text.isEmpty && yourWeight.text.isNotEmpty){
                      SnackBar snackBar = SnackBar(
                      content: const Text('Input Your Height'),
                      action: SnackBarAction(label: 'Close', onPressed: () {}));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                     else if(yourAge.text.isNotEmpty && yourHeight.text.isNotEmpty && yourWeight.text.isEmpty){
                      SnackBar snackBar = SnackBar(
                      content: const Text('Input Your Weight'),
                      action: SnackBarAction(label: 'Close', onPressed: () {}));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                    else if(yourAge.text.isNotEmpty && yourHeight.text.isEmpty && yourWeight.text.isEmpty){
                      SnackBar snackBar = SnackBar(
                      content: const Text('Input Your Height & Weight'),
                      action: SnackBarAction(label: 'Close', onPressed: () {}));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    else{
                      SnackBar snackBar = SnackBar(
                    content: const Text('Input Your Age, Height, and Weight '),
                    action: SnackBarAction(label: 'Close', onPressed: () {}));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  	}
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
