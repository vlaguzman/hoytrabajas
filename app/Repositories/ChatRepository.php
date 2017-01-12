<?php

namespace App\Repositories;

use App\Models\Chat;
use InfyOm\Generator\Common\BaseRepository;

class ChatRepository extends BaseRepository
{
    /**
     * @var array
     */
    protected $fieldSearchable = [
        'name',
        'lasttest',
        'ago',
        'face',
        'user_id'
    ];

    /**
     * Configure the Model
     **/
    public function model()
    {
        return Chat::class;
    }
}
