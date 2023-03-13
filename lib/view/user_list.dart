import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:user_list2/provider/list_provider.dart';

class UserList extends StatefulWidget {
  const UserList({super.key});

  @override
  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  @override
  Widget build(BuildContext context) {
    List<String> userList = Provider.of<UserListProvider>(context).userList;
    return Scaffold(
      appBar: AppBar(
        title: const Text('User List'),
        leading: GestureDetector(
          child: const Icon( Icons.arrow_back_ios, color: Colors.white, ),
          onTap: () {
             GoRouter.of(context).go("/");
          },
        ),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: userList.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text('${userList[index]}'),
              leading: const Icon(Icons.person),
              trailing: IconButton(
                onPressed: () {
                  Provider.of<UserListProvider>(context, listen: false)
                      .deleteName(index);
                },
                icon: const Icon(Icons.delete_forever_outlined),
              ),
            );
          },
        ),
      ),
    );
  }
}
