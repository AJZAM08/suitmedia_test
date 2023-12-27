import 'package:flutter/material.dart';
import 'package:suitmedia_test/first_screen.dart';
import 'package:suitmedia_test/third_screen.dart';

class SecondScreen extends StatefulWidget {
  final String? nama;
  final int? id;
  const SecondScreen({Key? key, this.nama, this.id}) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Second Screen',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        child: Column(
            children: [
              widget.id == null
                  ? Expanded(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Welcome',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.grey[600]),
                                ),
                                Text(
                                  namaku.name!,
                                  style: TextStyle(
                                      fontSize: 25, fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                          Center(
                            child: Text(
                              'Selected User Name',
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(builder: (context) => ThirdScreen())
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(13),
                                child: Text(
                                  'Choose a User',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              style: ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(
                                    Color.fromARGB(255, 43, 99, 123)),
                                shape: MaterialStatePropertyAll(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                  )
                  : Expanded(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Welcome',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.grey[600]),
                                ),
                                Text(
                                  namaku.name!,
                                  style: TextStyle(
                                      fontSize: 25, fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                          Center(
                            child: Text(
                              Users.userList
                                      .where((Users user) => user.id == widget.id)
                                      .first
                                      .firstName +
                                  ' ' +
                                  Users.userList
                                      .where((Users user) => user.id == widget.id)
                                      .first
                                      .lastName,
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(builder: (context) => ThirdScreen())
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(13),
                                child: Text(
                                  'Choose a User',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              style: ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(
                                    Color.fromARGB(255, 43, 99, 123)),
                                shape: MaterialStatePropertyAll(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                  )
            ]),
      ),
    );
  }
}
