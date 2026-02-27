# Subsense

A simple yet powerful subscription tracker built with flutter.

---

## Deskripsi Apliaksi

Subsense adalah aplikasi Subscription Tracker berbasis Flutter yang membantu pengguna mengelola dan memantau langganan digital seperti Netflix, Spotify, dan layanan lainnya.

Aplikasi ini memungkinkan pengguna untuk:
- Menyimpan data langganan
- Menghitung total biaya bulanan dan tahunan
- Melihat tanggal pembayaran berikutnya
- Mengetahui langganan yang akan segera jatuh tempo

---

## Fitur Aplikasi

- ➕ Tambah subscription
- ✏️ Edit subscription
- 🗑️ Hapus subscription
- 🔁 Billing cycle (Monthly / Yearly)
- 📅 Auto generate next billing date
- 📊 Monthly cost calculation
- 📈 Yearly projection

---

## 🌟 Nilai Tambah

- ✅ Multi-page navigation (Home & Edit Page)
- ✅ State management menggunakan GetX
- ✅ Perhitungan biaya bulanan & tahunan otomatis
  
---

## Widget yang digunakan
- Scaffold
- AppBar
- ListView.builder
- Card
- ListTile
- Column & Row
- ElevatedButton
- DropdownButtonFormField
- TextFormField
- getx

---

## Tampilan Aplikasi

### Home Page 
Menampilkan daftar subscription, total biaya bulanan dan tahunan, serta tanggal pembayaran berikutnya.

<p align="center">
<img width="300" height="600" alt="Screenshot_1772159193" src="https://github.com/user-attachments/assets/9dd495a4-e9ac-4da8-aacf-dc70c5b3439d" />
</p>

### Halaman Tambah / Edit Subscription
Digunakan untuk menambahkan atau mengubah data subscription

<p align="center">
<img width="300" height="600" alt="Screenshot_1772159521" src="https://github.com/user-attachments/assets/6af86966-6f36-4537-8254-a276a285a223" />
</p>

<p align="center">
<img width="300" height="600" alt="Screenshot_1772159532" src="https://github.com/user-attachments/assets/efbe05d4-2554-4292-97a5-3a29f5e4336b" />
</p>

## Cara Pengunaan
### 1. Menambahkan Subscription
Tekan tombol ➕ untuk menambahkan subscription baru.
   
   <p align="center">
     <img width="300" height="600" alt="Button Create" src="https://github.com/user-attachments/assets/cc8fcda6-4131-456c-bfb6-0a40ce9b1116" />
   </p>

Isi nama, harga, billing cycle, kategori, dan tanggal mulai, lalu tekan tombol **Simpan** untuk menyimpan data.
   
   <p align="center">
     <<img width="300" height="600" alt="Screenshot_1772161413" src="https://github.com/user-attachments/assets/8ef77b5e-f736-426c-8807-9347364ed8a8" />
   </p>

   ---

### 2. Mengedit Subscription
Tekan ikon ✏️ pada subscription yang ingin diubah.

  <p align="center">
        <img width="300" height="600" alt="button edit" src="https://github.com/user-attachments/assets/dba8b540-9f3d-4635-9d91-279603606a1b" />
   </p>

   Pengguna akan diarahkan ke halaman edit untuk memperbarui data.
   
   <p align="center">
     <img width="300" height="600" alt="Screenshot_1772159806" src="https://github.com/user-attachments/assets/d885dd73-869d-4355-bf83-c5d705f6836a" />
   </p>

   ---
   
### 4. Menghapus Subscription 
Tekan ikon 🗑️ untuk menghapus data.
    
  <p align="center">
      <img width="300" height="600" alt="Button Delete" src="https://github.com/user-attachments/assets/20daf751-a1f3-4f16-b005-f98a6929c8e4" />
   </p>

 Sebelum data dihapus, aplikasi akan menampilkan dialog konfirmasi untuk memastikan pengguna benar-benar ingin menghapus subscription tersebut.

   <p align="center">
   <img width="300" height="600" alt="Screenshot_1772160516" src="https://github.com/user-attachments/assets/a7c604a9-e19e-46ff-a34d-6d843ecff0ab" />
    </p>

---

Setelah pengguna menekan tombol **Hapus**, data subscription akan dihapus dari daftar.
Total biaya bulanan dan proyeksi tahunan akan otomatis diperbarui sesuai dengan data yang tersisa. Perubahan ini terjadi secara langsung karena aplikasi menggunakan sistem perhitungan dinamis.

<p align="center"
  <img width="300" height="600" alt="Screenshot_1772162274" src="https://github.com/user-attachments/assets/de733f92-6d5f-4a44-adbc-e6a06b294459" />
</p>
