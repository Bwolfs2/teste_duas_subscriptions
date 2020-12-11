import 'package:hasura_connect/hasura_connect.dart';
import 'package:teste_duas_subscriptions/app/modules/home/home_repository.dart';

import 'app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:teste_duas_subscriptions/app/app_widget.dart';
import 'package:teste_duas_subscriptions/app/modules/home/home_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        $AppController,
        Bind((i) => HasuraConnect('https://bwolfdev.herokuapp.com/v1/graphql'))
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, module: HomeModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
