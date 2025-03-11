Dưới đây là README phù hợp cho một **website bán son môi**, sử dụng **JSP, Servlet, Bootstrap**, và các công nghệ liên quan.  

---  

# **Lipstick Store – Online Cosmetics Shopping**  

## **Giới Thiệu**  
**Lipstick Store** là một trang web thương mại điện tử chuyên bán các sản phẩm son môi. Ứng dụng này giúp khách hàng dễ dàng tìm kiếm, mua sắm son môi từ nhiều thương hiệu khác nhau, đồng thời hỗ trợ quản lý sản phẩm, đơn hàng và khách hàng hiệu quả.  

## **Tính Năng**  

### **Dành cho khách hàng:**  
- **Duyệt sản phẩm:** Xem danh sách son môi với hình ảnh, giá cả, mô tả và đánh giá.  
- **Tìm kiếm & lọc sản phẩm:** Tìm son môi theo màu sắc, thương hiệu, giá, hoặc loại son (lì, dưỡng, bóng, v.v.).  
- **Chi tiết sản phẩm:** Xem thông tin chi tiết của từng sản phẩm, bao gồm đánh giá từ người mua.  
- **Thêm vào giỏ hàng:** Chọn sản phẩm và quản lý giỏ hàng trước khi đặt hàng.  
- **Thanh toán đơn hàng:** Hỗ trợ thanh toán qua thẻ ngân hàng hoặc thanh toán khi nhận hàng (COD).  
- **Đăng ký & đăng nhập:** Khách hàng có thể tạo tài khoản để theo dõi đơn hàng và lưu sản phẩm yêu thích.  
- **Quản lý đơn hàng:** Kiểm tra trạng thái đơn hàng, lịch sử mua sắm.  

### **Dành cho quản trị viên:**  
- **Quản lý sản phẩm:** Thêm, sửa, xóa sản phẩm và cập nhật giá cả.  
- **Quản lý đơn hàng:** Xử lý đơn hàng, cập nhật trạng thái (Chờ xử lý, Đang giao, Đã hoàn thành).  
- **Quản lý khách hàng:** Xem danh sách khách hàng, chặn tài khoản nếu cần.  
- **Thống kê doanh thu:** Báo cáo doanh số theo ngày, tháng, năm.  

## **Công Nghệ Sử Dụng**  

- **Ngôn ngữ lập trình:** Java (JSP, Servlet)  
- **Giao diện:** HTML, CSS, JavaScript, Bootstrap  
- **Cơ sở dữ liệu:** MySQL  
- **Thư viện & framework:**  
  - JDBC (Kết nối MySQL)  
  - JSTL (Hỗ trợ hiển thị dữ liệu trong JSP)  
  - Bootstrap (Thiết kế giao diện responsive)  
  - jQuery (Hỗ trợ hiệu ứng & Ajax)  
- **Máy chủ ứng dụng:** Apache Tomcat  

## **Cách Cài Đặt & Chạy Dự Án**  

### **Yêu Cầu Hệ Thống**  
- **JDK 11 hoặc cao hơn**  
- **Apache Tomcat 9 hoặc cao hơn**  
- **MySQL 8.0 hoặc cao hơn**  
- **Maven (nếu muốn build project tự động)**  

### **Bước 1: Clone Dự Án**  
```sh
git clone https://github.com/your-username/lipstick-store.git
```
Mở dự án bằng IDE như **Eclipse** hoặc **IntelliJ IDEA**.  

### **Bước 2: Cấu Hình Database**  
1. **Tạo database trong MySQL**  
```sql
CREATE DATABASE lipstick_store;
```
2. **Import dữ liệu mẫu (nếu có)**  
```sh
mysql -u root -p lipstick_store < database.sql
```
3. **Cấu hình `web.xml` hoặc `db.properties` để kết nối MySQL**  
```properties
jdbc.url=jdbc:mysql://localhost:3306/lipstick_store
jdbc.username=root
jdbc.password=yourpassword
jdbc.driverClass=com.mysql.cj.jdbc.Driver
```

### **Bước 3: Chạy Ứng Dụng**  
- Chạy **Apache Tomcat** và deploy project.  
- Truy cập trang web tại:  
  ```
  http://localhost:8080/lipstick-store
  ```

