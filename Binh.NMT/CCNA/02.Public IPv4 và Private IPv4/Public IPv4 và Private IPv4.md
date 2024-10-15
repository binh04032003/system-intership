
- Private IP là gì? Chức năng?

Private IP là các địa chỉ được cấp phát bởi InterNIC cho phép các công ty, tổ chức có thể tạo cho họ một mạng cục bộ riêng. 

Có 3 dãy IP ở class A, class B và class C được IANA dùng để đánh địa chỉ private IP:

![](https://3.bp.blogspot.com/-tqXXjldaJSs/V1ECAxQxmmI/AAAAAAAAAfI/qHUIvZG30mMGLcsNAB16dn7OeMk-sGYpACLcB/s1600/Capture.PNG)

Các loại địa chỉ IP Private phổ biến bao gồm 192.168.x.x, 172.16.x.x đến 172.31.x.x và 10.x.x.x.

Để cho phép truy cập trực tiếp đến thiết bị cục bộ bằng private IP, cần phải sự hỗ trợ của NAT (Network Address Translation) hoặc kết nối trực tiếp thiết bị đến Internet mà không thông qua bất kỳ router nào!

=>> Để đánh địa chỉ IP cho các thiết bị trong mạng cục bộ, để những thiết bị trong mạng cục bộ đấy có thể kết nối với nhau mà không cần thông qua Internet. Giúp việc quản lý mạng nội bộ dễ dàng hơn, cho phép phân chia mạng thành các nhóm nhỏ, thiết lập quy tắc truy cập và giám sát lưu lượng truy cập hiệu quả.

- Public IP là gì? Chức năng?

Public IP là địa chỉ được ISP cấp và có thể được nhìn thấy và truy cập từ Internet.

Một public IP có thể là tĩnh (static) hoặc động (dynamic) tùy theo loại dịch vụ của người dùng. Một địa chỉ public IP tĩnh không thay đổi và thường được dùng cho hosting các trang web, hoặc dịch vụ trên Internet. Các địa chỉ động được chọn từ một "hồ chứa" các địa chỉ có sẵn và thay đổi mỗi lần người dùng kết nối đến Internet.

- Phân biệt private IP và public IP
1. Về địa chỉ và phạm vi sử dụng
- IP Public: Là địa chỉ duy nhất được cung cấp cho mỗi thiết bị kết nối trực tiếp với Internet. Các địa chỉ này được quản lý và phân phối bởi các tổ chức như IANA và các nhà cung cấp dịch vụ Internet (ISP).

- IP Private: Là địa chỉ được sử dụng trong mạng nội bộ và không được định tuyến trên Internet. Các địa chỉ này được sử dụng để định danh và kết nối các thiết bị trong mạng LAN.
2. Về tính khả dụng khi truy cập
- IP Public: Có thể truy cập từ bất kỳ nơi nào trên Internet. Các dịch vụ hoặc trang web có thể truy cập bằng cách sử dụng địa chỉ IP Public.

- IP Private: Thường không thể truy cập từ bên ngoài mạng LAN. Các địa chỉ IP Private chỉ hoạt động trong phạm vi mạng nội bộ và không thể truy cập từ Internet.
3. Về tính bảo mật
- IP Public: Do có thể truy cập từ Internet nên tiềm ẩn nguy cơ bị tấn công mạng cao hơn.

- IP Private: Ít bị tấn công mạng hơn do hoạt động trong phạm vi mạng nội bộ. Tuy nhiên, người dùng vẫn cần cân nhắc các biện pháp bảo mật như tường lửa để bảo vệ mạng nội bộ khỏi các cuộc tấn công.



