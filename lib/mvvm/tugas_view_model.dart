import 'package:flutter/foundation.dart';
import '../data/repositori_tugas.dart';
import '../model/tugas.dart';
class TugasViewModel extends ChangeNotifier {
  TugasViewModel(this._repo);
  final RepositoriTugas _repo;
  String? _galat;
  bool _hanyaBelumSelesai = false;
  bool get hanyaBelumSelesai => _hanyaBelumSelesai;
  int get totalTugas => _repo.daftar.length;
  List<Tugas> get daftar => _hanyaBelumSelesai
      ? _repo.daftar.where((tugas) => !tugas.selesai).toList()
      : _repo.daftar;
  String? get galat => _galat;
  int get jumlahSelesai => _repo.daftar.where((tugas) => tugas.selesai).length;
  bool tambah(String input) {
    _galat = validasiJudul(input);
    final berhasil = _galat == null;
    if (berhasil) _repo.tambah(input.trim());
    notifyListeners();
    return berhasil;
  }
  void ubahStatus(int id) {
    _repo.ubahStatus(id);
    notifyListeners();
  }
  void aturFilter(bool nilai) {
    _hanyaBelumSelesai = nilai;
    notifyListeners();
  }
}