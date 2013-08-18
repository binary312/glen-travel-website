
DROP TABLE IF EXISTS alices;
CREATE TABLE alices (
  id int NOT NULL AUTO_INCREMENT,
  uuid int NOT NULL,
  pwd varchar(20) NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 COMMENT '驴友用户表';

DROP TABLE IF EXISTS drivers;
CREATE TABLE drivers (
  id int NOT NULL AUTO_INCREMENT,
  uuid int NOT NULL,
  pwd varchar(20) NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 COMMENT '司机用户表';

CREATE TABLE cars (
  id int NOT NULL AUTO_INCREMENT,
  model varchar(20) NOT NULL,
  number varchar(10) NOT NULL,
  picture varchar(50) NOT NULL,
  driving_license varchar(20) NOT NULL,
  bearing_count int NOT NULL,
  driving_year int NOT NULL,
  driving_distance int NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 COMMENT '车辆信息表';

DROP TABLE IF EXISTS alice_info;
CREATE TABLE alice_info (
  alice_id int NOT NULL,
  email varchar(50) NOT NULL,
  profile_pic varchar(50) NULL,
  FOREIGN KEY (alice_id) REFERENCES alices (id)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT '驴友信息表';

DROP TABLE IF EXISTS driver_info;
CREATE TABLE driver_info (
  driver_id int NOT NULL,
  email varchar(50) NOT NULL,
  real_name varchar(30) NOT NULL,
  id_number varchar(18) NULL,
  profile_pic varchar(50) NULL,
  ethnic varchar(20) NULL,
  mobile_phone varchar(11) NOT NULL,
  license_expired_date date NULL,
  drive_year int NULL,
  province varchar(20) NULL,
  trade_region varchar(20) NULL,
  about_me varchar(100) NULL,
  FOREIGN KEY (driver_id) REFERENCES drivers (id)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT '司机信息表';

DROP TABLE IF EXISTS alice_followed_drivers;
CREATE TABLE alice_followed_drivers (
  alice_id int NOT NULL,
  driver_id int NOT NULL,
  FOREIGN KEY (alice_id) REFERENCES alices (id),
  FOREIGN KEY (driver_id) REFERENCES drivers (id)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT '驴友关注的司机表';

DROP TABLE IF EXISTS driver_vs_car;
CREATE TABLE driver_vs_car (
  driver_id int NOT NULL,
  car_id int NOT NULL,
  FOREIGN KEY (driver_id) REFERENCES drivers (id),
  FOREIGN KEY (car_id) REFERENCES cars (id)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT '司机拥有的车辆表';

DROP TABLE IF EXISTS driver_integral;
CREATE TABLE driver_integral (
  driver_id int NOT NULL,
  integral int NOT NULL,
  obtain_date date NOT NULL,
  obtain_reason varchar(100) NULL,
  from_alice_id int NULL,
  update_date date NOT NULL,
  FOREIGN KEY (driver_id) REFERENCES drivers (id)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT '司机积分表';

DROP TABLE IF EXISTS driver_schedule;
CREATE TABLE driver_schedule (
  driver_id int NOT NULL,
  schedule_date date NOT NULL,
  status int NULL COMMENT '1: 已预约' ,
  FOREIGN KEY (driver_id) REFERENCES drivers (id)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT '司机计划表';

DROP TABLE IF EXISTS driver_review;
CREATE TABLE driver_review (
  driver_id int NOT NULL,
  review int NULL,
  FOREIGN KEY (driver_id) REFERENCES drivers (id)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT '司机好评表';