<?php namespace Zen\Octolanding\Models;

use Model;

/**
 * Model
 */
class Setting extends Model
{
    use \October\Rain\Database\Traits\Validation;
    
 
    public $timestamps = true;
    public $jsonable = ['emails', 'bgc_custom_images_options'];

    /**
     * @var string The database table used by the model.
     */
    public $table = 'zen_octolanding_settings';

    /**
     * @var array Validation rules
     */
    public $rules = [
        'color_main'         => 'required',
        'name'   => 'required',
        'site_name'   => 'required',
        'text_background'   => 'required',
    ];

    public function afterCreate()
    {
        if ($this->active) {
            $this->makePrimary();
        }
    }

    public function makePrimary()
    {
        $this->newQuery()->where('id', $this->id)->update(['active' => true]);
        $this->newQuery()->where('id', '<>', $this->id)->update(['active' => false]);
    }

    public function beforeUpdate()
    {
        if ($this->isDirty('active')) {
            $this->makePrimary();
        }
    }

    public $attachMany = [
        'img_logo' => ['System\Models\File', 'order' => 'sort_order', 'delete' => true],
        'favicon' => ['System\Models\File', 'order' => 'sort_order', 'delete' => true],
        'og_image' => ['System\Models\File', 'order' => 'sort_order', 'delete' => true],
        'bgc_custom_images' => ['System\Models\File', 'order' => 'sort_order', 'delete' => true],
    ];


}
