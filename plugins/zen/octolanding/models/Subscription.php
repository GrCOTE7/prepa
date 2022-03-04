<?php namespace Zen\Octolanding\Models;

use Model;

/**
 * Model
 */
class Subscription extends Model
{
    use \October\Rain\Database\Traits\Validation;
    

    /**
     * @var string The database table used by the model.
     */
    public $table = 'zen_octolanding_applications';

    /**
     * @var array Validation rules
     */
    public $rules = [
    ];
}
