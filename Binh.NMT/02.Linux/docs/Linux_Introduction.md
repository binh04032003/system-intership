# 1. Linux là gì?
Linux là hệ điều hành mã nguồn mở và hoàn toàn miễn phí ra đời năm 1991, được phát triển từ hệ điều hành Unix và viết dựa trên ngôn ngữ C.

Một hệ điều hành Linux được chia thành ba phần chính:
![](../imgs/Linux_ARCHITECTURE.png)
- Hardware: bao gồm các thiết bị phần cứng hoạt động trên máy tính như bộ nhớ, CPU, ổ đĩa,...
- Linux Kernel: nhân là phần cốt lõi của hệ điều hành, có vai trò trung gian giao tiếp giữa phần cứng và phần mềm.
- User Space: là không gian mà người dùng tương tác với hệ điều hành. Không gian này bao gồm shell, system utilities và applications.

  - Shell: Shell nhận lệnh từ người dùng, sau đó dịch các yêu cầu này sang ngôn ngữ máy và chuyển đến kernel để thực thi lệnh. Linux Shell cung cấp 2 hình thức giao diện nhập lệnh: 
     - Command Line Interface: Giao diện dòng lệnh - Cung cấp đầy đủ quyền truy cập vào hệ thống.
     - Graphic User Interface: Giao diện đồ họa người dùng - Cung cấp các đồ họa dễ hiểu, dễ sử dụng, phù hợp cho người dùng cơ bản.
  
  - System Utilities (Tiện ích hệ thống): là tập hợp các chương trình thực hiện các tác vụ cấp hệ thống, ví dụ như quản lý quy trình, kiểm soát tài khoản người dùng và định cấu hình cài đặt hệ thống. 
  - Applications (Ứng dụng): là các phần mềm được người dùng sử dụng để thực hiện tác vụ của mình. Hầu hết các bản phân phối Linux đều cung cấp cửa hàng ứng dụng để tìm kiếm và cài đặt ứng dụng dễ dàng.
![](../imgs/Linux_ARCHITECTURE_1.png)

Một số thành phần quan trọng khác của Linux:
- Bootloader (bộ nạp khởi động): Máy tính sẽ trải qua quá trình tự khởi động booting khi bắt đầu hoạt động. Bootloader (bộ nạp khởi động) sẽ có chức năng chính là tải kernel vào bộ nhớ và bắt đầu quá trình khởi động này.

- Daemon: Daemon là các quy trình chạy ngầm (background process) bắt đầu trong quá trình khởi động. Linux chứa nhiều quy trình daemon như định cấu hình kết nối mạng, phản hồi các thiết bị USB được kết nối, quản lý thông tin đăng nhập của người dùng, quản lý hệ thống tệp,…Daemon đảm bảo hệ thống được vận hành trơn tru.

  Một số quy trình daemon phổ biến:
  - *systemd.* Daemon trung tâm chịu trách nhiệm quản lý các tiến trình daemon khác.
  - *sshd.* Daemon cho phép kết nối an toàn với máy chủ từ xa và cho phép truyền tệp.
  - *Httpd.* Daemon máy chủ web nhận các yêu cầu HTTP và phục vụ các trang web.
  - *cron.* Daemon thực thi các tác vụ hoặc tập lệnh đã lên lịch từ crontab vào những thời điểm được yêu cầu.

- Init system (Hệ thống khởi tạo): là một quy trình daemon được bắt đầu bởi kernel. Init system có vai trò khởi tạo không gian người dùng trong khi khởi động và quản lý các quy trình hệ thống trong thời gian chạy. 

- Graphic server (Máy chủ đồ họa): là một framework cơ bản trên Linux hiển thị đồ họa trên màn hình. Thành phần này triển khai Hệ thống X Window (X11 hoặc X) và cho phép quản lý cửa sổ, nhập liệu bằng bàn phím/chuột và hỗ trợ nhiều màn hình.

- Môi trường Desktop: 

   - Các ứng dụng cài sẵn (ví dụ: trình quản lý tệp và thư mục, công cụ chỉnh sửa văn bản, trình duyệt web, trò chơi, và các tác vụ phổ biến khác).
   - Giao diện người dùng đồ họa (GUI) cho phép người dùng tương tác với hệ điều hành bằng chuột và bàn phím (Ví dụ: cửa sổ, menu thả xuống, cách hiển thị tệp và thư mục…).

# 2. Cấu trúc file, thư mục trong Linux
![](../imgs/Cau_truc_thu_muc_Linux.png)

- **/:** là thư mục gốc, nơi bắt đầu của thư mục và các file. Chỉ có người dùng root mới có quyền ghi vào thư mục này.
- **/bin:** chứa các tệp tin thực thi, bao gồm những câu lệnh cơ bản như ls, cp,...
- **/boot:** chứa những tập tin liên quan tới chương trình quản lý khởi động máy.
- **/dev:** chứa tệp tin thiết bị. Nó chứa các tập tin thiết bị đầu cuối như là USB hay bất kỳ thiết bị nào gắn vào hệ thống.
- **/etc:** chứa các tệp tin cấu hình thiết bị.
- **/usr:** chứa các chương trình của người dùng.
- **/home:** chứa các tập tin của các người dùng trong hệ thống.
- **/lib:** chứa các tập tin thư viện để hỗ trợ các tập tin thực thi được lưu trong /bin và /sbin.
- **/proc:** chứa thông tin về các tiến trình của hệ thống. Như các tập tin chứa thông tin về các tiến trình đang chạy, hay các tập tin hệ thống ảo với nội dung về tài nguyên hệ thống.
- **/sbin:** chứa các tệp tin thực thi của hệ thống, thường chỉ có thể truy cập bởi người dùng root hoặc các tài khoản có quyền cao.

   Ví dụ: iptables, reboot, fdisk, ifconfig, swapon
- **/tmp:** chứa các tập tin tạm được tạo bởi hệ thống và người dùng. Các tập tin trong thư mục này bị xóa khi hệ thống khởi động lại.
- **/var:** chưa các tệp tin biến đổi dung lượng theo thời gian sử dụng.
  
  Ví dụ: các tập tin ghi chú hệ thống (/var/log); các gói và các tập tin cơ sở dữ liệu (/var/lib); thư điện tử (/var/mail); hàng đợi – in queues (/var/spool); các tập tin khóa (/var/lock); các tập tin tạm được dùng khi khởi động lại (/var/tmp).
- **/srv:** chứa dữ liệu liên quan tới các dịch vụ trên máy chủ.
- **/opt:** chứa các ứng dụng thêm của các hãng khác nhau.
- **/nmt:** thư mục mount tạm thời nơi mà người quản trị hệ thống có thể mount các tập tin hệ thống.
- **/media:** chứa các mount tạm thời cho các thiết bị tháo lắp như là USB.
- **/run:** chứa thông tin tạm thời về hệ thống và các dịch vụ đang chạy từ lần khởi động cuối cùng. Nó được sử dụng chủ yếu để lưu trữ các dữ liệu trạng thái cần thiết trong suốt phiên làm việc hiện tại và sẽ bị xóa khi hệ thống khởi động lại.

# 3. Ưu điểm, hạn chế của Linux
- Ưu điểm:
  - Mã nguồn mở hoàn toàn miễn phí:
    - Bản chất mã nguồn mở miễn phí là ưu thế rất lớn của Linux, khiến hệ điều hành này có một cộng đồng người dùng lớn mạnh, liên tục đóng góp, cải tiến, sửa lỗi và phân phối các tính năng mới của Linux, đảm bảo rằng Linux luôn đi đầu trong các tiến bộ công nghệ.
  - Khả năng tùy chỉnh linh hoạt:
    - Linux có khả năng cấu hình cao và tuỳ thuộc vào thiết kế module mà người dùng có thể tùy chỉnh các phiên bản Linux của riêng họ. Tùy thuộc vào ứng dụng, Linux có thể được tối ưu hóa cho các mục đích khác nhau.
  - Tính ổn định cao:
    - Thiết kế module của hạt nhân Linux đảm bảo các thành phần riêng lẻ có thể được cập nhật hoặc sửa đổi mà không ảnh hưởng đến toàn bộ hệ thống. 
    - Linux được phát triển, cập nhật liên tục và kiểm thử nghiêm ngặt bởi cộng đồng Linux lớn mạnh.
  - Hiệu suất tối ưu:
    - Thiết kế hạt nhân Linux ưu tiên phân bổ tài nguyên, đảm bảo tài nguyên hệ thống được sử dụng hiệu quả để các quy trình chạy trơn tru. 
  - Tính bảo mật tốt:
    - Linux cung cấp các bản cập nhật bảo mật nhanh chóng và thường xuyên.
    - Bản chất mã nguồn mở cho phép cộng đồng Linux nhanh chóng xác định và “vá” các lỗ hổng bảo mật. 
    - Linux sử dụng hệ thống phân quyền nghiêm ngặt, người dùng được cấp quyền truy cập riêng biệt, ngăn chặn truy cập trái phép, giảm thiểu rủi ro về phần mềm độc hại hoặc vi rút.
  - Khả năng tương thích cao:
    - Linux có khả năng thích ứng, chạy liền mạch trên nhiều loại cấu hình phần cứng khác nhau, từ môi trường desktop, máy chủ, thiết bị di động, hệ thống nhúng (embedded), hoặc các môi trường điện toán đa dạng.
- Hạn chế:
  - Linux chưa phổ biến nên chưa được các nhà sản xuất máy tính khai thác.
  - Phần mềm hỗ trợ còn hạn chế.
  - Một số nhà sản xuất không có Driver hỗ trợ hệ điều hành Linux.
# 4. Linux Command là gì? Một số lệnh thao tác cơ bản trên Linux
Linux Command là các câu lệnh được sử dụng trong Linux để thực hiện các tác vụ hoặc thao tác trên hệ thống. Câu lệnh này sẽ được nhập vào trong terminal của hệ điều hành để điều khiển OS.

Một số lệnh thao tác cơ bản trên Linux:
- echo: lệnh in ra ký tự kèm theo sau echo
- pwd: lệnh in ra thư mục mà máy chủ đang hoạt động
- cd: lệnh thay đổi thư mục
  - $ cd . : chuyển tới thư mục hiện tại (current directory)
  - $ cd .. : chuyển tới thư mục mẹ của thư mục hiện tại (parent directory)
  - $ cd ~ : chuyển tới thư mục home
  - $ cd - : chuyển tới thư mục trước đó

  Có hai 2 cách biểu diễn path của một thư mục:
  - Absolute path: đường dẫn từ thư mục root. Thư mục root thường được biểu diễn bởi ký tự / (slash).
  - Relative path: đường dẫn tại thư mục hiện tại mà máy đang hoạt động.
  
- ls: lệnh liệt kê các thư mục
- touch: lệnh tạo ra một file mới
- file: chỉ ra loại file tương ứng 
- cat: lệnh hiển thị nội dung của file với output ngắn 
- less: hiển thị nội dung với output lớn 
  - q - thoát khỏi lệnh less và quay trở lại shell
  - Page up, Page down, Up and Down - sử dụng nút lên xuống hoặc điều chỉnh của file
  - g - chuyển tới đầu file
  - G - chuyển tới cuối file
  - /search - tìm kiếm text bằng cách gõ lệnh / kèm theo text
  - h - vào file hướng dẫn sử dụng less
- history: liệt kê ra các lệnh đã được sử dụng trước đây trong command line.
  - Sử dụng dấu ! và kèm theo số thứ tự của lệnh đó ở trong danh sách để sử dụng lại bất kỳ lệnh nào.
  - Sử dụng dấu !! để lặp lại lệnh ngay trước đó.
- cp: copy file hoặc directory.
- mv: cho phép di chuyển các file và directory, đồng thời có thể đổi tên của các file.
- mkdir: tạo ra các directory mới trong file system.
- rm: xóa file hoặc directory.
- find: tìm các file có tồn tại.
- help: giúp hiểu được một command có chức năng gì trong linux.
- man: hiển thị ra một manual page cho một lệnh ở dạng less.
- whatis: cung cấp description về một lệnh bất kỳ.
- alias: đặt tên cho một lệnh hoặc chuỗi command trong linux. Những lệnh alias được thực hiện sẽ không được lưu sau khi reboot, muốn lưu vĩnh viễn lệnh alias cần add vào ~/.bashrc.
- exit: có nhiệm vụ đóng một cửa sổ terminal lại, kết thúc quá trình thực thi của shell script, hoặc đăng xuất khỏi phiên truy cập SSH từ xa.
# 5. User và Group trong Linux? 
## 5.1 User là gì? Các loại user trong Linux?
- User là tài khoản cung cấp cho người dùng để thao tác với hệ thống.
- Một user sẽ có username và password. Mỗi user có một mã User ID - UID riêng.

Dựa vào quyền hạn truy cập, user được chia thành 2 loại chính:
- Superuser/Administrtor/root: loại user có quyền hạn cao nhất, có khả năng truy cập vào mọi file của hệ thống.
  - UID của Superuser/Administrtor/root là 0 bất kể tên nó là gì.
  - Các đặc quyền mà superuser có thể làm:
    - Thay đổi read/write/excute.
    - Tạo, tải file hay phần mềm.
    - Sửa đổi file và cài đặt.
    - Xoá thông tin user và data.
  - Để đăng nhập vào dưới quyền Superuser có 2 cách:
    - Sử dụng lệnh su: cho phép chạy tạm thời các lệnh dưới quyền root, cần phải nhập mật khẩu của tài khoản root.
    - Sử dụng lệnh sudo: cho phép chạy các lệnh với tư cách root mà không cần nhập mật khẩu của tài khoản root.
- Normal user: loại user thường, bị giới hạn một số quyền (có thể tùy chọn các quyền mà user này có thể làm).
## 5.2 Group là gì? Các loại group trong Linux?
- Group là thuật ngữ chỉ 1 nhóm tập hợp nhiều user lại với nhau. 
- Mỗi group sẽ có một tên duy nhất và một mã định danh duy nhất (Group ID - GID).
- Có 2 loại group chính:
  - Primary Group: nhóm mặc định được gán cho một người dùng khi họ đăng nhập vào hệ thống. Mỗi người dùng trong hệ thống Linux đều thuộc về một hoặc nhiều nhóm, nhưng chỉ có một nhóm chính. Nhóm người dùng chính được lưu trong tệp */etc/passwd*.
  - Supplementary Group: Được sử dụng để cung cấp các đặc quyền nhất định cho một nhóm người dùng. Các User có thể là thành viên của không hoặc nhiều nhóm phụ. Nhóm bổ sung được lưu trong tệp */etc/group*.
## 5.3 Phân quyền file/thư mục trong Linux
- Read, Write, Excute trong phân quyền file/thư mục:
![](../imgs/read_write_excute.png)
  - READ (Đọc): Quyền đọc cho phép mở file và xem nội dung của nó. Trong trường hợp thư mục thì bạn có thể xem các thành phần con trong nó.
  - WRITE (Viết): Quyền viết hay ghi cho phép thay đổi nội dung của file. Trong trường hợp thư mục thì có thể thay đổi vị trí, xoá, thêm các thành phần con trong nó.
  - EXECUTE (Thực thi): Quyền thực thi cho phép chạy file.

- Xem phân quyền của một file/thư mục:
  - Để xem thông tin phân quyền của một file hay thư mục gõ lệnh **ls** **-l** **/file_name/**. Kết quả thu được sẽ hiện dưới dạng format như sau:
  ![](../imgs/1.png)
    - **Permission:** các quyền của file.
    - **Owner:** chủ sở hữu của file.
    - **Group:** nhóm mà owner thuộc vào.
    - **Date Created:** ngày tạo file.
  - Trong Permission, có chi tiết các quyền cho các loại user khác nhau:
  ![](../imgs/2.png)
    - **file type:** có ba loại là Tệp thông thường (-)/ Thư mục (d)/ Liên kết (i).
    - **user:** quyền đối với người dùng (chủ sở hữu).
    - **group:** quyền đối với nhóm của chủ sở hữu.
    - **other:** quyền đối với những người dùng khác.
- Các chế độ chỉnh sửa phân quyền:

    Syntax: $ chmod [permission] [file_name]
  - Symbolic Mode: sử dụng ký tự để phân quyền
    - Quy ước ký tự:
      - User (u)
      - Group (g)
      - Other (o)
      - All (a)
      - Read (r)
      - Write (w)
      - Excute (x)
      - +: thêm quyền lên đầu các quyền hiện có
      - -: xóa quyền khỏi các quyền hiện có
      - =: ghi đè lên các quyền hiện có
    -  Syntax: $ chmod [user_type][signs][permission] [file_name]
  - Numeric Mode: sử dụng mã bát phân để phân quyền
    ![](../imgs/4.png)
    ![](../imgs/5.png)
# 6. Distro Linux là gì? Phân loại các Distro Linux?
Distro Linux là các phiên bản phân phối của Linux, được phát triển dựa trên Linux Kernel. Nó có vai trò đóng gói nhân Linux cùng với các phần mềm và tiện ích cần thiết, tạo thành một hệ điều hành hoàn chỉnh mà mà người dùng có thể cài đặt và khởi chạy. 

![](../imgs/Linux_Distribution.png)

Đây là ảnh mô tả về Linux Distro SUSE, SUSE là một bản phân phối Linux (distro) nổi tiếng, chủ yếu được sử dụng trong môi trường doanh nghiệp. SUSE Linux được phát triển bởi công ty SUSE, một trong những công ty lâu đời nhất chuyên cung cấp phần mềm dựa trên Linux. Distro này nổi bật vì tính ổn định, bảo mật và hiệu suất cao, phù hợp với các hệ thống máy chủ, trung tâm dữ liệu, và các ứng dụng doanh nghiệp.

Phân loại các Distro Linux:
- Ubuntu: 
  - Đối tượng phù hợp: 
    - Người mới bắt đầu.
    - Người dùng chuyển sang từ các hệ điều hành khác.
  - Ưu điểm nổi bật: 
    - Giao diện thân thiện với người dùng.
    - Hệ sinh thái phần mềm lớn.
    - Hỗ trợ cộng đồng mạnh mẽ. 
    - Quá trình cài đặt dễ dàng.
- Linux Mint (được phát triển dựa trên Ubuntu):
   - Đối tượng phù hợp:
     - Người dùng mới làm quen với Linux.
     - Người dùng ưu tiên sự ổn định và đơn giản.
   - Ưu điểm nổi bật:
     - Môi trường desktop đơn giản, ổn định, giao diện trực quan, gần gũi.
     - Cung cấp nhiều phần mềm và code đa phương tiện được cài đặt sẵn, cho phép người dùng dễ dàng xử lý các tác vụ máy tính phổ biến.
- Debian:
  - Đối tượng phù hợp: 
    - Cộng đồng đam mê mã nguồn mở.
    - Người dùng ưu tiên sự ổn định và tự do thao tác trên phần mềm.
  - Ưu điểm nổi bật:
    - Là distro lâu đời và có ảnh hưởng nhất, làm nền tảng phát triển nhiều distro khác.
    - Ổn định và an toàn, lý tưởng cho môi trường máy chủ và các hệ thống quan trọng.
    - Cam kết nguyên tắc mã nguồn mở, đảm bảo quyền tự do và quyền kiểm soát của người dùng.
    - Hệ thống quản lý gói mạnh mẽ gọi là APT.
- Red Hat Enterprise Linux (RHEL):
  - Đối tượng phù hợp: 
    - Doanh nghiệp và người dùng thương mại.
    - Đặc biệt phù hợp cho các hệ thống quan trọng, cần tính bảo mật cao.
  - Ưu điểm nổi bật:
    - Có tùy chọn mở rộng cho doanh nghiệp.
    - Có dịch vụ hướng dẫn và hỗ trợ cấp doanh nghiệp từ chuyên gia.
    - Tập trung mạnh vào bảo mật với các tính năng tiên tiến.
- CentOS:
  - Đối tượng phù hợp: CentOS là phiên bản mã nguồn mở và miễn phí dựa trên Red Hat Enterprise Linux, phù hợp để triển khai cấp doanh nghiệp.
  - Ưu điểm nổi bật:
    - Tương thích với các ứng dụng và gói phần mềm của RHEL.
    - Tính ổn định do có chu kỳ nâng cấp dài hơn.
    - Hỗ trợ lâu dài.
    - Đơn giản, nhẹ, chạy nhanh.
- Fedora:
  - Đối tượng phù hợp: Fedora thực tế là môi trường thử nghiệm của RHEL và CentOS. 
  - Ưu điểm nổi bật:
    - Cung cấp các phiên bản phần mềm mới nhất.
    - Nền tảng lý tưởng để thử nghiệm và triển khai các tính năng, cải tiến, công nghệ mới.
    - Thúc đẩy tính hợp tác cộng đồng, ưu tiên phần mềm mã nguồn mở và miễn phí.
- Arch Linux:
  - Đối tượng phù hợp:
    - Người dùng nâng cao hoặc các chuyên gia Linux.
    - Người muốn đi đầu trong quá trình phát triển Linux và tận hưởng các tính năng mới nhất.
  - Ưu điểm nổi bật:
    - Hệ thống cơ sở nhẹ, tối giản, cho phép người dùng tuỳ chỉnh môi trường Linux ở mức độ cao. 
    - Mô hình phát hành cuốn chiếu, do đó người dùng luôn có quyền truy cập vào các phiên bản phần mềm mới nhất.
    - Cung cấp Arch User Repository (AUR) – kho lưu trữ do người dùng đóng góp.
    - Cung cấp Arch Wiki – nguồn tài liệu chi tiết, toàn diện để người dùng tự tìm hiểu.
- Kali Linux (dựa trên Debian):
  - Đối tượng phù hợp:
    - Chuyên gia an ninh mạng.
    - Người dùng quan tâm đến penetration test (kiểm thử thâm nhập).
  - Ưu điểm nổi bật:
    - Kali Linux cung cấp các công cụ cài đặt sẵn để kiểm tra bảo mật và điều tra kỹ thuật số.
    - Cung cấp các công cụ kiểm thử thâm nhập như Nmap, Metasploit Framework, Maltego và Aircrack-ng.
- Pop!_OS (dựa trên Ubuntu):
  - Đối tượng phù hợp:
    - Game thủ.
    - Người dùng ưu tiên năng suất.
  - Ưu điểm nổi bật:
    - Hỗ trợ tối ưu cho các card đồ họa.
    - Có cửa hàng phần mềm Pop!_Shop chuyên cung cấp các game tương thích với Linux.
    - Tích hợp các công nghệ như Steam và Proton để hỗ trợ chơi game nâng cao.
    - Cung cấp các ứng dụng tối thiểu giúp tiết kiệm dung lượng và tối ưu thời lượng pin của laptop.
- MX Linux (dựa trên Debian):
  - Đối tượng phù hợp:
    - Người dùng mới bắt đầu, cần giao diện đơn giản nhưng vẫn có thể sử dụng hiệu quả tài nguyên hệ thống.
    - Những người dùng có phần cứng cũ.
  - Ưu điểm nổi bật:
    - Cân bằng giữa giao diện thân thiện, quen thuộc và hiệu quả sử dụng tài nguyên. 
    - Tối ưu hoá hiệu suất hệ thống của cả phần cứng cũ lẫn máy tính hiện đại.
# 7. Giấy phép mã nguồn mở là gì?
Giấy phép mã nguồn mở là một thỏa thuận pháp lý phác thảo các điều khoản và điều kiện theo đó phần mềm/chương trình có thể được sử dụng, sửa đổi và phân phối. Nó cấp cho người dùng một tập hợp các quyền, chẳng hạn như quyền sử dụng phần mềm, truy cập và sửa đổi mã nguồn cũng như phân phối các bản sao của phần mềm. Các giấy phép nguồn mở thường yêu cầu rằng bất kỳ sản phẩm phát sinh nào (nghĩa là các phiên bản đã sửa đổi) cũng được phân phối theo cùng một giấy phép nguồn mở. Điều này đảm bảo phần mềm vẫn là mã nguồn mở và sẵn có miễn phí cho những người khác sử dụng và đóng góp. 

Hai loại giấy phép mã nguồn mở:
- Bản quyền cho dùng (Copyleft): là luật hạn chế quyền sử dụng, sửa đổi và chia sẻ các sản phẩm sáng tạo nếu không được sự cho phép của chủ bản quyền. Khi một tác giả phát hành một chương trình theo giấy phép copyleft, họ đưa ra các yêu cầu về bản quyền của chương trình và đưa ra tuyên bố rằng người khác có quyền sử dụng, sửa đổi và chia sẻ tác phẩm miễn là các nghĩa vụ vẫn được duy trì.

- Cấp phép (Permissive): là giấy phép nguồn mở non-copyleft, đảm bảo quyền tự do sử dụng, sửa đổi và phân phối lại, đồng thời cho phép độc quyền các sản phẩm phát sinh. Nó đặt ra những hạn chế tối thiểu về cách người khác sử dụng các thành phần nguồn mở, có nghĩa là loại giấy phép này cho phép các mức độ tự do khác nhau để sử dụng, sửa đổi và phân phối lại mã nguồn mở, cho phép sử dụng nó trong các tác phẩm phát sinh độc quyền và gần như không yêu cầu gì liên quan đến các nghĩa vụ trong tương lai.

Hiện nay, có rất nhiều giấy phép mã nguồn mở trên mạng, bất kỳ ai cũng có thể tạo ra loại giấy phép này tùy theo sở thích của họ. Để giúp thu hẹp các quyết định và đơn giản hóa sự lựa chọn, OSI (Open Source Initiative) đã tổng hợp một danh sách các giấy phép đã được phê duyệt, bao gồm hơn 80 giấy phép nguồn mở được sử dụng phổ biến nhất, trong đó có một số giấy phép có giá trị cao đã và đang được sử dụng bởi một số dự án nguồn mở phổ biến nhất hiện nay.

- GNU General Public License (GPL):

  -  GNU General Public License (GPL) là giấy phép nguồn mở phổ biến nhất hiện nay. Richard Stallman đã tạo ra GPL để bảo vệ phần mềm GNU khỏi việc bị trở thành độc quyền và nó là một sự triển khai định rõ khái niệm “copyleft” của ông.
  
  -  GPL là một giấy phép copyleft. Điều này có nghĩa là bất kỳ phần mềm nào được viết dựa trên bất kỳ thành phần nào của GPL đều phải được phát hành dưới dạng mã nguồn mở. Kết quả là những phần mềm nào sử dụng thành phần mã nguồn mở của GPL (không quan trọng tỷ lệ phần trăm của nó trong toàn bộ mã là bao nhiêu) đều phải phát hành mã nguồn đầy đủ và cho phép tất cả các quyền sửa đổi và phân phối lại toàn bộ mã.

-  The Apache License: Giấy phép Apache là một giấy phép phần mềm nguồn mở được phát hành bởi Apache Software Foundation (ASF). Đây là một loại giấy phép phổ biến, được triển khai rộng rãi và được hỗ trợ bởi một cộng đồng lớn mạnh. Giấy phép Apache cho phép tự do sử dụng, sửa đổi và phân phối bất kỳ sản phẩm nào được cấp phép Apache. Tuy nhiên vẫn bắt buộc phải tuân theo các điều khoản của loại giấy phép này.

-  MIT License: MIT là một trong những giấy phép phần mềm miễn phí dễ sử dụng nhất. Về cơ bản, có thể làm bất kì điều gì bạn muốn với phần mềm được cấp phép bởi Giấy phép MIT – chi cần thêm một bản sao của Giấy phép MIT gốc và thông báo bản quyền vào đó. Sự đơn giản của nó chính là lý do nó có tỷ lệ chấp nhận cao với các developer.

-  Microsoft Public Licenses (Ms-PL): Là một giấy phép phần mềm mã nguồn mở miễn phí do Microsoft phát hành, hãng sản xuất phần mềm này đã tạo ra giấy phép này cho những dự án của mình và được phát hành dưới dạng mã nguồn mở. Giấy phép Ms-PL bảo vệ các tác giả bằng cách không đưa ra bất kì giấy bảo hành được quy định rõ ràng hay sự bảo đảm nào cho việc sử dụng mã của bạn, vì vậy tác giả sẽ không chịu trách nhiệm pháp lý trong các trường hợp mã không hoạt động tốt.







