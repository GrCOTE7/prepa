<?php namespace Webident\Builder\Components;

use RainLab\Builder\Components\RecordDetails;
use Event;

class RecordDetailsExtended extends RecordDetails
{

    public function init()
    {
        Event::listen('translate.localePicker.translateParams', function ($page, $params, $oldLocale, $newLocale) {
            $newParams = $params;

            if (isset($params['slug']))
            {
                $modelClassName = $this->property('modelClass');
                $model = new $modelClassName();

                $records = $model::transWhere('slug', $params['slug'], $oldLocale)->first();
                if ($records)
                {
                    $records->translateContext($newLocale);
                    $newParams['slug'] = $records['slug'];
                }
            }

            return $newParams;
        });
    }

    protected function loadRecord()
    {
        if (!strlen($this->identifierValue)) 
        {
            return;
        }

        $modelClassName = $this->property('modelClass');
        if (!strlen($modelClassName) || !class_exists($modelClassName)) 
        {
            throw new SystemException('Invalid model class name');
        }

        $model = new $modelClassName();
        // return $model->where($this->modelKeyColumn, '=', $this->identifierValue)->first();
        return $model->transWhere($this->modelKeyColumn, $this->identifierValue)->first();
    }
}
