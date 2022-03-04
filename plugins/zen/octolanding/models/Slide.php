<?php namespace Zen\Octolanding\Models;

use Model;

/**
 * Model
 */
class Slide extends Model
{
    use \October\Rain\Database\Traits\Validation;
    use \October\Rain\Database\Traits\Sortable;
    
    /*
     * Disable timestamps by default.
     * Remove this line if timestamps are defined in the database table.
     */
    public $timestamps = false;

    /**
     * @var array Validation rules
     */
    public $rules = [
        'name' => 'required',
    ];

    /**
     * @var string The database table used by the model.
     */
    public $table = 'zen_octolanding_slides';

    public $belongsTo = [
        'slider' => [
            'Zen\Octolanding\Models\Slider',
            'key' => 'slider_id'
        ],
    ];

    public function scopeSliderFilter($query, $model)
    {
        return $query->where('slider_id',$model);
    }

    public function getSliderIdOptions()
    {
        return Slider::lists('name','id');
    }

}
