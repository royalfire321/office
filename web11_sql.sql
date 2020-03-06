-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- 主機： 127.0.0.1
-- 產生時間： 2020-03-02 17:34:03
-- 伺服器版本： 10.4.11-MariaDB
-- PHP 版本： 7.3.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `web11`
--

-- --------------------------------------------------------

--
-- 資料表結構 `files`
--

CREATE TABLE `files` (
  `sn` smallint(5) UNSIGNED NOT NULL COMMENT 'files_sn',
  `kind` varchar(255) NOT NULL DEFAULT '' COMMENT '分類',
  `col_sn` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT '欄位編號',
  `sort` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT '排序',
  `file_kind` enum('img','file') NOT NULL DEFAULT 'img' COMMENT '上傳檔案種類',
  `file_name` varchar(255) NOT NULL DEFAULT '' COMMENT '上傳檔案名稱',
  `file_type` varchar(255) NOT NULL DEFAULT '' COMMENT '上傳檔案類型',
  `file_size` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '上傳檔案大小',
  `description` text DEFAULT NULL COMMENT '檔案說明',
  `counter` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '下載人次',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '檔案名稱',
  `download_name` varchar(255) NOT NULL DEFAULT '' COMMENT '下載檔案名稱',
  `sub_dir` varchar(255) NOT NULL DEFAULT '' COMMENT '檔案子路徑'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='上傳檔案資料表';

--
-- 傾印資料表的資料 `files`
--

INSERT INTO `files` (`sn`, `kind`, `col_sn`, `sort`, `file_kind`, `file_name`, `file_type`, `file_size`, `description`, `counter`, `name`, `download_name`, `sub_dir`) VALUES
(5, 'prod', 5, 1, 'img', '5FK0vwCE54_small.jpg', 'image/jpeg', 56898, NULL, 0, '68b50_5.jpg', '', '/prod'),
(2, 'prod', 4, 1, 'img', 'garrett-jackson-GU48qJ4p84o-unsplash.jpg', 'image/jpeg', 1765260, NULL, 0, '4cdaf_4.jpg', '', '/prod'),
(6, 'prod', 6, 1, 'img', 'Car02.jpg', 'image/jpeg', 166617, NULL, 0, '9ced1_6.jpg', '', '/prod'),
(10, 'mainSlide', 12, 1, 'img', '1561651029_341.jpg', 'image/jpeg', 928769, NULL, 0, '3a807_12.jpg', '', '/mainSlide'),
(8, 'mainSlide', 13, 1, 'img', '10113B2319.jpg', 'image/jpeg', 993803, NULL, 0, 'a83b2_13.jpg', '', '/mainSlide'),
(9, 'mainSlide', 14, 1, 'img', 'blur-blurry-character-163157.jpg', 'image/jpeg', 1764402, NULL, 0, 'e0c48_14.jpg', '', '/mainSlide'),
(11, 'mainSlide', 15, 1, 'img', 'kristopher-roller-zepnJQycr4U-unsplash.jpg', 'image/jpeg', 1395300, NULL, 0, 'b1c1d_15.jpg', '', '/mainSlide');

-- --------------------------------------------------------

--
-- 資料表結構 `kinds`
--

CREATE TABLE `kinds` (
  `sn` smallint(5) UNSIGNED NOT NULL COMMENT 'kinds_sn',
  `ofsn` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT '父類別',
  `kind` varchar(255) NOT NULL DEFAULT '' COMMENT '分類',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '標題',
  `sort` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT '排序',
  `enable` enum('1','0') NOT NULL DEFAULT '1' COMMENT '狀態',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '網址',
  `target` enum('1','0') NOT NULL DEFAULT '0' COMMENT '外連',
  `col_sn` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'col_sn',
  `content` text DEFAULT NULL COMMENT '內容'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='類別資料表';

--
-- 傾印資料表的資料 `kinds`
--

INSERT INTO `kinds` (`sn`, `ofsn`, `kind`, `title`, `sort`, `enable`, `url`, `target`, `col_sn`, `content`) VALUES
(1, 0, 'prod', '娃娃', 0, '1', '', '0', 0, NULL),
(4, 0, 'prod', '汽車', 0, '1', '', '0', 0, NULL),
(3, 0, 'prod', '星空', 2, '1', '', '0', 0, NULL),
(5, 0, 'mainMenu', 'About us', 1, '1', 'index.php#about', '0', 0, NULL),
(6, 0, 'mainMenu', 'Services', 2, '1', 'index.php#services', '0', 0, NULL),
(7, 0, 'mainMenu', 'Portfolio', 3, '1', 'index.php#portfolio', '0', 0, NULL),
(8, 0, 'mainMenu', 'Contact', 4, '1', 'index.php#contact', '0', 0, NULL),
(9, 0, 'mainMenu', '聯絡我們', 5, '1', 'index.php?op=contact_form', '0', 0, NULL),
(11, 0, 'supply', '555', 1, '1', '', '0', 0, NULL),
(12, 0, 'mainSlide', 'Start With us', 1, '0', '#', '0', 0, NULL),
(13, 0, 'mainSlide', 'With Amazing Space X', 2, '1', '#', '0', 0, NULL),
(14, 0, 'mainSlide', 'Lovely Idol', 3, '1', '#', '0', 0, NULL),
(15, 0, 'mainSlide', 'Join Us Now', 4, '1', '#', '0', 0, NULL);

-- --------------------------------------------------------

--
-- 資料表結構 `prods`
--

CREATE TABLE `prods` (
  `sn` int(10) UNSIGNED NOT NULL COMMENT 'prods_sn',
  `kind_sn` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT '分類',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '名稱',
  `content` text DEFAULT NULL COMMENT '內容',
  `price` int(10) UNSIGNED NOT NULL COMMENT '價格',
  `enable` enum('1','0') NOT NULL DEFAULT '1' COMMENT '狀態',
  `date` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '建立日期',
  `sort` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT '排序',
  `counter` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '人氣'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='商品資料表';

--
-- 傾印資料表的資料 `prods`
--

INSERT INTO `prods` (`sn`, `kind_sn`, `title`, `content`, `price`, `enable`, `date`, `sort`, `counter`) VALUES
(6, 4, '車子', '<p>tesla 4.0<img alt=\"smiley\" src=\"http://localhost/web11/class/ckeditor/plugins/smiley/images/regular_smile.png\" style=\"height:23px; width:23px\" title=\"smiley\" /></p>\r\n\r\n<p><img alt=\"台大公共衛生學院長詹長權   圖：擷取自國立臺灣大學公共衛生學院直播畫面\" src=\"https://s.yimg.com/ny/api/res/1.2/81jz9MtYQo4bmWU3OQd_tQ--~A/YXBwaWQ9aGlnaGxhbmRlcjtzbT0xO3c9ODAw/https://media.zenfs.com/zh-tw/newtalk.tw/5aa5b8faf9da01bb20cb439f1d770711\" /></p>\r\n\r\n<p>台大公共衛生學院長詹長權&nbsp;&nbsp;&nbsp;圖：擷取自國立臺灣大學公共衛生學院直播畫面</p>\r\n\r\n<p>更多</p>\r\n\r\n<p>[新頭殼newtalk] 武漢肺炎疫情升溫！台大公共衛生學院長詹長權表示，我國疫情流行模式從「境外移入」的傳播逐漸發展成「社區傳播」，建議民眾，人與人之間保持一公尺距離</p>\r\n', 399999, '1', 1582791472, 10, 5555),
(4, 1, 'kitty', '<h3 style=\"color:#aaaaaa; font-style:italic\"><span style=\"color:#e74c3c\"><code><em><strong>very cute</strong></em></code></span></h3>\r\n', 678, '1', 1582707855, 1, 99999),
(5, 1, 'space', 'very incredible ', 555555, '1', 1582783051, 2, 99999);

-- --------------------------------------------------------

--
-- 資料表結構 `suppliers`
--

CREATE TABLE `suppliers` (
  `zn` smallint(5) UNSIGNED NOT NULL COMMENT 'zn_supply',
  `name` varchar(255) NOT NULL COMMENT '公司名稱',
  `address` varchar(255) NOT NULL COMMENT '地址',
  `phone` varchar(255) NOT NULL COMMENT '電話',
  `email` varchar(255) NOT NULL COMMENT 'email',
  `sales_represent` varchar(255) NOT NULL COMMENT '業務代表',
  `enable` enum('1','0') NOT NULL DEFAULT '1' COMMENT '狀態'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 傾印資料表的資料 `suppliers`
--

INSERT INTO `suppliers` (`zn`, `name`, `address`, `phone`, `email`, `sales_represent`, `enable`) VALUES
(5, '哲豪記帳事務所', '高雄市鳳山區林森一路30號', '07-52785201', 'pervert06@gmail.com', '李哲豪', '1'),
(6, '展翔禮儀公司', '新竹市竹北區松江一路38號', '03-85214796', 'eso88@gmail.com', '鄭展翔', '0');

-- --------------------------------------------------------

--
-- 資料表結構 `users`
--

CREATE TABLE `users` (
  `uid` mediumint(8) UNSIGNED NOT NULL COMMENT '會員編號',
  `uname` varchar(255) NOT NULL COMMENT '帳號',
  `pass` varchar(255) NOT NULL COMMENT '密碼',
  `name` varchar(255) NOT NULL COMMENT '姓名',
  `tel` varchar(255) NOT NULL COMMENT '電話',
  `email` varchar(255) NOT NULL COMMENT '信箱',
  `kind` enum('0','1') NOT NULL DEFAULT '0' COMMENT '會員類別',
  `token` varchar(255) NOT NULL COMMENT 'token'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `users`
--

INSERT INTO `users` (`uid`, `uname`, `pass`, `name`, `tel`, `email`, `kind`, `token`) VALUES
(32, 'admin', '$2y$10$lD0xb1ihrTH1rDKWP641DufzxYxav3MWzhdAwbSwHV1Kag4HWeFn6', 'adam', '09123456789', 'adam@gmail.com', '1', '$2y$10$WNMh2H406jCdc5uv3JpgXOK6BSfZFox2Nwtb9sTTjFDJq1jywhbyy');

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `files`
--
ALTER TABLE `files`
  ADD PRIMARY KEY (`sn`);

--
-- 資料表索引 `kinds`
--
ALTER TABLE `kinds`
  ADD PRIMARY KEY (`sn`);

--
-- 資料表索引 `prods`
--
ALTER TABLE `prods`
  ADD PRIMARY KEY (`sn`);

--
-- 資料表索引 `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`uid`);

--
-- 在傾印的資料表使用自動遞增(AUTO_INCREMENT)
--

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `files`
--
ALTER TABLE `files`
  MODIFY `sn` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'files_sn', AUTO_INCREMENT=12;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `kinds`
--
ALTER TABLE `kinds`
  MODIFY `sn` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'kinds_sn', AUTO_INCREMENT=16;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `prods`
--
ALTER TABLE `prods`
  MODIFY `sn` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'prods_sn', AUTO_INCREMENT=7;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `users`
--
ALTER TABLE `users`
  MODIFY `uid` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '會員編號', AUTO_INCREMENT=33;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
