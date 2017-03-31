<?php
/**
 * 公共函数
 */

function deal_referurl($referurl) {
//    $ret = explode('.',$referurl);
//    $ret = explode('/',$ret[0]);
    //有时有www,有时没有，导致分割后取第0个元素不正确

//    if (in_array("register",$ret)) {
//
//        return U('Home/User/index');
//    }
    return $referurl;

}


