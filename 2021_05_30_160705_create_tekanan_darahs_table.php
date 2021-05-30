<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateTekananDarahsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('tekanan_darahs', function (Blueprint $table) {
            $table->id();
            $table->foreign('id_pegawai')->references('id')->on('pegawais');
            $table->foreign('id_penghuni')->references('id')->on('penghunis');
            $table->string('sistole');
            $table->string('distole');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('tekanan_darahs');
    }
    protected $primaryKey = 'id';
}
