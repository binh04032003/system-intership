# Tổng quan
TCP và UDP là hai giao thức ở lớp chuyển tiếp.
# 1. TCP (Transmission Control Protocol) - Giao thức điều khiển truyền vận 

Khái niệm:
- Là giao thức hướng kết nối (connection-oriented) tức là khi muốn truyền dữ liệu phải thiết lập kết nối trước.
- Hỗ trợ cơ chế full-duplex (truyền và nhận dữ liệu đồng thời).
- Cung cấp cơ chế đánh số gói tin (sequencing), để ráp các gói tin cho đúng ở điểm nhận.
- Cung cấp cơ chế báo nhận (acknowledgement), khi bên A gửi dữ liệu qua bên B, khi bên B nhận được sẽ gửi gói tin xác nhận là đã nhận. 
- Phục hồi dữ liệu bị mất trên đường truyền, bên A sẽ gửi lại cho bên B nếu chưa nhận được tin xác nhận.

Quá trình bắt tay 3 bước:
- Đối với giao thức TCP, trước khi truyền dữ liệu sẽ thiết lập kết nối bằng quá trình bắt tay 3 bước (Three-way handshake):
  - Bước 1: Client sẽ gửi yêu cầu kết nối tới máy chủ
  - Bước 2: Server nhận được yêu cầu và gửi trả lại gói tin SYN/ACK để xác nhận kết nối
  - Bước 3: Client sẽ gửi lại dữ liệu hồi âm

Ưu điểm:
- Truyền dữ liệu theo đúng thứ tự, chính xác.
- Không mất dữ liệu, độ tin cậy cao.

Nhược điểm:

=>> Vấn đề của giao thức TCP là phía nhận sẽ không nhận được các gói tin mới sau một gói bị lỗi cho đến khi gói tin lỗi đó được truyền lại. 
- Độ trễ lớn
- Không đáp ứng được yêu cầu về thời gian thực

Ứng dụng sử dụng TCP:
- SMTP - port 125.
- FTP - port 21.
- HTTP - port 80.

TCP header:

![](../imgs/TCP%20HEADER.png)

- Mỗi header của TCP có 10 trường bắt buộc với tổng kích thước là 20 bytes (160 bit). Phần dữ liệu có thể bổ sung trong TCP header là 40 bytes.
- Trong header của TCP, các thành phần xuất hiện theo trình tự sau:
```
Số cổng TCP nguồn - Source port number (2 byte)
Số cổng TCP đích - Destination port number (2 byte)
Số thứ tự - Sequence number (4 byte)
Số xác nhận - ACKnowledgement number (4 byte)
Dữ liệu TCP bù - data offset (4 bit)
Dữ liệu dành riêng - reverved (3 bit)
Cờ điều khiển - control flags (tối đa 9 bit)
Kích thước cửa sổ - Window size (2 byte)
Tổng kiểm tra TCP - Checksum (2 byte)
Con trỏ khẩn cấp - Urgent pointer (2 byte)
Dữ liệu tùy chọn TCP - optional data (0-40 byte)
```
- Cụ thể:
   - **Source port number và destination port number:** Số cổng TCP nguồn và đích là điểm cuối giao tiếp để gửi và nhận thiết bị. VD: client từ 1024 - 65535, server từ 1 - 1023.
   - **Sequence number:** Người gửi tin nhắn sử dụng số thứ tự để đánh dấu thứ tự của một nhóm tin nhắn (segment). Cả người gửi và người nhận đều sử dụng trường số xác nhận để truyền đạt số thứ tự của tin nhắn được nhận gần đây hoặc dự kiến sẽ được gửi.
   - **Acknowledgement number:** Nếu cờ ACK bật thì giá trị của trường chính là số thứ tự gói tin tiếp theo mà bên nhận cần.
   - **Data offset:** Trường có độ dài 4 bits qui định độ dài của phần header (tính theo đơn vị từ 32 bits). Phần header có độ dài tối thiểu là 5 từ (160 bits) và tối đa là 15 từ (480 bits).
   - **reserved:** Dữ liệu dự trữ trong các header TCP luôn có giá trị bằng 0. Trường này phục vụ mục đích căn chỉnh tổng kích thước tiêu đề (quan trọng đối với hiệu quả xử lý dữ liệu máy tính).
   - **control flags:** TCP sử dụng một bộ sáu cờ điều khiển tiêu chuẩn và ba cờ mở rộng (mỗi bit riêng lẻ (0 là tắt, 1 là bật) đại diện cho bật hoặc tắt) để quản lý luồng dữ liệu trong các tình huống cụ thể.
   - **Window size:** Người gửi TCP sử dụng một số được gọi là kích thước cửa sổ để điều chỉnh lượng dữ liệu họ gửi đến người nhận trước khi yêu cầu xác nhận lại. Nếu kích thước cửa sổ trở nên quá nhỏ, việc truyền dữ liệu mạng sẽ chậm một cách không cần thiết, trong khi nếu kích thước cửa sổ quá lớn, liên kết mạng có thể bị bão hòa (không thể sử dụng cho bất kỳ ứng dụng nào khác) hoặc người nhận có thể không thể xử lý dữ liệu đến nhanh chóng (cũng dẫn đến hiệu suất chậm). Các thuật toán window được tích hợp trong giao thức sẽ tự động tính toán các giá trị kích thước và sử dụng trường tiêu đề TCP này để phối hợp các thay đổi giữa người gửi và người nhận.
   - **checksum:** Các giá trị bên trong một tiêu đề TCP được tạo ra bởi người gửi giao thức như một kỹ thuật để giúp người nhận phát hiện tin nhắn được hỏng hoặc giả mạo.
   - **Urgent pointer:** Trường con trỏ khẩn cấp thường được đặt thành 0 và bị bỏ qua, nhưng kết hợp với một trong các cờ điều khiển, nó có thể được sử dụng làm phần bù dữ liệu để đánh dấu một tập hợp con của thông điệp cần xử lý ưu tiên.
   - **optional data:** Việc sử dụng dữ liệu TCP tùy chọn bao gồm hỗ trợ cho các thuật toán xác nhận và mở rộng. Trường này không nằm trong TCP header. Giá trị của trường này là thông tin dành cho các tầng trên (trong mô hình 7 lớp OSI).




# 2. UDP (User Datagram Protocol) - Giao thức gói dữ liệu người dùng

Khái niệm: 
- UDP là giao thức connection-less, tức là dữ liệu sẽ gửi đi ngay mà không cần thiết lập kết nối trước.
- Không đảm bảo độ tin cậy khi truyền dữ liệu (không quan tâm đến gói tin đến đích hay không).
- Không có cơ chế phục hồi dữ liệu (không biết gói tin có bị mất mát trên đường đi hay không).

Nhược điểm:
- UDP không thực hiện quá trình bắt tay 3 bước giữa bên gửi và bên nhận, vì thế bên gửi sẽ không biết được datagram đã đến đích hay chưa. 

Ứng dụng sử dụng UDP:
- DNS - port 53.
- Streaming media.
- Voice over IP.

UDP header:

![](../imgs/UDP%20Header.png)

- Một header của UDP chứa 8 bytes, được chia thành 4 trường bắt buộc:
```
Source port (2 bytes)
Destination port (2 bytes)
Length (2 bytes)
Checksum (2 bytes)
```
- Cụ thể
  - **Source port:** Trường này xác định cổng của người gửi thông tin và có ý nghĩa nếu muốn nhận thông tin phản hồi từ người nhận. Nếu không dùng đến thì đặt nó bằng 0.
  - **Destination Port:** Số cổng UDP nguồn và đích là điểm cuối giao tiếp để gửi và nhận thiết bị (giống TCP).
  - **Length:** Trường này có độ dài 16 bit xác định chiều dài của toàn bộ datagram: phần header và dữ liệu. Chiều dài tối thiểu là 8 byte khi gói tin không có dữ liệu, chỉ có header.
  - **Checksum:** Tương tự như TCP, tổng kiểm tra UDP cho phép người nhận kiểm tra chéo dữ liệu đến cho bất kỳ bit bị hỏng nào của tin nhắn.
# 3. Sự khác biệt giữa TCP và UDP
- TCP là giao thức hướng kết nối (connection-oriented) nên các phiên được duy trì giữa các host. Trong khi UDP là giao thức connectionless nên không hỗ trợ bất kỳ phiên nào.
- Về độ tin cậy, UDP không đảm bảo rằng chỉ có một bản sao dữ liệu tới đích. Để gửi dữ liệu tới các hệ thống cuối, UDP phân chia dữ liệu thành các đoạn nhỏ. UDP không đảm bảo rằng các đoạn này sẽ đến đích đúng thứ tự như chúng đã được tạo ra ở nguồn. Ngược lại, TCP sử dụng các số thứ tự cùng với số hiệu cổng và các gói tin xác thực thường xuyên, điều này đảm bảo rằng các gói tin đến đích đúng thứ tự mà nó đã được tạo ra.
- Về kiểm soát luồng, UDP không có kiểm soát luồng; kết quả là, một ứng dụng UDP được thiết kế tồi có thể làm giảm băng thông của mạng.

![](../imgs/So%20sánh%20TCP%20và%20UDP.png)
