<?php

namespace App\Livewire;

use App\Models\Address;
use App\Models\Barangay;
use App\Models\User;
use Livewire\Component;


class NewUsersList extends Component
{
    public function render()
    {
        // Paginate the users list and limit it to 50 users per page
        $users = User::with(['address.barangay'])
                     ->orderBy('created_at', 'desc')  // Order by the most recent user first
                     ->paginate(50);  // Limit to 50 users per page

        // Fetch all barangays for the filter
        $barangays = Barangay::all();

        return view('livewire.new-users-list', [
            'users' => $users,
            'barangays' => $barangays  // Pass barangays to the view
        ]);
    }
}
