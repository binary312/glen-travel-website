<?php

function db_connect() {
	$db_connection = mysql_connect(DB_HOST, DB_USER, DB_PWD);
	if (!$db_connection) {
		die('Could not connect: ' . mysql_error());
	}
	
	$db_selected = mysql_select_db(DB_NAME);
	if (!$db_selected) {
		die('Error on connect the db.' . mysql_error());
	}

	return $db_connection;
}

function db_close() {
	mysql_close();
}

function validate_exist($uuid) {
	// validate if the uuid exists
  $result = mysql_query("SELECT id FROM users WHERE uuid='$uuid'");
  if (mysql_num_rows($result) == 0) return false;
  return true;
}

function validate_exist_by_id($id) {
	// validate if the uuid exists
  $result = mysql_query("SELECT id FROM users WHERE id=$id");
  if (mysql_num_rows($result) == 0) return false;
  return true;
}

function validate_login($uuid, $pwd) {
	// validate if the uuid and password
  $result = mysql_query("SELECT id FROM users WHERE uuid='$uuid' && pwd='$pwd'");
  if (mysql_num_rows($result) == 0) return false;
  while ($row = mysql_fetch_array($result, MYSQL_ASSOC)) {
  	return $row['id'];
  }
}

function insert_user_info($uuid,$pwd,$token,$name,$email,$phone,$gender,$country,$region,$avatar,$date) {
	// insert user
	mysql_query("INSERT INTO users (uuid,pwd,token,name,email,phone,gender,country,region,avatar,date) VALUES ('$uuid','$pwd','$token','$name','$email','$phone','$gender','$country','$region','$avatar','$date')");
  return mysql_insert_id();
}

function query_user_info($id) {
	// query user
	$result = mysql_query("SELECT id,uuid,pwd,token,name,email,phone,gender,country,region,avatar FROM users WHERE id=$id");
  while ($row = mysql_fetch_array($result, MYSQL_ASSOC)) {
    return $row;
	}
}

function get_contacts($id,$device_contacts_phone,$device_contacts_email) {
	$contacts = array();
  // TODO: select * from users where phone in ($device_contacts_phone) or email in ($device_contacts_email)
	$result = mysql_query("SELECT id,uuid,name,email,phone,gender,country,region,avatar FROM users WHERE id<>$id LIMIT 3");
  while ($row = mysql_fetch_array($result, MYSQL_ASSOC)) {
    $contacts[] = $row;
	}
  return $contacts;
}