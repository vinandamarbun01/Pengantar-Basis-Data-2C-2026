USE klinik;

drop table rekam_medis;

CREATE TABLE rekam_medis (
    id_rekam INT PRIMARY KEY,
    id_pasien INT,
    id_dokter INT,
    tanggal_periksa DATE,
    diagnosis TEXT,

    FOREIGN KEY (id_pasien) REFERENCES pasien(id_pasien)
        ON DELETE restrict,

    FOREIGN KEY (id_dokter) REFERENCES dokter(id_dokter)
        ON DELETE cascade
);

INSERT INTO rekam_medis VALUES
(1, 1, 1, '2025-04-01', 'Flu'),
(2, 2, 1, '2025-04-02', 'Sakit gigi');

DELETE FROM dokter
WHERE id_dokter = 1;

DESCRIBE TABLE rekam_medis;
SELECT * FROM rekam_medis;