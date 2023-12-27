import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:suitmedia_test/second_screen.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({super.key});

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      final response = await http.get(Uri.parse('https://reqres.in/api/users?page=1&per_page=10'));

      if (response.statusCode == 200) {
        // Decode JSON response
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        final List<dynamic> users = responseData['data'];

        // Clear existing data
        Users.userList.clear();

        // Add each user to the list
        for (var userData in users) {
          Users user = Users(
            id: userData['id'],
            email: userData['email'],
            firstName: userData['first_name'],
            lastName: userData['last_name'],
            avatar: userData['avatar'],
          );
          Users.userList.add(user);
        }

        // Update the UI
        setState(() {});
      } else {
        // Handle error
        print('Failed to load data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Third Screen',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Users.userList.isEmpty
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: Users.userList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25,
                      vertical: 5
                    ),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SecondScreen(id: Users.userList[index].id,))
                        );
                      },
                      child: Container(
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundImage: NetworkImage(Users.userList[index].avatar),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${Users.userList[index].firstName} ${Users.userList[index].lastName}',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  Users.userList[index].email,
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.grey[500]
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }),
    );
  }
}

class Users {
  final int id;
  final String email;
  final String firstName;
  final String lastName;
  final String avatar;

  Users({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avatar,
  });

  static List<Users> userList = [];
}
