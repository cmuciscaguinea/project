<div>
    <!-- Table Section -->
    <div class="max-w-full px-4 py-10 sm:px-6 lg:px-8 lg:py-14 mx-auto">
        @if (session()->has('message'))
            <div class="mt-2 bg-teal-600 text-xs text-white rounded-lg p-4" role="alert">
                <span class="font-semibold">Success:</span> {{ session('message') }}
            </div>
        @endif

        <!-- Card -->
        <div class="flex flex-col">
            <div class="-m-1.5 overflow-x-auto">
                <div class="p-1.5 min-w-full inline-block align-middle">
                    <div class="bg-white border border-gray-300 rounded-xl shadow-lg overflow-hidden dark:bg-neutral-800 dark:border-neutral-700">
                        <!-- Header -->
                        <div class="px-6 py-4 grid gap-4 md:flex md:justify-between md:items-center border-b border-gray-200 dark:border-neutral-700">
                            <div>
                                <h2 class="text-xl font-semibold text-gray-800 dark:text-neutral-200">
                                    Users Management
                                </h2>
                                <p class="text-sm text-gray-600 dark:text-neutral-400">
                                    Add, edit, or manage users from this section.
                                </p>
                            </div>
                            <div class="flex space-x-3 items-center">
                                <!-- Search Bar -->
                                <input type="text" id="searchInput" class="py-2 px-4 text-sm border border-gray-300 rounded-lg dark:border-neutral-700 dark:bg-neutral-800 dark:text-neutral-200" placeholder="Search Users..." onkeyup="searchTable()">
                                
                                <!-- Filters -->
                                 <!-- Date Range Filters -->
    <div class="flex items-center gap-x-2">
        <label for="fromDate" class="text-sm">From:</label>
        <input type="date" id="fromDate" class="py-2 px-4 text-sm border border-gray-300 rounded-lg dark:border-neutral-700 dark:bg-neutral-800 dark:text-neutral-200" onchange="filterTable()">
    </div>
    <div class="flex items-center gap-x-2">
        <label for="toDate" class="text-sm">To:</label>
        <input type="date" id="toDate" class="py-2 px-4 text-sm border border-gray-300 rounded-lg dark:border-neutral-700 dark:bg-neutral-800 dark:text-neutral-200" onchange="filterTable()">
    </div>
                                <select id="roleFilter" class="py-2 px-4 text-sm border border-gray-300 rounded-lg dark:border-neutral-700 dark:bg-neutral-800 dark:text-neutral-200" onchange="filterTable()">
                                    <option value="">All Roles</option>
                                    <option value="0">Admin</option>
                                    <option value="1">School Head</option>
                                    <option value="2">Faculty</option>
                                    <option value="3">Student</option>
                                </select>

                                <select id="statusFilter" class="py-2 px-4 text-sm border border-gray-300 rounded-lg dark:border-neutral-700 dark:bg-neutral-800 dark:text-neutral-200" onchange="filterTable()">
                                    <option value="">All Status</option>
                                    <option value="0">Pending</option>
                                    <option value="1">Active</option>
                                    <option value="2">Disabled</option>
                                </select>
                                
                                <select id="barangayFilter" name="barangay_id" class="py-2 px-4 text-sm border border-gray-300 rounded-lg" onchange="filterTable()">
                                    <option value="">Grade & Section</option>
                                    @foreach($barangays as $barangay)
                                        <option value="{{ $barangay->id }}" {{ request('barangay_id') == $barangay->id ? 'selected' : '' }}>
                                            {{ $barangay->barangay_name }}
                                        </option>
                                    @endforeach
                                </select>
                                
                                <a class="py-2 px-4 inline-flex items-center gap-x-2 text-xs font-medium rounded-lg border border-transparent bg-green-600 text-white hover:bg-green-700 focus:outline-none" href="/admin/create/users">
                                    <svg class="shrink-0 w-4 h-4" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round">
                                        <path d="M5 12h14"/>
                                        <path d="M12 5v14"/>
                                    </svg>
                                    Add User
                                </a>
                            </div>
                        </div>

                        <!-- Table -->
                        <div class="overflow-x-auto">
                            <table id="userTable" class="min-w-full table-auto divide-y divide-gray-200 dark:divide-neutral-700 table-fixed">
                                <thead class="bg-gray-50 dark:bg-neutral-800">
                                    <tr>
                                        <th class="px-8 py-5 text-left text-sm font-semibold text-gray-700 dark:text-neutral-200 uppercase tracking-wider"></th>
                                        <th class="px-4 py-3 text-left text-sm font-semibold text-gray-700 dark:text-neutral-200 uppercase tracking-wider">Complete Name</th>
                                        <th class="px-4 py-3 text-left text-sm font-semibold text-gray-700 dark:text-neutral-200 uppercase tracking-wider">Position</th>
                                        <th class="px-4 py-3 text-left text-sm font-semibold text-gray-700 dark:text-neutral-200 uppercase tracking-wider">Grade & Section</th>
                                        <th class="px-4 py-3 text-left text-sm font-semibold text-gray-700 dark:text-neutral-200 uppercase tracking-wider">Contact #</th>
                                        <th class="px-4 py-3 text-left text-sm font-semibold text-gray-700 dark:text-neutral-200 uppercase tracking-wider">Gender</th>
                                        <th class="px-4 py-3 text-left text-sm font-semibold text-gray-700 dark:text-neutral-200 uppercase tracking-wider">Birthdate</th>
                                        <th class="px-4 py-3 text-left text-sm font-semibold text-gray-700 dark:text-neutral-200 uppercase tracking-wider">Status</th>
                                        <th class="px-4 py-3 text-left text-sm font-semibold text-gray-700 dark:text-neutral-200 uppercase tracking-wider">Email</th>
                                        <th class="px-4 py-3 text-left text-sm font-semibold text-gray-700 dark:text-neutral-200 uppercase tracking-wider">Reset Password</th>
                                        <th class="px-4 py-3 text-left text-sm font-semibold text-gray-700 dark:text-neutral-200 uppercase tracking-wider">Date Created</th>
                                        <th class="px-4 py-3 text-left text-sm font-semibold text-gray-700 dark:text-neutral-200 uppercase tracking-wider">Actions</th>
                                    </tr>
                                </thead>

                                <tbody id="tableBody" class="divide-y divide-gray-200 dark:divide-neutral-700">
                                    @if (count($users) > 0)
                                        @foreach ($users as $user)
                                            <tr class="hover:bg-gray-100 dark:hover:bg-neutral-700">
                                                <td class="px-4 py-3 text-sm">
                                                    <img 
                                                        src="{{ $user->profile_image ? asset('storage/' . $user->profile_image) : asset('assets/default-avatar.png') }}" 
                                                        alt="{{ $user->complete_name }}" 
                                                        class="w-8 h-8 rounded-full">
                                                </td>
                                                <td class="px-4 py-3 text-sm">
                                                    <a href="{{ route('users.profile-form', $user->user_id) }}" class="text-blue-600 hover:text-blue-800">
                                                        {{ $user->complete_name }}
                                                    </a>
                                                </td>
                                                
                                                <td class="px-4 py-3 text-sm">
                                                    @switch($user->role)
                                                        @case(0)
                                                            Admin
                                                            @break
                                                        @case(1)
                                                            School Head
                                                            @break
                                                        @case(2)
                                                            Faculty
                                                            @break
                                                        @case(3)
                                                            Student
                                                            @break
                                                        @default
                                                            Unknown
                                                    @endswitch
                                                </td>
                                                <td class="px-4 py-3 text-sm" data-barangay-id="{{ $user->address->barangay->id ?? '' }}">
                                                    {{ $user->address->street ?? 'N/A' }},
                                                    {{ $user->address->barangay->barangay_name ?? 'N/A' }},
                                                </td>
                                                
                                                <td class="px-4 py-3 text-sm">{{ $user->contact_no }}</td>
                                                <td class="px-4 py-3 text-sm">{{ $user->gender }}</td>
                                                <td class="px-4 py-3 text-sm">{{ $user->birth_date }}</td>
                                                <td class="px-4 py-3 text-sm">
                                                    @switch($user->status)
                                                        @case(0)
                                                            <span class="text-yellow-500">Pending</span>
                                                            @break
                                                        @case(1)
                                                            <span class="text-green-500">Active</span>
                                                            @break
                                                        @case(2)
                                                            <span class="text-gray-500">Disabled</span>
                                                            @break
                                                        @default
                                                            Unknown
                                                    @endswitch
                                                </td>
                                                <td class="px-4 py-3 text-sm">{{ $user->email }}</td>
                                                <td class="px-4 py-3 text-sm">
                                                    <form id="reset-password-form-{{ $user->user_id }}" action="{{ route('users.reset-password', $user->user_id) }}" method="POST">
                                                        @csrf
                                                        <button 
                                                            type="button" 
                                                            onclick="confirmResetPassword('{{ $user->complete_name }}', {{ $user->user_id }})" 
                                                            class="text-blue-600 hover:text-blue-800 focus:outline-none">
                                                            Reset Password
                                                        </button>
                                                    </form>
                                                </td>
                                                
                                                <td class="px-4 py-3 text-sm">{{ $user->created_at->format('Y-m-d') }}</td>
                                                
                                                <td class="px-4 py-3 text-sm">
                                                    <div class="flex gap-2">
                                                        <!-- Edit Button -->
                                                        <a href="{{ route('users.edit-form', $user->user_id) }}" class="text-blue-600 hover:text-blue-800 focus:outline-none">
                                                            <svg class="w-5 h-5" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round">
                                                                <path d="M12 20h9"/>
                                                                <path d="M14 8l8-8"/>
                                                            </svg>
                                                        </a>
                                                        
                                                        <!-- Delete Button -->
                                                        <form action="{{ route('users.destroy', $user->user_id) }}" method="POST" onsubmit="return confirm('Are you sure you want to delete this user?');" class="inline-block">
                                                            @csrf
                                                            @method('DELETE')
                                                            <button type="submit" class="text-red-600 hover:text-red-800 focus:outline-none">
                                                                <svg class="w-5 h-5" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round">
                                                                    <path d="M6 6L18 18"/>
                                                                    <path d="M6 18L18 6"/>
                                                                </svg>
                                                            </button>
                                                        </form>
                                                    </div>
                                                </td>
                                            </tr>
                                        @endforeach
                                    @else
                                        <tr>
                                            <td colspan="12" class="text-center py-4 text-sm text-gray-500">No data found!</td>
                                        </tr>
                                    @endif
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<script>
 function filterTable() {
    let roleFilter = document.getElementById("roleFilter").value;
    let statusFilter = document.getElementById("statusFilter").value;
    let barangayFilter = document.getElementById("barangayFilter").value; // Barangay filter
    let fromDate = document.getElementById("fromDate").value;
    let toDate = document.getElementById("toDate").value;

    let rows = document.getElementById("userTable").getElementsByTagName("tr");

    const roleMapping = {
        "0": "Admin",
        "1": "School Head",
        "2": "Faculty",
        "3": "Student"
    };

    const statusMapping = {
        "0": "Pending",
        "1": "Active",
        "2": "Disabled"
    };

    for (let i = 1; i < rows.length; i++) {
        let cells = rows[i].getElementsByTagName("td");
        let roleCell = cells[2]?.textContent.trim().toUpperCase() || "";
        let statusCell = cells[7]?.textContent.trim().toUpperCase() || "";
        let barangayCell = cells[3]?.getAttribute('data-barangay-id') || "";
        let dateCell = cells[10]?.textContent.trim(); // Get the "Date Created" column content

        // Match filters
        let matchRole = roleFilter ? roleCell === roleMapping[roleFilter].toUpperCase() : true;
        let matchStatus = statusFilter ? statusCell === statusMapping[statusFilter].toUpperCase() : true;
        let matchBarangay = barangayFilter ? barangayCell === barangayFilter : true;

        let matchDate = true;
        if (fromDate || toDate) {
            let rowDate = new Date(dateCell);
            let startDate = fromDate ? new Date(fromDate) : null;
            let endDate = toDate ? new Date(toDate) : null;

            if (startDate && rowDate < startDate) matchDate = false;
            if (endDate && rowDate > endDate) matchDate = false;
        }

        // Apply all filter logic
        if (matchRole && matchStatus && matchBarangay && matchDate) {
            rows[i].style.display = ""; // Show row
        } else {
            rows[i].style.display = "none"; // Hide row
        }
    }
}



// Search functionality
function searchTable() {
    let input = document.getElementById("searchInput");
    let filter = input.value.toUpperCase();
    let rows = document.getElementById("tableBody").getElementsByTagName("tr");

    for (let i = 0; i < rows.length; i++) {
        let cells = rows[i].getElementsByTagName("td");
        let found = false;
        
        for (let j = 0; j < cells.length; j++) {
            let cell = cells[j];
            if (cell) {
                if (cell.textContent.toUpperCase().indexOf(filter) > -1) {
                    found = true;
                    break;
                }
            }
        }
        
        if (found) {
            rows[i].style.display = "";
        } else {
            rows[i].style.display = "none";
        }
    }
}

// Confirm password reset action
function confirmResetPassword(userName, userId) {
    if (confirm(`Are you sure you want to reset the password for ${userName}?`)) {
        document.getElementById(`reset-password-form-${userId}`).submit();
    }
}


</script>
