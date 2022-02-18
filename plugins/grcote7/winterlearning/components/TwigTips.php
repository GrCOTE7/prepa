<?php namespace GrCote7\WinterLearning\Components;

use Cms\Classes\ComponentBase;

class TwigTips extends ComponentBase
{
    public function componentDetails()
    {
        return [
            'name'        => 'TwigTips Component',
            'description' => 'Some tips for Twig'
        ];
    }

    public function defineProperties()
    {
        return [];
    }
}
