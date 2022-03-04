<?php namespace Zen\Octolanding\Models;

use Model;
use Zen\Octolanding\Models\Slider;

/**
 * Model
 */
class FourImgSlideBgc extends Model
{
    use \October\Rain\Database\Traits\Validation;
    
    /*
     * Disable timestamps by default.
     * Remove this line if timestamps are defined in the database table.
     */
    public $timestamps = false;


    /**
     * @var string The database table used by the model.
     */
    public $table = 'zen_octolanding_fourimgslidebgc';

    /**
     * @var array Validation rules
     */
    public $rules = [
    ];

    public function getSliderIdOptions() {
        return Slider::pluck('name','id');
    }

    public $belongsTo = [
    'slider' => [
        'Zen\Octolanding\Models\Slider',
        'key' => 'slider_id'
    ],
    ];

}
