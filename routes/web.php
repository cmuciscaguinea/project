<?php
use App\Http\Controllers\OwnerController;
use App\Http\Controllers\VetController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\ReceptionistController;
use App\Http\Controllers\AdminController;
use App\Http\Livewire\Pages\Auth\Register;
use App\Livewire\EditUser;

use Illuminate\Support\Facades\Route;

Route::view('/', 'welcome');

Route::view('dashboard', 'dashboard')
    ->middleware(['auth']) //0
    ->name('dashboard');

Route::view('profile', 'profile')
    ->middleware(['auth'])
    ->name('profile');


Route::group(['middleware' => 'admin'],function(){

    Route::get('/admin/dashboard',[AdminController::class,'loadAdminDashboard'])
    ->name('admin-dashboard');

    
    Route::get('/admin/users',[AdminController::class,'loadUsersList'])
    ->name('admin-users');

    Route::get('/admin/owners',[AdminController::class,'loadOwnersList'])
    ->name('admin-owners');

    Route::get('/admin/create/users',[AdminController::class,'loadAddUsers']);

    Route::delete('/admin/users/{user}', [AdminController::class, 'destroy'])->name('users.destroy');

 // Edit User Route
Route::get('/users/{id}/edit', [UserController::class, 'edit'])->name('users.edit-form');
Route::put('/users/{id}', [UserController::class, 'update'])->name('users.update');

// Profile Update Routes (Make sure the paths are distinct)
Route::get('/users/{id}/editprofile', [UserController::class, 'profile_edit'])->name('users.profile-edit-form');
Route::put('/users/{id}/updateprofile', [UserController::class, 'profile_update'])->name('users.profile-update');

    //reset password
    Route::post('/users/{user}/reset-password', [UserController::class, 'resetPassword'])->name('users.reset-password');
    //profile
    Route::get('/users/{id}/profile', [UserController::class, 'profile'])->name('users.profile-form');

   

});

Route::get('/owner/dashboard',[OwnerController::class,'loadOwnerDashboard'])
->name('owner-dashboard')
->middleware('owner');

Route::get('/vet/dashboard',[VetController::class,'loadVetDashboard'])
->name('vet-dashboard')
->middleware('vet');

Route::get('/receptionist/dashboard',[ReceptionistController::class,'loadReceptionistDashboard'])
->name('receptionist-dashboard')
->middleware('receptionist');

require __DIR__.'/auth.php';
