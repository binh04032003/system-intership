# 1. SSH logs là gì?
SSH logs thường được ghi lại bởi daemon SSH (sshd), chịu trách nhiệm xử lý các kết nối SSH đến. Những nhật ký này có thể cung cấp thông tin về hoạt động của người dùng, các lần thử kết nối, các lần xác thực thành công hoặc thất bại, và các sự kiện liên quan khác. Việc giám sát những nhật ký này rất quan trọng để phát hiện các nỗ lực truy cập trái phép, khắc phục sự cố và đảm bảo tuân thủ các chính sách bảo mật.

Ví dụ về SSH logs điển hình:

Jul 17 09:23:45 server1 sshd[1234]: Accepted publickey for user1 from 192.168.1.100 port 52413 ssh2: RSA SHA256:abcdefghijklmnopqrstuvwxyz123456789ABCDEFG

Mục nhật ký này chứa thông tin quan trọng như: dấu thời gian, tên máy chủ, ID tiến trình, phương thức xác thực, tên người dùng, địa chỉ IP nguồn, số cổng và loại khóa mã hóa được sử dụng. Bằng cách phân tích các nhật ký này, quản trị viên hệ thống có thể theo dõi truy cập của người dùng, xác định các mối đe dọa bảo mật tiềm ẩn và duy trì một môi trường SSH an toàn.
# 2. Một số thành phần chính của SSH logs
- **Timestamp (dấu thời gian):** chỉ ra ngày và giờ của một kết nối SSH.
- **Hostname:** tên của máy chủ mà SSH deamon đang chạy.
- **Process Name:** tên của tiến trình tạo ra log entry, thường là sshd.
- **Process ID:** ID của tiến trình thuộc SSH deamon tạo ra log entry.
- **Event Type:** trạng thái của một kết nối SSH, bao gồm một số trạng thái như *Accepted*, *Failed*, *Disconnected*, *session opened*, và *session closed*.

   Ví dụ về một SSH kết nối thành công:

   Jul 12 08:23:45 server1 sshd[1234]: Accepted password for user1 from 192.168.1.100 port 22 ssh2

   Ví dụ về một SSH kết nối thất bại:

   Jul 12 08:24:10 server1 sshd[1234]: Failed password for invalid user fakeuser from 192.168.1.100 port 22 ssh2


# 3. Truy cập SSH logs

- **Sử dụng journalctl:** 

    journalctl là một lệnh được sử dụng để xem các nhật ký được quản lý bởi systemd, hệ thống quản lý và dịch vụ được sử dụng trong nhiều bản phân phối Linux hiện đại như Ubuntu, CentOS và Debian.

    Trên các hệ thống sử dụng systemd, chẳng hạn như các phiên bản hiện đại của Ubuntu, CentOS và Debian, nhật ký SSH được quản lý bởi dịch vụ journald. Lệnh journalctl được sử dụng để truy cập các SSH logs.

    Sử dụng câu lệnh journalctl -u ssh để truy cập SSH logs.

- **Truy cập vào /var/log/auth.log:**

   Trên một số hệ thống, đặc biệt là các hệ thống cũ hoặc những hệ thống không sử dụng systemd, nhật ký SSH được ghi trong tệp /var/log/auth.log. Điều này thường gặp trên các phiên bản cũ của Debian, Ubuntu và các bản phân phối khác sử dụng SysVinit hoặc các hệ thống init khác.

   Sử dụng một số câu lệnh sau để truy cập vào file SSH log trên:

   - cat /var/log/auth.log
   - tail -f /var/log/auth.log
   - grep sshd /var/log/auth.log
   - less /var/log/auth.log

- **Truy cập vào SSH log trên một số hệ điều hành khác nhau:**

   - SSH Logs on Ubuntu: một số phiên bản mới sử dụng journalctl, một số phiên bản cũ hơn truy cập /var/log/auth.log.
   - SSH Logs on CentOS: phiên bản mới sử dụng journalctl, một số phiên bản cũ hơn có thể sử dụng /var/log/secure.
   - SSH Logs on Debian: tương tự với hệ điều hành Ubuntu.
   - SSH Logs on Linux: tương tự với phiên bản phân phối trên của Linux.
   - SSH Logs on Windows: Windows sẽ không hỗ trợ SSH tương tự như với các phiên bản phân phối của Linux. Với việc cài đặt OpenSSH trên Windows, logs có thể được truy cập ở thư mục OpenSSH installation.

# 4. Quản lý logs của SSH
- **Nâng cao tính an toàn của kết nối SSH:** 
   - *Giới hạn truy cập SSH: bằng cách chỉnh file cấu hình của SSH.*

      - Cho phép một số đối tượng cụ thể có thể thực hiện SSH bằng chỉnh sửa dòng AllowUsers trong file cấu hình: AllowUsers user1 user2.

      - Vô hiệu hóa đăng nhập bằng tài khoản root: PermitRootLogin no. Giảm nguy cơ bị tấn công brute-force trực tiếp vào tài khoản root, Khuyến khích sử dụng tài khoản người dùng bình thường với quyền sudo để quản trị, đảm bảo bảo mật tốt hơn.

    - *Sử dụng xác thực dựa trên khóa:  Ngăn chặn các cuộc tấn công brute-force vì không cần nhập mật khẩu. Tăng cường bảo mật khi sử dụng các cặp khóa SSH mạnh và bảo vệ khóa riêng tư.*
    
       - Tạo cặp khóa SSH trên máy client: ssh-keygen -t rsa -b 4096
       - Sao chép khóa công khai lên máy chủ: ssh-copy-id username@server_ip
       - Vô hiệu hóa xác thực bằng mật khẩu: sudo nano /etc/ssh/sshd_config và chỉnh PasswordAuthentication no, PubkeyAuthentication yes
       - Khởi động lại dịch vụ SSH: sudo systemctl restart sshd
    
    - *Thay đổi cổng kết nối mặc định của SSH:* 
       - Chỉnh sửa tệp cấu hình SSH: sudo nano /etc/ssh/sshd_config
       - Tìm dòng chứa #Port 22 và thay đổi thành một số cổng khác: Port 2222
       - Khởi động lại dịch vụ SSH: sudo systemctl restart sshd
       
- **Chỉnh sửa mức độ ghi lại log của các kết nối SSH:** Mức độ nhật ký chi tiết hơn giúp phát hiện các hoạt động bất thường, các nỗ lực truy cập trái phép hoặc lỗi cấu hình.
    
    - *Chỉnh sửa tệp cấu hình SSH:* sudo nano /etc/ssh/sshd_config
    - *Tìm và điều chỉnh dòng LogLevel:* LogLevel INFO. Thay thế INFO bằng mức độ ghi lại log phù hợp.
       
       - QUIET: Chỉ ghi nhật ký tối thiểu.
       - FATAL: Chỉ ghi các lỗi nghiêm trọng.
       - ERROR: Ghi lại các lỗi không nghiêm trọng.
       - INFO: (Mặc định) Ghi nhật ký các thông tin cơ bản về hoạt động.
       - VERBOSE: Ghi chi tiết hơn, hữu ích khi khắc phục sự cố.
       - DEBUG, DEBUG1, DEBUG2, DEBUG3: Ghi nhật ký chi tiết nhất, thường được dùng cho việc phân tích lỗi và không nên sử dụng trên hệ thống sản xuất.
    
    - *Lưu tệp và khởi động lại dịch vụ SSH:* sudo systemctl restart sshd

- **Lọc các logs của SSH:** sử dụng câu lệnh journalctl dựa vào một số thông số khác nhau.

   - *Theo ngày/giờ:* 
       - journalctl -u ssh --since "2023-07-01" để xem các kết nối SSH từ ngày bao nhiêu. 
       - journalctl -u ssh --since "2023-07-01" --until "2023-07-12" để xem các kết nối SSH trong khoảng ngày bao nhiêu.
 
    - *Theo độ ưu tiên:*
       - journalctl -u ssh -p err: xem một số kết nối SSH bị lỗi.
       
- **Giám sát SSH log trong thời gian thực:** 
   
   - *Dùng câu lệnh journalctl:*  journalctl -u ssh -f
   - *Dùng thư mục /var/log/auth.log:* tail -f /var/log/auth.log

- **Xem các kết nối SSH được thực hiện gần đây:**
   - *Sử dụng lệnh last log:* lastlog




      


  














