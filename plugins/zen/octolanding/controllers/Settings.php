<?php namespace Zen\Octolanding\Controllers;

use Backend\Classes\Controller;
use BackendMenu;

class Settings extends Controller
{
    public $implement = [        'Backend\Behaviors\ListController',        'Backend\Behaviors\FormController',        'Backend\Behaviors\ReorderController'    ];
    
    public $listConfig = 'config_list.yaml';
    public $formConfig = 'config_form.yaml';
    public $reorderConfig = 'config_reorder.yaml';

    public function __construct()
    {
        parent::__construct();
        BackendMenu::setContext('Zen.Octolanding', 'main-menu-item', 'side-menu-item3');
    }

    public function onCheck($value, $key, $name_field, $switch=null) {
        if($value != null and $value != 0) {
            if(array_key_exists($key, $value)) {
                if(array_key_exists('value', $value[$key])) {

                    if($value[$key]['value'] == $name_field ) {
                        if($switch == null) {
                            echo "checked='checked'";
                        } else {
                            if(array_key_exists('required', $value[$key])) {
                                if($value[$key]['required'] == 1) echo "checked='checked'";
                            }

                        }

                    }
                }
            }
        }
    }
}
