<?php
  // page title
  $page_title = get_page_title($page);
  
  // meta keywords
  $page_meta_keywords = get_page_meta_keywords($page);
  
  // meta description
  $page_meta_description = get_page_meta_description($page);
?>

<!DOCTYPE html>
<html>
<head>
  <meta content="text/html; charset=UTF-8" http-equiv="content-type">
  <meta name="keywords" content="<?php echo $page_meta_keywords; ?>">
  <meta name="description" content="<?php echo $page_meta_description; ?>">
  <title>爱旅行<?php if ($page_title) { echo ' | ' . $page_title; } ?></title>
  <link rel="stylesheet" href="view/css/theme1.css">
</head>
<body>
  <div class="page-header">
    <p>header</p>
  </div>
  <div class="page-content">
    <div class="page-content-<?php echo $page; ?>">