<?php namespace Webident\Builder;

use System\Classes\PluginBase;
use Backend;

/**
 * Builder Plugin Information File
 */
class Plugin extends PluginBase
{

    /**
     * @var array Plugin dependencies
     */
    public $require = [
        'RainLab.Builder',
        // 'RainLab.Translate',
    ];

    public function pluginDetails()
    {
        return [
            'name' => 'webident.builder::lang.plugin.name',
            'description' => 'webident.builder::lang.plugin.description',
            'author' => 'Webident',
            'icon' => 'icon-leaf',
        ];
    }

    public function registerComponents()
    {
        return [
            'Webident\Builder\Components\RecordDetailsExtended' => 'recordDetailsExtended',
        ];
    }

}
