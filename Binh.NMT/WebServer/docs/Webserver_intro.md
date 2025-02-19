# 1. Khái niệm
Webserver là một phần mềm hoặc một máy tính được thiết kế để lưu trữ, xử lý và phục vụ các tệp tin và trang web cho các yêu cầu từ các máy tính khác qua mạng. 

Webserver hoạt động như một cầu nối giữa máy chủ và máy khách, cho phép truy cập vào các trang web và các tệp tin thông qua giao thức truyền tải HTTP hoặc các giao thức khác.

Khi một máy tính muốn truy cập một trang web hoặc một tệp tin từ một máy chủ, nó gửi yêu cầu tới địa chỉ IP của máy chủ đó thông qua giao thức HTTP. Web server sau đó nhận yêu cầu này, xử lý và tìm kiếm các tệp tin hoặc trang web tương ứng và trả về kết quả cho máy tính yêu cầu thông qua một trang web hoặc các tệp tin được truyền về qua mạng.

Các web server phổ biến như Apache HTTP Server, Nginx, Microsoft Internet Information Services (IIS), và Lighttpd cung cấp các tính năng và cấu hình phức tạp để quản lý việc lưu trữ và phục vụ các trang web.
# 2. Cách webserver hoạt động
Web server hoạt động dựa trên mô hình kiến trúc client-server, trong đó máy tính khách (client) gửi yêu cầu đến máy chủ (server) và máy chủ xử lý yêu cầu và trả về kết quả tương ứng.

![](../imgs/5.png)

- **Thiết lập kết nối:** Khi máy tính khách (client) muốn truy cập vào một trang web, nó gửi yêu cầu tới địa chỉ IP của máy chủ (server) thông qua một giao thức truyền tải HTTP. Quá trình này thường bắt đầu bằng việc thiết lập kết nối TCP/IP giữa client và server. Khi web server nhận được yêu cầu từ máy tính khách, nó sẽ xử lý yêu cầu đó. Quá trình này bao gồm việc phân tích yêu cầu để xác định tài nguyên được yêu cầu (ví dụ: trang HTML, hình ảnh, tệp tin...) và các tham số liên quan.

- **Tìm kiếm tài nguyên:** Sau khi phân tích yêu cầu, web server sẽ tìm kiếm và truy cập tài nguyên tương ứng. Điều này có thể bao gồm đọc tệp tin từ hệ thống tệp của máy chủ hoặc tương tác với cơ sở dữ liệu để lấy thông tin.

- **Xây dựng response:** Dựa trên yêu cầu và tài nguyên đã tìm kiếm, web server sẽ xây dựng một response để trả về cho máy tính khách. Response này thường bao gồm một mã trạng thái (status code) để chỉ ra thành công hay thất bại của yêu cầu, các thông tin header như loại nội dung, kích thước tệp tin, và nội dung thực tế được trả về.

- **Trả về response:** Cuối cùng, web server sẽ gửi response được xây dựng trở lại cho máy tính khách qua mạng. Máy tính khách nhận response và hiển thị nội dung tương ứng cho người dùng.

Quá trình này diễn ra liên tục và web server có thể xử lý đồng thời nhiều yêu cầu từ các máy tính khách khác nhau. Ngoài ra, web server cũng thường có các tính năng bảo mật, cấu hình và quản lý phiên để hỗ trợ việc xử lý yêu cầu và tạo ra các trang web phức tạp.
# 3. Những loại Webserver phổ biến
## 3.1 Apache HTTP server
![](../imgs/3.png)

Apache là web server được sử dụng rộng rãi nhất thế giới. Apache được phát triển và duy trì bởi một cộng đồng mã nguồn mở dưới sự bảo trợ của Apache Software Foundation. Apache được phát hành với giấy phép Apache License là được sử dụng tự do, miễn phí.

Tính đến tháng 8 năm 2018, apache ước tính phục vụ cho 54.2% các trang web đang hoạt động và 53.3% số máy chủ hàng đầu. Apache chạy trên các hệ điều hành như windows, linux, unix, MacOS…

Apache là một máy chủ web mã nguồn mở phổ biến, được sử dụng rộng rãi trên toàn thế giới để phục vụ các trang web và ứng dụng web. Nó là một phần mềm máy chủ HTTP, có khả năng xử lý các yêu cầu HTTP từ máy tính của người dùng và gửi lại trang web hoặc dữ liệu tương ứng.
## 3.2 Nginx
Nginx là một web server nhẹ, không chiếm nhiều tài nguyên của hệ thống. Nginx còn là một reserse proxy mã nguồn mở. Nginx khá là ổn định, cấu hình đơn giản và hiệu suất cao.

Nginx được phát triển bởi Igor Sesoev vào năm 2002 chủ yếu là để phục vụ cho website rambler.ru (trang web được truy cập nhiều thứ hai của nước Nga). Theo thống kê của Netcaft, trong một triệu website lớn nhất thế giới có 6.52% sử dụng Nginx.

Nginx là phần mềm mã nguồn mở và miễn phí, được phát hành rộng rãi theo giấy phép BSD. Nginx được phát triển bằng ngôn ngữ  và chạy được trên các hệ điều hành như Linux, FreeBSD, Windows, MacOS…

Nginx có các tính năng như chứng thực người dùng, virtual hosting, hỗ trợ CGI, FCGI, SCGI, WCGI, SSI, ISAPI, HTTPS, Ipv6,…
# 3.3 Internet Information Services (IIS)
IIS do Microsoft phát triển, sản phẩm này được tích hợp cùng với hệ điều hành Windows Server. Trong IIS bao gồm nhiều dịch vụ như: dịch vụ Web Server, dịch vụ FTP Server. Tính đến thời điểm tháng 5 năm 2015 thì thì số lượng trang Web sử dụng máy chủ IIS gần 248 triệu trang web.

# 3.4 Apache Tomcat
Apache Tomcat là một Java Servlet được phát triển bởi Apache Software Foundation. Tomcat thực thi các ứng dụng Java Servlet và JavaServer Pages (JSP). Tomcat cung cấp một máy chủ HTTP cho ngôn ngữ Java thuần túy.

Apache Tomcat rất ổn định và có tất cả các tính năng của một ứng dụng web thương mại nhưng đi kèm theo giấy phép mã nguồn mở của Apache. Tomcat cũng cung cấp một số chức năng bổ sung như tomcat manager application, speciallized realm imlementation và tomcat valves.

Các phiên bản của apache tomcat trùng với phiên bản và đặc điểm kỹ thuật của servlet java hoặc java servlet API. Tomcat 5.5X hỗ trợ Servlet API 2.3, tomcat 6.0X hỗ trợ servlet API 2.4 và tomcat 7.0 hỗ trợ servlet API 3.0. Ngoài Servlet versions API, phiên bản tomcat hỗ trợ phiên bản JSP API tương ứng.

Apache Tomcat hỗ trợ các hệ điều hành như windows, linux, MacOS, BSD,…
# 3.5 Lighttpd
Lighttpd là một phần mềm mã nguồn mở, an toàn và linh hoạt, đặc biệt miễn phí và được phân phối theo giấy phép BSD. Lighttpd được viết bởi Jan Kneschke. Lighttpd chiếm ít tài nguyên, memory thấp, CPU nhỏ. Lighttpd được phát triển bằng ngôn ngữ C. chạy trên hệ điều hành Linux, Windows, Mac OS,…
