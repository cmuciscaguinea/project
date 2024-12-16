<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class VetController extends Controller
{
   public function loadVetDashboard()
   {
        return view('vet.dashboard');
   } 
}
