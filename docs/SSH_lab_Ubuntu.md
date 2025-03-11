# 1. Thực hiện truy cập SSH thông qua tài khoản root
Tải phần mềm Mobaxterm để thực hiện vai trò SSH Client trong bài lab.

![](../imgs/10.png)

Cài đặt SSH server trên Ubuntu:
- Bước 1: Update server hệ thống bằng lệnh sudo apt update.
- Bước 2: Cài đặt SSH trên Ubuntu bằng lệnh sudo apt install openssh-server.
- Bước 3: Khởi động SSH bằng lệnh sudo systemctl start ssh.
- Bước 4: Kiểm tra trạng thái của SSH sau khi cài đặt bằng lệnh sudo systemctl status ssh. Nếu trạng thái là active (running) là cài đặt SSH thành công.

![](../imgs/11.png)
 
Mở phần mềm Mobaxterm chọn vào session, ấn new session để tạo phiên làm việc. Chọn SSH.

![](../imgs/12.png)

Kiểm tra ip của máy ảo Ubuntu với vai trò là server trong bài lab này.

![](../imgs/13.png)

Nhập username và password của máy ảo Ubuntu và hoàn thành kết nối SSH.

![](../imgs/14.png)

![](../imgs/15.png)
# 2. Thực hiện truy cập SSH thông qua keypair được tạo trên server
Thực hiện tạo keypair trên máy ảo Ubuntu bằng lệnh ssh-keygen -t rsa.

![](../imgs/16.png)

Kiểm tra lại thư mục xem 2 file chứa khóa công khai và khóa bí mật đã được tạo thành công hay chưa.

![](../imgs/18.png)

Tiến hành tạo file authorized_keys để server có thể xác nhận khóa công khai khi client muốn thực hiện truy cập SSH bằng lệnh touch authorized_keys tại thư mục chứ 2 file khóa.

Copy nội dung của file chứa khóa công khai là id_rsa.pub qua file authorized_keys.

![](../imgs/19.png)

Tiến hành tải file chứa khóa bí mật id_rsa về máy client (mobaxterm).

Vào file cấu hình của ssh để tiến hành sửa đổi thông số phù hợp cho việc kết nối SSH thông qua keypair.

![](../imgs/20.png)

Vào phần mềm Mobaxterm, chọn new session và chọn SSH để thực hiện kết nối. Tại đây nhập địa chỉ IP của máy server và chọn use private key thêm vào đó file id_rsa đã được tải xuống.

![](../imgs/21.png)

Tiến hành kết nối SSH thành công thông qua keypair.

![](../imgs/22.png)

# 3. Thực hiện truy cập SSH thông qua câu lệnh SSH-copy-id
- Thực hiện tạo keypair bằng câu lệnh ssh-keygen -t rsa.

![](../imgs/37.png)

- Kiểm tra trong thư mục xem đã tạo thành công 2 file key chưa.

![](../imgs/38.png) 

- Thực hiện câu lệnh ssh-copy-id để gửi file public key qua cho server.

![](../imgs/39.png)

- Tiến hành thực hiện kết nối ssh sau khi mỗi bên đều giữ một khóa.

![](../imgs/40.png)

- Kết nối ssh được thực hiện thành công.
