<?php

use App\Models\User;
use App\Models\Owner;
use App\Models\Barangay;
use App\Models\Address;
use Illuminate\Auth\Events\Registered;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\Rules;
use Livewire\Attributes\Layout;
use Livewire\Volt\Component;

new #[Layout('layouts.guest')] class extends Component
{
    public string $complete_name = '';
    public int $role; // Default role: owner
    public string $contact_no = '';
    public string $gender = '';
    public ?string $birth_date = null; // Nullable for optional field
    public int $status = 1; // Active status by default
    public string $email = '';
    public string $password = '';
    public string $password_confirmation = '';

    // Owner-specific fields
    public ?string $civil_status = null;
    public ?string $category = null;
    public ?int $permit = 1; // Active status by default

    // Address-related fields
    public int $barangay_id = 0;
    public string $street = '';

    public $barangays = []; // Barangays list

    /**
     * Mount function to initialize barangays.
     */
    public function mount()
    {
        // Load all barangays
        $this->barangays = Barangay::all();
    }

    /**
     * Handle an incoming registration request.
     */
    public function register(): void
    {
        // Validate inputs
        $validated = $this->validate([
            'complete_name' => ['required', 'string', 'max:255'],
            'role' => ['required', 'integer', 'in:0,1,2,3'], // Validate roles
            'contact_no' => ['nullable', 'string', 'max:15'],
            'gender' => ['required', 'string'],
            'birth_date' => ['nullable', 'date'], // Allow null for birth_date
            'status' => ['required', 'integer'],
            'email' => ['required', 'string', 'email', 'max:255', 'unique:users,email'],
            // Validate owner-specific fields only if role is "Owner"
            'civil_status' => ['nullable', 'required_if:role,1', 'string', 'max:255'],
            'category' => ['nullable', 'required_if:role,1', 'string', 'max:255'],
            // Validate address fields
            'barangay_id' => ['required', 'exists:barangays,id'],
            'street' => ['nullable', 'string', 'max:255'],
        ]);

        // Set the password to the fixed value '123456' and hash it
        $validated['password'] = Hash::make('123456');

        // Create the user
        $user = User::create([
            'complete_name' => $validated['complete_name'],
            'role' => $validated['role'],
            'contact_no' => $validated['contact_no'],
            'gender' => $validated['gender'],
            'birth_date' => $validated['birth_date'],
            'status' => $validated['status'],
            'email' => $validated['email'],
            'password' => $validated['password'], // Using the hashed password
        ]);

        // If the role is "Owner," create an Owner record
        if ($validated['role'] === 1) {
            Owner::create([
                'user_id' => $user->user_id, // Correct FK reference
                'civil_status' => $this->civil_status,
                'category' => $this->category,
                'permit' => 1, // Default permit value
            ]);
        }

        // Insert the address record
        Address::create([
            'user_id' => $user->user_id, // Foreign key to user
            'barangay_id' => $this->barangay_id, // Foreign key to barangay
            'street' => $this->street, // Street field from form input
        ]);

        // Fire the Registered event
        event(new Registered($user));


        // Redirect based on the role
        session()->flash('message', 'User added successfully!');
   redirect()->route('admin-users'); // Correct redirect
    }
}
?>
<div class="max-w-4xl mx-auto p-8 bg-white rounded-lg shadow-lg">
        <!-- Title -->
        <div class="text-center mb-6">
            <h2 class="text-3xl font-semibold text-gray-800">User Registration Form</h2>
            <p class="text-lg text-gray-500">Please fill in the details below to create a new account.</p>
        </div>
    <!-- Logo -->
    <div class="text-center mb-8">
        <a href="/">
            <img class="h-20 w-auto mx-auto" src="{{ asset('assets/val.png') }}" alt="Your Logo">
        </a>
    </div>

    <form wire:submit.prevent="register" class="space-y-8">
        <!-- Complete Name -->
        <div>
            <x-input-label for="complete_name" :value="__('Full Name')" class="text-lg font-semibold text-gray-800"/>
            <x-text-input wire:model="complete_name" id="complete_name" class="block mt-1 w-full border border-gray-300 rounded-lg p-4 shadow-sm focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-blue-500" type="text" required autofocus />
            <x-input-error :messages="$errors->get('complete_name')" class="mt-2 text-sm text-red-500" />
        </div>

        <!-- Role -->
        <div>
            <x-input-label for="role" :value="__('Role')" class="text-lg font-semibold text-gray-800"/>
            <select wire:model="role" id="role" class="block mt-1 w-full border border-gray-300 rounded-lg p-4 shadow-sm focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-blue-500" required wire:change="$refresh">
                <option value="#">Select Role</option>
                <option value="0">Admin</option>
                <option value="1">Mayor</option>
                <option value="2">Members</option>
                <option value="3">Staff</option>
            </select>
            <x-input-error :messages="$errors->get('role')" class="mt-2 text-sm text-red-500" />
        </div>

        <!-- Barangay Selection -->
        <div>
            <x-input-label for="barangay_id" :value="__('Address')" class="text-lg font-semibold text-gray-800"/>
            <select wire:model="barangay_id" id="barangay_id" class="block mt-1 w-full border border-gray-300 rounded-lg p-4 shadow-sm focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-blue-500" required>
                <option value="">Select <Section></Section></option>
                @foreach($barangays as $barangay)
                    <option value="{{ $barangay->id }}">{{ $barangay->barangay_name }}</option>
                @endforeach
            </select>
            <x-input-error :messages="$errors->get('barangay_id')" class="mt-2 text-sm text-red-500" />
        </div>

        <!-- Street Name -->
        <div>
            <x-input-label for="street" :value="__('Street')" class="text-lg font-semibold text-gray-800"/>
            <x-text-input wire:model="street" id="street" class="block mt-1 w-full border border-gray-300 rounded-lg p-4 shadow-sm focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-blue-500" type="text" required />
            <x-input-error :messages="$errors->get('street')" class="mt-2 text-sm text-red-500" />
        </div>

        <!-- Contact Number -->
        <div>
            <x-input-label for="contact_no" :value="__('Contact Number')" class="text-lg font-semibold text-gray-800"/>
            <x-text-input wire:model="contact_no" id="contact_no" class="block mt-1 w-full border border-gray-300 rounded-lg p-4 shadow-sm focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-blue-500" type="text" />
            <x-input-error :messages="$errors->get('contact_no')" class="mt-2 text-sm text-red-500" />
        </div>

        <!-- Gender -->
        <div>
            <x-input-label for="gender" :value="__('Gender')" class="text-lg font-semibold text-gray-800"/>
            <select wire:model="gender" id="gender" class="block mt-1 w-full border border-gray-300 rounded-lg p-4 shadow-sm focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-blue-500" required>
                <option value="">Select Gender</option>
                <option value="male">Male</option>
                <option value="female">Female</option>
            </select>
            <x-input-error :messages="$errors->get('gender')" class="mt-2 text-sm text-red-500" />
        </div>

        <!-- Birth Date -->
        <div>
            <x-input-label for="birth_date" :value="__('Birth Date')" class="text-lg font-semibold text-gray-800"/>
            <x-text-input wire:model="birth_date" id="birth_date" class="block mt-1 w-full border border-gray-300 rounded-lg p-4 shadow-sm focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-blue-500" type="date" />
            <x-input-error :messages="$errors->get('birth_date')" class="mt-2 text-sm text-red-500" />
        </div>

        <!-- Owner-Specific Fields -->
        @if ($role == 1)
            <div>
                <x-input-label for="civil_status" :value="__('Civil Status')" class="text-lg font-semibold text-gray-800"/>
                <select wire:model="civil_status" id="civil_status" class="block mt-1 w-full border border-gray-300 rounded-lg p-4 shadow-sm focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-blue-500" required>
                    <option value="">Select Civil Status</option>
                    <option value="Married">Married</option>
                    <option value="Separated">Separated</option>
                    <option value="Single">Single</option>
                    <option value="Widow">Widow</option>
                </select>
                <x-input-error :messages="$errors->get('civil_status')" class="mt-2 text-sm text-red-500" />
            </div>

            <div>
                <x-input-label for="category" :value="__('Category')" class="text-lg font-semibold text-gray-800"/>
                <select wire:model="category" id="category" class="block mt-1 w-full border border-gray-300 rounded-lg p-4 shadow-sm focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-blue-500" required>
                    <option value="">Select Category</option>
                    <option value="N/A">N/A</option>
                    <option value="Indigenous People">Indigenous People</option>
                    <option value="Senior">Senior</option>
                    <option value="Single Parent">Single Parent</option>
                    <option value="Pregnant">Pregnant</option>
                    <option value="Person with Disability">Person with Disability</option>
                    <option value="Lactating Mother">Lactating Mother</option>
                    <option value="LGBT">LGBT</option>
                </select>
                <x-input-error :messages="$errors->get('category')" class="mt-2 text-sm text-red-500" />
            </div>
        @endif

        <!-- Email Address -->
        <div>
            <x-input-label for="email" :value="__('Email')" class="text-lg font-semibold text-gray-800"/>
            <x-text-input wire:model="email" id="email" class="block mt-1 w-full border border-gray-300 rounded-lg p-4 shadow-sm focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-blue-500" type="email" required />
            <x-input-error :messages="$errors->get('email')" class="mt-2 text-sm text-red-500" />
        </div>

        <!-- Submit Button -->
        <div class="flex items-center justify-center mt-8">
            <x-primary-button class="bg-blue-600 hover:bg-blue-700 focus:ring-4 focus:ring-blue-300 focus:outline-none text-white font-semibold rounded-lg px-6 py-3 shadow-md transition duration-300 ease-in-out transform hover:scale-105">
                {{ __('Add User') }}
            </x-primary-button>
        </div>
    </form>
</div>
