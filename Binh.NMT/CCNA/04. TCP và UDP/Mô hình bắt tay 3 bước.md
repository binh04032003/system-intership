# Mô hình bắt tay 3 bước
Quá trình bắt tay 3 bước sử dụng SYN và ACK có sẵn trong TCP giúp hoàn thiện kết nối trước khi truyền. Mỗi TCP segment sẽ mang theo dữ liệu với sự trợ giúp từ các TCP flag options, cho phép bên gửi và bên nhận chỉ ra cờ nên được sử dụng để các Segment xử lý một cách chính xác ở bên kia. 
![](https://camo.githubusercontent.com/5322384943e827a6b84da2c2792c0893149e608edca27f2114d22f27fb215a66/687474703a2f2f332e62702e626c6f6773706f742e636f6d2f2d466b5848684a4f625563302f55635a6537626a754d56492f41414141414141414149342f366d5948794134346f42452f73313630302f7463702d616e616c797369732d73656374696f6e2d342d312e676966)

Với tất cả các cờ, giá trị bằng "1" tương ứng với cờ đấy đang được bật. Trong hình cho thấy cờ SYN đang được bật, tương ứng với đây là segment đầu tiên của một kết nối TCP mới. Mỗi cờ có độ dài 1 bit và có 6 cờ tất cả nên TCP flags có tổng độ dài là 6 bits. Trong đó 3 cờ phổ biến là SYN, ACK và FIN lần lượt dùng để thiết lập kết nối, báo nhận thành công và kết thúc kết nối.
## TCP flag options
- **Cờ đầu tiên: Urgent Pointer.** Cờ này để xác định dữ liệu đến là "khẩn cấp" tức là nâng độ ưu tiên của Segment. Những Segment có cờ Urgent Pointer được bật không phải chờ đợi cho đến khi các Segment trước đó được xử lý mà được gửi trực tiếp và xử lý ngay lập tức.
- **Cờ thứ 2 - ACKnowledgement.** Cờ ACK được sử dụng để xác nhận việc nhận thành công các gói tin. Khi client gửi yều cầu kết nối trong đó có cờ syn, Sau khi server nhận được cờ syn rồi thì sẽ phản hồi lại cho client 1 gói tin gồm có cờ syn và 1 cờ ACK đi sau nó để báo là đã nhận gói dữ liệu vừa nhận được. 
- **Cờ thứ 3 - PUSH.** Cờ PUSH giống như cờ Urgent Pointer, tồn tại để đảm bảo rằng các dữ liệu được ưu tiên và được xử lý tại nơi gửi hoặc nơi nhận. Cờ này cụ thể được sử dụng khá thường xuyên ở đầu và cuối của việc truyền dữ liệu, ảnh hưởng đến cách dữ liệu được xử lý ở cả 2 đầu. Khi sử dụng, cờ PUSH làm cho các Segment chắc chắn được xử lý 1 cách chính xác và ưu tiên thích hợp ở cả 2 đầu của kết nối.

    - Khi 1 máy muốn gửi dữ liệu của nó, nó tạm thời được cất trong bộ đệm TCP, 1 khu vực đặc biệt trong bộ nhớ, cho đến khi Segment đã đạt đến 1 kích thước nhất định và sau đó được gửi đến bên nhận. Thiết kế này đảm bảo rằng việc chuyển giao dữ liệu là hiệu quả nhất có thể mà không phải đợi thời gian và băng thông bằng cách tạo ra nhiều Segment, nhưng kết hợp chúng vào 1 hoặc nhiều cái lớn hơn.
- **Cờ thứ 4 - Reset (RST).** Cờ RST là cờ được sử dụng khi 1 Segment đến mà không được dự định dùng trong kết nối hiện thời. Nói cách khác, nếu ta gửi 1 gói tin đến 1 máy chủ để thiết lập kết nối và không có dịch vụ nào chờ đợi để trả lời yêu cầu, máy chủ sẽ tự động gửi 1 gói tin trả lời với cờ RST được bật. Điều này chỉ ra rằng máy chủ đã thiết lập lại kết nối.
- **Cờ thứ 5 - SYNchronisation.** Cờ thứ 5 trong TCP Flag Options thường được sử dụng nhất trong truyền thông sử dụng TCP.Cờ SYN được sử dụng để khởi tạo quá trình bắt tay 3 bước trong TCP.

    - Trong hình dưới, Host A cần phải tải dữ liệu từ Host B sử dụng giao thức TCP. Quá trình bắt tay 3 bước được thực hiện trước khi việc truyền dữ liệu xảy ra. Trong quá trình bắt tay 3 bước, chúng ta thấy có tổng cộng 2 cờ SYN được truyền. Khi trao đổi dữ liệu và kết nối mới đã được tạo ra, chúng ta sẽ thấy nhiều cờ SYN được gửi và nhận.
    ![](https://camo.githubusercontent.com/7a4719b47d8d617de44756c8d28653e1d9e098b1caf2ed07e216f663cf0c45d7/687474703a2f2f332e62702e626c6f6773706f742e636f6d2f2d59646e4e7264727a5754452f55635a306539446b3949492f4141414141414141414a492f6d464d49746d685f7a394d2f73313630302f7463702d616e616c797369732d73656374696f6e2d342d322e676966)
    
- **Cờ thứ 6 - FIN.** Cờ cuối cùng cờ FIN, viết tắt của từ FINished. Cờ này luôn xuất hiện khi các gói dữ liệu cuối cùng được trao đổi giữa 1 kết nối.
    - Thủ tục ngắt kết nối được thực hiện như sau:
    ![](https://camo.githubusercontent.com/fbaf22f4270243f69f06c5eb18664be8f14b206b52b312126751fd5158ca5e6c/687474703a2f2f342e62702e626c6f6773706f742e636f6d2f2d57763346345a35304874632f55635a33425a6b424b43492f4141414141414141414a592f474b7255313843574271772f73313630302f7463702d616e616c797369732d73656374696f6e2d342d332e676966)
    - Khi việc truyền dữ liệu hoàn tất, máy A gửi 1 gói tin với cờ FIN và ACK được thiết lập. Tại thời điểm này, ứng dụng của máy A sẽ không nhận bất kỳ 1 dữ liệu nào nữa và sẽ đóng kết nối từ bên máy A.
    - Khi máy B nhận được yêu cầu đóng kết nối, máy B gửi 1 báo nhận ACK cho máy A để thông báo đã nhận được yêu cầu và thông báo cho ứng dụng ở máy B là ứng dụng bên máy A yêu cầu đóng kết nối. Khi 2 công việc này hoàn thành, máy B gửi 1 gói tin có cờ FIN và ACK được bật để đóng kết nối bên phía mình.
    - TCP hoạt động ở 2 hướng. Trong ví dụ, lưu lượng từ máy A đến máy B và ngược lại. Ngoài ra nó còn yêu cầu cả 2 bên đóng kết nối từ phía mình, do đó cả 2 bên đều gửi cờ FIN để báo rằng kết nối được đóng ở phía nó.
    - Bước cuối cùng, bước 4, máy A chấp nhận yêu cầu máy B gửi ở bước 3 và gửi báo nhận cho máy B, thủ tục đóng kết nối hoàn tất.



## Cách thức hoạt động của quá trình bắt tay 3 bước
![](https://camo.githubusercontent.com/b6a94d43c2d7f48aebcdb64a6634bea71a78aaf904dbdd3d4ecf7f9bc484a169/687474703a2f2f342e62702e626c6f6773706f742e636f6d2f5f4b666d674d7a445f7076342f535f7442386a55597444492f41414141414141414141302f4e3136534d77466f5761412f73313630302f7463702d312e6a7067)