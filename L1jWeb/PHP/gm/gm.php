<?
require("../setup.php");
$code=$_POST[code];
$id=$_COOKIE["linsfuserid"];
$e_pass=$_COOKIE["linsfuserpass"];
$err_count=0;
$msg="";
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
$str="select count(*) from accounts where login='$id' and password='$e_pass' and access_level='200'";
$chk_id=$db->get_var($str);
if($chk_id==0){
	$err_count++;
	$msg=$msg."帳號密碼錯誤<br>";
}

$str="select count(*) from accounts where login='$id' and banned='1'"; 
$chk_lock=$db->get_var($str);
if($chk_lock==1){
	$err_count++;
	$msg=$msg."帳號鎖定中<br>";
}

$str="select count(*) from zwls_code where code='$code' and account='$id'";
$chk_code=$db->get_var($str);
if($chk_code==0){
	$err_count++;
	$msg=$msg."異常錯誤(非法執行)<br>";
}

if($open_gm!="1"){
	$err_count++;
	$msg=$msg."本系統尚未開放<br>";
}

$str="select count(*) from characters where account_name='$id'";
$chk_char=$db->get_var($str);
if($chk_char==0){
	$err_count++;
	$msg="無角色資料";
}

if($err_count==0){
	$a=1;

	$code="";
	$codestr='ABCDEFGHIJKLMNOPQRSTUVWXYZ';
	for($i=0;$i<10;$i++){
		$code.=$codestr[rand(0, 25)];
	}
	$str="Delete from zwls_code where account='$id'";
	$db->query($str);
	$str="insert into `zwls_code` (`account` , `code` , `time` , `ip`) values ('$id','$code','$time','$ip')";
	$db->query($str);

	mysql_select_db($sql_dbname, $login_on);
	$straa=sprintf("SELECT * FROM characters WHERE `account_name` LIKE '$id' ORDER BY `objid` ASC");
	$strab=mysql_query($straa, $login_on) or die(mysql_error());
	$strac=mysql_fetch_assoc($strab);
}
?>
<table border=0 cellpadding=1 cellspacing=1 bgcolor=ffffff width="80%">
<?if($err_count==0){?>
	<tr>
		<td width="100%" bgcolor=#303030 colspan="8"><div align="center"><font size=2 color=red>管理專區</font></div></td>
	</tr>
	<tr>
		<td width="%" bgcolor=#202020><div align="center" class="style7">NO.</div></td>
		<td width="%" bgcolor=#202020><div align="center" class="style7">帳號</div></td>
		<td width="%" bgcolor=#202020><div align="center" class="style7">暱稱</div></td>
		<td width="%" bgcolor=#202020><div align="center" class="style7">等級</div></td>
		<td width="%" bgcolor=#202020><div align="center" class="style7">職業</div></td>
		<td width="%" bgcolor=#202020><div align="center" class="style7">身分</div></td>
		<td width="%" bgcolor=#202020><div align="center" class="style7">狀態</div></td>
		<td width="%" bgcolor=#202020><div align="center" class="style7">操作</div></td>
	</tr>
<?do{?>
<form method="post" action="gm_save.php" name="form1" onsubmit="B<?=$a?>.disabled=1">
<input type="hidden" name="code" value="<?=$code?>">
<input type="hidden" name="objid" value="<?=$strac['objid']?>">
	<tr>
		<td bgcolor=#101010><div align="center" class="style7"><?=$a?></div></td>
		<td bgcolor=#101010><div align="center" class="style7"><?=$id?></div></td>
		<td bgcolor=#101010><div align="center" class="style7"><?=$strac['char_name']?></div></td>
		<td bgcolor=#101010><div align="center" class="style7"><?=$strac['level']?></div></td>
		<td bgcolor=#101010><div align="center" class="style7"><?
if($strac['Type'] == "0") echo "王族";
if($strac['Type'] == "1") echo "騎士";
if($strac['Type'] == "2") echo "妖精";
if($strac['Type'] == "3") echo "法師";
if($strac['Type'] == "4") echo "黑妖";
if($strac['Type'] == "5") echo "龍騎";
if($strac['Type'] == "6") echo "幻術";
?></div></td>
		<td bgcolor=#101010><div align="center" class="style7"><?
if($strac['AccessLevel'] == "200") echo "遊戲管理員";
else echo "一般玩家";
?></div></td>
		<td bgcolor=#101010><div align="center" class="style7"><?
if($strac['OnlineStatus'] == "1") echo "線上";
else echo "離線";
?></div></td>
		<td bgcolor=#101010><div align="center" class="style7"><input type="submit" value="修改" name="B<?=$a?>" style="width: 50px; color: #ffffff; background-color: #191919; border:1 solid #ffffff"></div></td>
	</tr>
</form>
<?
$a++;
}while($strac=mysql_fetch_assoc($strab));
?>
	<tr>
		<td width="100%" bgcolor=#101010 colspan="8"><a href="rerepays_list.php"><font color=red>線上回應處理中心</font></a></div></td>
	</tr>
	<tr>
		<td width="100%" bgcolor=#101010 colspan="8"><a href="newannounce.php"><font color=red>公告申請區</font></a></div></td>
	</tr>
	<tr>
		<td width="100%" bgcolor=#101010 colspan="8"><a href="newevent.php"><font color=red>活動申請區</font></a></div></td>
	</tr>
	<tr>
		<td width="100%" bgcolor=#101010 colspan="8"><a href="eventitemcard.php"><font color=red>活動物品獎勵申請區</font></a></div></td>
	</tr>
<?}else{?>
	<tr>
		<td width="100%" bgcolor=#303030><div align="center"><font size=2 color=red>系統訊息</font></div></td>
	</tr>
	<tr>
		<td width="100%" bgcolor=#202020><div align="left"><?=$msg?></div></td>
	</tr>
<?}?>
</table>
</center>
</body>
</html>