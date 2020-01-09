// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStore on _HomeStore, Store {
  final _$loadingAtom = Atom(name: '_HomeStore.loading');

  @override
  bool get loading {
    _$loadingAtom.context.enforceReadPolicy(_$loadingAtom);
    _$loadingAtom.reportObserved();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.context.conditionallyRunInAction(() {
      super.loading = value;
      _$loadingAtom.reportChanged();
    }, _$loadingAtom, name: '${_$loadingAtom.name}_set');
  }

  final _$dataAtom = Atom(name: '_HomeStore.data');

  @override
  List<DataX> get data {
    _$dataAtom.context.enforceReadPolicy(_$dataAtom);
    _$dataAtom.reportObserved();
    return super.data;
  }

  @override
  set data(List<DataX> value) {
    _$dataAtom.context.conditionallyRunInAction(() {
      super.data = value;
      _$dataAtom.reportChanged();
    }, _$dataAtom, name: '${_$dataAtom.name}_set');
  }

  final _$objAtom = Atom(name: '_HomeStore.obj');

  @override
  Data get obj {
    _$objAtom.context.enforceReadPolicy(_$objAtom);
    _$objAtom.reportObserved();
    return super.obj;
  }

  @override
  set obj(Data value) {
    _$objAtom.context.conditionallyRunInAction(() {
      super.obj = value;
      _$objAtom.reportChanged();
    }, _$objAtom, name: '${_$objAtom.name}_set');
  }

  final _$paramsAtom = Atom(name: '_HomeStore.params');

  @override
  Map<String, int> get params {
    _$paramsAtom.context.enforceReadPolicy(_$paramsAtom);
    _$paramsAtom.reportObserved();
    return super.params;
  }

  @override
  set params(Map<String, int> value) {
    _$paramsAtom.context.conditionallyRunInAction(() {
      super.params = value;
      _$paramsAtom.reportChanged();
    }, _$paramsAtom, name: '${_$paramsAtom.name}_set');
  }

  final _$getDataAsyncAction = AsyncAction('getData');

  @override
  Future<dynamic> getData() {
    return _$getDataAsyncAction.run(() => super.getData());
  }

  final _$getVersionAsyncAction = AsyncAction('getVersion');

  @override
  Future<dynamic> getVersion() {
    return _$getVersionAsyncAction.run(() => super.getVersion());
  }

  final _$_HomeStoreActionController = ActionController(name: '_HomeStore');

  @override
  void changePage(int index) {
    final _$actionInfo = _$_HomeStoreActionController.startAction();
    try {
      return super.changePage(index);
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }
}
