<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class OwnerController extends Controller
{
    public function loadOwnerDashboard()
    {
         return view('owner.dashboard');
    } 
}
