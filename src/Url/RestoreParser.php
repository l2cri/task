<?php
/**
 * Created by PhpStorm.
 * User: User
 * Date: 01.11.2016
 * Time: 23:39
 */

namespace L2cri\Url;


class RestoreParser extends Parser
{

    public function __construct($url, $oldContent = null)
    {
        parent::__construct($url);

        if($oldContent){
            $this->content = $oldContent;
        }
    }

    public function changeByArray(array $change)
    {
        $return =  array_reverse(array_flip($change));

        return parent::changeByArray($return);
    }

    public function changeByWord($word, $replace)
    {
        return parent::changeByWord($replace,$word);
    }
}