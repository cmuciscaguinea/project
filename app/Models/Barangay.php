<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Barangay extends Model
{
    use HasFactory;

    /**
     * Get the addresses for the barangay.
     */
    public function addresses()
    {
        return $this->hasMany(Address::class, 'barangay_id');
    }
}
