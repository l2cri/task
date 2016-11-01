<?php

/**
 * Created by PhpStorm.
 * User: User
 * Date: 01.11.2016
 * Time: 18:53
 */

namespace L2cri\Url;

class Parser
{
    protected $url;
    protected $content = '';

    public function __construct($url = null)
    {
        if($url){
            $this->url = $url;
        }
    }

    /**
     * Set url for parsing
     * @param string $url site address
     */
    public function setUrl($url)
    {
        $this->url = $url;
    }

    /**
     * Get content from site
     * @param int $timeout connect time
     * @return string content site
     */
    public function setContent($timeout = 10)
    {
        try {
            $content = $this->connect($timeout);
        }
        catch (myException $e) {
            die ('Error: '.$e->getMessage());
        }

        $this->content = $content;

        return $content;
    }

    /**
     * Get old result without new request
     * @return string site content
     */
    public function getContent(){
        return $this->content;
    }

    /**
     * Link with site
     * @param int $timeout connect time 0 - without limit
     * @return string site content
     * @throws myException checkError validate
     */
    private function connect($timeout = 0)
    {
        $ch = curl_init();

        curl_setopt_array($ch,[
            CURLOPT_URL => $this->url,
            CURLOPT_RETURNTRANSFER => 1,
            CURLOPT_CONNECTTIMEOUT => $timeout,
            CURLOPT_TIMEOUT => $timeout,
            CURLOPT_FOLLOWLOCATION => 1,
            CURLOPT_MAXREDIRS => 3
        ]);

        $html = curl_exec($ch);
        $code = curl_getinfo($ch,CURLINFO_HTTP_CODE);

        $msgError = $this->checkError($ch,$html,$code,$this->url);

        if($msgError )
        {
          curl_close($ch);
          throw new myException($msgError);
        }

        curl_close($ch);

        return $html;
    }

    /**
     * Validate curl result
     * @param $curl
     * @param $html
     * @param $code
     * @param string $url
     * @return string message error
     */
    private function checkError($curl,$html,$code,$url = ''){
        $errorNo = curl_errno($curl);

        if(empty($url)) return 'Please check url parameter';

        if($errorNo == CURLE_OPERATION_TIMEDOUT) return 'Timeout for result';

        if($errorNo) return sprintf('Can\'t load data by url: %s',$url);

        if( empty($html)) return 'Empty data on url';

        if( !in_array($code, array(200,301))) return  sprintf('Result return with code %s',$code);
    }

    /**
     * Find and change key to value
     * @param array $change array mapping
     * @return string changed content
     */
    public function changeByArray(array $change)
    {
        $key = array_keys($change);
        $values = array_values($change);

        while(true){
            $content = $this->content;

            $new_content = str_replace($key,$values,$content);

            if ($this->content === $new_content) break;

            $this->content = $new_content;
        }



        return $new_content;
    }

    /**
     * @param string $word search word
     * @param string $replace to replace
     * @return string changed content
     */
    public function changeByWord($word, $replace)
    {
        $content = $this->content;

        $new_content = str_replace($word,$replace,$content);
        $this->content = $new_content;

        return $new_content;
    }

}
