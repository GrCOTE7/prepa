<?php namespace Winter\Debugbar\Classes;

use Illuminate\Contracts\Http\Kernel;
use Barryvdh\Debugbar\ServiceProvider as BaseServiceProvider;

use Winter\Debugbar\Middleware\InjectDebugbar;

class ServiceProvider extends BaseServiceProvider
{
    /**
     * Register the Debugbar Middleware
     *
     * @param  string $middleware
     */
    protected function registerMiddleware($middleware)
    {
        $kernel = $this->app[Kernel::class];
        $kernel->pushMiddleware(InjectDebugbar::class);
    }
}