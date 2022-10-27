l1 là : code khi khởi tạo ứng dụng
l3_login_my là : Bài tập về nhà buổi 2  vẽ giao diện đăng nhập a Đại hướng dẫn
l5_StateFullWidget_my : Bài tập về nhà buổi 5 vẽ giao diện giỏ hàng có cộng trừ item
l8_Future_FutureBuilder_https_my: Bài tậo vê nhà buổi 8 về Future + FutureBuilder + https

// code của bạn Hưng
l4_navigator == learning_flutter  : Học về StatelesWidget

l5_StateFullWidget_cart == learning_cart   : Học vẽ giao diện
learning_cart: Buổi 5 cũng là của bạn hungf1324 nhưng đã bị thầy Hoàn Đỗ set-url git của thầy duylehong  : Dạy về stateFull  quản lý state ở trong cùng 1 màn hình

l5_StateFullWidget_ecommerce == learning_ecommerce   : Học vẽ giao diện
l6_StateFullWidget_ecommerce_app == ecommerce_app    : Học về StatefulWidget
l8_Future_https == learning_album                    : Học về Future- FutureBuilder- https

l9_provider_ecommerce_app == provider_ecommerce_app  : Học về Provider commit cũ của thầy duy : dạy về Provider trong buổi 9
l10                                                  : Học về Bloc
l11                                                  : học về SharePreferences  : Lưu trữ vào local storage
l12  : Học về SQ life                                : refactor lại bài của bạn Tài 

l9_provider_tutorial       : code đã commit cũ của thầy duy

### Buổi 1 ngày 2/8/2022 : Thầy đỗ hoàn đến chỉ giới thiệu Flutter và giao lưu
### Buổi 2 ngày 4/8/2022 : Học vẽ view StateLessWidget  và dạy cách search giải quyết vấn đề
### Buổi 3 ngày 9/8/2022 : Học vẽ view Container + TextFormField
import 'package:flutter/material.dart';   // import cách vẽ giao diện

// import các màn hình
import 'l1/flutter_demo.dart';


//import để khoá hướng màn hình
import 'package:flutter/services.dart';

//Điểm bắt đầu của ứng dụng
void main() {

//Khoá hướng màn hình
WidgetsFlutterBinding.ensureInitialized();
SystemChrome.setPreferredOrientations([
DeviceOrientation.portraitUp,
]).then((value) => runApp(const MyApp()));

runApp(const MyApp());   //class MyApp() là class sẽ được chạy . đây là root của chương trình
}

class MyApp extends StatelessWidget {
const MyApp({Key? key}) : super(key: key);

@override
Widget build(BuildContext context) {
return MaterialApp(       // return  ra 1
title: 'Flutter Demo',
theme: ThemeData(
primarySwatch: Colors.blue,
),
home: const MyHomePage(title: 'Flutter Demo Home Page'),   //Buổi 1

    );
}
}


### buổi  4: ngày 11/8/2022

nên ưu tiên sử dụng final nhiều nhất có thể

nếu signnature của các hàm giống nhau thì có thể không cần gọi hàm ()
onpressed = {callback}


StatelessWidget : Không thể tự reload
stl

StatefulWidget : Có thể tự reload lại
stf

hàm setState chức năng duy  nhất chỉ là gọi lại hàm build giúp render lại

VÒNG ĐỜI CỦA WIDGET : life Cycle
hàm innitstate chức năng call api
muốn thay đổi dữ liệu thay đổi ở hàm build xong dùng setstate để render lại

hàm disChangeDependencies thì dùng cho animation

hàm disUpdateWidget



hàm dispose được gọi khi màn hình bị huỷ

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


### Buổi 5 ngày 16/9/2022: Học vẽ StatefulWidget và controller trong TextFormField
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

### Buổi 6 19/8/2022
// project clone từ git của bạn hùng : chưa thay đổi set-url
// mở thiết bị ảo ios trên android studio . Phải mở trước máy ảo IOS thuộc Xcode lên


chỉ đưa cái widget ra ngoài khi mình càn loại widget khác nhau
Phần giống/ chung về layout ( loại widget , khoảng cách giữu các widge, thứ tự sắp xếp ) Mình nên  để bên trong
Phần khác nhau => Đưa ra ngoài bằng tham số trên constructor : data hoặc cụm widget khác nhau

flutter updgrade : Đề nâng cấp flutter lên phiên bản mới nhất


https://github.com/hungf1324/learning_cart.git
https://github.com/hungf1324/learning_ecommerce.git

khi chỉ thằng cha nó mới biết phải làm gì
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




Khi đổi tên project tức đổi tên folder chứa Project
thì  phải đổi tất cả các package:nameNew

sau đó ở file android/app/src/main/kolin/com/huynhDev/nameProject/MainActivity   phải sửa  package.com ở đó


hiểu đơn giản thì
Property của Class == tham số của Function
method của Class == callback của Function

 class name bắt buộc phải bắt đầu chữ cái viết thường hoặc dấu _
 package name bắt buộc viết theo kiểu lowercase_with_underscore
 name source file bắt buộc lowercase_with_underscore

 #### Buổi 7 : ngày 23/8/2022 quản lý state Bloc

trong flutter
 tên folder nên viết camelcase : viết thường chữ cái đầu
 Tên class nên viết hoa chữ cái đầu

 
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


#####  Buổi 8: 25/8/2022 Khi viết code can thiệp vào native thì có thể viết vào MainActivity.ks
 res trong đó chứa icon của app
 tên vào iocn trong app bên android là ở Mainifest :  phiên bản code và phiên bản app cũn ở trong này

 Khi mà .then tức hàm đó chạy xong mới chạy hàm dưới

 .timeout()  để có thể ứng thời gian cho call API việc bất đồng bộ

 Future<bool>
 await  bắt buộc câu lệnh đi tuần tự ,m câu đó thực hiện xong mới chạy câu lệnh bên dưới trong thân hàm async

  trong pubspec.yaml   ấn Pub get để có thể tả i tất cả các thư viện trong dependencies


chừng nào tác vụ chưa xong future.Builder sẽ hỗ trợ đưa ra xoay xoay
pub.dev là trang lấy thư viện
lấy cái thư viện nhiều like , pub point thư viện bên thứ 38
cài đặt thư viện
copy depencencies

FutureBuilder có đữ liệu



tách riêng ra 1 bên là lấy dữ liệu Future 1 bên là vẽ giao diện khi có dữ liệu FutureBuilder
201 là post thành công

synchronous operation: hoạt động sẽ chặn các hoạt động khác trước khi nó hoàn thành
synchronous operation : Hàm chỉ thực hiện các hoạt động đồng bộ

asynchronous operation : Hoạt động cho phép các hoạt động khác hoàn thành trước nó
asynchronous operation :Hàm thực thi ít nhất 1 hành động bất đồng bộ và cũng có thể cả các hoạt động đồng bộ

Future<T> là 1 class
Future<T> tạo ra 1 đối tượng type T
Future <T>: Là method mà lấy dữ liệu từ http xuống
<T> hiểu là kiểu dữ liệu trả về

nếu Future không tạo ra 1 giá trị sử dụng được thì kiểu Future<void>
future có 2 trạng thái , chưa hoàn thành và hoàn thành
Khi 1 hàm trả về 1 Future ,hàm đó sẽ đợi future hoàn thành xong và trả về giá trị khi Future đó completed
Khi Future hoàn thành xong , nó sẽ completed với 1 giá trị hoặc 1 error

Future : là 1 class in the Dart
future : Là 1 đối tượng của Dart Future class


HAI NGUYÊN TẮC SỬ DỤNG ASYNC AWAIT
Định nghĩa 1 hàm async bằng cách thêm async trước function body
thêm await trước mỗi async operation , và await chỉ hoạt động trong asynchronous function


nếu 1 hàm có sử dụng bất đồng bộ thì phải khai báo
Future<T> nameFunction () async {.......}

print(await createOrderMessage());  // await để đợi hàm future chạy xong

1 hàm không đồng bộ sẽ chạy đồng bộ cho tới khi xuất hiện từ khoá await đầu tiên xuất hiện

future cũng cung cấp các method .then .catchError
Future<int> future = getFuture();
future.then((value) => handleValue(value))
.catchError((error) => handleError(error));


Có thể viết các hành động đồng bộ và bất đồng bộ trong try , và nếu có bất cứ lỗi sảy ra nó sẽ được lọt vào catch

### Buổi 9 30/8/2022 : Quản lý state sử dụng Provider
  Cách đầu tiên StatefulWidget
  Mỗi cái có ưu điển nhược điểm khác nhau
  Provider là 1 widget
  bên trong có 1 method  create

không cần  stateFullwidget . mà cứ để StateLessWidget cũng có thể render lại
giúp tác vụ cung cấp dữ liệu , truyền dữ liệu vào

Provider bình thường chỉ cũng cấp dữu liệu

ChangenotifierProvide : có thể render lại

extend ChangeNotifier : class mà extend này , thì thông báo sự thay đổi thì cái gì trong Consumer sẽ được render lại

BuildContext trong flutter
trong mỗi hàm builder dể có BuildContext
Cấu trúc cây đi từ trên xuống dưới , giúp định vị vị trí của widget đó trên cây widget tree
Cơ chế của context là tìm từ dưới  lên trên


Muốn Provider.of phải wrap vào Builder

    MyModel data = Provider.of<MyModel>(context, listen: false);   // thay cho cách trên myData.doSomething()
                          data.doSomething();

                          Provider.of : Cứ tìm từ dưới lên trên , theo đúng sơ đồ tree

                          Provide lồng Provide cũng được , nhưng  trông k chuyên nghiệp
                          MultiProvide : Cái nào được viết trước thì sẽ bọc cái sai
Nên gạch dưới để những cái gì mình truy cập trong phạm vi đó thôi

Bọ cái nào thì cũng cấp cho cái đó , còn nếu bọc MatetialApp()  thì sẽ cung cấp data cho toàn bộ ứng dụng
cung cấp dữ liệu cho thành phần bên dưới , khi dữ liệu thay đổi thì 1 phần  view bj render theo

### Buổi  10 : 1/9/2022 : Quản lý state bằng Bloc
 ứng dụng xem phim APi public themoviedb.org

Gửi tin nhắn cho nhau rất dơn giản sử dụng video , gửi emoji ,âm thanh , video , ticker thì cao hơn chút
Đã xem , đã đọc chưa xem
Mã hoá tin nhắn đầu cuối ; snapChat
Cài đặt hẹn giờ  1 phút mất đi


Để có state của Bloc có thể lắng nghe được ở nhiều màn hình thì phải thêm thư viện  trong remote_bloc.dart
import 'package:rxdart/rxdart.dart';
  //final stateController = StreamController<RemoteState>();  // Cái này sẽ báo lỗi chỉ có thể lắng nghe ở 1 màn hình
  final stateController = BehaviorSubject<RemoteState>();   // ====> Phải dùng cái này

Buổi 10  : Học về Stream --> gốc gác của bloc
sử dụng Stream để quản lý state:  3 file khác nhau event - state - bloc  --> Cái này là Gốc gác của Bloc - Đang không sử dụng flutter_bloc

Có 2 trường phái sử dụng  bloc
1 : dùng Cubit : Để tạo nơi sử lý state : Bắn hàm nhận state
2 : dùng Bloc + BlocBuilder + BlocProvider : Bắn event nhận state

### Buổi 11 : 6/9/2022
tên của biến nên để lowerCamelCase : final const , String , Int,

QUY TẮC ĐẶT TÊN
lowerCamelCase
Các thuộc tính - phương thức class ,
định nghĩa cấp cao nhất,
biến,
tham số,
tham số được đặt tên ,
hàm
tạo được đặt tên phải viết hoa chữ cái đầu tiên của mỗi từ ngoại trừ từ đầu tiên và không sử dụng dấu phân tách.

Dấu shift -
Tên file , tên package, tên folder


web SocketIO hỗ trợ úng dụng chát

nền tảng cho phép sử dụng miễn phía
socketIO  Server


giao thức Socket: server có cổng để lắng nghe, máy chủ nhận tin nhắn và bắn hết tin nhắn qua cổng post
https: truyền nhận dữ liệu 2 đầu . cần phải request
socket : không cần request cũng nhận được tin nhắn
DÙng ứng dụng chat, realTime , có thông báo phải tự hiển thị lên


Firebase có tác dụng tương tự mà thực tế công ty dùng nhiều hơn SocketIO


Shared Preferences : LƯu dữ liệu dạng đơn giản




### Buổi 12 : 9/9/2022 Học về SQLife
SQlife cũng giống như share Preferences
SQlife giúp lưu giữ liệu dạng phức tạp hơn , dữu liệu dạng bảng
là cơ sở dữ liệu quan hệ dạng SQL


các câu lệnh SQlife đều phải bất đồng bộ

câu lệnh onCreate không tạo lại

SQlife cần 2 thư viện sqlite  và part

những thao tác mà mình truy cập mà phải chờ thì phải await , câu lệnh trên xong câu lệnh sau mới chạy
Có thể lấy file.db ở ngay android studio

### Buổi 13: 13/9/2022 Học cài đặt Firebase + authentication Firebase
có 2 cách để validate form
có widget TextFormField : để có thể validate dữ liệu và có hiệu ứng giao diện luôn

### Buổi 14/ 15/9/2022 học về cloud firestore

có 2 cách update dữ liệu lên trên cloud firestore là colection hoặc set

update: là thay đổi từng cái
set là thay đổi từng cái  đều phải truyền dạng Map<String Dynamic>

Truyền đủ đối số set và update như nhau
nhưng nếu truyền thiếu đối số , dùng update thì sẽ sửa đúng trường dữ liệu đó thôi , mấy trường khác giữ nguyên
còn set sẽ xoá cái không truyền

Toàn dạng noSQL thêm sửa xoá làm việc với thêm sửa xoá , chứ không có câu lệnh query như SQLife

Dự án thực tế , phần quyền , lọc dữ liệu ,
liên kết authentication và FireStore Database qua user UID

các user gửi hình ảnh cho nhau sẽ đều qua Storage

### Buổi 15 20/9/2022 Học về cloud Storage để có thể upload file lên bằng code

firestore database là nâng cấp của realtime database  : nhưng cũng chỉ có thể lưu dưới dạng json
storage là database có thể dạng ảnh , file, video

allow read, write if true;
hoặc request auth != null;



Học về cloud Storage
permission_handler: Để có thể truy cập vào bộ nhớ máy cần permission :

path_provider:  để có thể truy cập đường link bộ nhớ máy
firebase_storage: Để sử dụng database của firebase

firebase Crashlytics
theo dõi các lỗi mà ứng dụng đi vào thực tế, Đôi khi app bị lỗi
sẽ bắn ra log xem dòng code nào bị lỗi ,  Khi  ứng dụng bị crash là tự động bắt được lỗi
có thể bắt lỗi 1 cách chủ động, xem bao nhiêu người sai pass, bao nhiêu người không thanh toán được


Trong android manifest để xin quyền đọc và ghi thêm 2 dòng

<uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE" />
<uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE" />

firebase.google.com doc giống firebase.flutter.dev

firebase.google.com viết cho nhiều ngôn ngữ và nền tảng khác nhau sử dụng firebase
firebase.flutter.dev : Viết cho thuần Flutter : nên ưu tiên đọc ở đây


### Buổi 16: ngày 22/9/2022
Học về git  