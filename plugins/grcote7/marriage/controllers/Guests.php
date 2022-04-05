<?php namespace Grcote7\Marriage\Controllers;

use Backend\Classes\Controller;
use BackendMenu;

class Guests extends Controller
{
    public $implement = [        'Backend\Behaviors\ListController'    ];
    
    public $listConfig = 'config_list.yaml';

    public function __construct()
    {
        parent::__construct();
        BackendMenu::setContext('Grcote7.Marriage', 'main-menu-item', 'side-menu-item');
    }
}
