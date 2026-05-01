USE siakad;

-- ========================
-- Tabel Mata Kuliah
-- ========================
CREATE TABLE Mata_Kuliah (
    id_mata_kuliah VARCHAR(5) PRIMARY KEY,
    nama_mk VARCHAR(100),
    sks INT,
    semester INT
);

-- ========================
-- Tabel Dosen
-- ========================
CREATE TABLE Dosen (
    id_dosen INT PRIMARY KEY,
    nama_dosen VARCHAR(100),
    bidang_keahlian VARCHAR(50),
    id_mata_kuliah VARCHAR(5),
    FOREIGN KEY (id_mata_kuliah) REFERENCES Mata_Kuliah(id_mata_kuliah)
);

-- ========================
-- Tabel Mahasiswa
-- ========================
CREATE TABLE Mahasiswa (
    id_mahasiswa INT PRIMARY KEY,
    nama_mahasiswa VARCHAR(100),
    program_studi VARCHAR(100),
    angkatan INT
);

-- ========================
-- Tabel KRS
-- ========================
CREATE TABLE KRS (
    id_krs INT PRIMARY KEY,
    id_mahasiswa INT,
    id_mata_kuliah VARCHAR(5),
    semester_ambil INT,
    FOREIGN KEY (id_mahasiswa) REFERENCES Mahasiswa(id_mahasiswa),
    FOREIGN KEY (id_mata_kuliah) REFERENCES Mata_Kuliah(id_mata_kuliah)
);

-- ========================
-- INSERT Mata Kuliah
-- ========================
INSERT INTO Mata_Kuliah VALUES
('MK01', 'Algoritma & Pemrograman', 4, 1),
('MK02', 'Basis Data Terdistribusi', 3, 2),
('MK03', 'Struktur Data', 3, 4),
('MK04', 'Jaringan Komputer', 3, 3),
('MK05', 'Kecerdasan Buatan', 3, 5),
('MK06', 'Sistem Informasi Akuntansi', 2, 8),
('MK07', 'Pemrograman Web Native', 3, 9),
('MK08', 'Keamanan Informasi', 3, 7),
('MK09', 'Etika Profesi IT', 2, 10),
('MK10', 'Administrasi Basis Data', 3, 6);

-- ========================
-- INSERT Dosen
-- ========================
INSERT INTO Dosen VALUES
(1, 'Dr. Budi', 'Pemrograman', 'MK01'),
(2, 'Prof. Siti', 'Basis Data', 'MK02'),
(3, 'Ir. Ahmad', 'Jaringan', 'MK04'),
(4, 'Dian, M.Kom', 'Pemrograman', 'MK03'),
(5, 'Eko, S.T', 'Kecerdasan Buatan', 'MK05'),
(6, 'Rina, M.T', 'Basis Data', 'MK10'),
(7, 'Hadi, Ph.D', 'Keamanan Siber', 'MK08'),
(8, 'Siska, M.SI', 'Sistem Informasi', 'MK06'),
(9, 'Bambang, M.Kom', 'Pemrograman', 'MK07'),
(10, 'Laila, M.T', 'Manajemen Proyek', 'MK09');

-- ========================
-- INSERT Mahasiswa
-- ========================
INSERT INTO Mahasiswa (id_mahasiswa, nama_mahasiswa, program_studi, angkatan) VALUES
(2201, 'Dhani Kusuma', 'Sistem Informasi', 2022),
(2202, 'Rizky Pratama', 'Sistem Informasi', 2022),
(2301, 'Andi Wijaya', 'Sistem Informasi', 2023),
(2302, 'Bunga Citra', 'Sistem Informasi', 2023),
(2303, 'Dimas Anggara', 'Sistem Informasi', 2023),
(2401, 'Candra Gupta', 'Sistem Informasi', 2024),
(2402, 'Dedi Kurniawan', 'Sistem Informasi', 2024),
(2501, 'Farah Nabila', 'Sistem Informasi', 2025),
(2502, 'Gibran Rakabumi', 'Sistem Informasi', 2025),
(2503, 'Hani Safira', 'Sistem Informasi', 2025),
(2504, 'Irfan Bachdim', 'Sistem Informasi', 2025),
(2505, 'Joko Anwar', 'Sistem Informasi', 2025);

-- ========================
-- INSERT KRS
-- ========================
INSERT INTO KRS VALUES
(101, 2301, 'MK01', 3),
(102, 2301, 'MK02', 3),
(103, 2201, 'MK05', 5),
(104, 2302, 'MK04', 3),
(105, 2401, 'MK01', 1),
(106, 2402, 'MK07', 2),
(107, 2202, 'MK10', 5),
(108, 2303, 'MK06', 4),
(109, 2201, 'MK08', 6),
(110, 2401, 'MK03', 1);

select 
	mk.nama_mk,
	mk.sks,
	d.nama_dosen
from Mata_kuliah mk
join dosen d on mk.id_mata_kuliah = d.id_mata_kuliah
where d.bidang_keahlian in ('Pemrograman','Basis data');


select 
	mhs.nama_mahasiswa,
	k.id_mata_kuliah
from mahasiswa mhs
left join krs k on mhs.id_mahasiswa = k.id_mahasiswa;

select 
	mhs.nama_mahasiswa,
	mk.nama_mk,
	k.semester_ambil
from krs k
join mahasiswa mhs on k.id_mahasiswa = mhs.id_mahasiswa 
join mata_kuliah mk on k.id_mata_kuliah = mk.id_mata_kuliah 
where k.semester_ambil between 3 and 5
order by k.semester_ambil asc;

select 
	mhs.nama_mahasiswa,
	mk.nama_mk,
	mk.	sks
from krs k
join mahasiswa mhs on k.id_mahasiswa = mhs.id_mahasiswa 
join mata_kuliah mk on k.id_mata_kuliah = mk.id_mata_kuliah 
where mhs.program_studi = 'Sistem Informasi'
	and mk.sks > 2
order by mk.sks desc, mhs.nama_mahasiswa  asc;

select
	mhs.nama_mahasiswa,
	mhs.program_studi
from mahasiswa mhs
where mhs.nama_mahasiswa = 'Dedi Kurniawan'
	and mhs.program_studi = 'Sistem Informasi';
	


	

SELECT 
    mhs.nama_mahasiswa,
    mk.nama_mk,
    d.nama_dosen
FROM KRS k
JOIN Mahasiswa mhs ON k.id_mahasiswa = mhs.id_mahasiswa
JOIN Mata_Kuliah mk ON k.id_mata_kuliah = mk.id_mata_kuliah
JOIN Dosen d ON mk.id_mata_kuliah = d.id_mata_kuliah
WHERE mhs.angkatan BETWEEN 2023 AND 2025
  AND (d.nama_dosen = 'Dr. Budi' OR d.nama_dosen = 'Prof. Siti')
ORDER BY mhs.angkatan DESC;



