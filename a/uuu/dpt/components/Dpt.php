<?php namespace GrCOTE7\Dpt\Components;

use ApplicationException;
use Cms\Classes\ComponentBase;

class Dpt extends ComponentBase {

    public function componentDetails() {

        return [
            'name'        => 'Dpt Name',
            'description' => 'Give the name of a department.'
        ];
    }


    public function defineProperties() {

        return [
        ];
    }


    public function onAffItem() {

        $items               = [
            'Pomme',
            'Pêche',
            'Poire'
        ];
        $this->page['items'] = $items;
    }


    public function onGetName() {

        //        info('ok');
        //        return 'ok';
        $dpt = post('dpt') - 1;
        //        info($dpt);
        if (!isset($dpt)) $dpt = 1;
        $dptNames          = [
            'Ain',
            'Aisne',
            'Allier'
        ];
        $this->page['dpt'] = $dptNames[$dpt];
        //        info(' - Num: ' . $dpt . ' - Dpt ' . $dptNames[$dpt]);
    }
}
