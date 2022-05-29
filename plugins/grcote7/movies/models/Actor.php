<?php

namespace Grcote7\Movies\Models;



use Model;

/**
 * Model.
 */
class Actor extends Model
{
    use \Winter\Storm\Database\Traits\Validation;

    /**
     * @var string the database table used by the model
     */
    public $table = 'grcote7_movies_actors';

    /*
     * Disable timestamps by default.
     * Remove this line if timestamps are defined in the database table.
     */
    public $timestamps = false;

    public $belongsToMany = [
        'movies' => [
            'Grcote7\Movies\Models\Movie',
            'table' => 'grcote7_movies_actors_movies',
            'order' => 'name',
        ],
    ];

    public $attachOne = [
        'actorimage' => 'System\Models\File',
    ];
    /**
     * @var array Validation rules
     */
    public $rules = [
    ];
    protected $fillable = [
        'name',
        'lastname',
    ];

    public function getFullNameAttribute()
    {
        return $this->name . ' ' . $this->lastname;
    }
}
