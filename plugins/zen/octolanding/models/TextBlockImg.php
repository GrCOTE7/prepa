<?php namespace Zen\Octolanding\Models;

use Model;

/**
 * Model
 */
class TextBlockImg extends Model
{
    use \October\Rain\Database\Traits\Validation;
    
    /*
     * Disable timestamps by default.
     * Remove this line if timestamps are defined in the database table.
     */
    public $timestamps = false;

      public $jsonable = ['blocks'];


    /**
     * @var string The database table used by the model.
     */
    public $table = 'zen_octolanding_textblockimg';

    /**
     * @var array Validation rules
     */
    public $rules = [
    ];
}
