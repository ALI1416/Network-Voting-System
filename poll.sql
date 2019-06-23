CREATE TABLE `poll_option` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` int(11) unsigned NOT NULL COMMENT '发布投票id',
  `option_text` varchar(64) NOT NULL COMMENT '选项描述',
  `option_num` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '被投票数量',
  `option_state` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '选项状态 0正常 1已删除',
  PRIMARY KEY (`id`),
  KEY `poll_option_ibfk_1` (`post_id`),
  CONSTRAINT `poll_option_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `poll_record` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL COMMENT '投此票用户的id',
  `option_id` int(11) unsigned NOT NULL COMMENT '投票选项id',
  `poll_num` tinyint(4) unsigned NOT NULL DEFAULT '1' COMMENT '投票数量',
  `poll_date` datetime NOT NULL COMMENT '投票时间',
  `poll_ip` int(11) unsigned NOT NULL COMMENT '投票的IP',
  `poll_mac` char(12) NOT NULL COMMENT '投票的MAC',
  `poll_state` tinyint(4) NOT NULL DEFAULT '0' COMMENT '投票状态 0正常 1取消',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id_2` (`user_id`,`option_id`) USING BTREE,
  KEY `option_id` (`option_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `poll_record_ibfk_3` FOREIGN KEY (`option_id`) REFERENCES `poll_option` (`id`),
  CONSTRAINT `poll_record_ibfk_4` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `post` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL COMMENT '用户id',
  `title` varchar(32) NOT NULL COMMENT '标题',
  `introduce` text NOT NULL COMMENT '内容',
  `poll_type` tinyint(4) unsigned NOT NULL COMMENT '投票类型 0单选 1多选 2多次',
  `open_show` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '是否可以搜索到 0公开显示 1不公开显示',
  `open_poll` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '是否可以不登录投票 0都可投票 1登录后可投票',
  `open_result` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '是否公开投票结果 0公开投票结果 1不公开投票结果',
  `max_poll` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '最多选择/投票数量',
  `post_state` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '发布状态 0正常 1暂停 2删除',
  `post_date` datetime NOT NULL COMMENT '发布时间',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `post_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(16) NOT NULL COMMENT '用户名',
  `pwd` varchar(16) NOT NULL COMMENT '密码',
  `gender` tinyint(4) unsigned NOT NULL DEFAULT '1' COMMENT '性别 0女 1男',
  `year` int(11) unsigned NOT NULL DEFAULT '1900' COMMENT '出生年',
  PRIMARY KEY (`id`),
  UNIQUE KEY `NAME` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;