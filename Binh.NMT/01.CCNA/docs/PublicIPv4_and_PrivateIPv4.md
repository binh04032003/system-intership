
# 1. Private IP là gì? Chức năng?

Private IP là các địa chỉ được cấp phát bởi InterNIC cho phép các công ty, tổ chức có thể tạo cho họ một mạng cục bộ riêng. 

**/Notes**

Private IP là dải địa chỉ IP chỉ được dùng cho các mạng LAN, được quyền sử dụng ở nhiều doanh nghiệp khác nhau.

Nguyên tắc thì địa chỉ Private sẽ không thể truy cập ra ngoài Internet. Vì vậy, NAT ra đời để chuyển đổi giữa địa chỉ Private và địa chỉ Public.

**/EndNotes**

Có 3 dãy IP ở class A, class B và class C được IANA dùng để đánh địa chỉ private IP:

![](../imgs/Capture.PNG)

**Phân lớp A:** được dùng cho các network có số lượng host lớn. Phân lớp A cho phép có tới 126 network có thể phân chia. Bit đầu tiên của octet thuộc phân là lớp là bit 0, 7 bit còn lại sẽ giúp tạo ra các network tương ứng. 24 bit còn lại trong dải địa chỉ IP sẽ dùng để định danh các host. 
- Public IP Range: 1.0.0.0 to 127.0.0.0
- Private IP Range: 10.0.0.0 to 10.255.255.255 
- Subnet Mask: 255.0.0.0 (8 bits)
- Number of Networks: 126
- Number of Hosts per Network: 16,777,214

**Phân lớp B:** được dùng cho các mạng quy mô lớn. Phân lớp B cho phép tới 16,384 network bằng cách sử dụng 2 octet đầu tiên cho network ID. Hai bit đầu tiên của octet 1 trong phân lớp B lần lượt là bit 1 và 0, 16 bit còn lại trong dải IP sẽ dùng để định danh các host.
- Public IP Range: 128.0.0.0 to 191.255.0.0
- Private IP Range: 172.16.0.0 to 172.31.255.255
- Subnet Mask: 255.255.0.0 (16 bits)
- Number of Networks: 16,382
- Number of Hosts per Network: 65,534

**Phân lớp C:** được dùng cho các mạng quy mô nhỏ. Trong đó, 3 bit đầu tiên thuộc octet 1 lần lượt là 1,1,0 và sử dụng 21 bit còn lại của 3 octet đầu làm network ID. 
- Public IP Range: 192.0.0.0 to 223.255.255.0
- Private IP Range: 192.168.0.0 to 192.168.255.255
- Special IP Range: 127.0.0.1 to 127.255.255.255 
```
IP Range: 127.0.0.1 to 127.255.255.255 are network testing addresses (also referred to as loop-back addresses). These are virtual IP address, in that they cannot be assigned to a device. Specifically, the IP 127.0.0.1 is often used to troubleshoot network connectivity issues using the ping command. Specifically, it tests a computer's TCP/IP network software driver to ensure it is working properly.
```
- Subnet Mask: 255.255.255.0 (24 bits)
- Number of Networks: 2,097,150
- Number of Hosts per Network: 254

Các loại địa chỉ IP Private phổ biến bao gồm 192.168.x.x, 172.16.x.x đến 172.31.x.x và 10.x.x.x.

Để cho phép truy cập trực tiếp đến thiết bị cục bộ bằng private IP, cần phải sự hỗ trợ của NAT (Network Address Translation) hoặc kết nối trực tiếp thiết bị đến Internet mà không thông qua bất kỳ router nào!

=>> Để đánh địa chỉ IP cho các thiết bị trong mạng cục bộ, để những thiết bị trong mạng cục bộ đấy có thể kết nối với nhau mà không cần thông qua Internet. Giúp việc quản lý mạng nội bộ dễ dàng hơn, cho phép phân chia mạng thành các nhóm nhỏ, thiết lập quy tắc truy cập và giám sát lưu lượng truy cập hiệu quả.

# 2. Public IP là gì? Chức năng?

Public IP là địa chỉ được ISP cấp và có thể được nhìn thấy và truy cập từ Internet.

**/Notes**

Public IP là địa chỉ IP thực được dùng trên môi trường Internet và định tuyến toàn cầu.

**/EndNotes**

Một public IP có thể là tĩnh (static) hoặc động (dynamic) tùy theo loại dịch vụ của người dùng. Một địa chỉ public IP tĩnh không thay đổi và thường được dùng cho hosting các trang web, hoặc dịch vụ trên Internet. Các địa chỉ động được chọn từ một "hồ chứa" các địa chỉ có sẵn và thay đổi mỗi lần người dùng kết nối đến Internet.

# 3. Phân biệt private IP và public IP
1. Về địa chỉ và phạm vi sử dụng
- IP Public: Là địa chỉ duy nhất được cung cấp cho mỗi thiết bị kết nối trực tiếp với Internet. Các địa chỉ này được quản lý và phân phối bởi các tổ chức như IANA và các nhà cung cấp dịch vụ Internet (ISP).

- IP Private: Là địa chỉ được sử dụng trong mạng nội bộ và không được định tuyến trên Internet. Các địa chỉ này được sử dụng để định danh và kết nối các thiết bị trong mạng LAN.
2. Về tính khả dụng khi truy cập
- IP Public: Có thể truy cập từ bất kỳ nơi nào trên Internet. Các dịch vụ hoặc trang web có thể truy cập bằng cách sử dụng địa chỉ IP Public.

- IP Private: Thường không thể truy cập từ bên ngoài mạng LAN. Các địa chỉ IP Private chỉ hoạt động trong phạm vi mạng nội bộ và không thể truy cập từ Internet.
3. Về tính bảo mật
- IP Public: Do có thể truy cập từ Internet nên tiềm ẩn nguy cơ bị tấn công mạng cao hơn.

- IP Private: Ít bị tấn công mạng hơn do hoạt động trong phạm vi mạng nội bộ. Tuy nhiên, người dùng vẫn cần cân nhắc các biện pháp bảo mật như tường lửa để bảo vệ mạng nội bộ khỏi các cuộc tấn công.



