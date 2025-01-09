CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1),
	[UserName] [nvarchar](50) PRIMARY KEY NOT NULL ,
	[FullName] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[RoleID] [int] NOT NULL,
	[Image] [nvarchar](50) NULL,
	[Email] [nvarchar](50)  NULL,
	[BirthDay] date NOT NULL,
	[Address] [nvarchar](200) NULL,
	[Phone] [nvarchar](11) NOT NULL,
	[status] bit NOT NULL
)

INSERT INTO [dbo].[Users] ([UserName], [FullName], [Password], [Address],[Image], [Email], [BirthDay], [Phone], [RoleID], [status]) VALUES 
	('PThao', N'Admin', '123', N'Thường Tín, Hà Nội', 'images/users/me.png', 'thaonguyen1142004@gmail.com', '2004-11-04', '0981281791', 1, 1);
INSERT INTO [dbo].[Users] ([UserName], [FullName], [Password], [Address],[Image], [Email], [BirthDay], [Phone], [RoleID], [status]) VALUES 
	('user1', N'User1', '123', N'456 Oak St, CityB', 'images/users/none.jpg', 'user1@gmail.com', '1995-02-15', '9876543210', 2, 1);
INSERT INTO [dbo].[Users] ([UserName], [FullName], [Password], [Address],[Image], [Email], [BirthDay], [Phone], [RoleID], [status]) VALUES 
    ('user2', N'User2', '123', N'789 Pine St, CityC', 'images/users/none.jpg', 'user2@gmail.com', '1990-07-22', '1239874560', 2, 1);
INSERT INTO [dbo].[Users] ([UserName], [FullName], [Password], [Address],[Image], [Email], [BirthDay], [Phone], [RoleID], [status]) VALUES 
    ('user3', N'User3', '123', N'Thạch Thất, Hà Nội', 'images/users/none.jpg', 'user3@gmail.com', '1988-11-30', '6543217890', 2, 1);

-- Tạo bảng Categories
CREATE TABLE [dbo].[Categories](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](15) NOT NULL,
	[Description] [ntext] NULL,
	CONSTRAINT [PK_Categories] PRIMARY KEY([CategoryID])
)

insert into Categories(CategoryName, [Description]) values
(N'Son Kem', N'Có kết cấu dạng lỏng, lên màu đậm, khô nhanh');
insert into Categories(CategoryName, [Description]) values
(N'Son thỏi', N'có dạng thỏi cứng, dễ sử dụng và lên màu rõ nét');
insert into Categories(CategoryName, [Description]) values
(N'Son bóng', N'Dạng lỏng hoặc gel, tạo hiệu ứng bóng và căng mọng cho môi');
insert into Categories(CategoryName, [Description]) values
(N'Son dưỡng', N'Chủ yếu dùng để dưỡng ẩm và bảo vệ môi khỏi khô nẻ');
insert into Categories(CategoryName, [Description]) values
(N'Son lì', N'Có kết cấu lì, không bóng, lên màu rất chuẩn và giữ màu lâu');
insert into Categories(CategoryName, [Description]) values
(N'Son tint', N'Dạng son nước, tạo hiệu ứng màu tự nhiên, nhẹ nhàng và thấm vào môi');
insert into Categories(CategoryName, [Description]) values
(N'Son gió', N'Khi thoa lên môi, màu son sẽ thay đổi tùy theo nhiệt độ và độ pH của môi, tạo ra màu sắc riêng biệt cho từng người');

CREATE TABLE [dbo].[Suppliers](
	[SupplierID] [int] IDENTITY(1,1) NOT NULL,
	[CompanyName] [nvarchar](40) NOT NULL,
	[ContactName] [nvarchar](50) NULL,
	[Country] [nvarchar](50) NULL,
	[Phone] [nvarchar](24) NULL,
	[HomePage] [ntext] NULL,
	CONSTRAINT [PK_Suppliers] PRIMARY KEY([SupplierID])
)

insert into Suppliers(CompanyName, ContactName, Country, Phone, HomePage) values
('3CE', '3CE STYLENANDA', N'Hàn Quốc','+82-2-335-5274', 'https://www.stylenanda.com');
insert into Suppliers(CompanyName, ContactName, Country, Phone, HomePage) values
('Black Rouge','Black Rouge Vietnam', N'Hàn Quốc', '02-6083-1030', 'https://blackrouge.vn');
insert into Suppliers(CompanyName, ContactName, Country, Phone, HomePage) values
('M·A·C','M A C Cosmetics', N'Canada', '1-800-588-0070', 'https://www.maccosmetics.com/');
insert into Suppliers(CompanyName, ContactName, Country, Phone, HomePage) values
('romand','rom&nd', N'Hàn Quốc', '+82-31-789-3850', 'https://romand.us/');
insert into Suppliers(CompanyName, ContactName, Country, Phone, HomePage) values
(N'Cỏ mềm',N'Cỏ mềm Homelab', N'Việt Nam', '0968622511', 'https://comem.vn/');

CREATE TABLE [dbo].[Products](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](100) NOT NULL,
	[SupplierID] [int] NULL,
	[CategoryID] [int] NULL,
	[UnitPrice] [money] NULL,
	[UnitsInStock] [smallint] NULL,
	[QuantitySold] [int] NULL,
	[StarRating] float NULL,
	[image] [nvarchar](max) NULL,
	[describe] [nvarchar](max) NULL,
	[releaseDate] [date] NULL,
	[status] bit Not null,
	CONSTRAINT [PK_Products] PRIMARY KEY([ProductID]),
	CONSTRAINT [FK_Products_Supplier]
    FOREIGN KEY ([SupplierID])
    REFERENCES [dbo].[Suppliers] ([SupplierID]) ON DELETE SET NULL ON UPDATE CASCADE,
	CONSTRAINT [FK_Products_Category] 
    FOREIGN KEY ([CategoryID])
    REFERENCES [dbo].[Categories] ([CategoryID]) 
)

insert into Products(ProductName, SupplierID, CategoryID, UnitPrice, UnitsInStock, QuantitySold, 
StarRating, [image], describe, releaseDate, [status]) values
(N'Son Kem 3CE Cho Viền Môi Mờ Ảo Không Lem Khi Đeo Khẩu Trang 3CE Blur Water Tint 4.6g', 1, 1, 
318750, 100, 10, 5, 'images/products/p1.jpg', N'Son 3CE Blur Water Tint
  Trơn mịn, mọng nước ngay từ lớp son đầu tiên, thỏi son tint dạng nước này cho bạn một làn môi mềm mại, căng mọng, đầy vẻ hờn dỗi nũng nịu.
  CÔNG THỨC GEL MỀM MẠI NHƯ NƯỚC
  Chất gel mềm mại, dưỡng ẩm nhẹ nhàng, có khả năng bám màu cực tốt, cho lớp nền môi mịn màng, ẩm mượt mà bạn chưa từng trải nghiệm trước đây.
  CHO NỀN MÔI MỜ ẢO
  Thỏi son tint này được bổ sung thêm một lớp kem lót nhẹ, mang đến cho bạn làn môi mềm mịn với độ che phủ đáng ngạc nhiên.
  CẢM GIÁC THOẢI MÁI & NHẸ NHÀNG
  Thỏi son có công thức chống thấm giúp đôi môi mịn nhẹ và thoải mái cả ngày dài, không gây bết dính dù bạn đeo khẩu trang',
  '2024-03-04', 1
);

insert into Products(ProductName, SupplierID, CategoryID, UnitPrice, UnitsInStock, QuantitySold, 
StarRating, [image], describe, releaseDate, [status]) values
(N'Son Kem Lì 3CE Mịn Màng Như Nhung 3CE Velvet Lip Tint 4g | Official Store Lip Make up Cosmetic', 1, 5, 
375000, 150, 20, 5, 'images/products/p2.jpg', N'Trọng lượng tịnh: 4g
  Cách sử dụng: Lấy một lượng nhỏ son môi và thoa nhẹ nhàng lên môi.
  Hạn sử dụng: 30 tháng kể từ ngày sản xuất, 12 tháng sau khi mở.
  Sản xuất tại: Hàn Quốc
  Nhà phân phối và sản xuất: Nanda Inc. / C&C International Co., Ltd.',
  '2023-04-04', 1
);

insert into Products(ProductName, SupplierID, CategoryID, UnitPrice, UnitsInStock, QuantitySold, 
StarRating, [image], describe, releaseDate, [status]) values
(N'Son môi 3CE Hazy Lip Clay 4g trang điểm siêu lì mịn l Official Store Lip Make up Cosmetic', 1, 5, 
371450, 170, 15, 4.5, 'images/products/p3.jpg', N'  Do chênh lệch cài đặt ánh sáng và màn hình, màu sắc sản phẩm có thể hơi khác so với hình ảnh..
  Bạn có thể tham khảo bảng màu để nắm rõ hơn về màu sắc.',
  '2024-05-06', 1
);

insert into Products(ProductName, SupplierID, CategoryID, UnitPrice, UnitsInStock, QuantitySold, 
StarRating, [image], describe, releaseDate, [status]) values
(N'3CE Matte Lip Color Son thỏi 3CE mịn lì 3.5g', 1, 2, 
344500, 150, 20, 4.9, 'images/products/p4.jpg', N'
  Lưu ý khi sử dụng: 
  1) Nếu bạn gặp các triệu chứng sau trong hoặc sau khi sử dụng, vui lòng tạm ngừng sử dụng và hỏi ý kiến bác sĩ: đốm đỏ, sưng tấy, ngứa ngáy hoặc bất kỳ tác dụng phụ nào khác. 
  2) Không sử dụng sản phẩm trên vết thương hoặc bất kỳ vùng da nào bị kích ứng. 
  3) Các lưu ý về bảo quản 
  a. Để xa tầm tay trẻ em. 
  b. Tránh ánh nắng trực tiếp.',
  '2023-12-07', 1
);

insert into Products(ProductName, SupplierID, CategoryID, UnitPrice, UnitsInStock, QuantitySold, 
StarRating, [image], describe, releaseDate, [status]) values
(N'Son Kem Black Rouge Air Fit Velvet Tint Ver 2', 2, 1, 
178000, 120, 3, 4.6, 'images/products/p5.jpg', N'Son Kem Black Rouge Air Fit Velvet Tint Ver 2 với chất son nhẹ tênh, giúp bạn hạn chế tối đa tình trạng khô môi. 
Son lên chuẩn sắc và giữ màu đến 8 tiếng và có một lớp base hồng nhẹ giúp môi luôn có sức sống. Thiết kế thân vuông đặc trưng của thương hiệu Black Rouge với logo được in hologram óng ánh sang trọng.',
  '2024-10-15', 1
);

insert into Products(ProductName, SupplierID, CategoryID, UnitPrice, UnitsInStock, QuantitySold, 
StarRating, [image], describe, releaseDate, [status]) values
(N'Son dưỡng thuần chay có màu Ripplesh Jelly Balm 20.9g', 2, 4, 
157080, 200, 25, 4.8, 'images/products/p6.jpg', N'
Thành phần dưỡng ẩm có nguồn gốc thực vật chứa collagen
Giúp phục hồi, tái tạo tế bào da môi
Nâng cao khả năng thẩm thấu, hấp thụ dưỡng chất của môi
Góp phần loại bỏ tế bào chết một cách dịu nhẹ
Tăng cường hiệu quả dưỡng môi   
Chứa Axit hyaluronic cấp nước, cấp ẩm cho môi
Chất son melting balm đặc trưng tan chảy ở nhiệt độ da tạo độ bóng mượt
Chất son bóng mọng nước lấp lánh và trong suốt, bám dính tức thì ngay sau khi thoa',
'2023-11-07', 1
);

insert into Products(ProductName, SupplierID, CategoryID, UnitPrice, UnitsInStock, QuantitySold, 
StarRating, [image], describe, releaseDate, [status]) values
(N'MAC MACXIMAL Matte Lipstick 3.5g son thỏi lì biểu tượng cải tiến vượt trội, mịn lì, thoải mái', 3, 5, 
680000, 200, 25, 4.9, 'images/products/p7.jpg', N'
Dòng son biểu tượng của M.A.C. đã được CẢI TIẾN, không chỉ tạo hiệu ứng lì cho môi mà giờ đây còn mịn màng hơn với công thức dưỡng môi được cải tiến giúp đôi môi căng đầy hơn, bền màu hơn và nhiều dưỡng hơn. Với M.A.Cximal, bạn sẽ được trải nghiệm chất son ĐỘC BẢN với 40 màu được các chuyên gia trang điểm toàn thế giới ưa chuộng. Cảm giác mịn lì ĐỘC BẢN được tạo thành từ các nguyên liệu từ thiên nhiên như dầu dừa, bơ hạt mỡ hữu cơ giúp tăng cường độ ẩm cho đôi môi dễ chịu cả ngày ngay từ lần quệt đầu tiên. Độ bền màu 12 giờ ĐỘC BẢN giúp đôi môi căng đầy trong mọi hoàn cảnh. Thiết kế hình viên đạn phủ bóng ĐỘC BẢN sang chảnh nhưng thân thiện với môi trường khi hơn 30% bao bì sử dụng nhựa tái chế. Và cuối cùng, M.A.C. vẫn giữ nguyên mùi hương Vani ĐỘC BẢN yêu thích của các M.A.C. Lovers. ',
'2024-05-07', 1
);

insert into Products(ProductName, SupplierID, CategoryID, UnitPrice, UnitsInStock, QuantitySold, 
StarRating, [image], describe, releaseDate, [status]) values
(N'[Rom&nd] [Muteral Nude] Son thỏi lì, lên màu siêu xinh Hàn Quốc Romand Zero Matte Lipstick 3g', 4, 5, 
152000, 218, 11, 4.8, 'images/products/p8.jpg', 
N'THÔNG TIN SẢN PHẨM

-  Muteral Nude dịu nhẹ dưới nắng thu, được pha trộn hài hòa màu sắc và giảm ánh trắng để tạo nên độ trung tính vừa dịu dàng, vừa quyến rũ ngay từ ánh nhìn đầu tiên.

-  Màu nude tự nhiên có thể sử dụng trên mặt mộc, mà hoàn toàn không lo hiện tượng bợt tái da.

-  Lớp son nhẹ như vô hình, nhưng màu son vẫn rõ nét. Kết hợp cùng chất phấn cao cấp mịn màn, dễ tán trên môi, đồng thời không để lại vụn phấn. Đôi môi được che phủ khuyết điểm tuyệt vời với lớp son mềm mại và bột phấn siêu mịn.

-  Đặc biệt, phiên bản lần này được nghiên cứu kỹ lưỡng từ đội ngũ chuyên gia Hàn Quốc để tạo ra sự pha trộn giữa lớp phấn lì mịn và lượng dầu dưỡng thích hợp giúp cho độ bám hoàn hảo ngay khi apply. Bám trên môi hoàn hảo, không phai nhiều ra tay và để lại lớp dầu dưỡng cho đôi môi căng mướt. Phù hợp với các bạn nữ có đôi môi khô.', 
'2024-08-05', 1
);

insert into Products(ProductName, SupplierID, CategoryID, UnitPrice, UnitsInStock, QuantitySold, 
StarRating, [image], describe, releaseDate, [status]) values
(N'Son tint bóng, siêu lì cho đôi môi căng mọng Hàn Quốc Romand Dewyful Water Tint 5g', 4, 6, 
189000, 211, 14, 4.7, 'images/products/p9.jpg', 
N'THÔNG TIN SẢN PHẨM

- Khác với Juicy Lasting Tint, dòng son bóng này được biết tới với lớp bóng trong suốt tách biệt với lớp tint, tạo cảm giác lớp bóng trong suốt như nước.

- Màu nude nhẹ nhàng, giảm ánh trắng giúp phù hợp trang điểm  cùng chất son trong trẻo.





- Màu skin nude lên môi không hề có cảm giác bị dày môi, mà khá nữ tính, nhẹ nhàng. Stain màu dễ dàng tẩy với nước tẩy trang. Son nước cho đôi môi mướt mịn, che phủ khuyết điểm cho môi

- Về thiết kế: Thân son có thiết kế vuông dài, cầm chắc tay, tiện lợi mang theo bên mình bất cứ đâu. Bao bì vỏ son có màu trắng đơn giản nhưng vô cùng tinh tế phía trên vỏ là dòng chữ Dewyful được in nổi bật, nắp vỏ son và màu thân son đồng màu với màu sản phẩm bên trong giúp bạn dễ dàng quan sát lựa chọn cho mình màu son thích hợp nhất.

- Dù có thao tác đánh nhiều lớp, son vẫn duy trì độ trong trẻo, với một màu son bạn thử đánh 2 lớp, 3 lớp để tạo ra những phong cách khác nhau nhé.

- Lớp son thứ nhất mang đến lớp bóng mỏng, sắc hồng xinh nhẹ nhàng cho đôi môi

- Lớp thứ hai giúp đôi môi tràn đầy sức sống và rạng rỡ hơn với lớp bóng sáng.

- Lớp thứ ba mang đến độ bóng căng mọng như sương mai, vẫn duy trì được độ bóng của môi son những vẫn không làm môi quá dày

- Lớp bóng Dewy nhẹ nhàng và trong trẻo ngay từ lần quẹt đầu tiên. Lớp bóng nhẹ, không dính, hoàn hảo ở mọi góc độ. Lớp bóng không bị "phá vỡ" dù có bặm môi nhiều lần', 
'2024-09-06', 1
);

insert into Products(ProductName, SupplierID, CategoryID, UnitPrice, UnitsInStock, QuantitySold, 
StarRating, [image], describe, releaseDate, [status]) values
(N'Son dưỡng môi Nhiên Cỏ Mềm chứa Maxilip giúp dưỡng ẩm giảm nếp nhăn và ngừa lão hoá môi 3g', 5, 4, 
180000, 211, 11, 4.8, 'images/products/p10.jpg', 
N'THÔNG TIN SẢN PHẨM
Son dưỡng Nhiên - dòng son dưỡng mới trong bộ sưu tập nhà Cỏ Mềm với công dụng vượt trội trong việc dưỡng ẩm, làm mềm môi, ngăn ngừa và cải thiện tình trạng môi thâm, nứt nẻ, nhăn môi, ngừa lão hóa cho môi. Sản phẩm phù hợp với cả những đôi môi nhạy cảm.', 
'2023-06-10', 1
);

insert into Products(ProductName, SupplierID, CategoryID, UnitPrice, UnitsInStock, QuantitySold, 
StarRating, [image], describe, releaseDate, [status]) values
(N'Son Kem Bóng Thuỷ Tinh Môi Căng Mọng Mềm Mịn', 5, 3, 
185000, 118, 12, 4.9, 'images/products/p11.jpg', 
N'THÔNG TIN SẢN PHẨM
Son bóng Thủy Tinh là sản phẩm son trang điểm mới được ra mắt của nhà Cỏ hứa hẹn sẽ được nhiều chị em yêu thích. Là dòng son mới, em này với bảng màu trẻ trung, độ bám màu tốt giúp bạn có một đôi môi mịn màng, căng tràn sức sống. ', 
'2023-07-11', 1
);

insert into Products(ProductName, SupplierID, CategoryID, UnitPrice, UnitsInStock, QuantitySold, 
StarRating, [image], describe, releaseDate, [status]) values
(N'Son Lụa Diễm', 5, 3, 
198000, 167, 19, 4.7, 'images/products/p12.jpg', 
N'Son Lụa Diễm là dòng son trang điểm môi có nhiều ưu điểm nổi bật, đạt tiêu chuẩn an toàn về Chì và Thủy Ngân:

Chứa thành phần thiên nhiên an toàn
Được chiết xuất từ các thành phần như dầu Squalane, dầu quả bơ, bơ hạt mỡ, sáp ong, dầu hạnh nhân… có công dụng giữ ẩm, cung cấp dưỡng chất cho đôi môi mềm mịn.
.Chọn một màu son phù hợp rất quan trọng đối với một cô gái. Son Lụa Diễm Cỏ Mềm là sản phẩm không chỉ trang điểm cho môi mà còn dưỡng cho đôi môi mềm mịn, ngăn ngừa nứt nẻ, không làm thâm môi. Sản phẩm không chứa các chất bảo quản nên phù hợp cho cả những đôi môi nhạy cảm.', 
'2023-08-20', 1
);

update Products set UnitPrice = 198000 where ProductID = 12
update Products set SupplierID = 2 where ProductID=6
CREATE TABLE [dbo].[Orders]( 
 	[OrderID] [int] IDENTITY(1,1) NOT NULL, 
 	[Date] [date] NOT NULL, 
 	[UserName] [nvarchar](50) NOT NULL, 
 	[TotalMoney] [money] NULL, 
	[status] bit not null,
 CONSTRAINT [PK_Order] PRIMARY KEY ([OrderID]),
 CONSTRAINT [FK_Order_User] FOREIGN KEY ([UserName])
 REFERENCES [dbo].[Users] ([UserName]) ON DELETE NO ACTION
)

 -- Tạo bảng OrderDetails
 CREATE TABLE [dbo].[OrderDetails]( 
 	[OrderID] [int] NOT NULL,  	
	[ProductID] [int] NOT NULL, 
 	[Quantity] [float] NOT NULL, 
 	[UnitPrice] [money] NULL,
	CONSTRAINT [PK_OrderDetail] PRIMARY KEY ([OrderID], [ProductID] ),
	CONSTRAINT [FK_ProductDetail] FOREIGN KEY ([ProductID])
	REFERENCES [dbo].[Products]([ProductID]) ON DELETE CASCADE,
	CONSTRAINT [FK_OrderDetail] FOREIGN KEY ([OrderID])
	REFERENCES [dbo].[Orders]([OrderID]) ON DELETE CASCADE
)

create table Cart(
	[UserName] [nvarchar](50) NOT NULL foreign key references Users(UserName), 
	[ProductID] [int] NOT NULL foreign key references Products([ProductID]),
	quantity int,
	CONSTRAINT [PK_Cart] PRIMARY KEY ([UserName], [ProductID] )
)








