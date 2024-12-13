import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'package:chat_socket_app/models/user.dart';

class HomePage extends StatefulWidget {
  static const String route = 'home_route';

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final users = [
    User(uid: '1', name: 'Anakin', email: 'test1@test.com', online: true),
    User(uid: '2', name: 'Obiwan', email: 'test2@test.com', online: false),
    User(uid: '3', name: 'Leia', email: 'test3@test.com', online: true),
    User(uid: '4', name: 'Yoda', email: 'test4@test.com', online: true),
  ];
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('My name'),
          elevation: 1,
          backgroundColor: Colors.white,
          leading: const Icon(Icons.logout_outlined),
          actions: [
            Container(
                margin: const EdgeInsets.only(right: 10),
                child: Icon(
                  Icons.check_circle,
                  color: Colors.blue[300],
                ))
          ],
        ),
        body: SmartRefresher(
          controller: _refreshController,
          enablePullDown: true,
          onRefresh: _loadUsers,
          header: WaterDropHeader(
            complete: Icon(Icons.check, color: Colors.blue[400]),
            waterDropColor: Colors.blue,
          ),
          child: _listViewUsers(),
        ));
  }

  ListView _listViewUsers() {
    return ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (_, int index) => _userListTile(users[index]),
        separatorBuilder: (_, __) => const Divider(),
        itemCount: users.length);
  }

  ListTile _userListTile(User user) {
    return ListTile(
        title: Text(user.name),
        subtitle: Text(user.email),
        leading: CircleAvatar(
          child: Text(user.name.substring(0, 2).toUpperCase()),
        ),
        trailing: Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
              color: user.online ? Colors.green[300] : Colors.red,
              borderRadius: BorderRadius.circular(100)),
        ));
  }

  _loadUsers() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
  }
}
