<?php

declare(strict_types=1);

namespace Modules\Analytics\Config;

use CodeIgniter\Config\BaseConfig;

class Analytics extends BaseConfig
{
    /**
     * Gateway to analytic routes. By default, all analytics routes will be under `/analytics` path
     */
    public string $gateway = 'analytics';

    /**
     * --------------------------------------------------------------------
     * Route filters options
     * --------------------------------------------------------------------
     * @var array<string, string>
     */
    public array $routeFilters = [
        'analytics-full-data'     => 'permission:podcast$1.view',
        'analytics-data'          => 'permission:podcast$1.view',
        'analytics-filtered-data' => 'permission:podcast$1.view',
    ];
}
