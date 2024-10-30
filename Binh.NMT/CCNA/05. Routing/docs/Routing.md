# 1. Routing là gì?
Định tuyến (Routing) là quá trình tìm kiếm và xác định đường đi tốt nhất trên một mạng máy tính để gói tin tới được đích thông qua các thiết bị định tuyến. Để làm được điều đó thì các thiết bị định tuyến cần phải dựa vào thông tin bảng định tuyến (Routing Table) và giao thức định tuyến ( Routing Protocol).

Bộ routing hoạt động ở lớp network trong mô hình OSI và lớp internet trong mô hình TCP/IP. Bộ routing là một thiết bị mạng chuyển tiếp gói tin dựa trên thông tin có sẵn trong tiêu đề gói và bảng chuyển tiếp.

Các thuật toán routing được sử dụng để routing các gói tin. Thuật toán routing chịu trách nhiệm quyết định con đường tối ưu mà gói tin có thể được truyền đi.

Các giao thức routing sử dụng số liệu để xác định đường dẫn tốt nhất cho việc phân phối gói. Số liệu là tiêu chuẩn đo lường như đếm bước nhảy, băng thông, độ trễ, tải hiện tại trên đường dẫn, v.v. được sử dụng bởi thuật toán routing để xác định đường dẫn tối ưu đến đích.
# 2. Chức năng của Routing
**Định Tuyến (Path Selection):** Chọn đường đi tối ưu để truyền các gói dữ liệu.

**Chuyển Tiếp Gói (Packet Forwarding):** Chuyển tiếp các gói dữ liệu qua các nút mạng trung gian.

**Quản Lý Bảng Định Tuyến (Routing Table Management):** Duy trì và cập nhật bảng định tuyến chứa thông tin về các đường đi.
# 3. Các loại Routing
Routing gồm hai loại chính là Static Routing (Định tuyến tĩnh) và Dynamic Routing (Định tuyến động).
## Static Routing
- Là quá trình định tuyến thực hiện thủ công, cấu hình bằng tay từng đường đi và địa chỉ cụ thể cho Router. Bộ routing sẽ gửi các gói tin đến đích dọc theo tuyến đường do quản trị viên xác định. 
- Một dạng mặc định của định tuyến tĩnh là Default Route. Định tuyến này được sử dụng khi ta chưa cấu hình định tuyến đường đi cụ thể nào.
- Ưu điểm của định tuyến tĩnh:
  - Sử dụng ít băng thông hơn so với các phương thức định tuyến khác.
  - Không tiêu tốn tài nguyên để tính toán và phân tích gói tin định tuyến.
  - Dễ dàng triển khai, cấu hình.
  - Có tính bảo mật tốt hơn.
- Nhược điểm của định tuyến tĩnh:
  - Không có khả năng tự động cập nhật đường đi.
  - Phải cấu hình thủ công khi mạng có sự thay đổi.
  - Khả năng mở rộng kém, phù hợp với mô hình mạng nhỏ.
- Những trường hợp sử dụng định tuyến tĩnh:
  - Đường truyền có băng thông thấp.
  - Người quản trị cần kiểm soát các kết nối trong hệ thống.
  - Kết nối dùng định tuyến tĩnh là đường dự phòng cho đường kết nối dùng giao thức định tuyến động.
## Dynamic Routing
- Là quá trình định tuyến mà router sẽ thực hiện định tuyến một cách tự động (automatically).
- Là một kỹ thuật trong đó một bộ routing thêm một tuyến mới trong bảng routing cho mỗi gói để đáp ứng với những thay đổi trong điều kiện hoặc cấu trúc liên kết của mạng.
- Các giao thức động được sử dụng để khám phá các tuyến đường mới để đến đích.
- Trong routing động, RIP và OSPF là các giao thức được sử dụng để khám phá các tuyến mới.
- Nếu bất kỳ tuyến đường nào đi xuống, thì điều chỉnh tự động sẽ được thực hiện để đến đích.
- Khi thực hiện định tuyến động, các thiết bị phải có tính năng sau:
  - Tất cả các bộ routing phải có cùng một giao thức routing động để trao đổi các tuyến.
  - Nếu bộ routing phát hiện ra bất kỳ thay đổi nào trong điều kiện hoặc cấu trúc liên kết, thì bộ routing sẽ phát thông tin này đến tất cả các bộ routing khác.
- Ưu điểm của định tuyến động:
  - Dễ dàng để cấu hình.
  - Hiệu quả trong việc lựa chọn tuyến đường tốt nhất để đáp ứng với những thay đổi trong điều kiện hoặc cấu trúc liên kết.
- Nhược điểm của định tuyến động:
   - Đắt hơn về việc sử dụng CPU và băng thông.
   - Kém an toàn hơn so với routing mặc định và tĩnh.
# 4. Routing Table
## Tổng quan
Trong mạng IP sử dụng chuyển mạch gói, khi số lượng người dùng và số node mạng trung chuyển là rất lớn, yêu cầu đặt ra là các node mạng phải thông minh hơn, tự động tìm được tuyến đường tốt nhất để đi đến đích (best route). Vì vậy, người ta đã sinh ra các giao thức định tuyến (Routing Protocol) để tìm được best route. Và các best route này sẽ được lưu lại trong một database để khi có gói tin đến, router sẽ tra database và tìm ra được đường đi cho gói tin => database này chính là bảng định tuyến (Routing Table).
## Cấu tạo của bảng định tuyến
Một bảng định tuyến gồm nhiều entry, mỗi entry chứa thông tin về các tuyến đường đến các đích khác nhau. Cấu trúc của một entry bao gồm:

- Địa chỉ IP đích (destination IP): Địa chỉ này có thể là địa chỉ của một host cụ thể, hoặc là một địa chỉ của một mạng. Nếu là địa chỉ host, entry này sẽ có host-ID khác 0 để nhận diện một host. Nếu là địa chỉ mạng, phần host-ID = 0.

- Địa chỉ IP của next-hop router (next-hop IP), hoặc địa chỉ của một mạng kết nối trực tiếp (directly connected IP address): Là địa chỉ của đích đến tiếp theo (router) có thể chuyển tiếp gói tin đến đích.

- Network interface: Là cổng của router được sử dụng để gửi gói tin đến next-hop.

- Cờ (flags): Cho biết nguồn cập nhật của tuyến (route). Ví dụ: S – Static Route, C – Connected Route, O – OSPF Route…

- Metric cost (hay đơn giản là metric) trong các giao thức định tuyến là một giá trị dùng để đo lường và so sánh độ ưu tiên của các tuyến đường để chọn ra tuyến đường tốt nhất. Giá trị metric này được tính dựa trên các tiêu chí khác nhau, tùy thuộc vào từng giao thức định tuyến cụ thể. Mục đích của metric là để đánh giá chi phí hoặc hiệu quả của tuyến đường, giúp router đưa ra quyết định chọn tuyến đường tối ưu.

   Một số yếu tố thường được sử dụng để tính metric cost bao gồm:

    - Số bước nhảy (hop count): Là số lượng router trung gian mà gói tin phải đi qua để đến được đích (ví dụ như trong RIP).
    - Băng thông (bandwidth): Một số giao thức như OSPF hoặc EIGRP sử dụng băng thông của các liên kết để tính toán chi phí. Liên kết có băng thông lớn hơn sẽ có chi phí thấp hơn và được ưu tiên.
    - Độ trễ (delay): Là độ trễ trong việc truyền dữ liệu qua liên kết. Đường có độ trễ thấp hơn thường được ưu tiên.
    - Độ tin cậy (reliability): Một số giao thức có thể xem xét đến độ tin cậy của liên kết, dựa trên lịch sử hoạt động của nó (ví dụ như có bao nhiêu lỗi hoặc thất bại).
    - Tải (load): Lượng lưu lượng mà tuyến đường đang gánh chịu, giúp đánh giá mức độ tải của các liên kết.
-  Giá trị AD là viết tắt của Administrative Distance (Khoảng cách Quản trị). Administrative Distance là một giá trị số được sử dụng trong các router để xác định độ tin cậy của thông tin định tuyến nhận được từ các giao thức định tuyến khác nhau.

    Ý nghĩa của giá trị AD:

   - Độ tin cậy của thông tin định tuyến: Giá trị AD càng thấp thì thông tin định tuyến từ giao thức đó được coi là đáng tin cậy hơn.

   - Ưu tiên lựa chọn đường đi: Khi một router nhận được thông tin về cùng một mạng đích từ nhiều giao thức định tuyến khác nhau, nó sẽ ưu tiên sử dụng thông tin từ giao thức có giá trị AD thấp nhất.