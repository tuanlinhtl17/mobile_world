City.create(name: "Hà Nội", districts_attributes: [{name: "Ba Đình"}, {name: "Bắc Từ Liêm"},
{name: "Cầu Giấy"}, {name: "Đống Đa"}, {name: "Hà Đông"}, {name: "Hai Bà Trưng"}, 
{name: "Hoàn Kiếm"}, {name: "Hoàng Mai"}, {name: "Long Biên"}, {name: "Nam Từ Liêm"},
{name: "Tây Hồ"}, {name: "Thanh Xuân"}, {name: "Sơn Tây"}, {name: "Ba Vì"},
{name: "Chương Mỹ"}, {name: "Đan Phượng"}, {name: "Đông Anh"}, {name: "Gia Lâm"}, 
{name: "Hoài Đức"}, {name: "Mê Linh"}, {name: "Mỹ Đức"}, {name: "Phú Xuyên"}, 
{name: "Phúc Thọ"}, {name: "Quốc Oai"}, {name: "Sóc Sơn"}, {name: "Thạch Thất"}, 
{name: "Thanh Oai"}, {name: "Thanh Trì"}, {name: "Thường Tín"}, {name: "Ứng Hòa"}])
City.create(name: "Hồ Chí Minh", districts_attributes: [{name: "Quận 1"}, {name: "Quận 2"},
{name: "Quận 3"}, {name: "Quận 4"}, {name: "Quận 5"}, {name: "Quận 6"}, {name: "Quận 7"},
{name: "Quận 8"}, {name: "Quận 9"}, {name: "Quận 10"}, {name: "Quận 11"}, {name: "Quận 12"}, 
{name: "Bình Tân"}, {name: "Bình Thạnh"}, {name: "Gò Vấp"}, {name: "Phú Nhuận"}, {name: "Tân Bình"},
{name: "Tân Phú"}, {name: "Thủ Đức"}, {name: "Bình Chánh"}, {name: "Cần Giờ"}, {name: "Củ Chi"},
{name: "Hóc Môn"}, {name: "Nhà Bè"}])
Shop.create(address: "378 Nguyễn Trãi, P. Thanh Xuân Trung, Q. Thanh Xuân, TP. Hà Nội",
city_id: 1, district_id: 12)
ShopMobile.create(shop_id: 1, mobile_id: 1, amount: 20)
Shop.create(address: "238 Nguyễn Trãi, P.Trung Văn, Q. Thanh Xuân, TP. Hà Nội (bên cạnh trường Đại học Hà Nội)",city_id: 1, district_id: 12)
