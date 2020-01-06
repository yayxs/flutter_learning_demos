// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStore on _HomeStore, Store {
  final _$tileAtom = Atom(name: '_HomeStore.tile');

  @override
  bool get tile {
    _$tileAtom.context.enforceReadPolicy(_$tileAtom);
    _$tileAtom.reportObserved();
    return super.tile;
  }

  @override
  set tile(bool value) {
    _$tileAtom.context.conditionallyRunInAction(() {
      super.tile = value;
      _$tileAtom.reportChanged();
    }, _$tileAtom, name: '${_$tileAtom.name}_set');
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
  void setTile(String key, dynamic value) {
    final _$actionInfo = _$_HomeStoreActionController.startAction();
    try {
      return super.setTile(key, value);
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }
}
