<?php namespace Zen\Octolanding\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableCreateZenOctolandingSettings extends Migration
{
    public function up()
    {
        Schema::create('zen_octolanding_settings', function($table)
        {
            $table->engine = 'InnoDB';
            $table->increments('id')->unsigned();
            $table->boolean('active')->nullable();
            $table->string('name');
            $table->timestamp('created_at')->nullable();
            $table->timestamp('updated_at')->nullable();
            $table->text('emails')->nullable();
            $table->boolean('s_admin_send')->nullable()->default(1);
            $table->string('site_name');
            $table->boolean('footer_small')->nullable()->default(1);
            $table->dateTime('footer_date_end')->nullable();
            $table->boolean('footer_date')->default(1);
            $table->dateTime('footer_date_start')->nullable();
            $table->boolean('footer_date_custom')->nullable();
            $table->text('footer_text_rights')->nullable();
            $table->boolean('footer_small_logo')->nullable()->default(0);
            $table->boolean('svg_logo')->nullable()->default(0);
            $table->text('svg_logo_code')->nullable();
            $table->string('og_site_name')->nullable()->default('octolanding');
            $table->string('og_title')->nullable()->default('Landing for OctoberCMS');
            $table->string('og_type')->nullable()->default('website');
            $table->string('og_url')->nullable()->default('https://octobercms.com');
            $table->string('color_main');
            $table->string('text_background');
            $table->boolean('contact_mail_active')->default(1);
            $table->string('contact_mail')->nullable();
            $table->boolean('contact_phone_active')->default(1);
            $table->string('contact_phone')->nullable();
            $table->boolean('bgc_custom')->nullable();
            $table->boolean('bgc_custom_image')->nullable();
            $table->string('bgc_custom_color')->nullable();
            $table->text('bgc_custom_images_options')->nullable();
            $table->string('seo_title')->nullable()->default('Landing for OctoberCMS');
            $table->text('seo_descriptions')->nullable();
            $table->text('seo_keywords')->nullable();
            $table->boolean('logo_filter')->nullable()->default(1);
            $table->integer('header_id')->default(1);
            $table->boolean('column_contact')->nullable();
        });

        \DB::table('zen_octolanding_settings')->insert([
			[
				'active' => '1',
				'name' => 'Default settings',
				'site_name' => 'Octolanding',
				'color_main' => '#aa0000',
				'text_background' => '#fff',
				'contact_mail_active' => '1',
				'contact_mail' => 'team@october-studio.ru',
				'contact_phone_active' => '1',
				'contact_phone' => '+7 937 811 00 87',
				's_admin_send' => '1',
				'created_at' => date('Y-m-d H:i:s'),
                'header_id' => '1',
				'emails' => '[{"email":"darkrogua@gmail.com"}]',
			]
        ]);
    }
    
    public function down()
    {
        Schema::dropIfExists('zen_octolanding_settings');
    }
}
