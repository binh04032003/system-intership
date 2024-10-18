# Mô hình TCP/IP
## 1. Mô hình TCP/IP là gì?
![](https://cdn2.hubspot.net/hubfs/7414578/Imported_Blog_Media/TCP-Stack.png)

TCP/ IP (Transmission Control Protocol/ Internet Protocol - Giao thức điều khiển truyền nhận/ Giao thức liên mạng), là một bộ giao thức trao đổi thông tin được sử dụng để truyền tải và kết nối các thiết bị trong mạng Internet. TCP/IP được phát triển để mạng được tin cậy hơn cùng với khả năng phục hồi tự động.

TCP/IP gồm 2 giao thức chính:

- TCP: Có chức năng xác định các ứng dụng và tạo ra các kênh giao tiếp. TCP cũng có chức năng quản lý các thông tin khi được chia nhỏ để truyền tải qua internet. Giao thức này sẽ tập hợp các thông tin này theo đúng thứ tự, đảm bảo truyền tải thông tin chính xác tới địa chỉ đến.

- IP: Đảm bảo thông tin được truyền đến đúng địa chỉ. IP sẽ gán các địa chỉ và định tuyến từng gói thông tin. Mỗi mạng sẽ có 1 địa chỉ IP để xác định được chính xác nơi chuyển/nhận thông tin, dữ liệu.

TCP/IP là sự kết hợp giữa 2 giao thức. Trong đó IP (Giao thức liên mạng) cho phép các gói tin được gửi đến đích đã định sẵn, bằng cách thêm các thông tin dẫn đường vào các gói tin để các gói tin được đến đúng đích đã định sẵn ban đầu. Và giao thức TCP (Giao thức truyền vận) đóng vai trò kiểm tra và đảm bảo sự an toàn cho mỗi gói tin khi đi qua mỗi trạm. Trong quá trình này, nếu giao thức TCP nhận thấy gói tin bị lỗi, một tín hiệu sẽ được truyền đi và yêu cầu hệ thống gửi lại một gói tin khác. Quá trình hoạt động này sẽ được làm rõ hơn ở chức năng của mỗi tầng trong mô hình TCP/IP.
## 2. Các layer trong mô hình TCP/IP
### 2.1 Tổng quan
Mô hình TCP/IP có 4 lớp chức năng tương ứng như sau: lớp truy cập, lớp mạng, lớp vận chuyển và lớp ứng dụng.
### 2.2 Chức năng của từng layer
#### 2.2.1 Lớp truy cập
Lớp truy cập xử lý việc truyền tải thông điệp vật lý và phương tiện cho việc truyền dữ liệu. Các thiết bị vật lý như switch, cáp mạng, card mạng, HBA - Host Bus Adapter là các thành phần truy cập. Các giao thức và tiêu chuẩn về phương tiện truyền nằm ở lớp này.
#### 2.2.2 Lớp mạng
Lớp mạng có vai trò dẫn các gói tin đi qua các mạng đến đúng đích. Các giao thức chính trong lớp này bao gồm:
- IP - Internet Protocol
- ICMP - Internet Control Message Protocol
- IGMP - Internet Group Management Protocol
- ARP - Address Resolution Protocol
#### 2.2.3 Lớp vận chuyển
Lớp vận chuyển đảm nhận vai trò phân mảnh các gói tin lớn khi truyền và tập hợp lại khi nhận, đảm bảo tính toàn vẹn cho dữ liệu (không lỗi, không mất, đúng thứ tự).
#### 2.2.4 Lớp ứng dụng
Lớp ứng dụng đảm nhận vai trò tạo ra các kết nối giữa dữ liệu và ứng dụng. 
## 3. Workflow của mô hình TCP/IP
![](https://raw.githubusercontent.com/ducthien1998/system-intership/main/ThienBD/01.CCNA/imgs/4.png)
- **Bên gửi:**

  - **Lớp ứng dụng:** Người dùng đưa thông tin vào máy tính, dữ liệu sẽ được lớp này định dạng. Sau đó thiết lập và duy trì phiên làm việc, đóng dữ liệu thành data kèm theo 1 header và đưa xuống các lớp dưới để xử lý.
  - **Lớp vận chuyển**: Data được nhận từ lớp trên sẽ được phân mảnh thành các segment, các segment sẽ được đóng thêm TCP/UDP header chứa thông tin điều khiển và chuyển xuống các lớp dưới để tiếp tục xử lý.
  - **Lớp mạng:** Lớp mạng sẽ làm nhiệm vụ định tuyến gói tin (packet) được gửi xuống từ lớp trên. Lớp này sẽ chọn ra đường đi tối ưu bằng cách xác định địa chỉ IP của máy nguồn/đích. Đóng thêm IP header vào TCP/UDP Segment từ lớp trên tạo thành IP datagram và chuyển xuống lớp dưới để tiếp tục xử lý.
  - **Lớp truy cập:** Đầu tiên giao thức ARP của lớp này sẽ làm nhiệm vụ chuyển đổi địa chỉ IP sang địa chỉ MAC bằng cách gửi một bản tin request tới các máy trong mạng LAN. Trong bản tin đó có chứa địa chỉ IP của máy đích, máy nào nhận được kiểm tra là đúng địa chỉ IP của máy mình thì sẽ gửi lại 1 bản tin ARP reply bao gồm địa chỉ MAC của máy đó. Tầng này khi gộp data và header của tầng trên thành 1 data rồi và sau khi giao thức ARP có được địa chỉ MAC thì nó kèm theo 3 header đó là MAC header, LLC và header Mac CRC.
      - Logical Link Control (LLC): Có nhiệm vụ bảo vệ lớp trên từ bất cứ phương pháp truy cập cụ thể nào hoặc truy cập đường truyền cụ thể nào. Các lớp trên không lo lắng về cách kết nối của chúng tới mạng Ethernet bởi vì LLC điều khiển giao diện này.
      - (MAC-Media Access Control ) MAC header thì để xác định chính xác ai là người nhận vì mỗi máy chỉ có 1 địa chỉ MAC duy nhất.
      - MAC CRC (Cyclic Redundancy Check) để kiểm tra và phát hiện lỗi.

    Toàn bộ data và header này sẽ được đóng gói thành 1 frame và độ dài của byte tùy thuộc vào dữ liệu được gửi và nó sẽ chuyển sang dạng bit (0,1) để truyền qua đường truyền vật lý.
- **Bên nhận:**

   - **Lớp truy cập:** Nhận được dữ liệu bên máy gửi thì nó sẽ giải mã các bit (0,1) rồi đưa lại thành 1 frame và dùng giao thức MAC CRC và MAC Header để kiểm tra lỗi và xác định xem ai là người nhận. Sau khi kiểm tra xong thì nó sẽ loại bỏ 2 header này đi và gửi data và header còn lại lên tầng 2.

   - **Lớp mạng:** Sau khi nhận được data và header của lớp truy cập thì lớp mạng sẽ kiểm tra IP header để xác định đường đi đến người nhận. Sau khi xác định xong thì sẽ loại bỏ IP Header này đi và gửi data và header còn lại lên lớp trên.
   - **Lớp vận chuyển:** Khi đã nhận được dữ liệu thì lớp vận chuyển sẽ sử dụng header TCP/UDP để ghép các segment lại.
      - Đối với UDP thì sau khi nhận được dữ liệu và ghép xong thì sẽ không cần quan tâm đến là lỗi hay không.
      - Còn TCP thì sẽ xác nhận từng segment và gửi phản hổi lại cho bên máy gửi là đã nhận rồi thì bên máy gửi mới tiếp tục gửi các segment tiếp theo cho đến khi không còn segment nào.
      - Sau khi ghép dữ liệu xong 1 cách tuần tự thì sẽ loại bỏ header này và gửi data lên lớp trên.
    - **Lớp ứng dụng:** Sau khi nhận được data từ lớp dưới thì lớp này chỉ có nhiệm vụ là chuyển toàn bộ data này cho máy nhận như thể trạng bạn đầu.





## 4. So sánh với mô hình OSI
![](https://cdn2.hubspot.net/hubfs/7414578/Imported_Blog_Media/TCP-OSI.png)

### 4.1 Tổng quan
Tổng quan mô hình OSI cung cấp một khuôn khổ để các nhà phát triển có thể tạo ra các ứng dụng máy tính tiêu chuẩn, mô hình OSI giúp chuẩn hóa quá trình phát triển ứng dụng xuyên suốt tất cả các bước của quá trình giao tiếp. Trong khi đó, mô hình TCP-IP được xây dựng để phát triển hỗ trợ tập trung vào internet, đảm bảo rằng các ứng dụng đang được phát triển phù hợp với các chức năng của internet.
### 4.2 Tương quan giữa hai mô hình
- Về mặt cấu trúc
   - Khác nhau về số lớp
     - TCP/IP kết hợp lớp Presentation và lớp Session vào lớp Application.
     - Lớp Data Link và Lớp Physical cũng được thì được kết hợp vào lớp Network Access.
- Về mặt kết nối
   - Mô hình OSI hỗ trợ cả truyền dữ liệu có kết nối và không kết nối ở lớp Network và truyền dữ liệu có kết nối ở lớp Transport.
   - Mô hình TCP/IP chỉ hỗ trợ 1 phương thức truyền dữ liệu không kết nối ở lớp Internet nhưng ở lớp Transport lại hỗ trợ cả hai phương thức truyền có kết nối và không kết nối.
- Về mặt khái niệm.
   - Mô hình OSI phân biệt rõ 3 khái niệm cơ bản:
     - Dịch vụ.
     - Giao diện.
     - Giao thức.
   - Mô hình TCP/IP thì không phân biệt được ranh giới 3 khái niệm này.
 - Về mặt thiết kế.
   - Mô hình OSI: được thiết kế trước khi có các giao thức, Không thiết kế để dùng cho chồng giao thức, mang tính tổng quát, các chức năng đưa ra không phù hợp với thực tế.
   - Mô hình TCP/IP: được thiết kế sau khi có các giao thức và mô hình thực tế chỉ là mô tả các giao thức đã có.