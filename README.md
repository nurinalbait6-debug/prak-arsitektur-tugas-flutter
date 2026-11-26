# Starter Praktikum Arsitektur Tugas

# Identitas
- Nama = Nurin Albait
- Nim = 362558302005
- Kelas = TRPL 2E

Jalankan dari folder yang berisi pubspec.yaml dengan Flutter 3.29.2.

    flutter pub get
    flutter test
    flutter run -d chrome

Starter memuat model, repository dalam memori, form, menu, dan smoke test. Kerjakan versi MVC, versi MVVM, dan test tambahan dengan mengikuti PDF praktikum. Layar awal kedua versi berisi petunjuk untuk mulai mengimplementasikan.

Perbandingan Arsitektur (MVC vs MVVM)

1. Penerima Aksi & Penyimpan Pilihan Filter

MVC: Aksi ketukan chip diterima oleh _LayarMvcState lewat metode _ubahFilter(bool nilai), lalu diteruskan ke class PengendaliTugas lewat metode aturFilter(bool nilai) untuk disimpan di field _hanyaBelumSelesai.

MVVM: Aksi dari PanelTugas langsung dikirim ke class TugasViewModel lewat metode aturFilter(bool nilai) yang sekaligus menyimpan nilainya di field _hanyaBelumSelesai.

2. Pemicu Rebuild & Akibat Jika Dihapus

MVC: Dipicu oleh setState() di dalam _LayarMvcState._ubahFilter(). Jika dihapus, state di PengendaliTugas tetap berubah tetapi layar tidak di-rebuild, sehingga chip tidak terlihat aktif dan daftar tugas tidak tersaring.

MVVM: Dipicu oleh notifyListeners() di dalam TugasViewModel.aturFilter() yang didengarkan ListenableBuilder pada LayarMvvm. Jika dihapus, UI tidak mendapat sinyal pembaruan sehingga daftar tidak tersaring dan filter_test.dart gagal.

3. Pemilihan Pola Arsitektur

MVC: Cocok untuk satu layar sederhana dengan sedikit aksi karena alur dari klik tombol hingga pembaruan UI mudah ditelusuri langsung di file layar. Risikonya, saat fitur bertambah kompleks (seperti filter dan ringkasan), pemanggilan setState() rawan terlupa sehingga tampilan tidak sinkron dengan data.

MVVM: Cocok untuk layar dengan banyak elemen UI yang bergantung pada state yang sama (daftar tersaring, ringkasan, dan error) karena seluruh state dan notifikasinya bisa diuji lewat unit test tanpa UI. Risikonya, perlu mengelola lifecycle (dispose()) dan memastikan notifyListeners() selalu dipanggil saat state berubah.

# Bukti

Hasil pengujian terminal:
![Hasil Pengujian](bukti/hasil%20pengujian.png)

MVC – Filter Mati:
![MVC Filter Mati](bukti/mvc%20belum.png)

MVC – Filter Aktif:
![MVC Filter Aktif](bukti/mvc%20selesai.png)

MVVM – Filter Mati:
![MVVM Filter Mati](bukti/mvvm%20belum.png)

MVVM – Filter Aktif:
![MVVM Filter Aktif](bukti/mvvm%20selesai.png)