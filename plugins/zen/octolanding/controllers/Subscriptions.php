<?php namespace Zen\Octolanding\Controllers;

use Backend\Classes\Controller;
use BackendMenu;
use App;
use Validator;
use Session;
use Zen\Octolanding\Models\Subscription;
use Input;
use Lang;
use Mail;
use Zen\Octolanding\Models\Setting;

class Subscriptions extends Controller
{
    public $implement = [        'Backend\Behaviors\ListController',        'Backend\Behaviors\FormController'    ];
    
    public $listConfig = 'config_list.yaml';
    public $formConfig = 'config_form.yaml';

    public function __construct()
    {
        parent::__construct();
        BackendMenu::setContext('Zen.Octolanding', 'main-menu-item', 'side-menu-item6');
    }


    public static function onSend()
    {

        $data = Input::all();
        $setting = Setting::where('active',1)->first();

        $name = trim($data['name']);
        $phone = trim($data['phone']);

        $return = [
            'messages' => [],
            'badfields' => [
                'name'=>false,
                'phone'=>false,
            ]
        ];

        $locale = App::getLocale();
        App::setLocale($locale);

        /* Validation */
        $validator = Validator::make(
            [
                Lang::get('zen.octolanding::lang.form.field.name') => $name,
                Lang::get('zen.octolanding::lang.form.field.phone') => $phone,
            ],
            [
                Lang::get('zen.octolanding::lang.form.field.name') => 'required|min:3|max:100',
                Lang::get('zen.octolanding::lang.form.field.phone') => 'required|min:6|max:25',
            ]
        );

        if ($validator->fails())
        {
            $messages = $validator->messages();

            if ($messages->has(Lang::get('zen.octolanding::lang.form.field.name'))) {
                $return['messages'][] = $messages->first(Lang::get('zen.octolanding::lang.form.field.name'));
                $return['badfields']['name'] = true;
            }

            if ($messages->has(Lang::get('zen.octolanding::lang.form.field.phone'))) {
                $return['messages'][] = $messages->first(Lang::get('zen.octolanding::lang.form.field.phone'));
                $return['badfields']['phone'] = true;
            }

        }

        /* CHECK REPEAT TIME */
        $repiatTime = 10;
        if( Session::get('repeat')!="" && time() < Session::get('repeat') )
        {
            $timeDiff = Session::get('repeat') - time();
            $return['messages'][] = Lang::get('zen.octolanding::lang.form.messages.repeat').' '.$timeDiff.' '
                .Lang::get('zen.octolanding::lang.form.messages.second');
        }

        if($return['messages']) return json_encode ($return, JSON_UNESCAPED_UNICODE);

        Session::put('repeat', time() + $repiatTime);

        /* SAVE */
        $record = new Subscription;
        $record->name = $name;
        $record->active = 0;
        $record->phone = $phone;
        $record->save();

        $return['sended'] = Lang::get('zen.octolanding::lang.form.messages.sended');


        $vars = ['form' => $record,'setting' => $setting];

        $message_send = Subscriptions::sendMail($setting, $vars);

        return json_encode($return, JSON_UNESCAPED_UNICODE);
    }

    public static function sendMail($settings,$vars)
    {

        $admin_send = $admin_template = $admin_emails = $message = null;

        $admin_template = 'zen.octolanding::mail.admin.form_send';

        if ($settings->s_admin_send) {
            $admin_send = true;
            if(count($settings->emails) > 0) $admin_emails = $settings->emails;
        }

        $message = 'zen.octolanding::lang.form.messages.sended';

        if ($admin_send and $admin_emails != null) {
            Mail::send($admin_template, $vars, function($message) use ($settings, $admin_emails)
            {

                $message->from('noreply@'.$_SERVER['HTTP_HOST'], $settings->site_name);
                foreach ($admin_emails as $mail) {
                    $message->to($mail['email']);
                }
            });
        }

        return  Lang::get($message);

    }
}
