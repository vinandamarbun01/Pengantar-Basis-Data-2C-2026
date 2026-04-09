USE klinik;

CREATE TABLE dokter (
    id_dokter INT PRIMARY KEY,
    nama_dokter VARCHAR(100),
    spesialisasi VARCHAR(100)
);

CREATE TABLE pasien (
    id_pasien INT PRIMARY KEY,
    nama_pasien VARCHAR(100),
    tanggal_lahir DATE,
    no_telepon VARCHAR(15)
);

CREATE TABLE rekam_medis (
    id_rekam INT PRIMARY KEY,
    id_pasien INT,
    id_dokter INT,
    tanggal_periksa DATE,
    diagnosis TEXT,

    FOREIGN KEY (id_pasien) REFERENCES pasien(id_pasien)
        ON DELETE RESTRICT,
        
    FOREIGN KEY (id_dokter) REFERENCES dokter(id_dokter)
        ON DELETE RESTRICT
);

INSERT INTO dokter VALUES
(1, 'Dr. Andi', 'Umum'),
(2, 'Dr. Siti', 'Gigi');

INSERT INTO pasien VALUES
(1, 'Budi', '2000-05-10', '081234567890'),
(2, 'Ani', '1998-08-15', '082345678901');

INSERT INTO rekam_medis VALUES
(1, 1, 1, '2025-04-01', 'Flu'),
(2, 2, 2, '2025-04-02', 'Sakit gigi');

INSERT INTO rekam_medis VALUES
(3, 5, 54, '2026-03-23', 'demam');

UPDATE pasien
SET no_telepon = '089876543210'
WHERE id_pasien = 1;

UPDATE dokter
SET spesialisasi = 'Penyakit Dalam'
WHERE id_dokter = 1;

DELETE FROM rekam_medis
WHERE id_rekam = 1;

SHOW TABLES;
DESCRIBE rekam_medis;

SELECT * from rekam_medis;