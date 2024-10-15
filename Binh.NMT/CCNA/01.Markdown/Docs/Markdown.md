# Mục lục
I. Markdown là gì?

II. Cú pháp

1. Văn bản
- 1.1 Tiêu đề
- 1.2 Đoạn Văn
- 1.3 Chữ in nghiêng
- 1.4 Chữ in đậm
- 1.5 Chữ cả in đậm và in nghiêng
- 1.6 Chữ in giữa
2. Khối
- 2.1 Trích dẫn
- 2.2 Danh sách có thứ tự
- 2.3 Danh sách không có thứ tự
- 2.4 Khối lệnh
- 2.5 Bảng
3. Một số cú pháp chèn
- 3.1 Chèn liên Kết
- 3.2 Chèn hình ảnh
- 3.3 Chèn đường kẻ ngang
- 3.4 Chèn các to-do list 
- 3.5 Chèn ký tự để escape markdown

# I. Markdown là gì?
Markdown là một ngôn ngữ đánh dấu văn bản. Ngôn ngữ đánh dấu văn bản là phương pháp làm cho một câu, đoạn văn bản hoặc một ý nào đó trở nên khác biệt đối với các đoạn còn lại (in đậm, in nghiêng,...).
# II. Cú pháp
# 1. Văn bản
## 1.1 Tiêu đề
Viết loại tiêu đề bằng cách thêm các dấu # tương ứng vào đầu dòng.

Cú pháp:

\# Tiêu đề loại 1

\#\# Tiêu đề loại 2

\#\#\# Tiêu đề loại 3

\#\#\#\# Tiêu đề loại 4

\#\#\#\#\# Tiêu đề loại 5

\#\#\#\#\#\# Tiêu đề loại 6

Kết quả: 
# Tiêu đề loại 1
## Tiêu đề loại 2
### Tiêu đề loại 3
#### Tiêu đề loại 4
##### Tiêu đề loại 5
###### Tiêu đề loại 6
## 1.2 Đoạn văn
Để xuống dòng giữa các văn bản, sử dụng một dòng trống để tách các dòng văn bản.

Cú pháp:

Đây là đoạn văn 1

Đây là đoạn văn 2
## 1.3 Chữ in nghiêng
Để in nghiêng văn bản, thêm một dấu * hoặc dấu _ trước và sau từ cần in nghiêng.

Cú pháp:

\*Chữ in nghiêng\*

\_Chữ in nghiêng\_

Kết quả:

*Chữ in nghiêng*
## 1.4 Chữ in đậm
Để in đậm văn bản, thêm hai dấu * hoặc dấu _ trước và sau từ cần in đậm.

Cú pháp:

\*\*Chữ in đậm\*\*
\_\_Chữ in đậm\_\_

Kết quả:

**Chữ in đậm**
## 1.5 Chữ cả in đậm và in nghiêng
Để vừa in đậm và in nghiêng, thêm ba dấu * hoặc dấu _ trước và sau từ cần in đậm và in nghiêng.

Cú pháp:

\*\*\*Chữ in đậm và in nghiêng\*\*\*
\_\_\_Chữ in đậm cad in nghiêng\_\_\_

Kết quả:

***Chữ in đậm và in nghiêng***
## 1.6 Chữ gạch giữa
Để tạo chữ gạch giữa, thêm 2 dấu ~ trước và sau từ đó.

Cú pháp:

\~\~Chữ gạch giữa\~\~

Kết quả:

~~Chữ gạch giữa~~

# 2. Khối
## 2.1 Trích dẫn
Để tạo một trích dẫn, thêm dấu > vào trước mỗi dòng trích dẫn.

Cú pháp:

\> Lời trích dẫn 

Kết quả:

> Lời trích dẫn
## 2.2 Danh sách có thứ tự
Để tạo danh sách có thứ tự, cần thêm các số, dấu chấm trước nội dung (dùng tab để phân cấp).

Cú pháp: 

1\. Mục thứ nhất

2\. Mục thứ hai

3\. Mục thứ ba

Kết quả:

1. Mục thứ nhất
2. Mục thứ hai
3. Mục thứ ba
## 2.3 Danh sách không có thứ tự
Để tạo danh sách không có thứ tự, cần thêm dấu * hoặc - hoặc + trước nội dung (dùng tab để phân cấp).

Cú pháp:

\- Mục thứ nhất

\- Mục thứ hai

\- Mục thứ ba

Kết quả:

- Mục thứ nhất
- Mục thứ hai
- Mục thứ ba
## 2.4 Khối lệnh
Để viết một đoạn code, dùng 3 dấu ` ở trước và sau đoạn đó (có thể thêm format ngôn ngữ đó).

Cú pháp:

\`\`\` python
    
    print("Hello);
\`\`\`

Kết quả: 

```python
print("Hello")
```
## 2.5 Bảng
Để tạo bảng, cần ngăn cách bởi dấu | và cách đầu bảng với thân bảng bằng :--- (số dấu - tuỳ ý).

Cú pháp:

| Cột 1 | Cột 2 | Cột 3 | Cột 4 |
| :--- | :--- | :--- | :--- |
| A | B | C | D |
| E | F | G | H |
| I | K | L | M |

# 3. Một số cú pháp chèn
## 3.1 Chèn liên kết
Cú pháp:

Trực tiếp: https://github.com/VNPT-Cloud/system-intership

Gián tiếp: [Github](https://github.com/VNPT-Cloud/system-intership)
## 3.2 Chèn hình ảnh
Cú pháp:

![](https://hatrabbits.com/wp-content/uploads/2017/01/tafel-1.jpg)

## 3.3 Chèn đường kẻ ngang
Để tạo đường kẻ ngang, sử dụng ba dấu * hoặc - hoặc _ trên một dòng.

Cú pháp:

\-\-\-

\*\*\*

\_\_\_

Kết quả:

---
***
___
## 3.4 Chèn các to-do list
Để chèn to-do list, đánh dấu như list và thêm 1 cặp ngoặc vuông.

Cú pháp:

\- \[  \] Check list

\- \[ x \] Checked list

Kết quả:

- [ ] Check
- [x] Checked
## 3.5 Chèn ký tự để escape markdown 
Để phân biệt ký tự với những cú pháp trùng với cú pháp của markdown, sử dụng dấu \ đứng trước các ký tự đó.

