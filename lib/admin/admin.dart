import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:hackitba_utc/redux/store_content.dart';

class AdminView extends StatefulWidget {
  const AdminView({Key? key}) : super(key: key);

  @override
  State<AdminView> createState() => _AdminViewState();
}

class _AdminViewState extends State<AdminView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
      ),
      appBar: AppBar(title: Text("EasyWeb - Administrador")),
      body: StoreConnector<StoreContent, Widget>(
        converter: (store) => ListView(children: [
          ...store.state.webPages.map(
            (e) => ListTile(title: Text(e.title), subtitle: Text(e.url)),
          ),
        ]),
        builder: (context, child) => Container(
          child: child,
          padding: EdgeInsets.all(35),
        ),
      ),
    );
  }
}
