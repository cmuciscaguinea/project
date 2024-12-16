<?php

namespace App\Http\Controllers;

use App\Models\User;
use App\Models\Barangay;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage; // Add this for file storage

class UserController extends Controller
{
    public function profile($id)
    {
        $user = User::with('address')->findOrFail($id); // Fetch the user with their address
        $barangays = Barangay::all(); // Fetch all barangays
        return view('admin.profile', compact('user', 'barangays')); // Pass data to the view
    }

    public function edit($id)
    {
        $user = User::with('address')->findOrFail($id); // Fetch the user with their address
        $barangays = Barangay::all(); // Fetch all barangays
        return view('admin.edit', compact('user', 'barangays')); // Pass data to the view
    }

    public function update(Request $request, $id)
    {
        $request->validate([
            'complete_name' => 'required|string|max:100',
            'role' => 'required|integer',
            'contact_no' => 'required|string|max:15',
            'gender' => 'required|string|max:10',
            'birth_date' => 'required|date',
            'status' => 'required|integer',
            'email' => 'required|email|max:100|unique:users,email,' . $id . ',user_id',
            'barangay_id' => 'required|exists:barangays,id',
            'street' => 'nullable|string|max:255',
            'profile_image' => 'nullable|image|mimes:jpg,jpeg,png|max:2048', // Added validation for image
        ]);

        $user = User::findOrFail($id);

        // Handle profile image upload if a file is provided
        if ($request->hasFile('profile_image')) {
            // Delete old image if it exists
            if ($user->profile_image) {
                Storage::disk('public')->delete($user->profile_image);
            }
        
            // Store the new image
            $imagePath = $request->file('profile_image')->store('profile_images', 'public');
            $user->profile_image = $imagePath;
        }
        

        // Update user data
        $user->update($request->only([
            'complete_name',
            'role',
            'contact_no',
            'gender',
            'birth_date',
            'status',
            'email',
        ]));

        // Update or create the address
        $user->address()->updateOrCreate(
            ['user_id' => $user->user_id], // Condition to find the address
            $request->only(['barangay_id', 'street']) // Address fields to update
        );

        // Update or create the owner's data
        $user->owner()->updateOrCreate(
            ['user_id' => $user->user_id], // Match condition
            $request->only(['civil_status', 'category']) + ['permit' => 1] // Data to update, with permit added
        );

        return redirect()->route('users.edit-form', ['id' => $user->user_id])
    ->with('message', 'User details updated successfully.');

    }

    //Controller for  profile update

    public function profile_edit($id)
    {
        $user = User::with('address')->findOrFail($id); // Fetch the user with their address
        $barangays = Barangay::all(); // Fetch all barangays
        return view('admin.profile-edit', compact('user', 'barangays')); // Pass data to the view
    }

    public function profile_update(Request $request, $id)
    {
        $request->validate([
            'complete_name' => 'required|string|max:100',
            'role' => 'required|integer',
            'contact_no' => 'required|string|max:15',
            'gender' => 'required|string|max:10',
            'birth_date' => 'required|date',
            'status' => 'required|integer',
            'email' => 'required|email|max:100|unique:users,email,' . $id . ',user_id',
            'barangay_id' => 'required|exists:barangays,id',
            'street' => 'nullable|string|max:255',
            'profile_image' => 'nullable|image|mimes:jpg,jpeg,png|max:2048', // Added validation for image
        ]);

        $user = User::findOrFail($id);

        // Handle profile image upload if a file is provided
        if ($request->hasFile('profile_image')) {
            // Delete old image if it exists
            if ($user->profile_image) {
                Storage::disk('public')->delete($user->profile_image);
            }
        
            // Store the new image
            $imagePath = $request->file('profile_image')->store('profile_images', 'public');
            $user->profile_image = $imagePath;
        }
        

        // Update user data
        $user->update($request->only([
            'complete_name',
            'role',
            'contact_no',
            'gender',
            'birth_date',
            'status',
            'email',
        ]));

        // Update or create the address
        $user->address()->updateOrCreate(
            ['user_id' => $user->user_id], // Condition to find the address
            $request->only(['barangay_id', 'street']) // Address fields to update
        );

        // Update or create the owner's data
        $user->owner()->updateOrCreate(
            ['user_id' => $user->user_id], // Match condition
            $request->only(['civil_status', 'category']) + ['permit' => 1] // Data to update, with permit added
        );
        return redirect()->route('users.profile-form', ['id' => $user->user_id])
        ->with('message', 'Profile updated successfully.');

    }

    public function resetPassword(User $user)
    {
        try {
            // Update the user's password to "12345678"
            $user->update([
                'password' => bcrypt('12345678'),
            ]);

            // Redirect back with a success message
            return redirect()->back()->with('message', "Password for user {$user->complete_name} has been reset to '12345678'.");
        } catch (\Exception $e) {
            // Redirect back with an error message in case of failure
            return redirect()->back()->with('error', 'An error occurred while resetting the password.');
        }
    }
}
