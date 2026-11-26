import 'package:flutter/material.dart';
import '../data/repositori_tugas.dart';
import '../ui/panel_tugas.dart';
import 'tugas_view_model.dart';
class LayarMvvm extends StatefulWidget {
  const LayarMvvm({super.key});
  @override
  State<LayarMvvm> createState() => _LayarMvvmState();
}
class _LayarMvvmState extends State<LayarMvvm> {
  final _viewModel = TugasViewModel(RepositoriTugas());
  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) => ListenableBuilder(
    listenable: _viewModel,
    builder:
        (context, child) => PanelTugas(
          judul: 'Daftar Tugas · MVVM',
          daftar: _viewModel.daftar,
          totalTugas: _viewModel.totalTugas,
          jumlahSelesai: _viewModel.jumlahSelesai,
          hanyaBelumSelesai: _viewModel.hanyaBelumSelesai,
          galat: _viewModel.galat,
          onTambah: _viewModel.tambah,
          onUbahStatus: _viewModel.ubahStatus,
          onUbahFilter: _viewModel.aturFilter,
        ),
  );
}