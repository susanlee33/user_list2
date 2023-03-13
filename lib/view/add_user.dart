import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:user_list2/provider/list_provider.dart';

class AddUser extends StatefulWidget {
  const AddUser({super.key});

  @override
  State<AddUser> createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    List<String> userList = Provider.of<UserListProvider>(context).userList;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add User'),
      ),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _controller,
                decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(15.0),
                    hintText: 'Enter name'),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
            ),
            ElevatedButton(
              onPressed: () {
                Provider.of<UserListProvider>(context, listen: false)
                    .addName(_controller.text);
                final snackBar = SnackBar(
                  content: Text("${_controller.text} added successfully"),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
              child: const Text("Add User"),
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
            ),
            OutlinedButton(
              onPressed: () {
                GoRouter.of(context).go("/UserList");
              },
              child: const Text("Go to the User List"),
            ),
          ],
        ),
      ),
    );
  }
}
