-- creacion del database
DROP DATABASE IF EXISTS ventas_ecommerce;
CREATE DATABASE ventas_ecommerce;
USE ventas_ecommerce;
CREATE TABLE Usuarios (
    ID_Usuario INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Correo_Electronico VARCHAR(100) UNIQUE NOT NULL,
    Contraseña VARCHAR(20) NOT NULL,
    Teléfono VARCHAR(20) NOT NULL
);
CREATE TABLE Categorías (
    ID_Categoría INT AUTO_INCREMENT PRIMARY KEY,
    Nombre_Categoría VARCHAR(100) NOT NULL
);
CREATE TABLE Productos (
    ID_Producto INT AUTO_INCREMENT PRIMARY KEY,
    Nombre_Producto VARCHAR(50) NOT NULL,
    Descripción TEXT,
    Precio DECIMAL(10, 2) NOT NULL,
    Stock INT NOT NULL,
    ID_Categoría INT NOT NULL,
    FOREIGN KEY (ID_Categoría) REFERENCES Categorías(ID_Categoría)
);
CREATE TABLE Órdenes (
    ID_Orden INT AUTO_INCREMENT PRIMARY KEY,
    ID_Usuario INT NOT NULL,
    Fecha_Orden DATE NOT NULL,
    Estado_Orden VARCHAR(50) NOT NULL,
    Total_Orden DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (ID_Usuario) REFERENCES Usuarios(ID_Usuario)
);
CREATE TABLE Detalles_Orden (
    ID_Detalle_Orden INT AUTO_INCREMENT PRIMARY KEY,
    ID_Orden INT NOT NULL,
    ID_Producto INT NOT NULL,
    Cantidad INT NOT NULL,
    Precio_Unitario DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (ID_Orden) REFERENCES Órdenes(ID_Orden),
    FOREIGN KEY (ID_Producto) REFERENCES Productos(ID_Producto)
);
CREATE TABLE Ubicaciones (
    ID_Ubicación INT AUTO_INCREMENT PRIMARY KEY,
    ID_Usuario INT NOT NULL,
    Dirección VARCHAR(100) NOT NULL,
    Ciudad VARCHAR(100) NOT NULL,
    País VARCHAR(100) NOT NULL,
    FOREIGN KEY (ID_Usuario) REFERENCES Usuarios(ID_Usuario)
);
-- importacion de los dos csv usuarios.csv y categorias.csv

-- insertar datos en las tablas 
INSERT INTO Productos (ID_Producto, ID_Categoría, Nombre_Producto, Descripción, Precio, Stock) VALUES
(1, 4, 'Jueguetes', 'Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus. Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.', 148, 91),
(2, 8, 'Salud', 'Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.', 11718, 82),
(3, 4, 'Jueguetes', 'Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque. Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus. In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.', 1871, 73),
(4, 3, 'Hogar', 'Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.', 6885, 64),
(5, 2, 'Ropa', 'Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum. Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', 813, 55),
(6, 4, 'Jueguetes', 'Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris. Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.', 6856, 48),
(7, 6, 'Deportes', 'Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede. Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.', 10912, 38),
(8, 6, 'Deportes', 'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus. In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.', 4983, 49),
(9, 3, 'Hogar', 'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.', 8773, 29),
(10, 10, 'Comida', 'In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo. Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor. Duis mattis egestas metus.', 6135, 15),
(11, 8, 'Salud', 'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus. Phasellus in felis. Donec semper sapien a libero. Nam dui. Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.', 4140, 18),
(12, 6, 'Deportes', 'Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.', 3396, 12),
(13, 2, 'Ropa', 'Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.', 533, 17),
(14, 3, 'Hogar', 'Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi. Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.', 1141, 14),
(15, 9, 'Automóviles', 'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus. In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus. Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.', 1962, 14),
(16, 3, 'Hogar', 'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh. In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.', 6962, 74),
(17, 1, 'Electrónica', 'Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio. Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.', 6294, 17),
(18, 3, 'Hogar', 'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis. Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus. Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.', 10031, 18),
(19, 1, 'Electrónica', 'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus. In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.', 7513, 60),
(20, 6, 'Deportes', 'Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque. Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.', 6287, 33),
(21, 1, 'Electrónica', 'Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum. Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem. Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.', 10793, 56),
(22, 6, 'Deportes', 'Sed ante. Vivamus tortor. Duis mattis egestas metus.', 771, 22),
(23, 9, 'Automóviles', 'In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo. Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor. Duis mattis egestas metus.', 4432, 22),
(24, 1, 'Electrónica', 'In congue. Etiam justo. Etiam pretium iaculis justo. In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus. Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.', 11950, 24),
(25, 2, 'Ropa', 'Fusce consequat. Nulla nisl. Nunc nisl.', 1809, 56),
(26, 7, 'Musica', 'Phasellus in felis. Donec semper sapien a libero. Nam dui.', 6059, 26),
(27, 5, 'Libros', 'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.', 11504, 96),
(28, 8, 'Salud', 'Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit. Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.', 9714, 55),
(29, 1, 'Electrónica', 'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.', 3224, 50),
(30, 3, 'Hogar', 'Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.', 8271, 30);

USE ventas_ecommerce;
INSERT INTO Órdenes (ID_Orden, ID_Usuario, Fecha_Orden, Estado_Orden, Total_Orden) VALUES
(1, 98, '2024-04-23', 'Entregado', 57624),
(2, 7, '2023-10-25', 'Entregado', 519624),
(3, 88, '2024-07-31', 'No Entregado', 138417),
(4, 90, '2024-08-01', 'Entregado', 124915),
(5, 66, '2023-08-29', 'Entregado', 6250),
(6, 2, '2024-07-14', 'No Entregado', 37715),
(7, 4, '2024-05-28', 'Entregado', 337966),
(8, 62, '2024-02-01', 'Entregado', 79660),
(9, 16, '2023-10-15', 'Entregado', 283179),
(10, 11, '2023-11-21', 'Entregado', 411520),
(11, 58, '2024-02-14', 'Entregado', 75411),
(12, 59, '2023-08-04', 'Entregado', 45528),
(13, 23, '2024-01-20', 'Entregado', 14700),
(14, 10, '2024-07-18', 'No Entregado', 454126),
(15, 57, '2024-02-26', 'Entregado', 624732),
(16, 58, '2024-07-28', 'No Entregado', 3781),
(17, 67, '2024-07-13', 'No Entregado', 610350),
(18, 95, '2024-03-31', 'Entregado', 980595),
(19, 93, '2024-03-17', 'Entregado', 261477),
(20, 69, '2024-05-15', 'Entregado', 398475),
(21, 60, '2024-07-08', 'No Entregado', 17862),
(22, 71, '2024-01-11', 'Entregado', 743040),
(23, 31, '2024-04-01', 'Entregado', 23625),
(24, 53, '2024-05-06', 'Entregado', 388864),
(25, 8, '2024-05-31', 'Entregado', 30379),
(26, 66, '2023-10-19', 'Entregado', 612144),
(27, 86, '2024-01-16', 'Entregado', 64500),
(28, 18, '2023-12-21', 'Entregado', 943810),
(29, 56, '2023-12-04', 'Entregado', 565575),
(30, 1, '2023-11-16', 'Entregado', 847504),
(31, 64, '2024-07-02', 'No Entregado', 982773),
(32, 78, '2024-04-18', 'Entregado', 90390),
(33, 69, '2023-08-14', 'Entregado', 91050),
(34, 28, '2024-04-17', 'Entregado', 206460),
(35, 78, '2024-07-02', 'No Entregado', 694378),
(36, 9, '2023-08-28', 'Entregado', 549080),
(37, 35, '2024-05-06', 'Entregado', 130493),
(38, 100, '2023-08-05', 'Entregado', 108920),
(39, 97, '2024-04-11', 'Entregado', 117674),
(40, 29, '2024-03-15', 'Entregado', 353351),
(41, 31, '2024-02-02', 'Entregado', 107410),
(42, 34, '2024-03-12', 'Entregado', 352348),
(43, 68, '2024-05-05', 'Entregado', 106180),
(44, 69, '2024-04-03', 'Entregado', 726580),
(45, 5, '2024-03-11', 'Entregado', 53935),
(46, 32, '2023-08-04', 'Entregado', 79655),
(47, 3, '2024-07-17', 'No Entregado', 982080),
(48, 26, '2024-03-26', 'Entregado', 37468),
(49, 38, '2023-08-23', 'Entregado', 14652),
(50, 94, '2023-08-07', 'Entregado', 124333),
(51, 81, '2024-02-11', 'Entregado', 105070),
(52, 53, '2024-03-30', 'Entregado', 986337),
(53, 33, '2023-11-22', 'Entregado', 98146),
(54, 46, '2024-06-02', 'Entregado', 34928),
(55, 2, '2024-04-14', 'Entregado', 10300),
(56, 3, '2024-03-12', 'Entregado', 794325),
(57, 73, '2023-10-07', 'Entregado', 480171),
(58, 40, '2024-07-22', 'No Entregado', 350106),
(59, 80, '2024-04-15', 'Entregado', 102520),
(60, 39, '2024-05-24', 'Entregado', 481689),
(61, 39, '2023-08-02', 'Entregado', 812880),
(62, 81, '2023-10-20', 'Entregado', 123410),
(63, 74, '2024-07-16', 'No Entregado', 103580),
(64, 31, '2023-12-03', 'Entregado', 45087),
(65, 6, '2023-11-27', 'Entregado', 19754),
(66, 63, '2024-05-25', 'Entregado', 130383),
(67, 14, '2024-02-29', 'Entregado', 153465),
(68, 80, '2023-09-02', 'Entregado', 128799),
(69, 38, '2023-09-27', 'Entregado', 38440),
(70, 47, '2024-02-01', 'Entregado', 662013),
(71, 68, '2023-09-29', 'Entregado', 674040),
(72, 24, '2024-07-07', 'No Entregado', 596134),
(73, 69, '2023-12-03', 'Entregado', 188727),
(74, 64, '2024-03-13', 'Entregado', 48708),
(75, 79, '2023-12-01', 'Entregado', 476928),
(76, 99, '2024-05-12', 'Entregado', 658935),
(77, 74, '2023-10-15', 'Entregado', 153153),
(78, 22, '2024-06-17', 'Entregado', 564600),
(79, 61, '2023-08-11', 'Entregado', 145882),
(80, 49, '2024-05-27', 'Entregado', 469132),
(81, 80, '2024-05-18', 'Entregado', 988614),
(82, 76, '2023-11-18', 'Entregado', 25728),
(83, 29, '2024-02-29', 'Entregado', 35105),
(84, 98, '2023-08-14', 'Entregado', 234336),
(85, 61, '2023-10-15', 'Entregado', 122716),
(86, 67, '2024-01-24', 'Entregado', 2601),
(87, 25, '2024-06-13', 'Entregado', 4452),
(88, 19, '2023-10-05', 'Entregado', 118218),
(89, 37, '2024-07-15', 'No Entregado', 92430),
(90, 49, '2023-12-24', 'Entregado', 96317),
(91, 52, '2023-08-25', 'Entregado', 2030),
(92, 82, '2024-06-13', 'Entregado', 427050),
(93, 32, '2023-10-28', 'Entregado', 17901),
(94, 54, '2023-09-14', 'Entregado', 50182),
(95, 96, '2024-07-21', 'No Entregado', 927552),
(96, 44, '2024-05-01', 'Entregado', 242501),
(97, 52, '2024-04-14', 'Entregado', 33408),
(98, 44, '2024-01-04', 'Entregado', 3312),
(99, 41, '2024-02-06', 'Entregado', 107640),
(100, 63, '2023-11-01', 'Entregado', 46074),
(101, 55, '2024-02-01', 'Entregado', 100720),
(102, 28, '2023-10-23', 'Entregado', 713244),
(103, 22, '2023-08-15', 'Entregado', 104640),
(104, 2, '2023-10-15', 'Entregado', 123959),
(105, 13, '2024-01-06', 'Entregado', 32994),
(106, 18, '2023-10-26', 'Entregado', 285140),
(107, 59, '2023-12-27', 'Entregado', 33174),
(108, 100, '2023-09-15', 'Entregado', 85376),
(109, 61, '2024-03-14', 'Entregado', 742352),
(110, 45, '2023-12-08', 'Entregado', 48488),
(111, 30, '2024-03-14', 'Entregado', 106750),
(112, 58, '2024-04-09', 'Entregado', 100220),
(113, 93, '2023-11-09', 'Entregado', 891214),
(114, 27, '2023-09-16', 'Entregado', 68094),
(115, 8, '2024-05-12', 'Entregado', 17394),
(116, 30, '2024-02-01', 'Entregado', 375028),
(117, 90, '2024-04-23', 'Entregado', 728875),
(118, 46, '2024-01-07', 'Entregado', 29155),
(119, 66, '2023-12-30', 'Entregado', 851736),
(120, 49, '2024-05-18', 'Entregado', 329118),
(121, 86, '2024-03-28', 'Entregado', 79655),
(122, 96, '2024-04-16', 'Entregado', 867132),
(123, 75, '2024-01-17', 'Entregado', 107270),
(124, 20, '2024-06-09', 'Entregado', 197824),
(125, 89, '2024-07-18', 'No Entregado', 325926),
(126, 12, '2023-11-29', 'Entregado', 213900),
(127, 55, '2023-08-13', 'Entregado', 29325),
(128, 52, '2023-09-27', 'Entregado', 17030),
(129, 38, '2023-09-26', 'Entregado', 946138),
(130, 66, '2023-08-28', 'Entregado', 374479),
(131, 92, '2023-08-07', 'Entregado', 107550),
(132, 61, '2024-02-09', 'Entregado', 413824),
(133, 96, '2023-10-09', 'Entregado', 44247),
(134, 38, '2023-10-21', 'Entregado', 100960),
(135, 11, '2024-01-25', 'Entregado', 468656),
(136, 42, '2024-02-29', 'Entregado', 22980),
(137, 91, '2024-01-29', 'Entregado', 153387),
(138, 96, '2024-01-22', 'Entregado', 45276),
(139, 57, '2024-01-30', 'Entregado', 64925),
(140, 53, '2024-05-17', 'Entregado', 781792),
(141, 40, '2024-01-23', 'Entregado', 79996),
(142, 35, '2023-10-22', 'Entregado', 5329),
(143, 50, '2024-02-12', 'Entregado', 244706),
(144, 75, '2024-05-19', 'Entregado', 102720),
(145, 63, '2024-05-18', 'Entregado', 884352),
(146, 8, '2024-07-19', 'No Entregado', 128480),
(147, 50, '2024-04-25', 'Entregado', 281960),
(148, 10, '2024-01-08', 'Entregado', 792189),
(149, 92, '2024-04-02', 'Entregado', 963536),
(150, 55, '2024-05-10', 'Entregado', 80528),
(151, 34, '2024-02-17', 'Entregado', 493080),
(152, 25, '2024-04-28', 'Entregado', 48664),
(153, 20, '2023-10-18', 'Entregado', 91230),
(154, 22, '2024-06-12', 'Entregado', 145844),
(155, 49, '2024-03-13', 'Entregado', 762816),
(156, 44, '2024-05-06', 'Entregado', 524664),
(157, 61, '2024-03-28', 'Entregado', 153582),
(158, 60, '2024-05-24', 'Entregado', 242256),
(159, 15, '2024-04-04', 'Entregado', 676746),
(160, 73, '2023-11-23', 'Entregado', 106640),
(161, 1, '2023-10-18', 'Entregado', 107580),
(162, 3, '2023-11-11', 'Entregado', 100860),
(163, 26, '2023-11-03', 'Entregado', 67600),
(164, 79, '2024-02-07', 'Entregado', 981090),
(165, 60, '2024-06-20', 'Entregado', 124421),
(166, 4, '2024-03-04', 'Entregado', 79996),
(167, 87, '2024-01-20', 'Entregado', 567525),
(168, 21, '2024-04-16', 'Entregado', 105720),
(169, 96, '2024-02-21', 'Entregado', 281218),
(170, 83, '2024-01-18', 'Entregado', 123310),
(171, 98, '2023-11-17', 'Entregado', 282172),
(172, 14, '2024-02-29', 'Entregado', 44142),
(173, 4, '2023-08-05', 'Entregado', 593285),
(174, 20, '2024-07-23', 'No Entregado', 463964),
(175, 21, '2024-04-23', 'Entregado', 213808),
(176, 79, '2023-09-06', 'Entregado', 15288),
(177, 33, '2024-06-13', 'Entregado', 577600),
(178, 69, '2023-12-03', 'Entregado', 14988),
(179, 17, '2024-04-01', 'Entregado', 44751),
(180, 70, '2024-04-18', 'Entregado', 101610),
(181, 66, '2023-08-15', 'Entregado', 152139),
(182, 8, '2024-02-11', 'Entregado', 274300),
(183, 34, '2024-01-20', 'Entregado', 129041),
(184, 96, '2023-12-24', 'Entregado', 336632),
(185, 55, '2024-05-11', 'Entregado', 195536),
(186, 45, '2023-08-18', 'Entregado', 103650),
(187, 1, '2024-03-28', 'Entregado', 810720),
(188, 100, '2024-05-24', 'Entregado', 108390),
(189, 90, '2023-12-23', 'Entregado', 103264),
(190, 21, '2024-04-01', 'Entregado', 260559),
(191, 31, '2024-03-19', 'Entregado', 110649),
(192, 37, '2023-09-06', 'Entregado', 283815),
(193, 51, '2023-10-10', 'Entregado', 131043),
(194, 66, '2024-07-30', 'No Entregado', 188340),
(195, 89, '2024-07-26', 'No Entregado', 410176),
(196, 10, '2024-01-06', 'Entregado', 29646),
(197, 39, '2024-02-27', 'Entregado', 887548),
(198, 50, '2024-04-13', 'Entregado', 12573),
(199, 80, '2023-12-12', 'Entregado', 328662),
(200, 40, '2023-08-06', 'Entregado', 163960),
(201, 78, '2023-10-31', 'Entregado', 490420),
(202, 88, '2024-03-10', 'Entregado', 122672),
(203, 59, '2024-02-10', 'Entregado', 79072),
(204, 32, '2024-06-27', 'Entregado', 108650),
(205, 88, '2024-02-06', 'Entregado', 435666),
(206, 72, '2023-10-30', 'Entregado', 507082),
(207, 29, '2023-12-21', 'Entregado', 583148),
(208, 57, '2023-08-18', 'Entregado', 581172),
(209, 96, '2024-05-30', 'Entregado', 401751),
(210, 20, '2023-10-15', 'Entregado', 53866),
(211, 29, '2023-12-13', 'Entregado', 385206),
(212, 62, '2024-05-25', 'Entregado', 337792),
(213, 46, '2024-04-09', 'Entregado', 727005),
(214, 85, '2023-08-30', 'Entregado', 116960),
(215, 21, '2023-10-22', 'Entregado', 103810),
(216, 71, '2024-04-30', 'Entregado', 305635),
(217, 47, '2023-10-15', 'Entregado', 63121),
(218, 14, '2023-09-18', 'Entregado', 18576),
(219, 45, '2024-01-20', 'Entregado', 23424),
(220, 1, '2023-08-10', 'Entregado', 811800),
(221, 14, '2023-08-31', 'Entregado', 69134),
(222, 30, '2024-08-01', 'Entregado', 108470),
(223, 14, '2024-06-11', 'Entregado', 281960),
(224, 28, '2024-04-02', 'Entregado', 128073),
(225, 100, '2023-09-01', 'Entregado', 26144),
(226, 55, '2024-02-09', 'Entregado', 45297),
(227, 89, '2024-02-09', 'Entregado', 146186),
(228, 70, '2024-05-08', 'Entregado', 128337),
(229, 88, '2023-11-23', 'Entregado', 2975),
(230, 13, '2023-10-05', 'Entregado', 185330),
(231, 68, '2024-07-20', 'No Entregado', 41920),
(232, 57, '2024-02-22', 'Entregado', 696536),
(233, 89, '2023-12-14', 'Entregado', 965594),
(234, 78, '2024-07-26', 'No Entregado', 729385),
(235, 25, '2024-06-21', 'Entregado', 83629),
(236, 66, '2023-10-05', 'Entregado', 91680),
(237, 91, '2023-08-15', 'Entregado', 127413),
(238, 73, '2024-06-16', 'Entregado', 579196),
(239, 93, '2024-04-15', 'Entregado', 214314),
(240, 84, '2023-10-16', 'Entregado', 968240),
(241, 49, '2024-04-14', 'Entregado', 484),
(242, 77, '2023-10-31', 'Entregado', 480378),
(243, 18, '2024-05-06', 'Entregado', 242354),
(244, 33, '2023-11-29', 'Entregado', 33048),
(245, 70, '2024-01-31', 'Entregado', 628129),
(246, 87, '2023-10-04', 'Entregado', 137307),
(247, 47, '2023-10-31', 'Entregado', 439890),
(248, 14, '2023-12-08', 'Entregado', 138824),
(249, 75, '2024-07-05', 'No Entregado', 54004),
(250, 22, '2024-04-06', 'Entregado', 811710),
(251, 46, '2024-07-04', 'No Entregado', 53475),
(252, 19, '2023-09-17', 'Entregado', 221276),
(253, 12, '2023-08-22', 'Entregado', 171831),
(254, 88, '2023-10-23', 'Entregado', 67626),
(255, 69, '2024-06-04', 'Entregado', 968828),
(256, 1, '2024-06-25', 'Entregado', 170970),
(257, 15, '2023-11-19', 'Entregado', 117640),
(258, 77, '2023-09-13', 'Entregado', 304425),
(259, 35, '2024-03-03', 'Entregado', 568275),
(260, 64, '2023-08-19', 'Entregado', 337096),
(261, 27, '2023-10-28', 'Entregado', 50248),
(262, 48, '2023-10-08', 'Entregado', 306295),
(263, 1, '2024-02-02', 'Entregado', 340808),
(264, 1, '2024-02-01', 'Entregado', 103500),
(265, 74, '2024-02-27', 'Entregado', 3402),
(266, 50, '2023-09-25', 'Entregado', 640320),
(267, 80, '2024-02-03', 'Entregado', 33696),
(268, 16, '2023-12-19', 'Entregado', 12419),
(269, 33, '2023-11-15', 'Entregado', 23580),
(270, 95, '2023-12-07', 'Entregado', 778096),
(271, 44, '2023-09-08', 'Entregado', 101970),
(272, 92, '2024-03-27', 'Entregado', 592900),
(273, 65, '2023-12-20', 'Entregado', 233328),
(274, 73, '2023-11-01', 'Entregado', 374296),
(275, 61, '2023-10-11', 'Entregado', 967456),
(276, 86, '2024-01-09', 'Entregado', 942549),
(277, 46, '2023-11-07', 'Entregado', 832650),
(278, 19, '2024-01-31', 'Entregado', 294084),
(279, 80, '2024-06-23', 'Entregado', 127710),
(280, 45, '2024-06-25', 'Entregado', 58368),
(281, 15, '2023-11-28', 'Entregado', 763599),
(282, 28, '2023-11-23', 'Entregado', 302885),
(283, 45, '2024-07-31', 'No Entregado', 611598),
(284, 96, '2023-12-12', 'Entregado', 128139),
(285, 43, '2024-06-24', 'Entregado', 4900),
(286, 69, '2024-01-17', 'Entregado', 221041),
(287, 67, '2023-12-19', 'Entregado', 57864),
(288, 91, '2023-11-14', 'Entregado', 85637),
(289, 78, '2024-04-27', 'Entregado', 111606),
(290, 4, '2023-10-05', 'Entregado', 100050),
(291, 33, '2024-01-05', 'Entregado', 658530),
(292, 64, '2024-03-06', 'Entregado', 924000),
(293, 85, '2024-03-26', 'Entregado', 253400),
(294, 5, '2024-06-06', 'Entregado', 465868),
(295, 87, '2024-01-11', 'Entregado', 123530),
(296, 23, '2023-08-21', 'Entregado', 105560),
(297, 36, '2023-11-21', 'Entregado', 232128),
(298, 81, '2023-12-25', 'Entregado', 168674),
(299, 17, '2024-02-11', 'Entregado', 609102),
(300, 50, '2024-05-23', 'Entregado', 26912);

USE ventas_ecommerce;
INSERT INTO Detalles_Orden (ID_Detalle_Orden, ID_Orden, ID_Producto, Cantidad, Precio_Unitario) VALUES
(1, 1, 13, 24, 2401),
(2, 2, 28, 72, 7217),
(3, 3, 28, 37, 3741),
(4, 4, 3, 35, 3569),
(5, 5, 1, 25, 250),
(6, 6, 13, 19, 1985),
(7, 7, 14, 58, 5827),
(8, 8, 7, 28, 2845),
(9, 9, 8, 53, 5343),
(10, 10, 8, 64, 6430),
(11, 11, 30, 27, 2793),
(12, 12, 28, 21, 2168),
(13, 13, 13, 12, 1225),
(14, 14, 20, 67, 6778),
(15, 15, 26, 79, 7908),
(16, 16, 6, 19, 199),
(17, 17, 28, 78, 7825),
(18, 18, 7, 99, 9905),
(19, 19, 1, 51, 5127),
(20, 20, 23, 63, 6325),
(21, 21, 5, 13, 1374),
(22, 22, 2, 86, 8640),
(23, 23, 11, 15, 1575),
(24, 24, 2, 62, 6272),
(25, 25, 13, 17, 1787),
(26, 26, 2, 78, 7848),
(27, 27, 3, 25, 2580),
(28, 28, 9, 97, 9730),
(29, 29, 11, 75, 7541),
(30, 30, 6, 92, 9212),
(31, 31, 4, 99, 9927),
(32, 32, 11, 30, 3013),
(33, 33, 2, 30, 3035),
(34, 34, 17, 45, 4588),
(35, 35, 12, 83, 8366),
(36, 36, 28, 74, 7420),
(37, 37, 2, 11, 11863),
(38, 38, 21, 10, 10892),
(39, 39, 8, 34, 3461),
(40, 40, 26, 59, 5989),
(41, 41, 24, 10, 10741),
(42, 42, 22, 59, 5972),
(43, 43, 25, 10, 10618),
(44, 44, 29, 85, 8548),
(45, 45, 5, 23, 2345),
(46, 46, 15, 89, 895),
(47, 47, 7, 99, 9920),
(48, 48, 11, 19, 1972),
(49, 49, 30, 12, 1221),
(50, 50, 23, 11, 11303),
(51, 51, 15, 10, 10507),
(52, 52, 12, 99, 9963),
(53, 53, 10, 31, 3166),
(54, 54, 10, 59, 592),
(55, 55, 28, 10, 1030),
(56, 56, 4, 89, 8925),
(57, 57, 23, 69, 6959),
(58, 58, 26, 59, 5934),
(59, 59, 14, 10, 10252),
(60, 60, 20, 69, 6981),
(61, 61, 7, 90, 9032),
(62, 62, 30, 35, 3526),
(63, 63, 15, 10, 10358),
(64, 64, 10, 21, 2147),
(65, 65, 18, 14, 1411),
(66, 66, 4, 11, 11853),
(67, 67, 10, 39, 3935),
(68, 68, 21, 11, 11709),
(69, 69, 19, 62, 620),
(70, 70, 9, 81, 8173),
(71, 71, 12, 82, 8220),
(72, 72, 28, 77, 7742),
(73, 73, 28, 43, 4389),
(74, 74, 18, 22, 2214),
(75, 75, 13, 69, 6912),
(76, 76, 26, 81, 8135),
(77, 77, 13, 39, 3927),
(78, 78, 16, 75, 7528),
(79, 79, 5, 38, 3839),
(80, 80, 17, 68, 6899),
(81, 81, 7, 99, 9986),
(82, 82, 19, 16, 1608),
(83, 83, 15, 59, 595),
(84, 84, 17, 48, 4882),
(85, 85, 11, 11, 11156),
(86, 86, 24, 51, 51),
(87, 87, 9, 21, 212),
(88, 88, 18, 34, 3477),
(89, 89, 25, 30, 3081),
(90, 90, 3, 31, 3107),
(91, 91, 30, 14, 145),
(92, 92, 16, 65, 6570),
(93, 93, 3, 13, 1377),
(94, 94, 4, 22, 2281),
(95, 95, 26, 96, 9662),
(96, 96, 27, 49, 4949),
(97, 97, 10, 18, 1856),
(98, 98, 16, 18, 184),
(99, 99, 6, 10, 10764),
(100, 100, 7, 21, 2194),
(101, 101, 4, 10, 10072),
(102, 102, 16, 84, 8491),
(103, 103, 9, 32, 3270),
(104, 104, 21, 11, 11269),
(105, 105, 3, 18, 1833),
(106, 106, 23, 53, 5380),
(107, 107, 3, 18, 1843),
(108, 108, 12, 92, 928),
(109, 109, 2, 86, 8632),
(110, 110, 25, 22, 2204),
(111, 111, 16, 10, 10675),
(112, 112, 10, 10, 10022),
(113, 113, 23, 94, 9481),
(114, 114, 4, 26, 2619),
(115, 115, 28, 13, 1338),
(116, 116, 12, 61, 6148),
(117, 117, 29, 85, 8575),
(118, 118, 18, 17, 1715),
(119, 119, 14, 92, 9258),
(120, 120, 29, 57, 5774),
(121, 121, 24, 89, 895),
(122, 122, 2, 93, 9324),
(123, 123, 20, 10, 10727),
(124, 124, 5, 44, 4496),
(125, 125, 12, 57, 5718),
(126, 126, 2, 46, 4650),
(127, 127, 7, 17, 1725),
(128, 128, 6, 13, 1310),
(129, 129, 26, 97, 9754),
(130, 130, 20, 61, 6139),
(131, 131, 10, 10, 10755),
(132, 132, 30, 64, 6466),
(133, 133, 17, 21, 2107),
(134, 134, 15, 10, 10096),
(135, 135, 3, 68, 6892),
(136, 136, 3, 15, 1532),
(137, 137, 23, 39, 3933),
(138, 138, 2, 21, 2156),
(139, 139, 15, 25, 2597),
(140, 140, 29, 88, 8884),
(141, 141, 8, 28, 2857),
(142, 142, 25, 73, 73),
(143, 143, 26, 49, 4994),
(144, 144, 8, 10, 10272),
(145, 145, 13, 94, 9408),
(146, 146, 9, 11, 11680),
(147, 147, 27, 53, 5320),
(148, 148, 28, 89, 8901),
(149, 149, 10, 98, 9832),
(150, 150, 13, 28, 2876),
(151, 151, 10, 70, 7044),
(152, 152, 13, 22, 2212),
(153, 153, 20, 30, 3041),
(154, 154, 2, 38, 3838),
(155, 155, 29, 87, 8768),
(156, 156, 12, 72, 7287),
(157, 157, 5, 39, 3938),
(158, 158, 2, 49, 4944),
(159, 159, 10, 82, 8253),
(160, 160, 5, 10, 10664),
(161, 161, 4, 10, 10758),
(162, 162, 21, 10, 10086),
(163, 163, 4, 26, 2600),
(164, 164, 26, 99, 9910),
(165, 165, 9, 11, 11311),
(166, 166, 26, 28, 2857),
(167, 167, 3, 75, 7567),
(168, 168, 8, 10, 10572),
(169, 169, 27, 53, 5306),
(170, 170, 12, 11, 11210),
(171, 171, 15, 53, 5324),
(172, 172, 27, 21, 2102),
(173, 173, 5, 77, 7705),
(174, 174, 11, 68, 6823),
(175, 175, 27, 46, 4648),
(176, 176, 6, 12, 1274),
(177, 177, 23, 76, 7600),
(178, 178, 22, 12, 1249),
(179, 179, 14, 21, 2131),
(180, 180, 4, 10, 10161),
(181, 181, 13, 39, 3901),
(182, 182, 28, 52, 5275),
(183, 183, 18, 11, 11731),
(184, 184, 22, 58, 5804),
(185, 185, 6, 44, 4444),
(186, 186, 10, 10, 10365),
(187, 187, 2, 90, 9008),
(188, 188, 29, 10, 10839),
(189, 189, 14, 32, 3227),
(190, 190, 3, 51, 5109),
(191, 191, 25, 33, 3353),
(192, 192, 10, 53, 5355),
(193, 193, 29, 11, 11913),
(194, 194, 25, 43, 4380),
(195, 195, 4, 64, 6409),
(196, 196, 30, 54, 549),
(197, 197, 2, 94, 9442),
(198, 198, 2, 11, 1143),
(199, 199, 23, 57, 5766),
(200, 200, 17, 40, 4099),
(201, 201, 11, 70, 7006),
(202, 202, 6, 11, 11152),
(203, 203, 26, 28, 2824),
(204, 204, 18, 10, 10865),
(205, 205, 21, 66, 6601),
(206, 206, 29, 71, 7142),
(207, 207, 13, 76, 7673),
(208, 208, 12, 76, 7647),
(209, 209, 9, 63, 6377),
(210, 210, 29, 23, 2342),
(211, 211, 28, 62, 6213),
(212, 212, 1, 58, 5824),
(213, 213, 6, 85, 8553),
(214, 214, 28, 34, 3440),
(215, 215, 3, 10, 10381),
(216, 216, 2, 55, 5557),
(217, 217, 5, 79, 799),
(218, 218, 28, 43, 432),
(219, 219, 30, 48, 488),
(220, 220, 23, 90, 9020),
(221, 221, 29, 26, 2659),
(222, 222, 12, 10, 10847),
(223, 223, 1, 53, 5320),
(224, 224, 18, 11, 11643),
(225, 225, 21, 16, 1634),
(226, 226, 14, 21, 2157),
(227, 227, 20, 38, 3847),
(228, 228, 19, 11, 11667),
(229, 229, 23, 17, 175),
(230, 230, 20, 43, 4310),
(231, 231, 16, 20, 2096),
(232, 232, 15, 83, 8392),
(233, 233, 15, 98, 9853),
(234, 234, 23, 85, 8581),
(235, 235, 3, 91, 919),
(236, 236, 18, 30, 3056),
(237, 237, 21, 11, 11583),
(238, 238, 30, 76, 7621),
(239, 239, 18, 46, 4659),
(240, 240, 16, 98, 9880),
(241, 241, 1, 22, 22),
(242, 242, 20, 69, 6962),
(243, 243, 7, 49, 4946),
(244, 244, 9, 18, 1836),
(245, 245, 5, 79, 7951),
(246, 246, 8, 37, 3711),
(247, 247, 20, 66, 6665),
(248, 248, 27, 37, 3752),
(249, 249, 6, 23, 2348),
(250, 250, 19, 90, 9019),
(251, 251, 3, 23, 2325),
(252, 252, 20, 47, 4708),
(253, 253, 1, 41, 4191),
(254, 254, 6, 26, 2601),
(255, 255, 15, 98, 9886),
(256, 256, 25, 41, 4170),
(257, 257, 28, 34, 3460),
(258, 258, 10, 55, 5535),
(259, 259, 2, 75, 7577),
(260, 260, 8, 58, 5812),
(261, 261, 12, 22, 2284),
(262, 262, 10, 55, 5569),
(263, 263, 16, 58, 5876),
(264, 264, 4, 10, 10350),
(265, 265, 3, 18, 189),
(266, 266, 13, 80, 8004),
(267, 267, 4, 18, 1872),
(268, 268, 29, 11, 1129),
(269, 269, 17, 15, 1572),
(270, 270, 24, 88, 8842),
(271, 271, 29, 10, 10197),
(272, 272, 1, 77, 7700),
(273, 273, 29, 48, 4861),
(274, 274, 22, 61, 6136),
(275, 275, 27, 98, 9872),
(276, 276, 11, 97, 9717),
(277, 277, 25, 91, 9150),
(278, 278, 18, 54, 5446),
(279, 279, 17, 11, 11610),
(280, 280, 24, 76, 768),
(281, 281, 28, 87, 8777),
(282, 282, 12, 55, 5507),
(283, 283, 25, 78, 7841),
(284, 284, 2, 11, 11649),
(285, 285, 22, 70, 70),
(286, 286, 20, 47, 4703),
(287, 287, 13, 24, 2411),
(288, 288, 11, 29, 2953),
(289, 289, 7, 33, 3382),
(290, 290, 14, 10, 10005),
(291, 291, 3, 81, 8130),
(292, 292, 2, 96, 9625),
(293, 293, 30, 50, 5068),
(294, 294, 12, 68, 6851),
(295, 295, 10, 11, 11230),
(296, 296, 24, 10, 10556),
(297, 297, 16, 48, 4836),
(298, 298, 14, 41, 4114),
(299, 299, 11, 78, 7809),
(300, 300, 10, 16, 1682);
 
 INSERT INTO Ubicaciones (ID_Ubicación, ID_Usuario, Dirección, Ciudad, País) VALUES
(1, 8, '75813 Rowland Drive', 'Söderhamn', 'Sweden'),
(2, 8, '70 Crest Line Center', 'Mamu', 'China'),
(3, 38, '451 Old Shore Road', 'Gondar', 'Ethiopia'),
(4, 25, '01 Ridgeview Street', 'Benoy', 'Chad'),
(5, 4, '089 Ludington Circle', 'Denton', 'United States'),
(6, 29, '1 Stone Corner Circle', 'Paris 19', 'France'),
(7, 33, '1 Nobel Place', 'Manoc-Manoc', 'Philippines'),
(8, 76, '14576 1st Avenue', 'Parenggan', 'Indonesia'),
(9, 22, '68868 Lindbergh Terrace', 'Asempapan', 'Indonesia'),
(10, 29, '4 Banding Pass', 'Oklahoma City', 'United States'),
(11, 95, '19091 Pine View Center', 'Venlo', 'Netherlands'),
(12, 30, '39 Bayside Drive', 'Nizhnyaya Tura', 'Russia'),
(13, 12, '1538 Randy Road', 'Kasembon', 'Indonesia'),
(14, 73, '00 Truax Street', 'Balingoan', 'Philippines'),
(15, 82, '2916 Pleasure Point', 'Mayo', 'Thailand'),
(16, 9, '3783 Columbus Crossing', 'Pengembur Dua', 'Indonesia'),
(17, 4, '78 International Hill', 'Gjirokastër', 'Albania'),
(18, 80, '9595 Center Pass', 'Tornio', 'Finland'),
(19, 23, '737 Eastwood Pass', 'Hörby', 'Sweden'),
(20, 16, '0068 Kings Point', 'Trelleborg', 'Sweden'),
(21, 22, '35187 Thierer Place', 'Sruki', 'Indonesia'),
(22, 96, '37743 Hallows Junction', 'Mocun', 'China'),
(23, 59, '22 Waywood Way', 'Nizhniy Kislyay', 'Russia'),
(24, 82, '0 Mayer Center', 'Sakhipur', 'Bangladesh'),
(25, 4, '1 New Castle Hill', 'Dolores', 'Philippines'),
(26, 34, '761 Eggendart Avenue', 'Ouricuri', 'Brazil'),
(27, 69, '85134 Barnett Hill', 'Ibirataia', 'Brazil'),
(28, 84, '1021 Graceland Junction', 'Ciputih', 'Indonesia'),
(29, 33, '7 Anzinger Street', 'Nanyanchuan', 'China'),
(30, 36, '5721 Quincy Way', 'Zafarwāl', 'Pakistan'),
(31, 5, '25041 Old Shore Junction', 'Hofors', 'Sweden'),
(32, 100, '05390 Nobel Court', 'Jiulian', 'China'),
(33, 47, '4 Sloan Drive', 'Străşeni', 'Moldova'),
(34, 27, '2 Village Green Park', 'São Bartolomeu', 'Portugal'),
(35, 82, '624 Sullivan Road', 'Belūsovka', 'Kazakhstan'),
(36, 70, '76 Sherman Center', 'Mpumalanga', 'South Africa'),
(37, 10, '484 Lakewood Gardens Hill', 'Višňova', 'Czech Republic'),
(38, 52, '53947 Roxbury Plaza', 'Maputsoe', 'Lesotho'),
(39, 82, '29223 Cambridge Park', 'Meiqi', 'China'),
(40, 43, '04 Prentice Place', 'Nanmu', 'China'),
(41, 95, '9 Northview Terrace', 'Santuario', 'Colombia'),
(42, 15, '4 Nova Alley', 'Jinsha', 'China'),
(43, 2, '2969 Lerdahl Place', 'Zhangxi', 'China'),
(44, 41, '5260 Golf View Junction', 'Yunluo', 'China'),
(45, 65, '54 Golf Way', 'Liulang', 'China'),
(46, 10, '69681 Spaight Crossing', 'Paradela', 'Portugal'),
(47, 53, '28743 Sauthoff Court', 'Lahān', 'Nepal'),
(48, 38, '6894 Ilene Plaza', 'Yuhuazhai', 'China'),
(49, 17, '0 Red Cloud Center', 'Baños', 'Ecuador'),
(50, 29, '6 Pond Road', 'Ginatilan', 'Philippines'),
(51, 19, '2 Surrey Plaza', 'Barroco', 'Portugal'),
(52, 79, '366 Debra Lane', 'Santiago', 'Philippines'),
(53, 60, '1 Green Ridge Hill', 'Megati Kelod', 'Indonesia'),
(54, 77, '62678 Graedel Pass', 'Walahir', 'Indonesia'),
(55, 21, '8766 Manley Plaza', 'Huta Stara B', 'Poland'),
(56, 24, '973 Menomonie Junction', 'Salaspils', 'Latvia'),
(57, 46, '55 Londonderry Pass', 'Ostashkov', 'Russia'),
(58, 81, '9841 5th Drive', 'Milwaukee', 'United States'),
(59, 94, '3326 Warbler Lane', 'Pedro Santana', 'Dominican Republic'),
(60, 12, '33130 Lighthouse Bay Crossing', 'Būrkah', 'Afghanistan'),
(61, 57, '3379 Kensington Plaza', 'Nice', 'France'),
(62, 49, '602 Mifflin Crossing', 'Göteborg', 'Sweden'),
(63, 80, '19 Jay Pass', 'Baitang', 'China'),
(64, 21, '250 Talisman Hill', 'Oslo', 'Norway'),
(65, 50, '658 Gina Lane', 'Broniszewice', 'Poland'),
(66, 96, '02 Village Trail', 'El Chol', 'Guatemala'),
(67, 66, '46863 Memorial Parkway', 'Triolet', 'Mauritius'),
(68, 78, '89 Bashford Junction', 'Saint-Jean-de-Védas', 'France'),
(69, 97, '8 Union Crossing', 'Cibatu', 'Indonesia'),
(70, 85, '729 Knutson Plaza', 'Jianghong', 'China'),
(71, 79, '6 Carey Plaza', 'Gayam', 'Indonesia'),
(72, 37, '44 Sauthoff Center', 'San Luis', 'Guatemala'),
(73, 62, '39 Loftsgordon Park', 'Kota Bharu', 'Malaysia'),
(74, 52, '6864 Meadow Ridge Terrace', 'Campo Formoso', 'Brazil'),
(75, 35, '9344 Graedel Trail', 'Goúrnes', 'Greece'),
(76, 54, '02029 Prairieview Parkway', 'Huzhen', 'China'),
(77, 54, '636 Superior Drive', 'Rattanaburi', 'Thailand'),
(78, 67, '788 Welch Drive', 'Lyubar', 'Ukraine'),
(79, 65, '00501 International Street', 'Punta Gorda', 'Belize'),
(80, 45, '01182 Gina Road', 'Bubanza', 'Burundi'),
(81, 28, '80049 Upham Court', 'Novovasylivka', 'Ukraine'),
(82, 36, '2004 Fairview Pass', 'Peña', 'Philippines'),
(83, 6, '085 Spohn Avenue', 'Amga', 'Russia'),
(84, 52, '15589 Sloan Crossing', 'Itapemirim', 'Brazil'),
(85, 55, '6 Sundown Terrace', 'Nishi-Tokyo-shi', 'Japan'),
(86, 96, '67818 Norway Maple Crossing', 'Bhāndāria', 'Bangladesh'),
(87, 25, '08092 Troy Court', 'Lukulu', 'Zambia'),
(88, 72, '86508 Service Point', 'Sukogunungkrajan', 'Indonesia'),
(89, 97, '6 Scott Drive', 'Partille', 'Sweden'),
(90, 31, '64967 Gale Terrace', 'Tongqiao', 'China'),
(91, 39, '949 Jay Park', 'Severskaya', 'Russia'),
(92, 19, '136 Commercial Plaza', 'Morelos', 'Mexico'),
(93, 15, '3 Thompson Avenue', 'Bambuí', 'Brazil'),
(94, 70, '5998 Kropf Lane', 'Cailaco', 'East Timor'),
(95, 60, '303 Blaine Parkway', 'Warszawa', 'Poland'),
(96, 8, '1 Logan Center', 'Changqing', 'China'),
(97, 36, '773 Ramsey Lane', 'Tyresö', 'Sweden'),
(98, 14, '62 Oak Valley Lane', 'Citeureup', 'Indonesia'),
(99, 44, '88368 Kim Court', 'El Bolsón', 'Argentina'),
(100, 39, '353 Kennedy Hill', 'Grosseto', 'Italy');

-- creaciones de vistas
USE ventas_ecommerce;
CREATE VIEW vista_ordenes_completas AS
SELECT o.ID_Orden, u.Nombre AS Nombre_Usuario, o.Fecha_Orden, o.Estado_Orden, o.Total_Orden
FROM Órdenes o
JOIN Usuarios u ON o.ID_Usuario = u.ID_Usuario;


USE ventas_ecommerce;
CREATE VIEW vista_productos_con_categorias AS
SELECT p.ID_Producto, p.Nombre_Producto, p.Descripción, p.Precio, p.Stock, c.Nombre_Categoría
FROM Productos p
JOIN Categorías c ON p.ID_Categoría = c.ID_Categoría;

USE ventas_ecommerce;
CREATE VIEW vista_productos_stock_bajo AS
SELECT
p.ID_Producto,
p.Nombre_Producto,
p.Stock,
c.Nombre_Categoría
FROM
Productos p
JOIN
Categorías c ON p.ID_Categoría = c.ID_Categoría
WHERE
p.Stock <= 20;




USE ventas_ecommerce;
CREATE VIEW vista_ingresos_por_mes AS
SELECT YEAR(o.Fecha_Orden) AS Año, MONTH(o.Fecha_Orden) AS Mes, SUM(o.Total_Orden) AS Ingresos
FROM Órdenes o
GROUP BY YEAR(o.Fecha_Orden), MONTH(o.Fecha_Orden)
ORDER BY Año, Mes;

USE ventas_ecommerce;
CREATE VIEW vista_productos_ventas AS
SELECT 
    p.ID_Producto,
    p.Nombre_Producto,
    p.Precio,
    SUM(do.Cantidad) AS Cantidad_Vendida,
    SUM(do.Cantidad * do.Precio_Unitario) AS Ingresos_Generados
FROM 
    Productos p
JOIN 
    Detalles_Orden do ON p.ID_Producto = do.ID_Producto
GROUP BY 
    p.ID_Producto, p.Nombre_Producto, p.Precio;


-- creacion de triggers
DELIMITER //
CREATE TRIGGER actualizar_total_orden_despues_insert
AFTER INSERT ON Detalles_Orden
FOR EACH ROW
BEGIN
    DECLARE nuevo_total DECIMAL(10,2);
    SELECT calcular_total_orden(NEW.ID_Orden) INTO nuevo_total;
    UPDATE Órdenes
    SET Total_Orden = nuevo_total
    WHERE ID_Orden = NEW.ID_Orden;
END//
DELIMITER ;

DELIMITER //
CREATE TRIGGER disminuir_stock_producto_despues_insert
AFTER INSERT ON Detalles_Orden
FOR EACH ROW
BEGIN
    UPDATE Productos
    SET Stock = Stock - NEW.Cantidad
    WHERE ID_Producto = NEW.ID_Producto;
END//vista_ingresos_por_mes
DELIMITER ;

-- creacion de funciones 
DELIMITER //

CREATE DEFINER=`root`@`localhost` FUNCTION `calcular_total_ordenes_usuario`(p_id_usuario INT) RETURNS DECIMAL(10, 2)
DETERMINISTIC
BEGIN
    DECLARE total_ordenes DECIMAL(10, 2);
    
    -- Suma el total de todas las órdenes para el usuario especificado
    SELECT SUM(Total_Orden) INTO total_ordenes
    FROM Órdenes
    WHERE ID_Usuario = p_id_usuario;
    
    -- Devuelve el resultado
    RETURN total_ordenes;
END //

DELIMITER ;


DELIMITER //
CREATE FUNCTION calcular_total_orden(p_id_orden INT)
RETURNS DECIMAL(10, 2)
DETERMINISTIC
BEGIN
    DECLARE v_total DECIMAL(10, 2);
    SELECT SUM(Cantidad * Precio_Unitario) INTO v_total
    FROM Detalles_Orden
    WHERE ID_Orden = p_id_orden;
    RETURN v_total;
END //
DELIMITER ;

DELIMITER //

-- stored procedures
-- CREATE DEFINER=`root`@`localhost` PROCEDURE `agregar_nuevo_producto`(
    -- IN p_nombre_producto VARCHAR(50), 
    -- IN p_descripcion TEXT, 
    -- IN p_precio DECIMAL(10, 2), 
    -- IN p_stock INT,
    -- IN p_id_categoria INT
-- )
-- BEGIN
    -- INSERT INTO Productos (Nombre_Producto, Descripción, Precio, Stock, ID_Categoría)
    -- VALUES (p_nombre_producto, p_descripcion, p_precio, p_stock, p_id_categoria);
-- END 

-- CREATE DEFINER=`root`@`localhost` PROCEDURE `get_productos_por_categoria`(id_categoria INT)
-- BEGIN
   -- SELECT ID_Producto, Nombre_Producto, Descripción, Precio, Stock
    -- FROM Productos
    -- WHERE ID_Categoría = id_categoria;
-- END


-- usando el stored agregar_nuevo_producto
CALL agregar_nuevo_producto('Audífonos Bluetooth', 'Audífonos inalámbricos con cancelación de ruido', 85.50, 250, 1);

-- usando la funcion calcular_total_ordenes_usuarios
SELECT calcular_total_ordenes_usuario(1);

-- usando el stored get_productos_por_categorias 
CALL get_productos_por_categoria(1);

-- usando la vista_ingresos_por_mes
SELECT * FROM vista_ingresos_por_mes;


-- consultas directas desde sql
-- Obtener los productos más vendidos:
USE ventas_ecommerce;
SELECT
    Nombre_Categoría,
    Nombre_Producto,
    Total_Vendido
FROM (
    SELECT
        c.Nombre_Categoría,
        p.Nombre_Producto,
        SUM(do.Cantidad) AS Total_Vendido,
        ROW_NUMBER() OVER(PARTITION BY c.ID_Categoría ORDER BY SUM(do.Cantidad) DESC) AS ranking
    FROM
        Categorías c
    JOIN
        Productos p ON c.ID_Categoría = p.ID_Categoría
    JOIN
        Detalles_Orden do ON p.ID_Producto = do.ID_Producto
    GROUP BY
        c.ID_Categoría, c.Nombre_Categoría, p.Nombre_Producto
) AS top_productos
WHERE ranking = 1;


-- Calcular el valor total de inventario por categoría:
USE ventas_ecommerce;
SELECT 
    c.Nombre_Categoría,
    SUM(p.Precio * p.Stock) AS Valor_Total_Inventario
FROM 
    Categorías c
JOIN 
    Productos p ON c.ID_Categoría = p.ID_Categoría
GROUP BY 
    c.Nombre_Categoría
ORDER BY
    Valor_Total_Inventario DESC;
    
-- Encontrar a los usuarios que han gastado más:
USE ventas_ecommerce;
SELECT
    u.Nombre,
    SUM(o.Total_Orden) AS Gasto_Total
FROM
    Usuarios u
JOIN
    Órdenes o ON u.ID_Usuario = o.ID_Usuario
GROUP BY
    u.Nombre
ORDER BY
    Gasto_Total DESC;
    
-- Ver el estado de las órdenes y los productos comprados por usuario
USE ventas_ecommerce;
SELECT
    u.Nombre AS Nombre_Usuario,
    o.ID_Orden,
    o.Fecha_Orden,
    o.Estado_Orden,
    p.Nombre_Producto,
    do.Cantidad
FROM
    Usuarios u
JOIN
    Órdenes o ON u.ID_Usuario = o.ID_Usuario
JOIN
    Detalles_Orden do ON o.ID_Orden = do.ID_Orden
JOIN
    Productos p ON do.ID_Producto = p.ID_Producto
ORDER BY
    o.ID_Orden DESC, p.Nombre_Producto;
    

-- Encuentra las categorías con un valor de inventario total superior a 1000000
USE ventas_ecommerce;
SELECT 
    c.Nombre_Categoría,
    SUM(p.Precio * p.Stock) AS Valor_Total_Inventario
FROM 
    Categorías c
JOIN 
    Productos p ON c.ID_Categoría = p.ID_Categoría
GROUP BY 
    c.Nombre_Categoría
HAVING 
    Valor_Total_Inventario > 1000000;

-- Encuentra a los clientes que han realizado más de 5 órdenes
USE ventas_ecommerce;
SELECT
    u.Nombre,
    COUNT(o.ID_Orden) AS Numero_Ordenes
FROM
    Usuarios u
JOIN
    Órdenes o ON u.ID_Usuario = o.ID_Usuario
GROUP BY
    u.Nombre
HAVING
    Numero_Ordenes > 5
ORDER BY
    Numero_Ordenes DESC;


-- Consultas para encontrar el ingreso promedio por orden
USE ventas_ecommerce;
SELECT
    AVG(Total_Orden) AS Ingreso_Promedio_Por_Orden
FROM
    Órdenes;


-- Categoriza los productos en 'Alto Stock', 'Stock Medio' y 'Bajo Stock'
USE ventas_ecommerce;
SELECT
    Nombre_Producto,
    Stock,
    CASE
        WHEN Stock >= 100 THEN 'Alto Stock'
        WHEN Stock BETWEEN 20 AND 99 THEN 'Stock Medio'
        ELSE 'Bajo Stock'
    END AS Nivel_Stock
FROM
    Productos
ORDER BY
    Stock DESC;