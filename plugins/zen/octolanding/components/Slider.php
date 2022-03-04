<?php namespace Zen\Octolanding\Components;

use Cms\Classes\ComponentBase;
use Zen\Octolanding\Models\Slider as SliderModel;
use Zen\Octolanding\Models\Slide;


class Slider extends ComponentBase
{
    public function componentDetails()
    {
        return [
            'name' => 'zen.octolanding::lang.slider.component.name',
            'description' => 'zen.octolanding::lang.slider.component.description'
        ];
    }

    public function defineProperties()
    {
        return [
            'slider' => [
                'title' => 'zen.octolanding::lang.slider.component.properties.name',
                'description' => 'zen.octolanding::lang.slider.component.properties.description',
                'type' => 'dropdown',
            ],
            'jquery' => [
                'title' => 'zen.octolanding::lang.slider.component.properties.include.jquery',
                'type' => 'checkbox',
                'default' => '0',
            ],
            'carousel' => [
                'title' => 'zen.octolanding::lang.slider.component.properties.include.carousel',
                'type' => 'checkbox',
                'default' => '0',
            ],
            'twigName' => [
                'title' => 'zen.octolanding::lang.slider.component.properties.twigname',
                'type' => 'string',
                'default' => 'sliders_m',
            ],
        ];
    }

    public function getSliderOptions()
    {
        return SliderModel::lists('name', 'id');
    }

    public function onRun()
    {

        if ($this->property('jquery')) {
            $this->addJs('/plugins/zen/octolanding/assets/js/jquery.min.js');
        }

        if ($this->property('carousel')) {
            $this->addCss('/plugins/zen/octolanding/assets/css/owl.carousel.min.css');
            $this->addCss('/plugins/zen/octolanding/assets/css/owl.theme.default.css');
            $this->addJs('/plugins/zen/octolanding/assets/js/owl.carousel.min.js');
        }

        $this->addCss('/plugins/zen/octolanding/assets/css/owlslider.css');


        $slider_id = $this->property('slider');
        $this->page[$this->property('twigName')] = Slide::where('slider_id', $slider_id)
            ->orderBy('sort_order')
            ->get();
    }
}
