import 'package:fast_location/src/modules/home/repositories/local_storage_repository.dart';
import 'package:mobx/mobx.dart';

part 'history_controller.g.dart';

// ignore: library_private_types_in_public_api
class HistoryController = _HistoryControllerBase with _$HistoryController;

abstract class _HistoryControllerBase with Store {
  final LocalStorageRepository _localStorage = LocalStorageRepository();

  @observable
  ObservableList<String> history = ObservableList<String>();

  @action
  void loadHistory() {
    history.clear();
    history.addAll(_localStorage.getAddresses() as Iterable<String>);
  }
}