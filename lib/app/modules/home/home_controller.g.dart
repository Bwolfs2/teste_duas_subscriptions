// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $HomeController = BindInject(
  (i) => HomeController(i<HomeRepository>()),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  Computed<ObservableStream<List<Author>>> _$listaAuthorComputed;

  @override
  ObservableStream<List<Author>> get listaAuthor => (_$listaAuthorComputed ??=
          Computed<ObservableStream<List<Author>>>(() => super.listaAuthor,
              name: '_HomeControllerBase.listaAuthor'))
      .value;
  Computed<ObservableStream<List<Book>>> _$listaBookComputed;

  @override
  ObservableStream<List<Book>> get listaBook => (_$listaBookComputed ??=
          Computed<ObservableStream<List<Book>>>(() => super.listaBook,
              name: '_HomeControllerBase.listaBook'))
      .value;

  final _$snapshotAuthorAtom = Atom(name: '_HomeControllerBase.snapshotAuthor');

  @override
  Snapshot<List<Author>> get snapshotAuthor {
    _$snapshotAuthorAtom.reportRead();
    return super.snapshotAuthor;
  }

  @override
  set snapshotAuthor(Snapshot<List<Author>> value) {
    _$snapshotAuthorAtom.reportWrite(value, super.snapshotAuthor, () {
      super.snapshotAuthor = value;
    });
  }

  final _$snapshotBookAtom = Atom(name: '_HomeControllerBase.snapshotBook');

  @override
  Snapshot<List<Book>> get snapshotBook {
    _$snapshotBookAtom.reportRead();
    return super.snapshotBook;
  }

  @override
  set snapshotBook(Snapshot<List<Book>> value) {
    _$snapshotBookAtom.reportWrite(value, super.snapshotBook, () {
      super.snapshotBook = value;
    });
  }

  @override
  String toString() {
    return '''
snapshotAuthor: ${snapshotAuthor},
snapshotBook: ${snapshotBook},
listaAuthor: ${listaAuthor},
listaBook: ${listaBook}
    ''';
  }
}
