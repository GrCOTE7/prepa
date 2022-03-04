<?php namespace Zen\Octolanding\Models;

use Model;

/**
 * Model
 */
class Slider extends Model
{
    use \October\Rain\Database\Traits\Validation;
    
    /*
     * Disable timestamps by default.
     * Remove this line if timestamps are defined in the database table.
     */
    public $timestamps = false;

    /**
     * @var array Validation rules
     */
    public $rules = [
    ];

    /**
     * @var string The database table used by the model.
     */
    public $table = 'zen_octolanding_sliders';

    public $hasMany = [
        'slides' => [
            'Zen\Octolanding\Models\Slide',
            'key' => 'slider_id',
        ],
    ];

    public function afterDelete()
    {
        \DB::table('zen_octolanding_slides')
            ->where('slider_id', $this->id)
            ->update([
                'slider_id' => 0
            ]);
    }

}
