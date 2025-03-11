# 1 Khái niệm
SSH viết tắt là Secure Shell, là một giao thức mạng được thiết kế để thiết lập kết nối an toàn giữa máy tính và máy chủ, cho phép truy cập và quản lý máy tính từ xa một cách an toàn. SSH sử dụng cơ chế mã hóa dữ liệu truyền tải, bảo vệ thông tin đăng nhập và ngăn chặn các truy cập trái phép. 

SSH cung cấp khả năng xác thực danh tính, ngăn chặn tình trạng mạo danh, đảm bảo chỉ những người có quyền mới có thể truy cập vào hệ thống. Thông qua việc sử dụng cặp khóa công khai và khóa riêng tư, SSH tạo ra một kênh bảo mật cho việc truyền tải dữ liệu giữa máy tính và máy chủ.

![](../imgs/3.png)
# 2 Cơ chế hoạt động
SSH sử dụng mô hình client-server, để thiết lập kết nối SSH cả 2 phía phải thiết lập kết nối TCP trước. Trong quá trình đó sẽ thực hiện trao đổi về phiên bản của giao thức SSH ở 2 máy, các thuật toán sẽ sử dụng và tạo ra một khóa phiên để mã hóa đối xứng cho phiên làm việc.

![](../imgs/2.png)

- Connection setup: SSH sẽ kết nối giao tiếp thông qua TCP port, ở chế độ mặc định SSH server sử dụng port 22. SSH client sẽ gửi yêu cầu kết nối thông qua port đó, và một thiết lập kết nối TCP sẽ được hoàn tất giữa SSH client và SSH server.

- Version Negotiation: SSH có hai phiên bản là SSH1.X(có sớm hơn) và SSH2.0. SSH2.0 sẽ hỗ trợ thêm một số phương thức xác nhận, phương pháp mã hóa và một số dịch vụ bổ sung. SSH client và SSH server sẽ trao đổi để quyết định phiên bản SSH nào được sử dụng:

  - SSH server sẽ gửi các phiên bản SSH mà nó hỗ trợ thông qua quá trình thiết lập kết nối tới SSH client.
  - Sau khi nhận được thông tin từ SSH server, nó cũng sẽ gửi lại các phiên bản SSH mà nó hỗ trợ lại SSH server.
  - SSH server tiến hành kiểm tra thông tin và xác định phiên bản SSH sẽ được sử dụng.

- Algorithm Negotiation: SSH sử dụng một số thuật toán bao gồm thuật toán trao đổi khóa để tạo khóa phiên, thuật toán mã hóa đối xứng để mã hóa dữ liệu, thuật toán khóa công khai để tạo chữ ký số và xác thực, và thuật toán HMAC để bảo vệ tính toàn vẹn của dữ liệu. Máy chủ và máy khách SSH hỗ trợ nhiều thuật toán cho mỗi loại, do đó cần đàm phán và xác định thuật toán sẽ được sử dụng cho từng loại.

   - SSH client và SSH server gửi cho nhau những thuật toán mà nó hỗ trợ.
   - Máy chủ và máy khách SSH sẽ đàm phán để xác định thuật toán được sử dụng cho từng loại. Trong quá trình đàm phán từng loại thuật toán, máy chủ và máy khách SSH sẽ so khớp các thuật toán được cả hai bên hỗ trợ để chọn một thuật toán cuối cùng. Sau khi các thuật toán cho từng loại được so khớp thành công, quá trình đàm phán thuật toán hoàn tất. Nếu không có thuật toán nào được so khớp cho một loại, quá trình đàm phán thuật toán của loại đó sẽ thất bại. Kết quả là, việc đàm phán thuật toán giữa máy chủ và máy khách SSH thất bại và kết nối SSH sẽ bị hủy bỏ.

- Key Exchange: Máy chủ và máy khách SSH sử dụng thuật toán trao đổi khóa để tạo động một khóa phiên chung và ID phiên nhằm thiết lập một kênh mã hóa. Khóa phiên được sử dụng để mã hóa dữ liệu truyền tải tiếp theo, và ID phiên được sử dụng để nhận dạng kết nối SSH liên quan trong quá trình xác thực. Trong giai đoạn này, máy khách cũng hoàn thành việc xác thực danh tính của máy chủ. Quá trình này diễn ra như sau: máy chủ sử dụng khóa riêng của mình để ký các thông điệp, và máy khách sử dụng khóa công khai của máy chủ để xác minh chữ ký đó. 

  Máy chủ và máy khách SSH cần giữ cùng một khóa phiên để thực hiện mã hóa đối xứng trong các phiên tiếp theo. Để đảm bảo tính bảo mật của quá trình trao đổi khóa, SSH tạo khóa phiên bằng một phương pháp an toàn: máy chủ và máy khách SSH cùng nhau tạo khóa phiên. Cụ thể, dựa trên các lý thuyết toán học, việc trao đổi khóa được thực hiện mà không cần truyền trực tiếp khóa, do đó khóa không cần được truyền qua kênh không an toàn.

![](../imgs/4.png)

     - 1. SSH server tạo ra hai số nguyên tố G và P, khóa riêng tư của server b, và tính khóa công khai y của server bằng phép tính y = (G^b)%P.
     - 2. SSH server gửi số G,P và khóa công khai y tới SSH client.
     - 3. SSH client tự tạo ra khóa riêng tư a và tính toán khóa công khai x của server bằng phép tính x = (G^a)%P.
     - 4. SSH client gửi khóa công khai x tới SSH server.
     - 5. SSH server tính toán khóa đối xứng K bằng phép tính K = (x^b)%P, SSH cliet cũng tính toán khóa đối xứng K bằng phép tính K = (y^a)%P. Các quy tắc toán học đảm bảo rằng khóa K được tạo ở SSH server và SSH client sẽ giống nhau.

- User Authentication: Máy khách SSH gửi một yêu cầu xác thực đến máy chủ SSH, sau đó máy chủ SSH thực hiện xác thực máy khách SSH.

  - Xác thực mật khẩu: SSH client sẽ mã hóa username và mật khẩu và gửi tới cho SSH server. Máy chủ giải mã tên người dùng và mật khẩu, so sánh chúng với tên người dùng và mật khẩu được lưu trữ cục bộ, sau đó trả về thông báo xác thực thành công hoặc thất bại cho máy khách.
  - Xác thực khóa công khai: Máy chủ kiểm tra xem khóa công khai nhận được từ máy khách có khớp với bất kỳ khóa nào được lưu trong tệp ~/.ssh/authorized_keys của người dùng hay không.
  - SSH client sẽ hoàn tất kết nối SSH sau khi hoàn tất hai bước kiểm tra trên.

   Xác thực bằng mật khẩu và xác thực bằng khóa là hai phương pháp xác thực người dùng cơ bản trong SSH. Nguyên tắc cơ bản của xác thực bằng mật khẩu là máy khách SSH sử dụng khóa đối xứng để mã hóa mật khẩu, và máy chủ SSH sử dụng khóa đối xứng để giải mã mật khẩu, sau đó kiểm tra tính hợp lệ của mật khẩu. Phương thức xác thực này đơn giản, nhưng yêu cầu nhập tên người dùng và mật khẩu mỗi khi đăng nhập.

   Xác thực bằng khóa có thể triển khai đăng nhập không cần mật khẩu với mức độ bảo mật cao hơn. Nguyên tắc cơ bản là máy khách SSH sử dụng khóa riêng của mình để ký các thông điệp, và máy chủ sử dụng khóa công khai của máy khách để xác minh chữ ký.

- Session Request: Sau khi xác thực thành công, máy khách SSH gửi một yêu cầu phiên (session request) đến máy chủ, yêu cầu máy chủ cung cấp một loại dịch vụ nhất định. Điều này có nghĩa là máy khách SSH yêu cầu thiết lập một phiên làm việc với máy chủ, và sau đó máy chủ sẽ phản hồi yêu cầu từ máy khách.

- Session Interaction: Sau khi một phiên làm việc được thiết lập, máy chủ và máy khách SSH trao đổi dữ liệu thông qua phiên này. Dữ liệu được gửi bởi máy chủ và máy khách SSH được mã hóa và giải mã bằng khóa phiên.
# 3 Quá trình hoạt động
- **Thiết lập kết nối:** máy khách SSH gửi yêu cầu kết nối tới máy chủ SSH.
- **Xác thực:** Máy chủ SSH xác thực danh tính của máy khách SSH bằng mật khẩu hoặc khóa SSH.
- **Mã hóa dữ liệu:** Sau khi xác thực thành công, tất cả dữ liệu được truyền giữa hai máy được mã hóa để bảo mật.
- **Quản lý kết nối:** Người dùng có thể thực hiện các thao tác quản lý máy chủ từ xa như chạy lệnh, truyền tập tin, cấu hình hệ thống.
# 4 Chức năng
- SSH cho phép quản trị viên hệ thống truy cập và thực hiện các thao tác quản lý trên máy chủ từ xa như cài đặt phần mềm, cấu hình hệ thống, sửa lỗi,...
- SSH cũng được sử dụng để triển khai phần mềm tự động từ xa, giúp tăng tốc độ và hiệu quả của quá trình triển khai.
- SSH có thể được sử dụng để thiết lập VPN, giúp kết nối an toàn qua mạng internet công cộng.
- Truy cập và chỉnh sửa code từ xa, thuận tiện cho việc cộng tác phát triển phần mềm.
- SSH có thể được sử dụng để chia sẻ tập tin an toàn giữa các máy tính.
- SSH có thể được sử dụng để truy cập và quản lý các thiết bị nhúng như router, camera IP.



