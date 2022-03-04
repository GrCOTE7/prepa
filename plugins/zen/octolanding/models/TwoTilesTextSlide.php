<?php namespace Zen\Octolanding\Models;

use Model;
use Zen\Octolanding\Models\Slider;

/**
 * Model
 */
class TwoTilesTextSlide extends Model
{
    use \October\Rain\Database\Traits\Validation;
    
    /*
     * Disable timestamps by default.
     * Remove this line if timestamps are defined in the database table.
     */

    public $jsonable = ['blocks'];
    public $timestamps = false;


    /**
     * @var string The database table used by the model.
     */
    public $table = 'zen_octolanding_twotilestextslide';

    /**
     * @var array Validation rules
     */
    public $rules = [

    ];



    public function getSliderIdOptions() {
    	return Slider::pluck('name','id');
    }

    public function getSliderId($id) {
    	return Slider::where('id', $id)->first();
    }

}
