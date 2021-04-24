DROP DATABASE IF EXISTS  dbWisma;
CREATE DATABASE dbWisma;
USE dbWisma;

CREATE TABLE user (
  	id int(10) NOT NULL,
  	username varchar(100),
  	id_level varchar(100),
  	status varchar(100),
  	PRIMARY KEY (id)
);
INSERT INTO user VALUES (1, Alfa, Administrasi, Active);

CREATE TABLE pegawai (
	id_pegawai int(11) NOT NULL,
	nama varchar(100),
	id int,
	FOREIGN KEY (id) REFERENCES user(id),
	status varchar(100),
	PRIMARY KEY (id_pegawai)
);
INSERT INTO pegawai VALUES (1, Alfa, 1, Active);

CREATE TABLE keterangan_keluhan (
	id_keterangan int(11) NOT NULL,
	keterangan varchar(100),
	PRIMARY KEY (id_keterangan)
);
INSERT INTO keterangan_keluhan VALUES (1, keterangan);

CREATE TABLE penanggung_jawab (
	id_penganggung_jawab int(11) NOT NULL,
	nama varchar(100),
	alamat varchar(100),
	no_telp int(15),
	PRIMARY KEY(id_penganggung_jawab
);
INSERT INTO penanggung_jawab VALUES (1, Beta, Jl.Rajawali, 08222222);

CREATE TABLE penghuni (
	id_penghuni int(11) NOT NULL,
	id_penganggung_jawab int,
	FOREIGN KEY (id_penganggung_jawab) REFERENCES penanggung_jawab(id_penganggung_jawab),
	nama varchar(100),
	panggilan varchar(50),
	--foto--
	tgl_lahir DATE,
	gender varchar(1),
	agama varchar(15),
	alamat varchar(100),
	no_telp int(15),
	asal_daerah varchar(15),
	ruang varchar(20),
	tgl_masuk DATE,
	tgl_keluar DATE,
	meninggal varchar(100),
	keluar int(15),
	PRIMARY KEY(id_penghuni)
);
INSERT INTO penghuni VALUES (1, 1, Charles,'2000-01-01', P, Katolik, Jl.Merak, 081111111, Semarang, R51, '2012-12-12', '2013-01-01', Gagal jantung, 10);

CREATE TABLE keluhan_utama (
	id_keluhan_utama int(11) NOT NULL,
	id_pegawai int,
	id_penghuni int,
	id_keterangan int,
	FOREIGN KEY (id_pegawai) REFERENCES pegawai(id_pegawai),
	FOREIGN KEY (id_penghuni) REFERENCES penghuni(id_penghuni),
	FOREIGN KEY (id_keterangan) REFERENCES keterangan_keluhan(id_keterangan),
	timestam (DATETIME),
	PRIMARY KEY (id_keluhan_utama)
);
INSERT INTO keluhan_utama VALUES (1,1,1,1,'2020-01-01');

CREATE TABLE berat_badan (
	id_berat_badan int(11) NOT NULL,
    id_pegawai int,
	id_penghuni int,
	FOREIGN KEY (id_pegawai) REFERENCES pegawai(id_pegawai),
	FOREIGN KEY (id_penghuni) REFERENCES penghuni(id_penghuni),
	hasil decimal(11),
	timestam DATETIME,
	PRIMARY KEY (id_berat_badan)
);
INSERT INTO berat_badan VALUES (1,1,1,7.5,'2020-01-02');

CREATE TABLE jenis_obat (
	id_jenis_obat int(11) NOT NULL,
	nama_obat varchar(20),
	PRIMARY KEY(id_jenis_obat)
);
INSERT INTO jenis_obat VALUES (1,Paramex);

CREATE TABLE cek_obat (
	id_cek_obat int(11) NOT NULL,
	id_pegawai int,
	id_penghuni int,
	id_jenis_obat int,
	FOREIGN KEY (id_pegawai) REFERENCES pegawai(id_pegawai),
	FOREIGN KEY (id_penghuni) REFERENCES penghuni(id_penghuni),
	FOREIGN KEY (id_jenis_obat) REFERENCES jenis_obat(id_jenis_obat),
	dikonsumsi int(10),
	timestam DATETIME,
	PRIMARY KEY(id_cek_obat)
);
INSERT INTO cek_obat VALUES (1,1,1,1,5,'2020-02-02');

CREATE TABLE tekanan_darah (
	id_tekanan_darah int(11) NOT NULL,
	id_pegawai int,
	id_penghuni int,
	FOREIGN KEY (id_pegawai) REFERENCES pegawai(id_pegawai),
	FOREIGN KEY (id_penghuni) REFERENCES penghuni(id_penghuni),
	sistole int(10),
	diastole int(10),
	timestam DATETIME,
	PRIMARY KEY(id_tekanan_darah)
);
INSERT INTO tekanan_darah VALUES (1,1,1,10,20,'2020-03-03');

CREATE TABLE visit_dokter(
	id_visit_dokter INT(11) NOT NULL,
	id_pegawai int,
	id_penghuni int,
	FOREIGN KEY (id_pegawai) REFERENCES pegawai(id_pegawai),
	FOREIGN KEY (id_penghuni) REFERENCES penghuni(id_penghuni),
	nama_dokter varchar(100),
	keluhan varchar(100),
	diagnosa varchar(100),
	resep_obat varchar(100),
	timestam DATETIME,
	PRIMARY KEY(id_visit_dokter)
);
INSERT INTO visit_dokter VALUES (1,1,1,Delta,Pusing,Kurang tidur,Paramex 2x1,'2020-04-04');

CREATE TABLE perkembangan_keperawatan(
	id_perkembangan_keperawatan INT(11) NOT NULL,
	id_pegawai int,
	id_penghuni int,
	FOREIGN KEY (id_pegawai) REFERENCES pegawai(id_pegawai),
	FOREIGN KEY (id_penghuni) REFERENCES penghuni(id_penghuni),
	anaslisa varchar(100),
	planning varchar(100),
	evaluasi varchar(100),
	timestam DATETIME,
	PRIMARY KEY(id_perkembangan_keperawatan)
);
INSERT INTO perkembangan_keperawatan VALUES (1,1,1,Pusing karena kurang tidur,Tambah jam tidur,kurangi aktivitas malam,'2020-05-05');