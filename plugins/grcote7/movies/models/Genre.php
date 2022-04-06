<?php namespace Grcote7\Movies\Models;

use Model;

/**
 * Model
 */
class Genre extends Model
{
    use \Winter\Storm\Database\Traits\Validation;
    
    /*
     * Disable timestamps by default.
     * Remove this line if timestamps are defined in the database table.
     */
    public $timestamps = false;


    /**
     * @var string The database table used by the model.
     */
    public $table = 'grcote7_movies_genres';

    /**
     * @var array Validation rules
     */
    public $rules = [
    ];
}
