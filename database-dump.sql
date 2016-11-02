CREATE TABLE Clients (
  Id int(11) NOT NULL AUTO_INCREMENT COMMENT '�������������',
  `Name` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '���',
  Phone varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '�������',
  Email varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'email',
  PRIMARY KEY (Id)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO Clients (Id, Name, Phone, Email) VALUES
(1, '������', '+76584957789', 'test1@yandex.ru'),
(2, '����', '+7958465415', 'test1@mail.ru'),
(3, '����', '+7986645879', 'test2@mail.ru'),
(4, '������', '+7658027464', 'test@gmail.com'),
(5, '��������', '+79584514156', 'test@gmail.ru'),
(6, '�������', '+7946464156', 'test3@mail.ru'),
(7, '�����', '+76841461166', 'test@rambler.ru'),
(8, '�����', '+763254965', 'test4@mail.ru'),
(9, '����    ', '+7684564616', 'test1@rambler.ru'),
(10, '�����', '+7946166516', 'test4@mail.ru'),
(11, '�����', '+766516166  ', 'test5@mail.ru'),
(12, '�����', '+7951156161', 'test2@gmail.ru');

CREATE TABLE Orders (
  Id int(11) NOT NULL AUTO_INCREMENT COMMENT '�������������',
  CTime int(11) NOT NULL COMMENT '����� ��������',
  Address varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '����� ��������',
  Clients_id int(11) NOT NULL COMMENT '������������� �������',
  PRIMARY KEY (Id)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO Orders (Id, CTime, Address, Clients_id) VALUES
(1, 1425546000, '��������� 47', 1),
(2, 1423386000, '�������� 45', 2),
(3, 1425546000, '��������� 47', 1),
(4, 1426410000, '������� 16', 3),
(5, 1421053200, '������ 34', 4),
(6, 1423386000, 'Dzerzhinkogo 64', 2);

CREATE TABLE Products (
  Id int(11) NOT NULL COMMENT '�������������',
  `Name` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '��������',
  Price int(11) NOT NULL COMMENT '����',
  Count int(11) NOT NULL COMMENT '����������',
  Order_id int(11) NOT NULL COMMENT '�������������� ������',
  PRIMARY KEY (Id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO Products (Id, Name, Price, Count, Order_id) VALUES
(151513, '����', 200, 2, 1),
(151514, '�����', 90, 3, 2),
(151515, '����', 50, 1, 3),
(151516, '������', 80, 5, 4),
(151517, '������ �����', 150, 2, 1),
(151518, '�����', 60, 4, 2),
(151519, '�����', 90, 1, 5),
(151520, '����', 50, 4, 2),
(151521, '����', 40, 6, 3);