// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TodoStore on _TodoStore, Store {
  final _$todoLostAtom = Atom(name: '_TodoStore.todoLost');

  @override
  List<dynamic> get todoLost {
    _$todoLostAtom.context.enforceReadPolicy(_$todoLostAtom);
    _$todoLostAtom.reportObserved();
    return super.todoLost;
  }

  @override
  set todoLost(List<dynamic> value) {
    _$todoLostAtom.context.conditionallyRunInAction(() {
      super.todoLost = value;
      _$todoLostAtom.reportChanged();
    }, _$todoLostAtom, name: '${_$todoLostAtom.name}_set');
  }

  final _$imgUrlAtom = Atom(name: '_TodoStore.imgUrl');

  @override
  String get imgUrl {
    _$imgUrlAtom.context.enforceReadPolicy(_$imgUrlAtom);
    _$imgUrlAtom.reportObserved();
    return super.imgUrl;
  }

  @override
  set imgUrl(String value) {
    _$imgUrlAtom.context.conditionallyRunInAction(() {
      super.imgUrl = value;
      _$imgUrlAtom.reportChanged();
    }, _$imgUrlAtom, name: '${_$imgUrlAtom.name}_set');
  }

  final _$_TodoStoreActionController = ActionController(name: '_TodoStore');

  @override
  void addTodo() {
    final _$actionInfo = _$_TodoStoreActionController.startAction();
    try {
      return super.addTodo();
    } finally {
      _$_TodoStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setImgUrl(String url) {
    final _$actionInfo = _$_TodoStoreActionController.startAction();
    try {
      return super.setImgUrl(url);
    } finally {
      _$_TodoStoreActionController.endAction(_$actionInfo);
    }
  }
}
