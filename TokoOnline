DROP DATABASE IF EXISTS TokoOnline;
CREATE DATABASE TokoOnline;
USE TokoOnline;

-- DDL for Pengguna Table
CREATE TABLE Pengguna (
    UserID INT PRIMARY KEY,
    Aktif BOOLEAN,
    Blokir BOOLEAN,
    NamaPengguna VARCHAR(255) NOT NULL,
    NIK VARCHAR(16) UNIQUE NOT NULL,
    Alamat TEXT,
    NomorTelepon VARCHAR(20),
    Email VARCHAR(255) UNIQUE NOT NULL,
    JenisKelamin VARCHAR(10)
);

-- DDL for Penjual Table
CREATE TABLE Penjual (
    UserID_Penjual INT PRIMARY KEY,
    TanggalDaftar DATE,
    JumlahToko INT,
    FOREIGN KEY (UserID_Penjual) REFERENCES Pengguna(UserID)
);

-- DDL for Pembeli Table
CREATE TABLE Pembeli (
    UserID_Pembeli INT PRIMARY KEY,
    TotalBelanja DECIMAL(10, 2),
    PointReward INT,
    FOREIGN KEY (UserID_Pembeli) REFERENCES Pengguna(UserID)
);

-- DDL for Toko Table
CREATE TABLE Toko (
    StoreID INT PRIMARY KEY,
    NamaToko VARCHAR(255) NOT NULL,
    DeskripsiToko TEXT,
    UserID INT, -- Foreign key to Pengguna (owner of the store)
    FOREIGN KEY (UserID) REFERENCES Pengguna(UserID)
);

-- DDL for Kategori Table
CREATE TABLE Kategori (
    CategoryID INT PRIMARY KEY,
    NamaKategori VARCHAR(255) NOT NULL,
    Deskripsi TEXT
);

-- DDL for Produk Table
CREATE TABLE Produk (
    ProductID INT PRIMARY KEY,
    StoreID INT NOT NULL,
    NamaProduk VARCHAR(255) NOT NULL,
    Deskripsi TEXT,
    Harga DECIMAL(10, 2) NOT NULL,
    Stok INT NOT NULL,
    StatusProduk VARCHAR(50), -- e.g., 'Available', 'Out of Stock', 'Discontinued'
    Rating DECIMAL(2, 1),
    FOREIGN KEY (StoreID) REFERENCES Toko(StoreID)
);

-- DDL for Detail_Category (Junction table for Product and Category)
CREATE TABLE Detail_Category (
    ProductID INT,
    CategoryID INT,
    PRIMARY KEY (ProductID, CategoryID),
    FOREIGN KEY (ProductID) REFERENCES Produk(ProductID),
    FOREIGN KEY (CategoryID) REFERENCES Kategori(CategoryID)
);

-- DDL for Transaksi Table
CREATE TABLE Transaksi (
    TransactionID INT PRIMARY KEY,
    UserID INT NOT NULL,
    TotalHarga DECIMAL(10, 2) NOT NULL,
    Diskon DECIMAL(10, 2),
    OngkosKirim DECIMAL(10, 2),
    StatusPesanan VARCHAR(50), -- e.g., 'Pending', 'Processing', 'Shipped', 'Delivered', 'Cancelled'
    NamaProduk VARCHAR(255), -- Corrected from NamaPenerima
    FOREIGN KEY (UserID) REFERENCES Pengguna(UserID)
);

-- DDL for Membeli (Junction table for Transaksi and Produk)
CREATE TABLE Membeli (
    TransactionID INT,
    ProductID INT,
    JumlahProduk INT NOT NULL,
    PRIMARY KEY (TransactionID, ProductID),
    FOREIGN KEY (TransactionID) REFERENCES Transaksi(TransactionID),
    FOREIGN KEY (ProductID) REFERENCES Produk(ProductID)
);

-- DDL for Ulasan Table
CREATE TABLE Ulasan (
    ReviewID INT PRIMARY KEY,
    ProductID INT NOT NULL,
    UserID INT NOT NULL,
    Rating INT, -- Typically 1-5
    Komentar TEXT,
    TanggalUlasan DATE,
    FOREIGN KEY (ProductID) REFERENCES Produk(ProductID),
    FOREIGN KEY (UserID) REFERENCES Pengguna(UserID)
);

-- DDL for Pembayaran Table
CREATE TABLE Pembayaran (
    PaymentID INT PRIMARY KEY,
    TransactionID INT NOT NULL,
    MetodeBayar VARCHAR(50),
    TanggalBayar DATETIME,
    OngkosKirim DECIMAL(10, 2),
    BiayaAdministrasi DECIMAL(10, 2),
    JumlahBayar DECIMAL(10, 2) NOT NULL,
    StatusBayar VARCHAR(50), -- e.g., 'Pending', 'Completed', 'Failed', 'Refunded'
    FOREIGN KEY (TransactionID) REFERENCES Transaksi(TransactionID)
);


-- 5. DML Section: Insert Data (50 rows per table)

-- DML for Pengguna Table (50 rows)
INSERT INTO Pengguna (UserID, Aktif, Blokir, NamaPengguna, NIK, Alamat, NomorTelepon, Email, JenisKelamin) VALUES
(1, TRUE, FALSE, 'Budi Santoso', '3201010000000001', 'Jl. Merdeka No. 10, Jakarta', '081234567890', 'budi.santoso@example.com', 'Laki-laki'),
(2, TRUE, FALSE, 'Siti Aminah', '3201010000000002', 'Jl. Kebon Jeruk No. 5, Bandung', '081345678901', 'siti.aminah@example.com', 'Perempuan'),
(3, TRUE, FALSE, 'Joko Susilo', '3201010000000003', 'Jl. Anggrek No. 20, Surabaya', '081456789012', 'joko.susilo@example.com', 'Laki-laki'),
(4, TRUE, FALSE, 'Dewi Lestari', '3201010000000004', 'Jl. Mawar No. 15, Yogyakarta', '081567890123', 'dewi.lestari@example.com', 'Perempuan'),
(5, TRUE, FALSE, 'Agus Setiawan', '3201010000000005', 'Jl. Melati No. 8, Medan', '081678901234', 'agus.setiawan@example.com', 'Laki-laki'),
(6, TRUE, FALSE, 'Rina Permata', '3201010000000006', 'Perumahan Indah Blok C No. 12, Bekasi', '081789012345', 'rina.permata@example.com', 'Perempuan'),
(7, TRUE, FALSE, 'Fajar Ramadhan', '3201010000000007', 'Komplek Griya Asri No. 3, Semarang', '081890123456', 'fajar.ramadhan@example.com', 'Laki-laki'),
(8, TRUE, FALSE, 'Maya Sari', '3201010000000008', 'Jalan Damai No. 7, Malang', '081901234567', 'maya.sari@example.com', 'Perempuan'),
(9, TRUE, FALSE, 'Dian Pratama', '3201010000000009', 'Gang Dahlia No. 25, Denpasar', '081012345678', 'dian.pratama@example.com', 'Laki-laki'),
(10, TRUE, FALSE, 'Wulan Febriani', '3201010000000010', 'Desa Maju RT 01 RW 02, Palembang', '081123456789', 'wulan.febriani@example.com', 'Perempuan'),
(11, TRUE, FALSE, 'Andi Wijaya', '3201010000000011', 'Jl. Kenanga No. 30, Makassar', '081223344556', 'andi.wijaya@example.com', 'Laki-laki'),
(12, TRUE, FALSE, 'Citra Kirana', '3201010000000012', 'Jl. Cendrawasih No. 1, Pontianak', '081334455667', 'citra.kirana@example.com', 'Perempuan'),
(13, TRUE, FALSE, 'Eko Prasetyo', '3201010000000013', 'Komplek Permata Biru No. 18, Balikpapan', '081445566778', 'eko.prasetyo@example.com', 'Laki-laki'),
(14, TRUE, FALSE, 'Fitri Handayani', '3201010000000014', 'Jl. Garuda No. 4, Samarinda', '081556677889', 'fitri.handayani@example.com', 'Perempuan'),
(15, TRUE, FALSE, 'Guntur Cahyo', '3201010000000015', 'Perumahan Harmoni Blok A No. 22, Pekanbaru', '081667788990', 'guntur.cahyo@example.com', 'Laki-laki'),
(16, TRUE, FALSE, 'Hana Maharani', '3201010000000016', 'Jl. Elang No. 9, Lampung', '081778899001', 'hana.maharani@example.com', 'Perempuan'),
(17, TRUE, FALSE, 'Irfan Maulana', '3201010000000017', 'Gang Mawar No. 11, Padang', '081889900112', 'irfan.maulana@example.com', 'Laki-laki'),
(18, TRUE, FALSE, 'Julia Rahayu', '3201010000000018', 'Jl. Seruni No. 6, Manado', '081990011223', 'julia.rahayu@example.com', 'Perempuan'),
(19, TRUE, FALSE, 'Kevin Darmawan', '3201010000000019', 'Desa Damai Sejahtera RT 03 RW 01, Jayapura', '081001122334', 'kevin.darmawan@example.com', 'Laki-laki'),
(20, TRUE, FALSE, 'Lia Putri', '3201010000000020', 'Komplek Cemara Indah No. 14, Kendari', '081112233445', 'lia.putri@example.com', 'Perempuan'),
(21, TRUE, FALSE, 'M. Zaki', '3201010000000021', 'Jl. Anggrek No. 25, Solo', '081223344557', 'm.zaki@example.com', 'Laki-laki'),
(22, TRUE, FALSE, 'Nurul Hidayah', '3201010000000022', 'Jl. Sakura No. 7, Cirebon', '081334455668', 'nurul.hidayah@example.com', 'Perempuan'),
(23, TRUE, FALSE, 'Oscar Wijoyo', '3201010000000023', 'Perumahan Pelangi No. 3, Bogor', '081445566779', 'oscar.wijoyo@example.com', 'Laki-laki'),
(24, TRUE, FALSE, 'Putri Anjani', '3201010000000024', 'Jl. Teratai No. 10, Tangerang', '081556677890', 'putri.anjani@example.com', 'Perempuan'),
(25, TRUE, FALSE, 'Qori Abdul', '3201010000000025', 'Gang Kenari No. 5, Depok', '081667788901', 'qori.abdul@example.com', 'Laki-laki'),
(26, TRUE, FALSE, 'Rani Suryani', '3201010000000026', 'Desa Sejahtera RT 02 RW 03, Sukabumi', '081778899012', 'rani.suryani@example.com', 'Perempuan'),
(27, TRUE, FALSE, 'Surya Kencana', '3201010000000027', 'Jl. Rajawali No. 13, Tasikmalaya', '081889900123', 'surya.kencana@example.com', 'Laki-laki'),
(28, TRUE, FALSE, 'Tia Lestari', '3201010000000028', 'Komplek Griya Mandiri No. 1, Purwakarta', '081990011234', 'tia.lestari@example.com', 'Perempuan'),
(29, TRUE, FALSE, 'Umar Bakri', '3201010000000029', 'Jl. Pahlawan No. 2, Ciamis', '081001122345', 'umar.bakri@example.com', 'Laki-laki'),
(30, TRUE, FALSE, 'Vina Amelia', '3201010000000030', 'Perumahan Alam Asri No. 17, Garut', '081112233456', 'vina.amelia@example.com', 'Perempuan'),
(31, TRUE, FALSE, 'Willy Gunawan', '3201010000000031', 'Jl. Teratai No. 20, Klaten', '081223344558', 'willy.gunawan@example.com', 'Laki-laki'),
(32, TRUE, FALSE, 'Xenia Sari', '3201010000000032', 'Gang Melati No. 8, Magelang', '081334455669', 'xenia.sari@example.com', 'Perempuan'),
(33, TRUE, FALSE, 'Yoga Pratama', '3201010000000033', 'Komplek Bunga Raya No. 11, Purwokerto', '081445566780', 'yoga.pratama@example.com', 'Laki-laki'),
(34, TRUE, FALSE, 'Zara Rahma', '3201010000000034', 'Jl. Kamboja No. 6, Cilacap', '081556677891', 'zara.rahma@example.com', 'Perempuan'),
(35, TRUE, FALSE, 'Adam Mahesa', '3201010000000035', 'Desa Jaya Makmur RT 04 RW 05, Kebumen', '081667788902', 'adam.mahesa@example.com', 'Laki-laki'),
(36, TRUE, FALSE, 'Bella Anggraini', '3201010000000036', 'Jl. Anyelir No. 19, Tegal', '081778899013', 'bella.anggraini@example.com', 'Perempuan'),
(37, TRUE, FALSE, 'Candra Dinata', '3201010000000037', 'Perumahan Griya Pesona No. 2, Brebes', '081889900124', 'candra.dinata@example.com', 'Laki-laki'),
(38, TRUE, FALSE, 'Diana Putri', '3201010000000038', 'Jl. Angsa No. 14, Kudus', '081990011235', 'diana.putri@example.com', 'Perempuan'),
(39, TRUE, FALSE, 'Edo Satrio', '3201010000000039', 'Gang Kenanga No. 9, Jepara', '081001122346', 'edo.satrio@example.com', 'Laki-laki'),
(40, TRUE, FALSE, 'Fani Pratiwi', '3201010000000040', 'Komplek Permata Hijau No. 16, Pati', '081112233457', 'fani.pratiwi@example.com', 'Perempuan'),
(41, TRUE, FALSE, 'Gita Kusuma', '3201010000000041', 'Jl. Kutilang No. 7, Rembang', '081223344559', 'gita.kusuma@example.com', 'Perempuan'),
(42, TRUE, FALSE, 'Harry Sujatmiko', '3201010000000042', 'Desa Harapan Jaya RT 05 RW 06, Blora', '081334455670', 'harry.sujatmiko@example.com', 'Laki-laki'),
(43, TRUE, FALSE, 'Indah Permata', '3201010000000043', 'Jl. Bunga Melati No. 1, Tuban', '081445566781', 'indah.permata@example.com', 'Perempuan'),
(44, TRUE, FALSE, 'Jati Waskita', '3201010000000044', 'Perumahan Alam Damai No. 24, Bojonegoro', '081556677892', 'jati.waskita@example.com', 'Laki-laki'),
(45, TRUE, FALSE, 'Kiki Amalia', '3201010000000045', 'Gang Anggrek No. 12, Nganjuk', '081667788903', 'kiki.amalia@example.com', 'Perempuan'),
(46, TRUE, FALSE, 'Lukman Hakim', '3201010000000046', 'Jl. Sakura No. 3, Kediri', '081778899014', 'lukman.hakim@example.com', 'Laki-laki'),
(47, TRUE, FALSE, 'Mira Puspita', '3201010000000047', 'Komplek Bintang Timur No. 5, Madiun', '081889900125', 'mira.puspita@example.com', 'Perempuan'),
(48, TRUE, FALSE, 'Nanda Putra', '3201010000000048', 'Desa Sukses Jaya RT 01 RW 01, Ponorogo', '081990011236', 'nanda.putra@example.com', 'Laki-laki'),
(49, TRUE, FALSE, 'Olivia Susanti', '3201010000000049', 'Jl. Teratai No. 15, Ngawi', '081001122347', 'olivia.susanti@example.com', 'Perempuan'),
(50, TRUE, FALSE, 'Putra Pratama', '3201010000000050', 'Perumahan Cempaka No. 8, Pacitan', '081112233458', 'putra.pratama@example.com', 'Laki-laki');


-- DML for Penjual Table (50 rows - linking to existing Pengguna)
INSERT INTO Penjual (UserID_Penjual, TanggalDaftar, JumlahToko) VALUES
(1, '2023-01-01', 2), (3, '2023-01-05', 1), (5, '2023-01-10', 3), (7, '2023-01-15', 1), (9, '2023-01-20', 2),
(11, '2023-01-25', 1), (13, '2023-01-30', 2), (15, '2023-02-04', 1), (17, '2023-02-09', 3), (19, '2023-02-14', 1),
(21, '2023-02-19', 2), (23, '2023-02-24', 1), (25, '2023-03-01', 2), (27, '2023-03-06', 1), (29, '2023-03-11', 3),
(31, '2023-03-16', 1), (33, '2023-03-21', 2), (35, '2023-03-26', 1), (37, '2023-03-31', 2), (39, '2023-04-05', 1),
(2, '2023-04-10', 1), (4, '2023-04-15', 2), (6, '2023-04-20', 1), (8, '2023-04-25', 3), (10, '2023-04-30', 1),
(12, '2023-05-05', 2), (14, '2023-05-10', 1), (16, '2023-05-15', 2), (18, '2023-05-20', 1), (20, '2023-05-25', 3),
(22, '2023-05-30', 1), (24, '2023-06-04', 2), (26, '2023-06-09', 1), (28, '2023-06-14', 2), (30, '2023-06-19', 1),
(32, '2023-06-24', 2), (34, '2023-06-29', 1), (36, '2023-07-04', 2), (38, '2023-07-09', 1), (40, '2023-07-14', 3),
(41, '2023-07-19', 1), (42, '2023-07-24', 2), (43, '2023-07-29', 1), (44, '2023-08-03', 2), (45, '2023-08-08', 1),
(46, '2023-08-13', 3), (47, '2023-08-18', 1), (48, '2023-08-23', 2), (49, '2023-08-28', 1), (50, '2023-09-02', 2);


-- DML for Pembeli Table (50 rows - linking to existing Pengguna)
INSERT INTO Pembeli (UserID_Pembeli, TotalBelanja, PointReward) VALUES
(1, 1500000.50, 1500), (2, 800000.25, 800), (3, 200000.00, 200), (4, 500000.75, 500), (5, 1200000.00, 1200),
(6, 350000.00, 350), (7, 950000.00, 950), (8, 180000.50, 180), (9, 720000.00, 720), (10, 480000.20, 480),
(11, 650000.00, 650), (12, 210000.00, 210), (13, 1100000.00, 1100), (14, 300000.00, 300), (15, 880000.00, 880),
(16, 420000.00, 420), (17, 1300000.00, 1300), (18, 550000.00, 550), (19, 990000.00, 990), (20, 270000.00, 270),
(21, 780000.00, 780), (22, 190000.00, 190), (23, 1050000.00, 1050), (24, 380000.00, 380), (25, 920000.00, 920),
(26, 450000.00, 450), (27, 1400000.00, 1400), (28, 600000.00, 600), (29, 1150000.00, 1150), (30, 330000.00, 330),
(31, 890000.00, 890), (32, 250000.00, 250), (33, 1000000.00, 1000), (34, 400000.00, 400), (35, 960000.00, 960),
(36, 470000.00, 470), (37, 1450000.00, 1450), (38, 620000.00, 620), (39, 1180000.00, 1180), (40, 360000.00, 360),
(41, 910000.00, 910), (42, 280000.00, 280), (43, 1080000.00, 1080), (44, 430000.00, 430), (45, 970000.00, 970),
(46, 490000.00, 490), (47, 1550000.00, 1550), (48, 650000.00, 650), (49, 1220000.00, 1220), (50, 390000.00, 390);

-- DML for Toko Table (50 rows - linking to Penjual/Pengguna)
INSERT INTO Toko (StoreID, NamaToko, DeskripsiToko, UserID) VALUES
(1, 'Toko Elektronik Jaya', 'Menyediakan berbagai macam perangkat elektronik terbaru.', 1),
(2, 'Busana Muslimah Cantik', 'Koleksi busana muslimah modern dan syari.', 3),
(3, 'Warung Sembako Online', 'Kebutuhan pokok sehari-hari dengan harga bersaing.', 5),
(4, 'Toko Buku Ilmu', 'Menjual buku-buku pelajaran, novel, dan referensi.', 7),
(5, 'Peralatan Rumah Tangga ABC', 'Perlengkapan rumah tangga lengkap dan berkualitas.', 9),
(6, 'Gadget Zone', 'Pusat gadget terbaru dan aksesoris.', 11),
(7, 'Fesyen Pria Modern', 'Koleksi pakaian pria trendi.', 13),
(8, 'Sayur Segar Online', 'Sayuran dan buah-buahan segar langsung dari petani.', 15),
(9, 'Alat Musik Harmoni', 'Berbagai alat musik untuk pemula hingga profesional.', 17),
(10, 'Toko Mainan Anak Ceria', 'Mainan edukatif dan menyenangkan untuk anak-anak.', 19),
(11, 'Komputer Corner', 'Laptop, PC, dan komponen komputer.', 21),
(12, 'Sepatu Trendy', 'Koleksi sepatu terbaru untuk pria dan wanita.', 23),
(13, 'Toko Daging Segar', 'Daging sapi, ayam, dan ikan berkualitas.', 25),
(14, 'Perlengkapan Olahraga Prima', 'Alat dan pakaian olahraga.', 27),
(15, 'Handycraft Unik', 'Kerajinan tangan dan barang-barang unik.', 29),
(16, 'Digital Camera Store', 'Kamera DSLR, mirrorless, dan aksesoris.', 31),
(17, 'Aksesoris Wanita Kekinian', 'Perhiasan, tas, dan aksesoris fashion.', 33),
(18, 'Minuman Sehat Alami', 'Jus, teh herbal, dan minuman kesehatan.', 35),
(19, 'Kebutuhan Bayi & Anak', 'Popok, pakaian bayi, dan perlengkapan anak.', 37),
(20, 'Elektronik Rumah Tangga', 'Kulkas, mesin cuci, AC, dll.', 39),
(21, 'Pakaian Dalam Nyaman', 'Berbagai jenis pakaian dalam.', 41),
(22, 'Camilan Sehat', 'Snack sehat dan organik.', 43),
(23, 'Alat Tulis Kantor', 'Pulpen, kertas, dan perlengkapan kantor.', 45),
(24, 'Perhiasan Emas & Perak', 'Cincin, kalung, gelang.', 47),
(25, 'Produk Kecantikan Alami', 'Skincare dan makeup organik.', 49),
(26, 'Toko Bunga Segar', 'Aneka jenis bunga potong dan rangkaian.', 2),
(27, 'Perlengkapan Hewan Peliharaan', 'Makanan, kandang, dan aksesoris.', 4),
(28, 'Alat Pertukangan', 'Peralatan dan perkakas untuk rumah tangga.', 6),
(29, 'Pakaian Olahraga', 'Baju, celana, dan sepatu olahraga.', 8),
(30, 'Tanaman Hias Indoor', 'Berbagai tanaman hias untuk dekorasi rumah.', 10),
(31, 'Perlengkapan Camping', 'Tenda, sleeping bag, dan peralatan outdoor.', 12),
(32, 'Dekorasi Rumah Minimalis', 'Hiasan dinding, vas bunga, dll.', 14),
(33, 'Kopi & Teh Nusantara', 'Biji kopi dan daun teh pilihan.', 16),
(34, 'Produk Kesehatan Herbal', 'Obat herbal, suplemen alami.', 18),
(35, 'Baju Anak Lucu', 'Pakaian anak dengan desain menarik.', 20),
(36, 'Mainan Edukasi', 'Mainan yang merangsang kreativitas anak.', 22),
(37, 'Aksesoris Mobil', 'Sarung jok, karpet, dll.', 24),
(38, 'Perlengkapan Mandi & Sabun', 'Sabun, shampoo, lotion.', 26),
(39, 'Perangkat Jaringan', 'Router, modem, kabel LAN.', 28),
(40, 'Peralatan Kebersihan', 'Pembersih lantai, sikat, pel.', 30),
(41, 'Furnitur Minimalis', 'Meja, kursi, lemari.', 32),
(42, 'Perlengkapan Jahit', 'Mesin jahit, benang, kain.', 34),
(43, 'Bumbu Dapur Lengkap', 'Remah-rempah, saus, bumbu instan.', 36),
(44, 'Produk Organik & Diet', 'Makanan sehat, bebas gluten.', 38),
(45, 'Peralatan Masak Modern', 'Panci anti lengket, oven, air fryer.', 40),
(46, 'Aksesoris HP & Tablet', 'Case, screen protector, power bank.', 42),
(47, 'Produk Daur Ulang', 'Tas dari bahan daur ulang, dll.', 44),
(48, 'Peralatan Berkebun', 'Sekop, pot, bibit tanaman.', 46),
(49, 'Perlengkapan Renang', 'Kacamata renang, baju renang.', 48),
(50, 'Fashion Remaja', 'Pakaian dan aksesoris untuk remaja.', 50);


-- DML for Kategori Table (50 categories)
INSERT INTO Kategori (CategoryID, NamaKategori, Deskripsi) VALUES
(1, 'Elektronik', 'Produk-produk terkait perangkat elektronik.'),
(2, 'Fashion Pria', 'Pakaian dan aksesoris untuk pria.'),
(3, 'Fashion Wanita', 'Pakaian dan aksesoris untuk wanita.'),
(4, 'Makanan & Minuman', 'Produk makanan, minuman, dan bahan pokok.'),
(5, 'Kesehatan & Kecantikan', 'Produk perawatan diri dan kesehatan.'),
(6, 'Rumah Tangga', 'Peralatan dan perlengkapan untuk rumah.'),
(7, 'Otomotif', 'Suku cadang dan aksesoris kendaraan.'),
(8, 'Olahraga & Hobi', 'Peralatan olahraga dan barang hobi.'),
(9, 'Buku & Alat Tulis', 'Berbagai jenis buku dan perlengkapan tulis.'),
(10, 'Mainan & Bayi', 'Mainan anak-anak dan perlengkapan bayi.'),
(11, 'Komputer & Laptop', 'Perangkat keras dan lunak komputer.'),
(12, 'Gadget & Aksesoris', 'Smartphone, tablet, smartwatch dan aksesorisnya.'),
(13, 'Perhiasan', 'Cincin, kalung, gelang, anting.'),
(14, 'Kamera & Fotografi', 'Kamera, lensa, tripod, dan aksesoris fotografi.'),
(15, 'Furnitur', 'Meja, kursi, lemari, tempat tidur.'),
(16, 'Peralatan Dapur', 'Panci, wajan, pisau, alat masak lainnya.'),
(17, 'Produk Hewan Peliharaan', 'Makanan hewan, kandang, mainan hewan.'),
(18, 'Perlengkapan Mandi', 'Sabun, shampoo, pasta gigi, sikat gigi.'),
(19, 'Alat Musik', 'Gitar, piano, drum, alat musik tradisional.'),
(20, 'Kebutuhan Gaming', 'Console game, aksesoris gaming, game.'),
(21, 'Tanaman & Berkebun', 'Bibit tanaman, pot, pupuk, alat berkebun.'),
(22, 'Perlengkapan Outdoor', 'Tenda, tas gunung, sleeping bag.'),
(23, 'Kerajinan Tangan', 'Produk seni dan kerajinan unik.'),
(24, 'Susu & Produk Olahan Susu', 'Susu cair, yogurt, keju.'),
(25, 'Daging & Seafood', 'Daging sapi, ayam, ikan, udang.'),
(26, 'Buah & Sayur Segar', 'Berbagai jenis buah dan sayuran.'),
(27, 'Bumbu & Bahan Masakan', 'Rempah-rempah, saus, minyak.'),
(28, 'Roti & Kue', 'Roti tawar, roti manis, kue basah, kue kering.'),
(29, 'Minuman Bersoda & Jus', 'Minuman kemasan, jus buah.'),
(30, 'Produk Organik', 'Makanan dan produk bebas bahan kimia.'),
(31, 'Alat Kebersihan', 'Sapu, pel, sikat, deterjen.'),
(32, 'Pakaian Dalam', 'Celana, atasan, piyama.'),
(33, 'Perlengkapan Cuci Baju', 'Mesin cuci, deterjen, pewangi pakaian.'),
(34, 'Lampu & Penerangan', 'Lampu LED, bohlam, lampu hias.'),
(35, 'Peralatan Listrik', 'Stop kontak, kabel, saklar.'),
(36, 'Keamanan Rumah', 'CCTV, alarm, kunci pintu.'),
(37, 'Perawatan Rambut', 'Shampoo, conditioner, vitamin rambut.'),
(38, 'Perawatan Wajah', 'Pembersih wajah, pelembab, serum.'),
(39, 'Makeup', 'Foundation, lipstik, maskara.'),
(40, 'Parfum & Cologne', 'Parfum pria dan wanita.'),
(41, 'Vitamin & Suplemen', 'Multivitamin, suplemen kesehatan.'),
(42, 'Peralatan Medis', 'Termometer, plester, alat P3K.'),
(43, 'Pakaian Anak', 'Baju, celana, jaket anak.'),
(44, 'Sepatu Anak', 'Sepatu kasual, sepatu olahraga anak.'),
(45, 'Tas & Dompet', 'Tas tangan, ransel, dompet.'),
(46, 'Jam Tangan', 'Jam tangan analog, digital, smartwatch.'),
(47, 'Kacamata', 'Kacamata baca, kacamata hitam.'),
(48, 'Seni & Kerajinan', 'Cat, kanvas, alat gambar.'),
(49, 'Perlengkapan Pesta', 'Balon, dekorasi, kostum.'),
(50, 'Barang Koleksi', 'Action figure, perangko, koin.');


-- DML for Produk Table (50 rows)
INSERT INTO Produk (ProductID, StoreID, NamaProduk, Deskripsi, Harga, Stok, StatusProduk, Rating) VALUES
(1, 1, 'Smartphone X1 Pro', 'Layar OLED 6.7 inci, kamera 108MP, baterai 5000mAh.', 8500000.00, 100, 'Available', 4.5),
(2, 1, 'Laptop Gaming Legion Y90', 'Prosesor Intel i9, RAM 32GB, RTX 4070, SSD 1TB.', 25000000.00, 20, 'Available', 4.8),
(3, 2, 'Gamis Syari Premium Zafira', 'Bahan ceruti babydoll, desain elegan, nyaman dipakai.', 350000.00, 50, 'Available', 4.2),
(4, 3, 'Beras Super Pulen 5kg', 'Beras kualitas premium, pulen dan wangi, cocok untuk keluarga.', 65000.00, 200, 'Available', 4.7),
(5, 4, 'Novel Sejarah Indonesia', 'Menceritakan perjalanan sejarah kemerdekaan Indonesia.', 95000.00, 30, 'Available', 4.0),
(6, 1, 'Smart TV QLED 55 inch Ultra HD', 'Resolusi 4K, suara jernih, smart features, Netflix ready.', 12000000.00, 15, 'Available', 4.6),
(7, 2, 'Kemeja Batik Tulis Modern', 'Batik tulis premium, motif klasik dengan sentuhan modern.', 280000.00, 40, 'Available', 4.3),
(8, 3, 'Minyak Goreng Kelapa Sawit 2L', 'Minyak goreng berkualitas, jernih dan sehat.', 32000.00, 150, 'Available', 4.5),
(9, 4, 'Buku Resep Masakan Nusantara', 'Kumpulan resep masakan tradisional Indonesia lengkap.', 120000.00, 25, 'Available', 4.1),
(10, 5, 'Blender Serbaguna Philips', 'Daya 600W, mata pisau stainless steel, mudah dibersihkan.', 450000.00, 60, 'Available', 4.4),
(11, 6, 'Smartwatch Galaxy Watch 5', 'Fitur kesehatan lengkap, baterai tahan lama.', 3200000.00, 80, 'Available', 4.6),
(12, 7, 'Celana Jeans Slim Fit Pria', 'Bahan denim stretch, nyaman dan gaya.', 180000.00, 120, 'Available', 4.1),
(13, 8, 'Apel Fuji Merah (1kg)', 'Apel segar dan manis, cocok untuk camilan sehat.', 35000.00, 300, 'Available', 4.8),
(14, 9, 'Gitar Akustik Yamaha F310', 'Kualitas suara jernih, cocok untuk pemula.', 1500000.00, 10, 'Available', 4.7),
(15, 10, 'Mainan Lego City Fire Station', 'Meningkatkan kreativitas anak, cocok untuk usia 6+.', 750000.00, 40, 'Available', 4.9),
(16, 11, 'Monitor Gaming Asus ROG 27 inch', 'Refresh rate 144Hz, response time 1ms.', 4800000.00, 25, 'Available', 4.7),
(17, 12, 'Sepatu Sneakers Pria Nike Air', 'Desain stylish, ringan dan nyaman.', 900000.00, 70, 'Available', 4.5),
(18, 13, 'Daging Sapi Slice (500gr)', 'Daging sapi pilihan, cocok untuk shabu-shabu.', 70000.00, 180, 'Available', 4.6),
(19, 14, 'Raket Badminton Yonex Astrox', 'Ringan dan kuat, cocok untuk pemain profesional.', 800000.00, 15, 'Available', 4.4),
(20, 15, 'Hiasan Dinding Makrame Handmade', 'Dekorasi estetik untuk rumah Anda.', 150000.00, 20, 'Available', 4.8),
(21, 16, 'Action Camera GoPro Hero 10', 'Video 5.3K, tahan air, stabilisasi HyperSmooth.', 6000000.00, 12, 'Available', 4.9),
(22, 17, 'Anting Emas Putih Berlian', 'Desain elegan, cocok untuk acara formal.', 5000000.00, 5, 'Available', 5.0),
(23, 18, 'Teh Hijau Organik Celup', 'Teh hijau pilihan, kaya antioksidan.', 45000.00, 250, 'Available', 4.5),
(24, 19, 'Popok Bayi Pampers Premium Care', 'Lembut dan anti bocor, ukuran M.', 120000.00, 300, 'Available', 4.7),
(25, 20, 'Kulkas 2 Pintu Samsung RT20FAR', 'Hemat energi, kapasitas besar.', 4200000.00, 10, 'Available', 4.6),
(26, 21, 'Bra Sport Seamless Wanita', 'Nyaman untuk olahraga, bahan elastis.', 90000.00, 100, 'Available', 4.2),
(27, 22, 'Keripik Tempe Aneka Rasa', 'Snack renyah, cocok untuk camilan.', 25000.00, 500, 'Available', 4.3),
(28, 23, 'Buku Tulis Hardcover A5', 'Kertas tebal, cocok untuk catatan penting.', 20000.00, 400, 'Available', 4.0),
(29, 24, 'Kalung Perak Liontin Nama', 'Bisa custom nama, cocok untuk kado.', 300000.00, 30, 'Available', 4.5),
(30, 25, 'Serum Wajah Vitamin C', 'Mencerahkan kulit, mengurangi flek hitam.', 180000.00, 70, 'Available', 4.6),
(31, 26, 'Bunga Mawar Merah Fresh', 'Setangkai bunga mawar merah segar.', 25000.00, 100, 'Available', 4.7),
(32, 27, 'Makanan Kucing Royal Canin', 'Nutrisi lengkap untuk kucing dewasa.', 150000.00, 80, 'Available', 4.8),
(33, 28, 'Bor Listrik Bosch GSB 550', 'Daya 550W, cocok untuk kebutuhan rumah tangga.', 600000.00, 15, 'Available', 4.5),
(34, 29, 'Pakaian Renang Pria Speedo', 'Bahan elastis, cepat kering.', 200000.00, 50, 'Available', 4.3),
(35, 30, 'Tanaman Hias Monstera Deliciosa', 'Ukuran sedang, cocok untuk dekorasi indoor.', 250000.00, 20, 'Available', 4.6),
(36, 31, 'Tenda Camping Kapasitas 4 Orang', 'Anti air, mudah dipasang.', 800000.00, 10, 'Available', 4.4),
(37, 32, 'Lampu Hias Gantung Minimalis', 'Desain modern, cocok untuk ruang tamu.', 350000.00, 25, 'Available', 4.2),
(38, 33, 'Kopi Arabika Gayo (250gr)', 'Biji kopi pilihan dari Aceh, aroma kuat.', 75000.00, 120, 'Available', 4.9),
(39, 34, 'Madu Hutan Asli (500ml)', 'Madu murni alami, kaya manfaat kesehatan.', 120000.00, 60, 'Available', 4.8),
(40, 35, 'Baju Kaos Anak Karakter', 'Bahan katun lembut, desain lucu.', 60000.00, 150, 'Available', 4.1),
(41, 36, 'Puzzle Kayu Edukasi', 'Meningkatkan motorik halus anak, angka dan huruf.', 90000.00, 80, 'Available', 4.5),
(42, 37, 'Sarung Jok Mobil Universal', 'Melindungi jok mobil, bahan nyaman.', 300000.00, 40, 'Available', 4.0),
(43, 38, 'Paket Sabun & Shampoo Herbal', 'Bahan alami, lembut untuk kulit sensitif.', 70000.00, 100, 'Available', 4.4),
(44, 39, 'Router Wi-Fi D-Link DIR-841', 'Kecepatan tinggi, jangkauan luas.', 450000.00, 30, 'Available', 4.6),
(45, 40, 'Pembersih Lantai Karbol Wangi', 'Membersihkan dan menghilangkan bau tak sedap.', 30000.00, 200, 'Available', 4.2),
(46, 41, 'Meja Belajar Minimalis Kayu', 'Desain modern, kokoh dan fungsional.', 700000.00, 15, 'Available', 4.7),
(47, 42, 'Mesin Jahit Portable Singer', 'Mudah digunakan, cocok untuk pemula.', 1200000.00, 10, 'Available', 4.5),
(48, 43, 'Bumbu Kari Instan Indofood', 'Praktis dan lezat untuk masakan kari.', 15000.00, 300, 'Available', 4.3),
(49, 44, 'Granola Bar Coklat (Box)', 'Snack sehat, tinggi serat dan protein.', 50000.00, 100, 'Available', 4.6),
(50, 45, 'Air Fryer Philips HD9270', 'Memasak tanpa minyak, kapasitas 4.1 liter.', 1800000.00, 8, 'Available', 4.9);


-- DML for Detail_Category Table (at least 50 mappings)
INSERT INTO Detail_Category (ProductID, CategoryID) VALUES
(1, 1), (1, 12), -- Smartphone X1 Pro -> Elektronik, Gadget & Aksesoris
(2, 1), (2, 11), (2, 20), -- Laptop Gaming -> Elektronik, Komputer & Laptop, Kebutuhan Gaming
(3, 3), (3, 32), -- Gamis Syari -> Fashion Wanita, Pakaian Dalam (jika dianggap pakaian luar)
(4, 4), (4, 27), -- Beras -> Makanan & Minuman, Bumbu & Bahan Masakan
(5, 9), -- Novel -> Buku & Alat Tulis
(6, 1), (6, 6), -- Smart TV -> Elektronik, Rumah Tangga
(7, 2), -- Kemeja Batik -> Fashion Pria
(8, 4), (8, 27), -- Minyak Goreng -> Makanan & Minuman, Bumbu & Bahan Masakan
(9, 9), -- Buku Resep -> Buku & Alat Tulis
(10, 6), (10, 16), -- Blender -> Rumah Tangga, Peralatan Dapur
(11, 1), (11, 12), -- Smartwatch -> Elektronik, Gadget & Aksesoris
(12, 2), -- Celana Jeans -> Fashion Pria
(13, 4), (13, 26), -- Apel Fuji -> Makanan & Minuman, Buah & Sayur Segar
(14, 8), (14, 19), -- Gitar Akustik -> Olahraga & Hobi, Alat Musik
(15, 10), (15, 8), -- Mainan Lego -> Mainan & Bayi, Olahraga & Hobi
(16, 11), (16, 20), -- Monitor Gaming -> Komputer & Laptop, Kebutuhan Gaming
(17, 2), (17, 8), -- Sepatu Sneakers -> Fashion Pria, Olahraga & Hobi
(18, 4), (18, 25), -- Daging Sapi -> Makanan & Minuman, Daging & Seafood
(19, 8), -- Raket Badminton -> Olahraga & Hobi
(20, 6), (20, 23), -- Hiasan Dinding -> Rumah Tangga, Kerajinan Tangan
(21, 1), (21, 14), -- Action Camera -> Elektronik, Kamera & Fotografi
(22, 13), (22, 3), -- Anting Emas -> Perhiasan, Fashion Wanita
(23, 4), (23, 29), (23, 30), -- Teh Hijau -> Makanan & Minuman, Minuman, Produk Organik
(24, 10), -- Popok Bayi -> Mainan & Bayi
(25, 6), (25, 1), -- Kulkas -> Rumah Tangga, Elektronik
(26, 3), (26, 32), -- Bra Sport -> Fashion Wanita, Pakaian Dalam
(27, 4), -- Keripik Tempe -> Makanan & Minuman
(28, 9), -- Buku Tulis -> Buku & Alat Tulis
(29, 13), (29, 3), -- Kalung Perak -> Perhiasan, Fashion Wanita
(30, 5), (30, 38), -- Serum Wajah -> Kesehatan & Kecantikan, Perawatan Wajah
(31, 21), -- Bunga Mawar -> Tanaman & Berkebun
(32, 17), -- Makanan Kucing -> Produk Hewan Peliharaan
(33, 6), (33, 35), -- Bor Listrik -> Rumah Tangga, Peralatan Listrik
(34, 2), (34, 8), (34, 29), -- Pakaian Renang -> Fashion Pria, Olahraga & Hobi
(35, 21), -- Monstera Deliciosa -> Tanaman & Berkebun
(36, 8), (36, 22), -- Tenda Camping -> Olahraga & Hobi, Perlengkapan Outdoor
(37, 6), (37, 34), -- Lampu Hias -> Rumah Tangga, Lampu & Penerangan
(38, 4), (38, 29), -- Kopi Arabika -> Makanan & Minuman, Minuman Bersoda & Jus
(39, 5), (39, 41), -- Madu Hutan -> Kesehatan & Kecantikan, Vitamin & Suplemen
(40, 10), (40, 43), -- Baju Kaos Anak -> Mainan & Bayi, Pakaian Anak
(41, 10), (41, 8), -- Puzzle Kayu -> Mainan & Bayi, Olahraga & Hobi
(42, 7), -- Sarung Jok Mobil -> Otomotif
(43, 5), (43, 18), -- Paket Sabun & Shampoo -> Kesehatan & Kecantikan, Perlengkapan Mandi
(44, 11), (44, 35), -- Router Wi-Fi -> Komputer & Laptop, Peralatan Listrik
(45, 6), (45, 31), -- Pembersih Lantai -> Rumah Tangga, Alat Kebersihan
(46, 6), (46, 15), -- Meja Belajar -> Rumah Tangga, Furnitur
(47, 6), (47, 42), -- Mesin Jahit -> Rumah Tangga, Peralatan Medis (as household tools)
(48, 4), (48, 27), -- Bumbu Kari -> Makanan & Minuman, Bumbu & Bahan Masakan
(49, 4), (49, 30), -- Granola Bar -> Makanan & Minuman, Produk Organik
(50, 6), (50, 16); -- Air Fryer -> Rumah Tangga, Peralatan Dapur


-- DML for Transaksi Table (50 rows)
INSERT INTO Transaksi (TransactionID, UserID, TotalHarga, Diskon, OngkosKirim, StatusPesanan, NamaProduk) VALUES
(1, 2, 8500000.00, 0.00, 25000.00, 'Delivered', 'Smartphone X1 Pro'),
(2, 4, 350000.00, 10000.00, 15000.00, 'Shipped', 'Gamis Syari Premium Zafira'),
(3, 1, 65000.00, 0.00, 10000.00, 'Processing', 'Beras Super Pulen 5kg'),
(4, 8, 25000000.00, 500000.00, 50000.00, 'Pending', 'Laptop Gaming Legion Y90'),
(5, 9, 120000.00, 0.00, 12000.00, 'Delivered', 'Buku Resep Masakan Nusantara'),
(6, 6, 95000.00, 5000.00, 8000.00, 'Delivered', 'Blender Serbaguna Philips'),
(7, 10, 1500000.00, 0.00, 20000.00, 'Shipped', 'Gitar Akustik Yamaha F310'),
(8, 12, 480000.20, 15000.00, 10000.00, 'Processing', 'Celana Jeans Slim Fit Pria'),
(9, 14, 210000.00, 0.00, 15000.00, 'Pending', 'Apel Fuji Merah (1kg)'),
(10, 16, 880000.00, 20000.00, 25000.00, 'Delivered', 'Raket Badminton Yonex Astrox'),
(11, 18, 550000.00, 0.00, 18000.00, 'Shipped', 'Daging Sapi Slice (500gr)'),
(12, 20, 270000.00, 10000.00, 10000.00, 'Processing', 'Popok Bayi Pampers Premium Care'),
(13, 22, 190000.00, 0.00, 12000.00, 'Pending', 'Teh Hijau Organik Celup'),
(14, 24, 380000.00, 12000.00, 15000.00, 'Delivered', 'Buku Tulis Hardcover A5'),
(15, 26, 450000.00, 0.00, 18000.00, 'Shipped', 'Bra Sport Seamless Wanita'),
(16, 28, 600000.00, 20000.00, 20000.00, 'Processing', 'Bor Listrik Bosch GSB 550'),
(17, 30, 330000.00, 0.00, 15000.00, 'Pending', 'Tanaman Hias Monstera Deliciosa'),
(18, 32, 250000.00, 8000.00, 10000.00, 'Delivered', 'Lampu Hias Gantung Minimalis'),
(19, 34, 400000.00, 0.00, 12000.00, 'Shipped', 'Pakaian Renang Pria Speedo'),
(20, 36, 470000.00, 15000.00, 18000.00, 'Processing', 'Tenda Camping Kapasitas 4 Orang'),
(21, 38, 620000.00, 0.00, 20000.00, 'Pending', 'Madu Hutan Asli (500ml)'),
(22, 40, 360000.00, 10000.00, 15000.00, 'Delivered', 'Baju Kaos Anak Karakter'),
(23, 42, 280000.00, 0.00, 10000.00, 'Shipped', 'Sarung Jok Mobil Universal'),
(24, 44, 430000.00, 12000.00, 15000.00, 'Processing', 'Granola Bar Coklat (Box)'),
(25, 46, 490000.00, 0.00, 18000.00, 'Pending', 'Meja Belajar Minimalis Kayu'),
(26, 48, 650000.00, 20000.00, 20000.00, 'Delivered', 'Peralatan Berkebun'),
(27, 50, 390000.00, 0.00, 15000.00, 'Shipped', 'Fashion Remaja'),
(28, 1, 12000000.00, 200000.00, 50000.00, 'Delivered', 'Smart TV QLED 55 inch Ultra HD'),
(29, 3, 280000.00, 0.00, 10000.00, 'Shipped', 'Kemeja Batik Tulis Modern'),
(30, 5, 32000.00, 0.00, 8000.00, 'Delivered', 'Minyak Goreng Kelapa Sawit 2L'),
(31, 7, 3200000.00, 50000.00, 20000.00, 'Processing', 'Smartwatch Galaxy Watch 5'),
(32, 9, 180000.00, 0.00, 10000.00, 'Pending', 'Mainan Lego City Fire Station'),
(33, 11, 35000.00, 0.00, 5000.00, 'Delivered', 'Apel Fuji Merah (1kg)'),
(34, 13, 1500000.00, 30000.00, 25000.00, 'Shipped', 'Gitar Akustik Yamaha F310'),
(35, 15, 750000.00, 0.00, 18000.00, 'Processing', 'Hiasan Dinding Makrame Handmade'),
(36, 17, 4800000.00, 100000.00, 30000.00, 'Pending', 'Monitor Gaming Asus ROG 27 inch'),
(37, 19, 900000.00, 0.00, 20000.00, 'Delivered', 'Sepatu Sneakers Pria Nike Air'),
(38, 21, 70000.00, 0.00, 8000.00, 'Shipped', 'Daging Sapi Slice (500gr)'),
(39, 23, 800000.00, 20000.00, 15000.00, 'Processing', 'Raket Badminton Yonex Astrox'),
(40, 25, 150000.00, 0.00, 10000.00, 'Pending', 'Kulkas 2 Pintu Samsung RT20FAR'),
(41, 27, 6000000.00, 150000.00, 50000.00, 'Delivered', 'Action Camera GoPro Hero 10'),
(42, 29, 5000000.00, 100000.00, 30000.00, 'Shipped', 'Anting Emas Putih Berlian'),
(43, 31, 45000.00, 0.00, 5000.00, 'Delivered', 'Bunga Mawar Merah Fresh'),
(44, 33, 120000.00, 0.00, 10000.00, 'Processing', 'Kopi Arabika Gayo (250gr)'),
(45, 35, 4200000.00, 80000.00, 40000.00, 'Pending', 'Air Fryer Philips HD9270'),
(46, 37, 90000.00, 0.00, 8000.00, 'Delivered', 'Sarung Jok Mobil Universal'),
(47, 39, 25000.00, 0.00, 5000.00, 'Shipped', 'Pembersih Lantai Karbol Wangi'),
(48, 41, 20000.00, 0.00, 5000.00, 'Delivered', 'Meja Belajar Minimalis Kayu'),
(49, 43, 300000.00, 10000.00, 15000.00, 'Processing', 'Paket Sabun & Shampoo Herbal'),
(50, 45, 180000.00, 0.00, 10000.00, 'Pending', 'Mesin Jahit Portable Singer');


-- DML for Membeli Table (at least 50 entries, linking transactions to products)
INSERT INTO Membeli (TransactionID, ProductID, JumlahProduk) VALUES
(1, 1, 1), (1, 6, 1), -- Transaksi 1: Smartphone X1 Pro, Smart TV
(2, 3, 1), (2, 7, 1), -- Transaksi 2: Gamis Syari, Kemeja Batik
(3, 4, 2), (3, 8, 1), -- Transaksi 3: Beras, Minyak Goreng
(4, 2, 1), (4, 16, 1), -- Transaksi 4: Laptop Gaming, Monitor Gaming
(5, 5, 1), (5, 9, 1), -- Transaksi 5: Novel Sejarah, Buku Resep
(6, 10, 1), (6, 11, 1), -- Transaksi 6: Blender, Smartwatch
(7, 12, 2), (7, 17, 1), -- Transaksi 7: Celana Jeans, Sepatu Sneakers
(8, 13, 3), (8, 18, 1), -- Transaksi 8: Apel, Daging Sapi
(9, 14, 1), (9, 19, 1), -- Transaksi 9: Gitar Akustik, Raket Badminton
(10, 15, 1), (10, 20, 1), -- Transaksi 10: Lego, Hiasan Dinding
(11, 21, 1), (11, 22, 1), -- Transaksi 11: Action Camera, Anting Emas
(12, 23, 2), (12, 24, 1), -- Transaksi 12: Teh Hijau, Popok Bayi
(13, 25, 1), (13, 26, 2), -- Transaksi 13: Kulkas, Bra Sport
(14, 27, 4), (14, 28, 1), -- Transaksi 14: Keripik Tempe, Buku Tulis
(15, 29, 1), (15, 30, 1), -- Transaksi 15: Kalung Perak, Serum Wajah
(16, 31, 1), (16, 32, 1), -- Transaksi 16: Bunga Mawar, Makanan Kucing
(17, 33, 1), (17, 34, 1), -- Transaksi 17: Bor Listrik, Pakaian Renang
(18, 35, 1), (18, 36, 1), -- Transaksi 18: Monstera, Tenda Camping
(19, 37, 1), (19, 38, 2), -- Transaksi 19: Lampu Hias, Kopi Arabika
(20, 39, 1), (20, 40, 3), -- Transaksi 20: Madu Hutan, Baju Kaos Anak
(21, 41, 1), (21, 42, 1), -- Transaksi 21: Puzzle Kayu, Sarung Jok Mobil
(22, 43, 2), (22, 44, 1), -- Transaksi 22: Sabun & Shampoo, Router Wi-Fi
(23, 45, 1), (23, 46, 1), -- Transaksi 23: Pembersih Lantai, Meja Belajar
(24, 47, 1), (24, 48, 2), -- Transaksi 24: Mesin Jahit, Bumbu Kari
(25, 49, 1), (25, 50, 1); -- Transaksi 25: Granola Bar, Air Fryer
-- Additional 25 entries for Membeli (linking to remaining transactions, ensuring variety)
INSERT INTO Membeli (TransactionID, ProductID, JumlahProduk) VALUES
(28, 6, 1), (29, 7, 1), (30, 8, 1), (31, 1, 1), (32, 12, 1),
(33, 13, 1), (34, 14, 1), (35, 15, 1), (36, 16, 1), (37, 17, 1),
(38, 18, 1), (39, 19, 1), (40, 20, 1), (41, 21, 1), (42, 22, 1),
(43, 23, 1), (44, 24, 1), (45, 25, 1), (46, 26, 1), (47, 27, 1),
(48, 28, 1), (49, 29, 1), (50, 30, 1), (28, 2, 1), (29, 3, 1);


-- DML for Ulasan Table (50 rows)
INSERT INTO Ulasan (ReviewID, ProductID, UserID, Rating, Komentar, TanggalUlasan) VALUES
(1, 1, 2, 5, 'Sangat puas dengan smartphonenya, kameranya jernih!', '2024-01-20'),
(2, 3, 4, 4, 'Gamisnya bagus, tapi pengiriman agak lama.', '2024-02-10'),
(3, 4, 1, 5, 'Berasnya pulen dan wangi, langganan!', '2024-03-01'),
(4, 2, 8, 5, 'Laptopnya gila, performa top banget buat gaming!', '2024-04-15'),
(5, 5, 9, 4, 'Buku resepnya lengkap, sangat membantu.', '2024-05-01'),
(6, 6, 6, 5, 'TVnya keren, fitur smartnya sangat berguna.', '2024-05-05'),
(7, 7, 10, 4, 'Kemeja batiknya bagus, sesuai ekspektasi.', '2024-05-10'),
(8, 8, 12, 5, 'Minyak gorengnya kualitasnya baik, pengiriman cepat.', '2024-05-15'),
(9, 9, 14, 4, 'Buku resepnya informatif, banyak ide masakan baru.', '2024-05-20'),
(10, 10, 16, 5, 'Blender serbaguna, sangat membantu di dapur.', '2024-05-25'),
(11, 11, 18, 4, 'Smartwatchnya multifungsi, cocok untuk olahraga.', '2024-06-01'),
(12, 12, 20, 5, 'Jeansnya nyaman dipakai dan modelnya keren.', '2024-06-05'),
(13, 13, 22, 5, 'Apelnya segar dan manis, anak-anak suka.', '2024-06-10'),
(14, 14, 24, 4, 'Gitar akustiknya suaranya jernih, cocok untuk pemula.', '2024-06-15'),
(15, 15, 26, 5, 'Mainan Lego sangat edukatif, anak saya betah main.', '2024-06-20'),
(16, 16, 28, 5, 'Monitor gamingnya luar biasa, pengalaman main game jadi beda.', '2024-06-25'),
(17, 17, 30, 4, 'Sepatunya stylish, nyaman dipakai seharian.', '2024-07-01'),
(18, 18, 32, 5, 'Dagingnya fresh dan berkualitas, rekomendasi untuk BBQ.', '2024-07-05'),
(19, 19, 34, 4, 'Raketnya ringan, performanya cukup baik.', '2024-07-10'),
(20, 20, 36, 5, 'Hiasan dindingnya cantik, menambah estetika ruangan.', '2024-07-15'),
(21, 21, 38, 5, 'GoPro-nya handal untuk merekam petualangan.', '2024-07-20'),
(22, 22, 40, 5, 'Antingnya sangat mewah, desainnya elegan.', '2024-07-25'),
(23, 23, 42, 4, 'Teh hijaunya wangi, membuat rileks.', '2024-08-01'),
(24, 24, 44, 5, 'Popoknya nyaman, anti ruam untuk bayi.', '2024-08-05'),
(25, 25, 46, 5, 'Kulkasnya dingin cepat, hemat listrik.', '2024-08-10'),
(26, 26, 48, 4, 'Bra sportnya nyaman, cocok untuk segala aktivitas.', '2024-08-15'),
(27, 27, 50, 4, 'Keripik tempe renyah, favorit keluarga.', '2024-08-20'),
(28, 28, 1, 5, 'Buku tulisnya bagus, kertas tebal.', '2024-08-25'),
(29, 29, 3, 5, 'Kalungnya cantik, ukiran namanya rapi.', '2024-09-01'),
(30, 30, 5, 4, 'Serumnya lumayan, kulit terasa lebih cerah.', '2024-09-05'),
(31, 31, 7, 5, 'Bunganya fresh, pengiriman aman.', '2024-09-10'),
(32, 32, 9, 5, 'Makanan kucingnya disukai peliharaan saya.', '2024-09-15'),
(33, 33, 11, 4, 'Bor listriknya kuat, sesuai deskripsi.', '2024-09-20'),
(34, 34, 13, 4, 'Baju renangnya nyaman, kualitas kain baik.', '2024-09-25'),
(35, 35, 15, 5, 'Monstera-nya sehat, daunnya besar.', '2024-10-01'),
(36, 36, 17, 5, 'Tenda camping mudah dipasang, kokoh.', '2024-10-05'),
(37, 37, 19, 4, 'Lampu hiasnya menambah kesan hangat di ruangan.', '2024-10-10'),
(38, 38, 21, 5, 'Kopi Arabika-nya mantap, cocok untuk pagi hari.', '2024-10-15'),
(39, 39, 23, 5, 'Madu hutan asli, rasanya enak.', '2024-10-20'),
(40, 40, 25, 4, 'Baju kaos anak lucu, bahannya adem.', '2024-10-25'),
(41, 41, 27, 4, 'Puzzle kayu edukatif, anak saya suka.', '2024-11-01'),
(42, 42, 29, 5, 'Sarung jok mobilnya pas, mudah dipasang.', '2024-11-05'),
(43, 43, 31, 4, 'Sabun dan shampoo herbalnya wangi.', '2024-11-10'),
(44, 44, 33, 5, 'Router Wi-Fi-nya kencang, sinyal stabil.', '2024-11-15'),
(45, 45, 35, 4, 'Pembersih lantai wangi, lantai bersih.', '2024-11-20'),
(46, 46, 37, 5, 'Meja belajarnya minimalis, cocok untuk kamar kecil.', '2024-11-25'),
(47, 47, 39, 4, 'Mesin jahitnya mudah digunakan, cocok untuk pemula.', '2024-12-01'),
(48, 48, 41, 5, 'Bumbu kari instan praktis, rasanya pas.', '2024-12-05'),
(49, 49, 43, 5, 'Granola bar sehat dan enak, cocok untuk sarapan.', '2024-12-10'),
(50, 50, 45, 5, 'Air fryer-nya sangat membantu, memasak jadi lebih sehat.', '2024-12-15');


-- DML for Pembayaran Table (50 rows)
INSERT INTO Pembayaran (PaymentID, TransactionID, MetodeBayar, TanggalBayar, OngkosKirim, BiayaAdministrasi, JumlahBayar, StatusBayar) VALUES
(1, 1, 'Transfer Bank', '2024-01-18 10:30:00', 25000.00, 5000.00, 8530000.00, 'Completed'),
(2, 2, 'Kartu Kredit', '2024-02-08 14:00:00', 15000.00, 7500.00, 362500.00, 'Completed'),
(3, 3, 'E-Wallet', '2024-02-29 18:45:00', 10000.00, 2000.00, 77000.00, 'Completed'),
(4, 4, 'Virtual Account', '2024-04-12 09:00:00', 50000.00, 10000.00, 24560000.00, 'Pending'),
(5, 5, 'COD', '2024-04-28 11:15:00', 12000.00, 0.00, 132000.00, 'Completed'),
(6, 6, 'Transfer Bank', '2024-05-03 09:30:00', 8000.00, 1500.00, 104500.00, 'Completed'),
(7, 7, 'Kartu Kredit', '2024-05-08 15:00:00', 20000.00, 10000.00, 1530000.00, 'Completed'),
(8, 8, 'E-Wallet', '2024-05-13 19:00:00', 10000.00, 2500.00, 477500.20, 'Completed'),
(9, 9, 'Virtual Account', '2024-05-18 10:00:00', 15000.00, 3000.00, 228000.00, 'Pending'),
(10, 10, 'COD', '2024-05-23 12:00:00', 25000.00, 0.00, 885000.00, 'Completed'),
(11, 11, 'Transfer Bank', '2024-05-28 08:30:00', 18000.00, 3500.00, 571500.00, 'Completed'),
(12, 12, 'Kartu Kredit', '2024-06-02 14:30:00', 10000.00, 5000.00, 275000.00, 'Completed'),
(13, 13, 'E-Wallet', '2024-06-07 17:00:00', 12000.00, 2400.00, 204400.00, 'Pending'),
(14, 14, 'Virtual Account', '2024-06-12 11:00:00', 15000.00, 3000.00, 386000.00, 'Completed'),
(15, 15, 'COD', '2024-06-17 13:00:00', 18000.00, 0.00, 468000.00, 'Completed'),
(16, 16, 'Transfer Bank', '2024-06-22 09:00:00', 20000.00, 4000.00, 604000.00, 'Completed'),
(17, 17, 'Kartu Kredit', '2024-06-27 16:00:00', 15000.00, 7500.00, 352500.00, 'Pending'),
(18, 18, 'E-Wallet', '2024-07-02 18:30:00', 10000.00, 2000.00, 252000.00, 'Completed'),
(19, 19, 'Virtual Account', '2024-07-07 10:00:00', 12000.00, 2400.00, 414400.00, 'Completed'),
(20, 20, 'COD', '2024-07-12 11:00:00', 18000.00, 0.00, 488000.00, 'Completed'),
(21, 21, 'Transfer Bank', '2024-07-17 09:30:00', 20000.00, 4000.00, 644000.00, 'Pending'),
(22, 22, 'Kartu Kredit', '2024-07-22 15:00:00', 15000.00, 7500.00, 362500.00, 'Completed'),
(23, 23, 'E-Wallet', '2024-07-27 18:00:00', 10000.00, 2000.00, 292000.00, 'Completed'),
(24, 24, 'Virtual Account', '2024-08-01 10:30:00', 15000.00, 3000.00, 416000.00, 'Pending'),
(25, 25, 'COD', '2024-08-06 12:30:00', 18000.00, 0.00, 508000.00, 'Completed'),
(26, 26, 'Transfer Bank', '2024-08-11 09:00:00', 20000.00, 4000.00, 674000.00, 'Completed'),
(27, 27, 'Kartu Kredit', '2024-08-16 14:00:00', 15000.00, 7500.00, 412500.00, 'Completed'),
(28, 28, 'E-Wallet', '2024-08-21 17:00:00', 50000.00, 10000.00, 11860000.00, 'Completed'),
(29, 29, 'Virtual Account', '2024-08-26 11:00:00', 10000.00, 2000.00, 292000.00, 'Completed'),
(30, 30, 'COD', '2024-08-31 13:00:00', 8000.00, 0.00, 40000.00, 'Completed'),
(31, 31, 'Transfer Bank', '2024-09-05 09:30:00', 20000.00, 4000.00, 3174000.00, 'Pending'),
(32, 32, 'Kartu Kredit', '2024-09-10 14:30:00', 10000.00, 5000.00, 195000.00, 'Completed'),
(33, 33, 'E-Wallet', '2024-09-15 17:30:00', 5000.00, 1000.00, 41000.00, 'Completed'),
(34, 34, 'Virtual Account', '2024-09-20 10:00:00', 25000.00, 5000.00, 1495000.00, 'Completed'),
(35, 35, 'COD', '2024-09-25 12:00:00', 18000.00, 0.00, 768000.00, 'Completed'),
(36, 36, 'Transfer Bank', '2024-09-30 08:00:00', 30000.00, 6000.00, 4736000.00, 'Pending'),
(37, 37, 'Kartu Kredit', '2024-10-05 15:30:00', 20000.00, 10000.00, 930000.00, 'Completed'),
(38, 38, 'E-Wallet', '2024-10-10 18:00:00', 8000.00, 1600.00, 79600.00, 'Completed'),
(39, 39, 'Virtual Account', '2024-10-15 11:00:00', 15000.00, 3000.00, 818000.00, 'Completed'),
(40, 40, 'COD', '2024-10-20 13:00:00', 10000.00, 0.00, 160000.00, 'Completed'),
(41, 41, 'Transfer Bank', '2024-10-25 09:00:00', 50000.00, 10000.00, 6060000.00, 'Completed'),
(42, 42, 'Kartu Kredit', '2024-10-30 14:00:00', 30000.00, 15000.00, 5045000.00, 'Completed'),
(43, 43, 'E-Wallet', '2024-11-04 17:00:00', 5000.00, 1000.00, 51000.00, 'Completed'),
(44, 44, 'Virtual Account', '2024-11-09 10:30:00', 10000.00, 2000.00, 132000.00, 'Pending'),
(45, 45, 'COD', '2024-11-14 12:30:00', 40000.00, 0.00, 4240000.00, 'Completed'),
(46, 46, 'Transfer Bank', '2024-11-19 09:00:00', 8000.00, 1600.00, 99600.00, 'Completed'),
(47, 47, 'Kartu Kredit', '2024-11-24 14:00:00', 5000.00, 1000.00, 31000.00, 'Completed'),
(48, 48, 'E-Wallet', '2024-11-29 17:00:00', 5000.00, 1000.00, 26000.00, 'Completed'),
(49, 49, 'Virtual Account', '2024-12-04 10:30:00', 15000.00, 3000.00, 318000.00, 'Pending'),
(50, 50, 'COD', '2024-12-09 12:30:00', 10000.00, 0.00, 1900000.00, 'Completed');
