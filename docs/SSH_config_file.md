# 1. SSH config file là gì?
SSH config file là công cụ để thực hiện cấu hình thông số cho kết nối SSH, cho phép thiết lập một tệp cấu hình riêng cho từng người dùng, nơi có thể lưu trữ các tùy chọn SSH khác nhau cho mỗi máy từ xa mà bạn kết nối.

SSH config file thường được lưu trữ trong thư mục /etc/ssh. Tệp cấu hình là một văn bản chứa các tùy chọn kết nối SSH khác nhau, công cụ quản lý ssh sẽ giúp ích cho công việc quản lý một số máy chủ từ xa. Trong thư mục bày, có thể cấu hình tệp ssh xác định tất cả các máy chủ, tên máy chủ, tên người dùng và mật khẩu của chúng với số lượng không giới hạn hồ sơ có thể tạo ra.

![](../imgs/5.png)
# 2. Cấu trúc của SSH config file
Cấu trúc của một tệp cấu hình SSH có dạng như sau:
```
Host hostname1
    SSH_OPTION value
    SSH_OPTION value

Host hostname2
    SSH_OPTION value

Host *
    SSH_OPTION value
```

# 3. Cấu hình kết nối SSH thông qua SSH config file
## 3.1 Tạo ssh user config file
File ssh user config thường được tạo mặc định trong thư mục /etc/ssh. Nếu chưa có file trên thư mục, có thể thực hiện tạo file bằng câu lệnh sau:

![](../imgs/6.png)

Sau đó cấp quyền cấu hình cho file bằng lệnh sau:

![](../imgs/7.png)

## 3.2 Thêm cấu hình vào file
Để có thể cấu hình cho file ssh config, sử dụng lệnh vim để truy cập vào file và bấm i để tiến hành sửa đổi:

![](../imgs/8.png)

Cấu hình các kết nối với các máy chủ từ xa với các thông số cơ bản như trong hình. Bấm esc để quay lại command line trong lệnh vim, gõ :wq để lưu file cấu hình và thoát. Bây giờ có thể thực hiện ssh qua câu lệnh ssh CentOS9.

## 3.3 Một số thông số cấu hình khác
- **AddressFamily:** Quy định loại IP address mà dịch vụ SSHD sẽ dùng. Các giá trị khả dụng: any, inet (IPv4), inet6 (IPv6). Mặc định: any.

- **BatchMode:** Tham số BatchMode kiểm soát việc có hiển thị yêu cầu nhập mật khẩu hay không. Giá trị mặc định là **no**, và hệ thống sẽ yêu cầu nhập mật khẩu. Đổi thành **yes** nếu sử dụng SSH trong các tập lệnh (scripts).

- **BindAddress:** Tham số BindAddress giúp xác định địa chỉ liên kết trong một hệ thống có nhiều địa chỉ. Nếu giá trị của UserPrivilegedPort là yes, tùy chọn này sẽ không hoạt động.

- **ChallengeResponseAuthentication:** Tham số ChallengeResponseAuthentication kiểm soát việc có sử dụng xác thực thách thức-phản hồi (challenge-response authentication) khi kết nối đến máy chủ qua SSH hay không. Giá trị mặc định là yes.

- **CheckHostIP:** Tham số CheckHostIP cho SSH biết có thực hiện kiểm tra bổ sung địa chỉ IP của máy chủ trong tệp known_hosts hay không. Tham số này cho phép SSH phát hiện sự thay đổi khóa máy chủ. Giá trị mặc định là yes.

- **Cipher:** Tham số Cipher là một tham số của giao thức phiên bản 1, dùng để chỉ định loại mã hóa cho các phiên làm việc. Các loại mã hóa được hỗ trợ bao gồm blowfish, des, và 3des (mặc định).

- **Ciphers:** Tham số Ciphers chỉ định loại mã hóa được sử dụng để mã hóa các phiên làm việc trong giao thức phiên bản 2. Các loại mã hóa khả dụng và giá trị mặc định bao gồm: aes128-ctr, aes192-ctr, aes256-ctr, arcfour256, arcfour128, aes128-cbc, 3des-cbc, blowfish-cbc, cast128-cbc, aes192-cbc, aes256-cbc, arcfour. Có thể cung cấp nhiều loại mã hóa trong một danh sách, phân tách bằng dấu phẩy.

- **ClearAllForwardings:** Tham số ClearAllForwardings kiểm soát việc xóa tất cả các thiết lập chuyển tiếp cổng động, cục bộ và từ xa từ dòng lệnh hoặc tệp cấu hình. Giá trị mặc định của ClearAllForwardings là **no**. Khi chạy SSH từ dòng lệnh, hãy sử dụng tham số này để xóa mọi cấu hình đã thiết lập trước đó.

- **Compression:** Tham số Compression kiểm soát việc có sử dụng nén dữ liệu hay không. Giá trị mặc định là **no**.

- **CompressionLevel:** Tham số CompressionLevel đặt mức độ nén nếu tham số Compression được đặt là yes. Mức độ nén là một số nguyên từ 1 (nhanh nhất, chất lượng thấp nhất) đến 9 (chậm nhất, chất lượng cao nhất), với mức mặc định là 6. Tham số này chỉ áp dụng cho giao thức phiên bản 1.

- **ConnectionAttempts:** Tham số ConnectionAttempts kiểm soát số lần thử kết nối trước khi thoát. Mỗi lần thử diễn ra trong một giây, và số lần thử mặc định là 1.

- **ConnectTimeout:** Tham số ConnectTimeout xác định thời gian chờ kết nối (timeout) tính bằng giây khi kết nối đến một máy chủ SSH. Giá trị mặc định của thời gian chờ là giá trị TCP timeout của hệ thống.

- **ControlMaster:** Tham số ControlMaster cho phép chia sẻ một kết nối qua cùng một mạng. Tham số này hỗ trợ các đối số sau:
   -  **yes:** Cho phép lắng nghe trên một ổ cắm điều khiển (control socket) được cung cấp trong ControlPath.
   -  **no:** Tắt tính năng lắng nghe, nhưng vẫn cho phép kết nối qua ControlPath bằng kết nối mạng của master (mặc định).
   -  **ask:** Lắng nghe các kết nối và yêu cầu xác nhận. Nếu ControlPath không mở, SSH sẽ tiếp tục mà không kết nối với kết nối master.
   -  **auto:** Cho phép ghép nối kết nối tự động (opportunistic multiplexing) và tạo một kết nối mới nếu không tồn tại kết nối nào.
   -  **autoask:** Kết hợp các tùy chọn ask và auto.

- **ControlPath:** Tham số ControlPath chứa thông tin về ổ cắm điều khiển (control socket) trong các kết nối được chia sẻ. Đối số none sẽ tắt tính năng chia sẻ kết nối. Nếu cung cấp một đường dẫn (path), các phép thay thế (substitutions) sau đây có thể sử dụng:
   - **%r:** Tên người dùng từ xa (remote username).
   - **%h:** Tên máy chủ từ xa (remote hostname).
   - **%p:** Cổng từ xa (remote port).
   - **%u:** Tên người dùng cục bộ (local username).
   
   Khuyến nghị tối thiểu là sử dụng %h, %p, và %r trong ControlPath để đảm bảo mỗi kết nối có một định danh duy nhất.

- **DynamicForward:** Tham số DynamicForward cho phép chuyển tiếp cổng TCP động (dynamic TCP port forwarding) qua kênh bảo mật. Định dạng để sử dụng là bind_address:port hoặc bind_address/port.
   - Sử dụng **localhost** làm địa chỉ liên kết (bind address) để giới hạn cổng chỉ sử dụng cục bộ.
   - Sử dụng * để làm địa chỉ liên kết nếu muốn cổng khả dụng từ tất cả các giao diện mạng.

- **X11Forwarding:** Quy định cho phép chuyển tiếp X11 hay không. Mặc định: no.

- **X11DisplayOffset:** Quy định con số hiển thị đầu tiên khả dụng cho việc chuyển tiếp X11 của dịch vụ SSHD. Điều này giúp cho dịch vụ SSHD không can thiệp vào các server X11 thật. Mặc định: 10.

- **X11UseLocalhost:** Quy định việc dịch vụ SSHD có gán server chuyển tiếp X11 vào địa chỉ loopback hay là vào đỉa chỉ wildcard.

- **TCPKeepAlive:** Quy định việc dịch vụ SSHD có gửi gói tin keepalive tới phía người dùng hay không. Mặc định: yes.

- **GSSAPIAuthentication:** Quy định cho phép sử dụng GSSAPI để chứng thực hay không.

- **GSSAPICleanupCredentials:** Quy định việc có tự động xóa cache thông tin đăng nhập của user khi user logout hay không. Mặc định: yes.

- **GSSAPIEnablek5users:** Quy định việc có tra cứu file .k5users cho việc quản lý truy cập bằng chứng thức GSSAPI hay không.

- **UsePAM:** Bật giao diện Pluggable Authentication Module. Nếu thông số này đặt là “yes”, dịch vụ sẽ bật chứng thực PAM sử dụng ChallengeResponseAuthentication và PasswordAuthentication thêm vào tài khoản PAM và session module processing cho tất cả các loại chứng thực.


