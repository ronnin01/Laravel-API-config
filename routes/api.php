<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::get('/sample', function() {
    return response()
    ->json([
        "data" => [
            ["key"=>1, "name"=>"aaron"],
            ["key"=>2, "name"=>"gabriel"],
            ["key"=>3, "name"=>"gabby"],
            ["key"=>4, "name"=>"ron"],
        ]
    ], 200);
});
