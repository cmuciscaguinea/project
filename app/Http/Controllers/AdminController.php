<?php

namespace App\Http\Controllers;

use App\Model\Address;
use App\Models\Barangay;
use App\Models\City;
use App\Models\User;

use Illuminate\Http\Request;

class AdminController extends Controller
{
    public function loadAdminDashboard()
   {
        return view('admin.dashboard');
   } 

   public function loadUsersList()
   {
       // Paginate users, 50 per page
       $users = User::with(['address.barangay'])->paginate(50);
       $barangays = Barangay::all(); // Corrected variable name to match the view
   
       return view('admin.users-list', compact('users', 'barangays'));
   }
   

   public function destroy(User $user)
   {
       try {
           // Delete associated owner details if they exist
           if ($user->owner) {
               $user->owner->delete(); // Delete the related owner record
           }
   
           // Now delete the user
           $user->delete(); // Soft delete or hard delete depending on your model
   
           return redirect()->back()->with('message', 'User and their owner details deleted successfully!');
       } catch (\Exception $e) {
           return redirect()->back()->with('error', 'An error occurred while deleting the user: ' . $e->getMessage());
       }
   }
   

   public function loadOwnersList()
   {
        return view('admin.animal-owners');
   } 

   public function loadAddUsers() 
   {
        return view('admin.add-users');
   }

}
