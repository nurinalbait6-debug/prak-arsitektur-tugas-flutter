import 'package:flutter/material.dart';
import '../data/repositori_tugas.dart';
import '../ui/panel_tugas.dart';
import 'pengendali_tugas.dart';
class LayarMvc extends StatefulWidget {
  const LayarMvc({super.key});
  @override
  State<LayarMvc> createState() => _LayarMvcState();
}
class _LayarMvcState extends State<LayarMvc> {
  final _pengendali = PengendaliTugas(RepositoriTugas());
  bool _tambah(String input) {
    final berhasil = _pengendali.tambah(input);
    setState(() {});
    return berhasil;
  }
  void _ubahStatus(int id) {
    setState(() => _pengendali.ubahStatus(id));
  }
  void _ubahFilter(bool nilai) {
    setState(() => _pengendali.aturFilter(nilai));
  }
  @override
  Widget build(BuildContext context) => PanelTugas(
    judul: 'Daftar Tugas · MVC',
    daftar: _pengendali.daftar,
    totalTugas: _pengendali.totalTugas,
    jumlahSelesai: _pengendali.jumlahSelesai,
    hanyaBelumSelesai: _pengendali.hanyaBelumSelesai,
    galat: _pengendali.galat,
    onTambah: _tambah,
    onUbahStatus: _ubahStatus,
    onUbahFilter: _ubahFilter,
  );
}