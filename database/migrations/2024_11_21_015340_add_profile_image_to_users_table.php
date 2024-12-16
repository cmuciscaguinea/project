<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up()
{
    Schema::table('users', function (Blueprint $table) {
        $table->string('profile_image')->nullable(); // To store the image file name (nullable for users who haven't uploaded an image yet)
    });
}

// In the down() method
public function down()
{
    Schema::table('users', function (Blueprint $table) {
        $table->dropColumn('profile_image');
    });
}
};
