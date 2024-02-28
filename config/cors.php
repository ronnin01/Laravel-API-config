<?php

/**
 * THIS CORS CONFIGURATION IS BASED ON HOW MANY STAGED YOUR DEVELOPMENT IS.
 *  - local
 *  - development
 *  - production
 * YOU CAN SPECIFY YOUR CONFIGURATION IN .env
 */

# EMPTY ORIGIN
$allowed_origins = [];

# CHECK ENV APP_ENV
switch(env("APP_ENV")) {
    # SPECIFY YOUR ORIGINS HERE
    case "local":
        $allowed_origins = [
            'http://localhost:3001'
        ];
        break;
    case "development":
        $allowed_origins = [
            'http://localhost:3002'
        ];
        break;
    case "production":
        $allowed_origins = [
            'http://localhost:3003'
        ];
        break;
    default:
        $allowed_origins = [];
        break;
}

return [

    /*
    |--------------------------------------------------------------------------
    | Cross-Origin Resource Sharing (CORS) Configuration
    |--------------------------------------------------------------------------
    |
    | Here you may configure your settings for cross-origin resource sharing
    | or "CORS". This determines what cross-origin operations may execute
    | in web browsers. You are free to adjust these settings as needed.
    |
    | To learn more: https://developer.mozilla.org/en-US/docs/Web/HTTP/CORS
    |
    */

    'paths' => ['api/*', 'sanctum/csrf-cookie'],

    'allowed_methods' => ['*'],

    'allowed_origins' => $allowed_origins,

    'allowed_origins_patterns' => [],

    'allowed_headers' => ['*'],

    'exposed_headers' => false,

    'max_age' => 0,

    'supports_credentials' => true,

];
