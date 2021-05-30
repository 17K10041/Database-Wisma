<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateUrinesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('urines', function (Blueprint $table) {
            $table->id();
            $table->foreign('id_pegawai')->references('id')->on('pegawais');
            $table->foreign('id_penghuni')->references('id')->on('penghunis');
            $table->foreign('id_keterangan')->references('id')->on('keterangan_keluhans');
            $table->string('keterangan');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('urines');
    }
    protected $primaryKey = 'id';
}
