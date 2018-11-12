drop table if exists `answer`;
drop table if exists `question`;
drop table if exists `friend`;
drop table if exists `user`;

create table `user` (
    `id` int not null auto_increment,
    `name` varchar(255),
    `surname` varchar(255),
    `email` varchar(255),
    `password` varchar(255),
    `gender` enum('M', 'F'),
    `img` varchar(255),
    `description` text,
    `score` int,
    primary key (`id`),
    unique key (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1; 

create table `friend` (
    `friendid` int not null,
    `otherfriendid` int not null,
    foreign key (`friendid`) references user(`id`) on delete cascade on update cascade,
    foreign key (`otherfriendid`) references user(`id`) on delete cascade on update cascade,
    unique key (`friendid`, `otherfriendid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

create table `question` (
    `id` int not null auto_increment,
    `userid` int not null,
    `question` varchar(255) not null,
    primary key (`id`),
    foreign key (`userid`) references user(`id`) on delete cascade on update cascade
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

create table `answer` (
    `id` int not null auto_increment,
    `userid` int not null,
    `questionid` int not null,
    `answer` varchar(255) not null,
    `correct` tinyint(1) not null,
    primary key (`id`),
    foreign key (`userid`) references user(`id`) on delete cascade on update cascade,
    foreign key (`questionid`) references question(`id`) on delete cascade on update cascade
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

insert into user (name, surname, email, password, gender, img, description, score) values
("Zihao", "Hong", "zhong@ucm.es", "pass", "M", "img", "description", 888),
("Diego", "Acuna Berger", "dacuna@ucm.es", "pass", "M", "img", "description", 200);

insert into friend (friendid, otherfriendid) values
(1, 2);

insert into question (userid, question) values
(1, "One Piece or Naruto?");

insert into answer (userid, questionid, answer, correct) values
(1, 1, "One Piece", 1);