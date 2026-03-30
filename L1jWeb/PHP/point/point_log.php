<?
require("../setup.php");
$id=$_COOKIE["linsfuserid"];
$e_pass=$_COOKIE["linsfuserpass"];
$err_count=0;
$msg="";

$str="select count(*) from user_register where name='$id' and e_pass='$e_pass'";
$chk_id=$db->get_var($str);
if($chk_id==0){
	$err_count++;
	$msg=$msg."帳號密碼錯誤<br>";
}

$str="select count(*) from zwls_item_get_log where account='$id'";
$chk_log=$db->get_var($str);
if($chk_log==0){
	$err_count++;
	$msg=$msg."尚無紀錄<br>";
}

?>
<html>

<head>
<meta http-equiv="Content-Language" content="zh-tw">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title><?=$web_name?></title>
</head>

<body bgcolor="#000000" text="#FFFFFF" link="#FFFFFF" vlink="#FFFFFF" alink="#FFFFFF">
<?
include("../html/head.php");
?>
<table border=0 cellpadding=1 cellspacing=1 bgcolor=ffffff width="80%">
<?if($err_count==0){
	mysql_select_db($sql_dbname, $login_on);
?>
	<tr>
		<td width="100%" bgcolor=#303030 colspan="7"><div align="center"><font size=2 color=red>點數紀錄</font></div></td>
	</tr>
	<tr>
		<td width="10%" bgcolor=#202020><div align="center">序號</div></td>
		<td width="10%" bgcolor=#202020><div align="center">種類</div></td>
		<td width="32%" bgcolor=#202020><div align="center">名稱</div></td>
		<td width="8%" bgcolor=#202020><div align="center">數量</div></td>
		<td width="8%" bgcolor=#202020><div align="center">點數</div></td>
		<td width="12%" bgcolor=#202020><div align="center">來源</div></td>
		<td width="20%" bgcolor=#202020><div align="center">時間</div></td>
	</tr>
<?
	if($err_count1==0){
		$straa = sprintf("SELECT * FROM zwls_item_get_log WHERE `account` LIKE '$id' ORDER BY no DESC Limit 0,200");
		$strab = mysql_query($straa, $login_on) or die(mysql_error());
		$strac = mysql_fetch_assoc($strab);
		do {
?>
	<tr>
		<td bgcolor=#101010><div align="left"><?=$strac['no']?></div></td>
		<td bgcolor=#101010><div align="left"><?=$strac['itemtype']?></div></td>
		<td bgcolor=#101010><div align="left"><?=$strac['itemname']?></div></td>
		<td bgcolor=#101010><div align="left"><?=$strac['itemcount']?></div></td>
		<td bgcolor=#101010><div align="left"><?=$strac['point']?></div></td>
		<td bgcolor=#101010><div align="left"><?=$strac['logfrom']?></div></td>
		<td bgcolor=#101010><div align="left"><?=$strac['time']?></div></td>
	</tr>
<?
		}while($strac=mysql_fetch_assoc($strab));
	}
}else{
?>
	<tr>
		<td width="100%" bgcolor=#101010><div align="left"><?=$msg?></div></td>
	</tr>
<?
}
?>
</table>
</center>
</body>
</html>