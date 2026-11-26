import '../data/repositori_tugas.dart';
import '../model/tugas.dart';
class PengendaliTugas {
  PengendaliTugas(this._repo);
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
    if (_galat != null) return false;
    _repo.tambah(input.trim());
    return true;
  }
  void ubahStatus(int id) => _repo.ubahStatus(id);
  void aturFilter(bool nilai) {
    _hanyaBelumSelesai = nilai;
  }
}