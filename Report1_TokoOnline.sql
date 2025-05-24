/*DDL: CREATE TABLE*/

CREATE TABLE Pengguna (
    UserID INT PRIMARY KEY,
    NamaPengguna VARCHAR(100),
    NIK VARCHAR(20),
    Alamat TEXT,
    NomorTelepon VARCHAR(20),
    Email VARCHAR(100),
    JenisKelamin VARCHAR(10),
    Aktif BOOLEAN,
    Blokir BOOLEAN
);

CREATE TABLE Pembeli (
    UserID INT PRIMARY KEY,
    TotalBelanja DECIMAL(12, 2),
    PoinReward INT,
    FOREIGN KEY (UserID) REFERENCES Pengguna(UserID)
);

CREATE TABLE Penjual (
    UserID INT PRIMARY KEY,
    JumlahToko INT,
    FOREIGN KEY (UserID) REFERENCES Pengguna(UserID)
);

CREATE TABLE Toko (
    StoreID INT PRIMARY KEY,
    UserID INT,
    NamaToko VARCHAR(100),
    DeskripsiToko TEXT,
    FOREIGN KEY (UserID) REFERENCES Penjual(UserID)
);

CREATE TABLE Kategori (
    CategoryID INT PRIMARY KEY,
    NamaKategori VARCHAR(100),
    Deskripsi TEXT
);

CREATE TABLE Produk (
    ProdukID INT PRIMARY KEY,
    StoreID INT,
    CategoryID INT,
    NamaProduk VARCHAR(100),
    Deskripsi TEXT,
    Harga DECIMAL(12, 2),
    Stok INT,
    StatusProduk VARCHAR(50),
    Rating DECIMAL(3, 2),
    FOREIGN KEY (StoreID) REFERENCES Toko(StoreID),
    FOREIGN KEY (CategoryID) REFERENCES Kategori(CategoryID)
);

CREATE TABLE Detail_Category (
    ProdukID INT,
    CategoryID INT,
    PRIMARY KEY (ProdukID, CategoryID),
    FOREIGN KEY (ProdukID) REFERENCES Produk(ProdukID),
    FOREIGN KEY (CategoryID) REFERENCES Kategori(CategoryID)
);

CREATE TABLE Transaksi (
    TransaksiID INT PRIMARY KEY,
    UserID INT,
    TotalHarga DECIMAL(12, 2),
    Diskon DECIMAL(5, 2),
    OngkosKirim DECIMAL(12, 2),
    StatusPesanan VARCHAR(50),
    NamaProduk TEXT,
    FOREIGN KEY (UserID) REFERENCES Pembeli(UserID)
);

CREATE TABLE Membeli (
    TransaksiID INT,
    ProdukID INT,
    JumlahProduk INT,
    PRIMARY KEY (TransaksiID, ProdukID),
    FOREIGN KEY (TransaksiID) REFERENCES Transaksi(TransaksiID),
    FOREIGN KEY (ProdukID) REFERENCES Produk(ProdukID)
);

CREATE TABLE Pembayaran (
    PaymentID INT PRIMARY KEY,
    TransaksiID INT,
    Tanggal DATE,
    Metode VARCHAR(50),
    OngkosKirim DECIMAL(12, 2),
    TotalBayar DECIMAL(12, 2),
    StatusBayar VARCHAR(50),
    FOREIGN KEY (TransaksiID) REFERENCES Transaksi(TransaksiID)
);

CREATE TABLE Ulasan (
    ReviewID INT PRIMARY KEY,
    ProdukID INT,
    UserID INT,
    Rating DECIMAL(3, 2),
    Komentar TEXT,
    TanggalUlasan DATE,
    FOREIGN KEY (ProdukID) REFERENCES Produk(ProdukID),
    FOREIGN KEY (UserID) REFERENCES Pengguna(UserID)
);

/*DML: INSERT INTO*/

INSERT INTO Pengguna VALUES
(1, 'Ahmad', '123456789', 'Jl. Melati No.1', '08123456789', 'ahmad@mail.com', 'Laki-laki', TRUE, FALSE),
(2, 'Sari', '987654321', 'Jl. Mawar No.2', '08987654321', 'sari@mail.com', 'Perempuan', TRUE, FALSE);

INSERT INTO Penjual VALUES (1, 1);
INSERT INTO Pembeli VALUES (2, 500000.00, 150);

INSERT INTO Toko VALUES (101, 1, 'Toko Ahmad', 'Menjual perlengkapan elektronik');

INSERT INTO Kategori VALUES
(1, 'Elektronik', 'Produk elektronik seperti laptop dan HP'),
(2, 'Pakaian', 'Berbagai jenis pakaian');

INSERT INTO Produk VALUES
(201, 101, 1, 'Laptop Asus ROG', 'Laptop gaming terbaik', 20000000.00, 5, 'Tersedia', 4.8);

INSERT INTO Detail_Category VALUES (201, 1);

INSERT INTO Transaksi VALUES
(301, 2, 19500000.00, 500000.00, 20000.00, 'Selesai', 'Laptop Asus ROG');

INSERT INTO Membeli VALUES (301, 201, 1);

INSERT INTO Pembayaran VALUES
(401, 301, '2025-05-01', 'Transfer Bank', 20000.00, 19500000.00, 'Sudah Dibayar');

INSERT INTO Ulasan VALUES
(501, 201, 2, 5.0, 'Barang bagus, sesuai deskripsi!', '2025-05-02');
