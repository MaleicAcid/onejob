<?php

 function get_contents($url){
    $ch = curl_init();
    curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, FALSE);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, TRUE);
    curl_setopt($ch, CURLOPT_URL, $url);
    $response =  curl_exec($ch);
    curl_close($ch);

    //-------请求为空
    if(empty($response)){
        exit("50001");
    }

    return $response;
}
function check_third_session($third_session)
{
    $data = S($third_session);
    if($data['unionid'] ) {
        return $data;
    }else{
        return $data;
    }
}

