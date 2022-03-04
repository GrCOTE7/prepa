<?php
Route::group(['middleware' => 'web'], function () {

    Route::post('/form/send', function () {
        return \Zen\Octolanding\Controllers\Subscriptions::onSend();
    });

});