<?php

/*
 * (c) Boosteur.com - 2022
 */

use Grcote7\Movies\Models\Movie;

// (c) Boosteur.com - 2022

Route::get('/hello', function () {
  return Movie::orderBy('year', 'desc')->paginate(20);
});
