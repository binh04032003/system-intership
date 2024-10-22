

# VLAN 
## LAN là gì?
- LAN là một mạng cục bộ (Local Area Network) được hiểu là sự kết hợp của nhiều thiết bị được kết nối lại với nhau trong một hệ thống mạng tại một khu vực nhất định (công ty, trường học, nhà ở...). Việc ghép nối các thiết bị trong cùng một hệ thống cho phép các thiết bị này trao đổi dữ liệu với nhau một cách nhanh chóng và dễ dàng.

   Những thiết bị trong cùng mạng LAN có thể kết nối với nhau thông qua sợi cáp mạng. Gộp nhiều mạng LAN có thể truy cập với nhau tạo ra một mạng lưới rộng lớn hơn được gọi là WAN (Wide Area Network) và để giao tiếp với nhau, các thiết bị được kết nối với một hoặc nhiều thiết bị thu phát tín hiệu mạng (Router).
## VLAN là gì?
- VLAN là viết tắt của Virtual Local Area Network, hay còn gọi là mạng LAN ảo. VLAN là một kỹ thuật phân chia mạng LAN vật lý thành các mạng logic riêng biệt, được gọi là các VLAN.

- Mỗi VLAN hoạt động như một mạng LAN riêng biệt, với lưu lượng truy cập riêng biệt và được cách ly với các VLAN khác.

- Nếu không có mạng Virtual LAN, một broadcast được gửi từ host có thể dễ dàng đi đến mọi thiết bị mạng. Khi đó, tất cả thiết bị đều sẽ xử lý những frame đã nhận broadcast đó. Việc này sẽ làm tăng đáng kể chi phí cho CPU trên mỗi thiết bị, đồng thời làm giảm khả năng bảo mật của hệ thống.

- Nếu ta đặt các interface trên các switch ở những VLAN riêng biệt, một broadcast từ host A chỉ có thể đi đến các thiết bị khả dụng ở trong cùng một Virtual LAN. Các host của Virtual LAN sẽ không hề biết về cách thức giao tiếp.
```
Khi một switch được cấu hình thành các VLAN riêng biệt, mỗi VLAN hoạt động như một mạng LAN độc lập. Gói tin broadcast từ một thiết bị chỉ truyền trong phạm vi VLAN của thiết bị đó và không lan ra các VLAN khác. Điều này giúp chia nhỏ mạng thành các phân đoạn, giảm lưu lượng không cần thiết, tăng cường bảo mật và kiểm soát dễ dàng hơn. Các thiết bị trong cùng một VLAN giao tiếp với nhau mà không cần phải hiểu về việc có nhiều VLAN tồn tại, vì chúng hoạt động như thể nằm trong cùng một mạng LAN thông thường.
```

# Cách hoạt động của VLAN
Binh.NMT/CCNA/06. VLAN/images/Cách hoạt động của VLAN.png

VLAN hoạt động bằng cách đánh dấu các khung Ethernet với một mã VLAN (VLAN ID). Mã VLAN này xác định VLAN mà khung Ethernet thuộc về. Khi một thiết bị gửi khung Ethernet, chúng sẽ thêm mã VLAN vào khung. Khi khung Ethernet đến bộ chuyển mạch, bộ chuyển mạch sẽ đọc mã VLAN và chuyển khung đến cổng tương ứng với VLAN đó.

Chi tiết về các bước mà VLAN hoạt động:

- Gửi khung Ethernet: Khi một thiết bị gửi khung Ethernet, nó sẽ thêm mã VLAN vào khung. Mã VLAN này xác định VLAN mà khung Ethernet thuộc về.
- Chuyển khung đến bộ chuyển mạch: Khung Ethernet được truyền qua cáp đến bộ chuyển mạch.
- Bộ chuyển mạch đọc mã VLAN: Bộ chuyển mạch đọc mã VLAN trong khung Ethernet.
- Chuyển khung đến cổng tương ứng: Bộ chuyển mạch chuyển khung Ethernet đến cổng tương ứng với VLAN được xác định bởi mã VLAN.
- Thiết bị nhận khung: Thiết bị trên cổng nhận được khung Ethernet và xử lý nó.
# Phân loại VLAN
- Port-based VLAN: Loại VLAN này dựa trên cổng của switch để phân chia các thiết bị thành các VLAN khác nhau. Các thiết bị trong cùng một VLAN sẽ được kết nối đến cùng một cổng của switch.

- Tagged VLAN: Loại VLAN này cho phép chia một cổng switch thành nhiều VLAN. Các gói tin truyền đi trên một cổng này sẽ được gắn thêm tag để xác định VLAN tương ứng.

- Protocol-based VLAN: Loại VLAN này phân chia các thiết bị dựa trên loại giao thức mà chúng sử dụng. Các thiết bị sử dụng cùng loại giao thức sẽ thuộc cùng một VLAN.

- Management VLAN: Loại VLAN này được sử dụng để quản lý các thiết bị trong mạng. Tất cả các switch, router và các thiết bị quản lý khác sẽ được gán vào VLAN này để đảm bảo tính an toàn và bảo mật.

- Voice VLAN: Loại VLAN này được sử dụng để phân biệt các thiết bị điện thoại từ các thiết bị khác trong mạng. Khi được gán vào Voice VLAN, thiết bị điện thoại sẽ được ưu tiên truyền tải âm thanh và video, đảm bảo chất lượng cuộc gọi.

- Default VLAN: Loại VLAN mặc định được tạo ra khi switch được cấu hình và các cổng của nó không được gán cho bất kỳ VLAN nào khác. Các thiết bị kết nối đến các cổng này sẽ thuộc Default VLAN.

# Ứng dụng của VLAN
Một số ứng dụng cơ bản của VLAN:
## Chia tách mạng logic
VLAN giúp chia tách mạng vật lý thành các mạng logic riêng biệt, mỗi mạng logic có thể đại diện cho một bộ phận, phòng ban hoặc nhóm người dùng khác nhau trong tổ chức. Việc chia tách mạng logic mang lại nhiều lợi ích như:
- **Tăng cường tính bảo mật:** Mỗi VLAN hoạt động như một mạng riêng biệt, giúp hạn chế truy cập trái phép giữa các bộ phận, phòng ban, ngăn chặn sự lây lan của virus và phần mềm độc hại.
- **Cải thiện hiệu suất mạng:** Việc chia tách lưu lượng truy cập theo VLAN giúp giảm thiểu tình trạng tắc nghẽn mạng, đảm bảo hiệu suất mạng tốt hơn cho các ứng dụng quan trọng.
- **Dễ dàng quản lý:** Quản trị viên mạng có thể dễ dàng quản lý và điều khiển lưu lượng truy cập trong từng VLAN, giúp đơn giản hóa việc quản lý mạng và khắc phục sự cố.

![](https://static-xf1.vietnix.vn/wp-content/uploads/2024/04/ung-dung-cua-vlan-la-chia-tach-mang-logic.webp)

## Phân đoạn mạng
VLAN giúp phân đoạn mạng thành các vùng riêng biệt, mỗi vùng có thể có các chính sách bảo mật và chất lượng dịch vụ (QoS) riêng. Việc phân đoạn mạng đặc biệt hữu ích trong các môi trường mạng có nhiều loại lưu lượng truy cập khác nhau, chẳng hạn như mạng văn phòng, mạng VoIP, mạng IoT, v.v.
## Tạo mạng ảo cho các dịch vụ đặc biệt
Mạng VLAN có thể được sử dụng để tạo ra các mạng ảo cho các dịch vụ đặc biệt như mạng khách, mạng DMZ, v.v. Việc tạo ra các mạng ảo riêng biệt giúp tăng cường bảo mật và khả năng kiểm soát cho các dịch vụ này.
## Hỗ trợ cho các ứng dụng đa phát sóng
VLAN giúp cải thiện hiệu quả của các ứng dụng đa phát sóng như chia sẻ tệp, họp trực tuyến, v.v. bằng cách giới hạn lưu lượng truy cập đa phát sóng trong phạm vi VLAN.
## Giảm thiểu chi phí
Việc sử dụng VLAN có thể giúp giảm thiểu chi phí đầu tư cho hạ tầng mạng bằng cách cho phép sử dụng chung các thiết bị mạng như switch, router, v.v.
## Một số ứng dụng khác
Tách biệt mạng chính với mạng dự phòng.

Cung cấp quyền truy cập mạng cho nhân viên hoặc khách hàng.

Hỗ trợ cho các mạng VPN.

Tạo ra các mạng Wi-Fi riêng biệt.
