<?php

function get_page_info_by_type($type, $page) {
	$content = file_get_contents('config/page_vs_' . $type . '.txt');
  $rows = explode(PHP_EOL, $content);
  $info = array();
  foreach ($rows as $row) {
    $cols = explode('=', $row);
    $info[$cols[0]] = $cols[1];
  }
  if (isset($info[$page])) {
    return $info[$page];
  }
  if (isset($info['[default]'])) {
    return $info['[default]'];
  }
  return '';
}

function get_page_title($page) {
  return get_page_info_by_type('title', $page);
}

function get_page_meta_keywords($page) {
  return get_page_info_by_type('meta_keywords', $page);
}

function get_page_meta_description($page) {
	return get_page_info_by_type('meta_description', $page);
}