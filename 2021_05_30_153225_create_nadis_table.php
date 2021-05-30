<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateNadisTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('nadis', function (Blueprint $table) {
            $table->id();
            $table->foreign('id_pegawai')->references('id')->on('pegawais');
            $table->foreign('id_penghuni')->references('id')->on('penghunis');
            $table->float('hasil');
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
        Schema::dropIfExists('nadis');
    }
    protected $primaryKey = 'id';
}
