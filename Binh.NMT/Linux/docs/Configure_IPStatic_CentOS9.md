# 1. Cài đặt IP tĩnh bằng cách sửa file cấu hình
- Kiểm tra IP hiện tại của máy ảo:
![](../imgs/6.png)
- Vào thư mục chứa card mạng và truy cập vào file cấu hình:
![](../imgs/7.png)
- Thực hiện chỉnh sửa địa chỉ IP của máy ảo trong file cấu hình:
![](../imgs/9.png)
- Gõ :wq để lưu và thoát khỏi file cấu hình
- Sau khi thoát khỏi file, gõ lệnh systemctl restart NetworkManager để khởi động lại mạng.
- Kiểm tra lại địa chỉ IP của máy ảo:
![](../imgs/10.png)
  
  Hoàn tất việc cài đặt IP tĩnh cho máy ảo CentOS.
# 2. Cài đặt IP tĩnh bằng dòng lệnh 
- Thực hiện cấu hình IP tĩnh bằng các dòng lệnh theo thứ tự sau:
  - Cấu hình địa chỉ mạng.
  - Cấu hình địa chỉ gateway.
  - Cấu hình dns.
  - Chọn cấu hình IPv4 bằng phương pháp thủ công.
  - Bật kết nối cho địa chỉ IPv4 vừa được đặt.
![](../imgs/12.png)
- Restart lại mạng để cập nhật địa chỉ IP bằng câu lệnh systemctl restart NetworkManager.
- Kiểm tra lại địa chỉ IP của máy ảo:
  ![](../imgs/11.png)
  Hoàn tất việc cài đặt IP tĩnh cho máy ảo CentOS.
# 3. Cài đặt IP tĩnh bằng giao diện
- Chạy câu lệnh nmtui để mở giao diện NetworkManager.
- Chọn edit connection và nhấn ok:
![](../imgs/13.png)
- Chọn add để cấu hình IP tĩnh mới:
![](../imgs/14.png)
- Chọn type Ethernet và nhấn create:
![](../imgs/15.png)
- Sửa địa chỉ IP và nhấn ok:
![](../imgs/16.png)
- Quay lại giao diện NetworkManager chọn activate a connection:
![](../imgs/17.png)
- Chọn mạng mình vừa tạo và nhấn activate:
![](../imgs/18.png)
- Chạy lệnh systemctl restart NetworkManager để khởi động lại mạng:
![](../imgs/19.png)
- Kiểm tra lại địa chỉ IP của máy ảo:
![](../imgs/20.png)
   
  Hoàn tất cài đặt IP tĩnh cho máy ảo CentOS.