var elixir = require('laravel-elixir');
require('laravel-elixir-livereload');

elixir.config.assetsPath = 'assets/';
elixir.config.publicPath = '/assets/compiled/';

elixir(function (mix) {

    mix.sass('menu.scss');

    mix.scripts([
       'app.js'
    ]);

    mix.livereload([
        'sass/*.scss',
        '**/*.html',
        '**/*.php'
    ]);

});
