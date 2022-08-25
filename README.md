


# buổi  4: ngày 11/8/2022

nên ưu tiên sử dụng final nhiều nhất có thể

nếu signnature của các hàm giống nhau thì có thể không cần gọi hàm ()
onpressed = {callback}


stateless : Không thể tự reload
stl

stateFull : Có thể tự reload lại
stf

hàm settate chức năng duy  nhất chỉ là gọi lại hàm buil giúp render lại

VÒNG ĐỜI CỦA WIDGET : life Cycle
hàm innitstate chức năng call api
muốn thay đổi dữ liệu thay đổi ở hàm build xong dùng setstate để render lại

hàm disChangeDependencies thì dùng cho animation

hàm disUpdateWidget



hàm dispose được goij khi màn hình bị huỷ

xây giao diện
nhận diện state
xử lý state
cập nhật giao điện

về cơ bản ngoài chia theo kiểu StatelesWidget và StatefulWidget

chia theo kiểu
 thông tin của ứng dụng  : Text, Button , TextField....
Dùng để tạo bố cục : Scaffod : để tràn hết màn hình + có appBar : Scaffod , Column , Row, SizeBox, Center, Padding , Stack....


đang có 120 mấy cái widget : sau tự tư duy mà làm theo thôi


Container : Chỉ có 1 thằng child

widget Stack để widget đè lên 1 widget
dùng widget Position để có thể di chuyển widget này so với widtget kia

overflow : để có thể nếu chữ quá dài thì thêm 3 dấu chấm

widget Spacer () : Chiếm dụng tất cả khoảng trống còn lại

// Khài niệm màn hình bị giãn ra nếu kisch thước màn hình thay đổi mitiple screen


thẻ widget nào cũng có child hoặc children  để chứa các widget con bên trong

widget Expanded để có thể  đẩy các con của nó sang 1 phía nó sáng 1 phía nào đó : dãn widget con của nó tới toàn bộ không gian của thằng cha Expadend
widtget con ra toàn bộ không gian trống của thằng cha

Image.asset có thể chỉnh kích thước hình ảnh


widget : Phát hiện cử chỉ ngón tay trên widget
GestureDetector : Có mehtod : onTap : () {} để nhận biết widget con của nó có được bấm vào hay không
Không tạo bất cứ hiệu ứng gì khi bấm vào

InkWell để nhận biến cái text  hay widget con của nó có được bấm vào hay không
Khi bấm vào thì giao diện rất xấu

RichText : Muốn style trong 1 cụm Text
 Có thể tạo ra rất nhiều style (màu sắc , kích thước ....)


 ListView : chứa các item có layout tương tự nhau chỉ khác nhau về data của item


 Buổi 5: ngày 16/8/2022:
 super (key:key) : Để phân biệt các widget thì trình biên dịch dựa trên key của 1 widget
 bất kỳ widget nào cũng có key là 1 thuộc tính optional
 Khi muốn widget này được render lại thì cần có key này

 : super(key:Uniquekey()) : Lúc nào cũng sẽ build lại

 : super(key: GlobalObjectKey())  : Khi làm việc với animation cần sử dụng GlobalKey để điều khiển start/stop animation

 : super(key: ValueKey("10")  : bình thường sẽ tự khởi tạo dạng này ValueKey("10")

 Quy tắc lập trình Tổng rất số của những số rất nhỏ , sẽ tốt hơn tổng rất nhỏ của những số lớn
 Chia  file nhỏ nhất có thể , chia theo chức năng nhỏ nhất có thể
 Phần giống nhau thì để làm layout
 Phần khác nhau thì đưa ra làm tham số cho constructor

Expadend chỉ là 1 thằng con của Flexiable mà thôi nhưng có thuộc tính flex : tight

padding , Position cũng là widtget
container làm được tất cả mọi CSS

MediaQuery.of(context).size.width   : Lấy chiều ngang màn hình
SizeBox : Để có khoảng trống chiều rộng chiều ngang gì đấy


Buổi 6: 18/8/2022
chỉ đưa cái widget ra ngoài khi mình càn loại widget khác nhau
Phần giống/ chung về layout ( loại widget , khoảng cách giữu các widge, thứ tự sắp xếp ) Mình nên  để bên trong
Phần khác nhau => Đưa ra ngoài bằng tham số trên constructor : data hoặc cụm widget khác nhau

flutter updgrade : Đề nâng cấp flutter lên phiên bản mới nhất


https://github.com/hungf1324/learning_cart.git
https://github.com/hungf1324/learning_ecommerce.git

khi chỉ thằng cha nó mưới bết phải làm gì
 ngoài
 final  Function () onABC
 final VoidCallback onABC

tho thao tác ở widget con mà màn screen (widget to mới là thay đổi )  thì phải ở widget con khai báo hàm tạo ra hàm thực thi . xong truyền callback lên màn hình chính cho chạy hàm đó, vì màn đó mới có đủ dữ liệu
FLutter : Khai báo hàm từ thằng cha. xong truyền hàm đó vào thằng con . xong ở thằng con cho chạy hàm

chuyển sang màn mới đè lên màn cũ
muốn trả về kế quả thì phải async await
chuyển bỏ màn cũ đi

CÁch 2 , chuyển bằng route nằm name

cách 3 thư viện : auto_route  từ Flutter 2.1


//Buổi 6 19/8/2022
// project clone từ git của bạn hùng : chưa thay đổi set-url
// mở thiết bị ảo ios trên android studio . Phải mở trước máy ảo IOS thuộc Xcode lên

Khi đổi tên project tức đổi tên folder chứa Project
thì  phải đổi tất cả các package:nameNew

sau đó ở file android/app/src/main/kolin/com/huynhDev/nameProject/MainActivity   phải sửa  package.com ở đó


hiểu đơn giản thì
Property của Class == tham số của Function
method của Class == callback của Function

 class name bắt buộc phải bắt đầu chữ cái viết thường hoặc dấu _
 package name bắt buộc viết theo kiểu lowercase_with_underscore
 name source file bắt buộc lowercase_with_underscore

 Buổi 7 : 22/8/2022
