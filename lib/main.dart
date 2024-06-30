import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Login';

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(appTitle),
        ),
        body: const MyCustomForm(),
      ),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();
  final String userName = "huy";
  final String pass = "123";
  int loginTimes = 0;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter user name';
              } else if (value != userName) {
                return 'Incorrect user name';
              }
              return null;
            },
            decoration: const InputDecoration(
              labelText: 'Username',
            ),
          ),
          TextFormField(
            obscureText: true,
            decoration: const InputDecoration(
              labelText: 'Password',
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter password';
              } else if (value != pass) {
                return 'Incorrect Password';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  loginTimes = 0;
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ScreenHome()),
                  );
                } else {
                  loginTimes++;

                  if (loginTimes >= 3) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Incorrect password 3 times'),
                        backgroundColor: Colors.red,
                      ),
                    );

                    // setState(() {
                    //   loginTimes = 0;
                    // });
                  }
                }
              },
              child: const Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarHome(),
      body: bodyHome(),
    );
  }

  AppBar appBarHome() {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Location',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                ),
              ),
              Row(
                children: [
                  Text(
                    'Jakarta',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                  Icon(
                    Icons.arrow_drop_down,
                    color: Colors.black,
                  ),
                ],
              ),
            ],
          ),
          Column(
            children: [
              Image.asset(
                'assets/image/IC_Notification.png',
                width: 30,
                height: 30,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Padding bodyHome() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search, color: Colors.grey),
                    hintText: 'Search address, or near you',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Image.asset(
                  'assets/image/IC_Filter.png',
                  width: 30,
                  height: 30,
                ),
              ),
            ],
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Container(
                    width: 100,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(14),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          spreadRadius: 2,
                          blurRadius: 4,
                          offset: Offset(2, 4),
                        ),
                      ],
                    ),
                    child: const Center(
                        child: Text('House',
                            style: TextStyle(color: Colors.white))),
                  ),
                ),
                const SizedBox(width: 4),
                Container(
                  width: 100,
                  height: 40,
                  child: const Center(
                      child: Text('Apartment',
                          style: TextStyle(color: Colors.black))),
                ),
                const SizedBox(width: 4),
                Container(
                  width: 100,
                  height: 40,
                  child: const Center(
                      child:
                          Text('Hotel', style: TextStyle(color: Colors.black))),
                ),
                const SizedBox(width: 4),
                Container(
                  width: 100,
                  height: 40,
                  child: const Center(
                      child:
                          Text('Villa', style: TextStyle(color: Colors.black))),
                ),
                const SizedBox(width: 4),
                Container(
                  width: 100,
                  height: 40,
                  child: const Center(
                      child: Text('Homestay',
                          style: TextStyle(color: Colors.black))),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Near from you',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  'See more',
                  style: TextStyle(fontSize: 14, color: Colors.black54),
                ),
              ],
            ),
          ),
          SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: <Widget>[
                  houseHorizontal(
                    image: 'assets/image/house.png',
                    name: 'Dreamsville House',
                    address: 'Jl. Sultan Iskandar Muda',
                    distance: '1.8 km',
                  ),
                  houseHorizontal(
                    image: 'assets/image/house_2.png',
                    name: 'Ascot House',
                    address: 'Jl. Cilandak Tengah',
                    distance: '3.0 km',
                  ),
                  houseHorizontal(
                    image: 'assets/image/house.png',
                    name: 'Dreamsville House',
                    address: 'Jl. Sultan Iskandar Muda',
                    distance: '1.8 km',
                  ),
                  houseHorizontal(
                    image: 'assets/image/house_2.png',
                    name: 'Ascot House',
                    address: 'Jl. Cilandak Tengah',
                    distance: '3.0 km',
                  ),
                ],
              )),
          const Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Best for you',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  'See more',
                  style: TextStyle(fontSize: 14, color: Colors.black54),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              scrollDirection: Axis.vertical,
              children: <Widget>[
                houseVertical(
                  image: 'assets/image/house_3.png',
                  name: 'Orchad House',
                  price: 'Rp. 2.500.000.000 / Year',
                  bedroom: '6 Bedroom',
                  bathroom: '4 Bathroom',
                ),
                houseVertical(
                  image: 'assets/image/house_4.png',
                  name: 'The Hollies House',
                  price: 'Rp. 2.000.000.000 / Year',
                  bedroom: '5 Bedroom',
                  bathroom: '2 Bathroom',
                ),
                houseVertical(
                  image: 'assets/image/house_3.png',
                  name: 'Orchad House',
                  price: 'Rp. 2.500.000.000 / Year',
                  bedroom: '6 Bedroom',
                  bathroom: '4 Bathroom',
                ),
                houseVertical(
                  image: 'assets/image/house_4.png',
                  name: 'The Hollies House',
                  price: 'Rp. 2.000.000.000 / Year',
                  bedroom: '5 Bedroom',
                  bathroom: '2 Bathroom',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget houseHorizontal(
      {required String image,
      required String name,
      required String address,
      required String distance}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  image,
                  width: 210,
                  height: 250,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Colors.black.withOpacity(0.6),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 10,
                right: 10,
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/image/IC_Location.png',
                        width: 20,
                        height: 20,
                      ),
                      Text(
                        distance,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 30,
                left: 10,
                child: Text(
                  name,
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              Positioned(
                bottom: 10,
                left: 10,
                child: Text(
                  address,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget houseVertical(
      {required String image,
      required String name,
      required String price,
      required String bedroom,
      required String bathroom}) {
    return Container(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              image,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold)),
              Text(price,
                  style: const TextStyle(fontSize: 14, color: Colors.blue)),
              Row(
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'assets/image/IC_Bed.png',
                        width: 25,
                        height: 25,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        bedroom,
                        style: const TextStyle(
                            fontSize: 14, color: Colors.black54),
                      ),
                    ],
                  ),
                  const SizedBox(width: 20),
                  Row(
                    children: [
                      Image.asset(
                        'assets/image/IC_Bath.png',
                        width: 25,
                        height: 25,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        bathroom,
                        style: const TextStyle(
                            fontSize: 14, color: Colors.black54),
                      ),
                    ],
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
