l1 là : code khi khởi tạo ứng dụng
l3_login_my là : Bài tập về nhà buổi 2  vẽ giao diện đăng nhập a Đại hướng dẫn
l5_StateFullWidget_my : Bài tập về nhà buổi 5 vẽ giao diện giỏ hàng có cộng trừ item
l8_Future_FutureBuilder_https_my: Bài tậo vê nhà buổi 8 về Future + FutureBuilder + https

l4_navigator == learning_flutter

l5_StateFullWidget_cart == learning_cart
learning_cart: Buổi 6 cũng là của bạn hungf1324 nhưng đã set-url git của thầy duylehong  : Dạy về stateFull  quản lý state ở trong cùng 1 màn hình

l5_StateFullWidget_ecommerce == learning_ecommerce
l6_StateFullWidget_ecommerce_app == ecommerce_app
l8_Future_https == learning_album
l9_provider_ecommerce_app == provider_ecommerce_app





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

//Buổi 6 19/8/2022
// project clone từ git của bạn hùng : chưa thay đổi set-url
// mở thiết bị ảo ios trên android studio . Phải mở trước máy ảo IOS thuộc Xcode lên

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
22/8/2022
trong flutter
 tên folder nên viết camelcase : viết thường chữ cái đầu
 Tên class nên viết hoa chữ cái đầu

 Buổi 7 : ngày 23/8/2022 quản lý state Bloc
 bước đàu tiên khi clone
 vào yaml . ấn pub get

 flutter updgare : cập nhật cả phiên bản của flutter , cả dart


//Cách quản lý thư mục của dự án
 widget : commont có thể dùng chung , có thể dùng cho các dự án khác
 components : cái common nhỏ cấu thành , và chỉ có thể dùng ở dự án này


MediaQuery  : Lấy kích thước thiết bị còn có thể lấy màn hình đang chiều dọc hay chiều ngang ,
var _size = MediaQuery.of(context).size
double width = _size.width
double height = _size.height_
con số độc lập không phụ thuộc px , Đây là kích thước vật lý của màn hình _
nếu kx ra 1 ứng dụng phải có 2 giao diện : 1 đứng , 1 ngang

chiều cao nút bấm thường 70 80 gì đấy

Không cho người dùng xoay theo chiều ngang . flutter lock screen orientation

LayoutBuilder  : thường bọc bên ngoài , nếu < 600 hiển thị 1 kiểu . >600 hiển thị 1 kiểu
 sử dụng if() else để có thể hiển thị giao diện nào

 LayoutBuilder(builder(BuilderContext , BoxConstraints constraints) {
 if (constraints.maxWidth < 600 ) {
 }

 Buổi 7 : 23/8/2022
 Trái của app bar
 trái = left = start = leading
 phải = right = end=


 widget visibility : hiển thị hay không
 SafeArea (top : false , )
 SingleChildScrollView( scrollDirection : Axis.Horizontal)  // theo chiều ngang

 GridView.builder : từ trái qua phải từ trên xuống dưới
 childAspectRatio : Chiều rộng so với chiều cao trong GridView
 crossAxisSpacing : Khoảng cách nằm ngang giữa 1 phần tử
 mainAxisSpacing : Khoảng cách nằm dọc  giữa 2 phần tử

  tất cả âm thanh , hình ảnh , font chữ : để vào assets : Tài nguyên đặt file gì cũng được hết

 inkWell có hiệu ứng đổ bóng:

 class === object (ES6) javaScript
 Image.assets : Để hiển thị hình ảnh lấy được từ thư mục
 Hình ảnh nên để 1 chiều  chiều còn lại tự động


 Để có thể sửa 1 từ ở tất cả mọi file thì bôi đen . refacter/ rename

 conflict xảy ra khi cùng code 1 chỗ
 trên thanh tabbar có git
 dấu 1: update git pull project
 dấu 2: add + commit + push
 dấu 3: git push

 khi conflict thì có thể nên bấm merger để có thể merger code bằng tay xem chọn cái hiện tại hay chọn cái trên git repo


 Buổi 8: 25/8/2022 Khi viết code can thiệp vào native thì có thể viết vào MainActivity.ks
 res trong đó chứa icon của app
 tên vào iocn trong app bên android là ở Mainifest :  phiên bản code và phiên bản app cũn ở trong này

 Khi mà .then tức hàm đó chạy xong mới chạy hàm dưới

 .timeout()  để có thể ứng thời gian cho call API việc bất đồng bộ

 Future<bool>
 await  bắt buộc câu lệnh đi tuần tự ,m câu đó thực hiện xong mới chạy câu lệnh bên dưới trong thân hàm async

  trong pubspec.yaml   ấn Pub get để có thể tả i tất cả các thư viện trong dependencies

  Buổi 9 30/8/2022 : Quản lý state
  Cách đầu tiên StatefulWidget
  Mỗi cái có ưu điển nhược điểm khác nhau


Buổi  10 : 1/9/2022 : Quản lý state bằng Bloc
 ứng dụng xem phim APi public themoviedb.org

Gửi tin nhắn cho nhau rất dơn giản sử dụng video , gửi emoji ,âm thanh , video , ticker thì cao hơn chút
Đã xem , đã đọc chưa xem
Mã hoá tin nhắn đầu cuối ; snapChat
Cài đặt hẹn giờ  1 phút mất đi


