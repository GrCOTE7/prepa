<?php namespace {namespace};

use Model;

/**
 * Model
 */
class {classname} extends Model
{
    use \Winter\Storm\Database\Traits\Validation;
    {dynamicContents}

    /**
     * @var string The database table used by the model.
     */
    public $table = '{table}';

    /**
     * @var array Validation rules
     */
    public $rules = [
    ];
}
