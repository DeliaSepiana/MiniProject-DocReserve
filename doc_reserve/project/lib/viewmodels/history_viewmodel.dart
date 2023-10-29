import 'package:project/models/history.dart';

class HistoryViewModel {
  List<HistoryModel> _history = [];

  List<HistoryModel> get history => _history;

  // Tambahkan history ke dalam list
  void addHistory(HistoryModel historyModel) {
    _history.add(historyModel);
  }

  // Dapatkan semua history yang tersimpan
  List<HistoryModel> getAllHistory() {
    return _history;
  }

  // Bersihkan semua history
  void clearHistory() {
    _history.clear();
  }
}
