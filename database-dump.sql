CREATE TABLE Clients (
  Id int(11) NOT NULL AUTO_INCREMENT COMMENT 'индетификатор',
  `Name` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'имя',
  Phone varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'телефон',
  Email varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'email',
  PRIMARY KEY (Id)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO Clients (Id, Name, Phone, Email) VALUES
(1, 'Кирилл', '+76584957789', 'test1@yandex.ru'),
(2, 'Саша', '+7958465415', 'test1@mail.ru'),
(3, 'Коля', '+7986645879', 'test2@mail.ru'),
(4, 'Марина', '+7658027464', 'test@gmail.com'),
(5, 'Кристина', '+79584514156', 'test@gmail.ru'),
(6, 'Евгений', '+7946464156', 'test3@mail.ru'),
(7, 'Костя', '+76841461166', 'test@rambler.ru'),
(8, 'Ольга', '+763254965', 'test4@mail.ru'),
(9, 'Дима    ', '+7684564616', 'test1@rambler.ru'),
(10, 'Мария', '+7946166516', 'test4@mail.ru'),
(11, 'Дарья', '+766516166  ', 'test5@mail.ru'),
(12, 'Елена', '+7951156161', 'test2@gmail.ru');

CREATE TABLE Orders (
  Id int(11) NOT NULL AUTO_INCREMENT COMMENT 'идентификатор',
  CTime int(11) NOT NULL COMMENT 'время создания',
  Address varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'адрес доставки',
  Clients_id int(11) NOT NULL COMMENT 'идентификатор клиента',
  PRIMARY KEY (Id)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO Orders (Id, CTime, Address, Clients_id) VALUES
(1, 1425546000, 'Васильева 47', 1),
(2, 1423386000, 'Кулакова 45', 2),
(3, 1425546000, 'Васильева 47', 1),
(4, 1426410000, 'Пушкина 16', 3),
(5, 1421053200, 'Жукова 34', 4),
(6, 1423386000, 'Dzerzhinkogo 64', 2);

CREATE TABLE Products (
  Id int(11) NOT NULL COMMENT 'идентификатор',
  `Name` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'название',
  Price int(11) NOT NULL COMMENT 'цена',
  Count int(11) NOT NULL COMMENT 'количество',
  Order_id int(11) NOT NULL COMMENT 'индентификатор заказа',
  PRIMARY KEY (Id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO Products (Id, Name, Price, Count, Order_id) VALUES
(151513, 'Кофе', 200, 2, 1),
(151514, 'Масло', 90, 3, 2),
(151515, 'Хлеб', 50, 1, 3),
(151516, 'Молоко', 80, 5, 4),
(151517, 'Зубная паста', 150, 2, 1),
(151518, 'Кефир', 60, 4, 2),
(151519, 'Масло', 90, 1, 5),
(151520, 'Хлеб', 50, 4, 2),
(151521, 'Вода', 40, 6, 3);