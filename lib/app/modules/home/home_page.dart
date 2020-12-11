import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          Text('Authors:'),
          Observer(
            builder: (context) {
              if (controller.listaAuthor?.hasError ?? false) {
                print(controller.listaAuthor.error);
                return Center(
                  child: Text("Ocorreu um erro ao realizar essa requisição."),
                );
              }

              if (controller.listaAuthor?.value == null) {
                return Center(child: CircularProgressIndicator());
              }
              return ListView.builder(
                shrinkWrap: true,
                itemCount: controller.listaAuthor.value.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(controller.listaAuthor.value[index].name),
                  );
                },
              );
            },
          ),
          Text('Books'),
          Observer(
            builder: (context) {
              if (controller.listaBook?.hasError ?? false) {
                print(controller.listaBook.error);
                return Center(
                  child: Text("Ocorreu um erro ao realizar essa requisição."),
                );
              }

              if (controller.listaBook?.value == null) {
                return Center(child: CircularProgressIndicator());
              }
              return ListView.builder(
                shrinkWrap: true,
                itemCount: controller.listaBook.value.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(controller.listaBook.value[index].name),
                  );
                },
              );
            },
          )
        ],
      ),
    );
  }
}
