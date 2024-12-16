<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;

class User extends Authenticatable
{
    use HasFactory, Notifiable;

    protected $primaryKey = 'user_id';
    protected $keyType = 'int';
    public $incrementing = true;  // Specify primary key if it's not 'id'.
    

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'complete_name',
        'email',
        'password',
        'address',
        'contact_no',
        'gender',
        'birth_date',
        'status',
        'role',
    ];

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var array<int, string>
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array<string, string>
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
        'birth_date' => 'date', // Add this for proper casting
        'password' => 'hashed',
    ];
    
    public function address()
    {
        return $this->hasOne(Address::class, 'user_id', 'user_id' );
    }
    
    public function owner()
    {
        // Assuming the 'owners' table has a 'user_id' column (not 'user_user_id')
        return $this->hasOne(Owner::class, 'user_id'); // Specify the correct foreign key
    }
}    
