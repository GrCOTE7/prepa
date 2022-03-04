<?php namespace Zen\Octolanding\Components;

use Cms\Classes\ComponentBase;
use Zen\Octolanding\Models\Post;


class Posts extends ComponentBase
{
    public function componentDetails()
    {
        return [
            'name'        => 'Записи блога',
            'description' => 'Выводит записи блога'
        ];
    }

    public function defineProperties()
    {
        return [
            'Sorting' => [
                'title'       => 'Сортировка',
                'description' => 'Порядок вывода',
                'type'        => 'dropdown',
                'default'     => 'сначало новые',
                'options'     => ['DESC'=>'сначало новые', 'ASC'=>'сначало старые'],

            ],
            'Paginate' => [
                'title'       => 'Кол-во на странице',
                'description' => 'Количество вопросов на странице',
                'type'              => 'string',
                'validationPattern' => '^[0-9]+$',
                'validationMessage' => 'Введите число',
                'default'           => '10',
            ],


        ];
    }

    public function onRun() {

        $this->page['posts'] = Post::where('active', '1')->orderBy('date', $this->property('Sorting'))->paginate($this->property('Paginate'));

        /*
				*** Вывод конкретных элементов
        */

        $slug = $this->param('?');

        if($slug == '*') {
            $slug = null;
        } else {
            $this->page['slug'] = '/'.$slug;
            $urlArr = explode('/', $slug);

            $urlCount = count($urlArr);

            $parent_cat_id = null;
            for($i=0;$i<$urlCount;$i++){
                if(!$parent_cat_id){
                    return $this->getCard($slug);
                }

            }

        }

    }

    public function getCard($slug)
    {
        $card = Post::where('active',1)->where('slug', $slug)->first();
        if(!$card) return $this->controller->run('404');

        $this->urlChain .= $card->slug;

        $this->page['post'] = $card;

        # Seo tags
        $this->page['blogTitle'] = $card->seo_title ?: $card->name;
        $this->page['blogDescription'] = $card->seo_description;
        $this->page['blogKeywords'] = $card->seo_keywords;

    }
}
