<!doctype html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>System Admin</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="apple-touch-icon" href="{{ asset('apple-touch-icon.png') }}">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <link rel="stylesheet" href="{{ asset('css/style.css') }}">
    <link rel="stylesheet" href="{{ asset('css/admin.css') }}">
    <link rel="stylesheet" href="{{ asset('https://use.fontawesome.com/releases/v5.7.2/css/all.css') }}" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
<style lang="">
    /*========= 9.Log in =======*/
._login {
    overflow: auto;
    min-height: 100vh;
    padding-bottom: 45px;
}
._login_main {
    background: #fff;
    box-shadow: 2px 5px 43px rgba(188, 207, 219, 0.65);
    margin-top: 100px;
    padding: 0;
    border-radius: 3px;
}
._login_header {
    border-radius: 3px 3px 0 0;
    padding: 23px 0;
}
._login_header_title {
    color: #fff;
    font-weight: 600;
    font-size: 14px;
}
._login_form {
    padding: 51px 41px 36px;
}
._login_input_group {
    margin-bottom: 37px;
}
/* ._login_input i {
    font-size: 12px;
    color: #838386;
    margin-right: 21px;
    margin-top: 3px;
    width: 13px;
} */
._login_input {
    display: flex;
    align-items: center;
}
._login_input_inp {
    flex: 1 1;
}
._login_input_inp_field:focus{
	border-bottom: 1px solid #10a2ef;
}
._login_input_inp_field {
    border: none;
    border-bottom: 1px solid #d4d4d4;
    transition: .3s all ease;
    font-size: 13px;
    padding: 2px 4px 4px 0;
    width: 100%;
    transition: .3s all ease;
}
._login_input_button {
    text-align: center;
}
._login_input_button_btn {
    font-size: 12px;
    letter-spacing: 1px;
    font-weight: 600;
    padding: 7px 34px;
    border-radius: 31px;
}
.forget:hover{
	text-decoration: underline;
}
.forget {
    font-size: 13px;
    cursor: pointer;
    color: #10a2ef;
    margin-top: 8px;
    text-align: right;
    display: inline-block;
}
._other_signin {
    margin-top: 26px;
}
._other_signin_ul{
	text-align: right;
}
._other_signin_ul li i {
    font-size: 12px;
}
._other_signin_ul li {
    display: inline-block;
    padding-left: 11px;
    cursor: pointer;
}
._linkedin{}
._linkedin i {
    color: #10a2ef;
}
._facebook{}
._facebook i {
    color: blue;
}
._twitter{}
._twitter i {
    color: red;
}
._or_sign {
    font-size: 12px;
    font-weight: 600;
    margin-right: 16px;
    cursor: inherit !important;
}
._forgrt_div{
	text-align: right;
}
/*========= 9.Log in =======*/

</style>
<body>

    <div id="app">
        <adminmain></adminmain>
    </div>
    <script>
        (function () {
               window.Laravel = {
                   csrfToken: '{{ csrf_token() }}'
               };
               @if(Auth::check())
                 window.authUser={!! Auth::user() !!}
                 @else
                   window.authUser=false
                 @endif
           })();
       </script>
</body>

<script src="/js/adminapp.js"></script>

</html> 