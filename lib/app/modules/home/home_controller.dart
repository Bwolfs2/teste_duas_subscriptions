import 'package:hasura_connect/hasura_connect.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste_duas_subscriptions/app/modules/home/home_repository.dart';

part 'home_controller.g.dart';

@Injectable()
class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase extends Disposable with Store {
  final HomeRepository repository;

  @observable
  Snapshot<List<Author>> snapshotAuthor;

  @observable
  Snapshot<List<Book>> snapshotBook;

  _HomeControllerBase(this.repository) {
    getData();
  }

  Future getData() async {
    snapshotAuthor = await repository.first();
    snapshotBook = await repository.second();
  }

  @computed
  ObservableStream<List<Author>> get listaAuthor =>
      snapshotAuthor?.asObservable();

  @computed
  ObservableStream<List<Book>> get listaBook => snapshotBook?.asObservable();

  @override
  void dispose() {
    snapshotBook.close();
    snapshotAuthor.close();
  }
}
