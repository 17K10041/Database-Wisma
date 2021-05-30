<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePenghunisTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('penghunis', function (Blueprint $table) {
            $table->id();
            $table->foreign('id_penanggung_jawab')->references('id')->on('penanggung_jawabs');
            $table->string('nama_lengkap');
            $table->string('nama_panggilan');
            // foto
            $table->date('tgl_lahir');
            $table->string('gender');
            $table->string('agama');
            $table->string('alamat');
            $table->integer('no_telp');
            $table->string('asal_daerah');
            $table->string('ruang');
            $table->date('tanggal_masuk');
            $table->date('tanggal_keluar');
            $table->integer('meninggal');
            $table->integer('keluar');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('penghunis');
    }
    protected $primaryKey = 'id';
}
