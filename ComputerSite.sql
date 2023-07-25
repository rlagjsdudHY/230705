drop database if exists ComputerSite;
create database if not exists ComputerSite;
use ComputerSite;

#회원가입
create table memList (
	num				int				primary key		auto_increment,  #번호
    uid				char(20)		unique not null				  ,  #아이디
    upw				char(20)		not null				  ,  #비밀번호
    uname			char(20)		not null				  ,  #이름
    phone			char(20)								  ,  #전화번호
    address			char(100)								  ,  #주소
    email			char(20)								  ,  #이메일
    regTM			timestamp		default now()                #시간
);

drop table memList;
select * from memList order by num;
insert into memList (num,uid,upw,uname,phone,address,email,regTM)
values 
(1, 'test', '!aaaa1111', '테스터1', '010-1111-1111', '서울시 마포구', 'test01@naver.com', now()), 
(2, 'test2', '!aaaa1111', '테스터1', '010-1111-1111', '서울시 마포구', 'test01@naver.com', now()),
(3, 'test3', '!aaaa1111', '테스터2', '010-2222-2222', '서울시 마포구', 'test02@naver.com', now());
# Error Code: 3730. Cannot drop table 'memlist' referenced by a foreign key constraint 'cart_ibfk_1' on table 'cart'.



#컴퓨터 상품 상세정보    
create table board (
	num				int				primary key		auto_increment,  #번호
    writer 			char(30) 		not null					  ,  #admin
	title 			char(100) 		not null 					  ,  #제목
	content 		varchar(1000)								  ,  #컴퓨터 상품
    filename		char(50)									 	 #컴퓨터 이미지
);

    insert into board (num,writer,title,content,fileName)
     values 
(1, 'test', '컴퓨터1', '컴퓨터1공간입니다', '컴퓨터사진'); 
	
    drop table board;
    
    #어드민 테이블
create table admin (
	num	 	int 	primary key 	auto_increment , #번호
    uid		char(20)	 null	 , 					#아이디
    upw 	char(20)	 null  	 ,	 				#비밀번호
    uname	char(20)	 null    ,  			    #이름
    email	char(20)    							 #이메일
);
 drop table admin;
insert into admin (uid,upw,uname,email)
values ('admin','1234','관리자','admin@admin.co.kr');
select uname from admin where uid = 'admin';
select * from admin;

#공지사항 게시판
create table noticeBoard (
	num				int				primary key		auto_increment,  #번호
    writer 			char(30) 		not null					  ,  #admin
	title 			char(100) 		not null 					  ,  #제목
	content 		varchar(1000)	not	null						  ,  #내용
    filename		char(50)		null							 ,	 #이미지
	readcnt			int					 null	default 0	   	, #조회수
    regTM			timestamp			default now()			    #작성시간
);
select * from noticeBoard;
drop table noticeBoard;
#게시글 몇개 추가
INSERT INTO noticeBoard (writer, title, content, filename, readcnt, regTM)
VALUES
    ('관리자', '첫 번째 공지', '첫 번째 공지사항 내용입니다.', NULL, 10, NOW()),
    ('관리자', '두 번째 공지', '두 번째 공지사항 내용입니다.', NULL, 5, NOW()),
    ('관리자', '세 번째 공지', '세 번째 공지사항 내용입니다.', NULL, 8, NOW());
 select * from noticeBoard where num = 1;
 
 
 
#######################제품 사양 기본옵션 시작######################
create table goodsDetail (
	pcNum 			int 		primary key 	auto_increment 	,	# 번호
    goodsName 		char(80)	not null						,	# 제품명
    image			char(80)	not null						,	# 사진
    monitor 		char(80)	not null						,	# 모니터 포함
    pcCpu 			char(80)	not null						,	# CPU
    cpuCooler 		char(80)	not null						,	# CPU쿨러
    pcMemory 		char(80)	not null						,	# 메모리
    mainboard		char(80)	not null						,	# 메인보드
    ssd 			char(80)	not null						,	# SSD하드
    hdd 			char(80)	not null						,	# HDD추가
    graphic 		char(80)	not null						,	# 그래픽카드
    cd 				char(80)	not null						,	# CD드라이브
    sound 			char(80)	not null						,	# 사운드
    networkCard 	char(80)	not null						,	# 랜카드
    pcCase 			char(80)	not null						,	# 케이스
    power 			char(80)	not null						,	# 파워
    windows 		char(80)	not null						,	# 윈도우
    office 			char(80)	not null						,	# 오피스
    freeGift 		char(80)	not null						,	# 사은품
    pcPrice			int			not null							# 가격
);

insert into goodsDetail
(pcNum, goodsName, image, monitor, pcCpu, cpuCooler, pcMemory, mainboard, ssd, hdd, graphic,
cd, sound, networkCard, pcCase, power, windows, office, freeGift, pcPrice)
values
(1, '고성능/3D전용 F4', 'images/goods/model01.jpg', '포함안됨', '인텔10세대-i5 10400F 터보 4.3G(6코어12쓰레드)',
'인텔 CPU 쿨러', '16GB DDR4-3200(팀그룹,16Gx1)', '(H510)ASUS PRO H510M-C/CSM',
'512G (팀그룹 MP33,M.2 NVMe)', 'HDD디스크 미포함[추가구성 가능]',
'[지포스] 이도디스플레이 GTX1660 SUPER RAGE-X D6 6GB Dual', 'CD-ROM 미포함 [추가 구성 가능]',
'[내장형] 6/8채널 사운드코덱', '[내장형] 기가 LAN/1000Mbps', '[미들][쿨링팬6개] 잘만 N3 FM 블랙(LED ON/OFF)',
'현대파워 PRIME 650K (120mm 저소음)', '윈도우 미설치 (정품구매시 설치후 출고)', 'MicroSoft Office 추가구매 가능',
'고급 게이밍 장패드 사은품(L패드)', 700000),
(2, '고성능/3D전용 F3', 'images/goods/model02.jpg', '포함안됨', '인텔10세대-i7 10500F 터보 4.3G(8코어12쓰레드)',
'인텔 CPU 쿨러', '16GB DDR5-3200(팀그룹,16Gx1)', '(H510)ASUS PRO H510M-C/CSM',
'512G (팀그룹 MP33,M.2 NVMe)', 'HDD디스크 미포함[추가구성 가능]',
'[지포스] 이도디스플레이 GTX2060 SUPER RAGE-X D6 8GB Dual', 'CD-ROM 미포함 [추가 구성 가능]',
'[내장형] 6/8채널 사운드코덱', '[내장형] 기가 LAN/1000Mbps', '[미들][쿨링팬6개] 잘만 N3 FM 블랙(LED ON/OFF)',
'현대파워 PRIME 650K (120mm 저소음)', '윈도우 미설치 (정품구매시 설치후 출고)', 'MicroSoft Office 추가구매 가능',
'고급 게이밍 장패드 사은품(L패드)', 750000),
(3, '고성능/3D전용 G1', 'images/goods/model03.jpg', '포함안됨', '인텔10세대-i5 10400F 터보 4.3G(6코어12쓰레드)',
'인텔 CPU 쿨러', '16GB DDR4-3200(팀그룹,16Gx1)', '(H510)ASUS PRO H510M-C/CSM',
'512G (팀그룹 MP33,M.2 NVMe)', 'HDD디스크 미포함[추가구성 가능]',
'[지포스] 이도디스플레이 GTX1660 SUPER RAGE-X D6 6GB Dual', 'CD-ROM 미포함 [추가 구성 가능]',
'[내장형] 6/8채널 사운드코덱', '[내장형] 기가 LAN/1000Mbps', '[미들][쿨링팬6개] 잘만 N3 FM 블랙(LED ON/OFF)',
'현대파워 PRIME 650K (120mm 저소음)', '윈도우 미설치 (정품구매시 설치후 출고)', 'MicroSoft Office 추가구매 가능',
'고급 게이밍 장패드 사은품(L패드)', 800000),
(4, '고성능/3D전용 G5', 'images/goods/model04.jpg', '포함안됨', '인텔10세대-i5 10400F 터보 4.3G(6코어12쓰레드)',
'인텔 CPU 쿨러', '16GB DDR4-3200(팀그룹,16Gx1)', '(H510)ASUS PRO H510M-C/CSM',
'512G (팀그룹 MP33,M.2 NVMe)', 'HDD디스크 미포함[추가구성 가능]',
'[지포스] 이도디스플레이 GTX1660 SUPER RAGE-X D6 6GB Dual', 'CD-ROM 미포함 [추가 구성 가능]',
'[내장형] 6/8채널 사운드코덱', '[내장형] 기가 LAN/1000Mbps', '[미들][쿨링팬6개] 잘만 N3 FM 블랙(LED ON/OFF)',
'현대파워 PRIME 650K (120mm 저소음)', '윈도우 미설치 (정품구매시 설치후 출고)', 'MicroSoft Office 추가구매 가능',
'고급 게이밍 장패드 사은품(L패드)', 900000),
(5, '고성능/3D전용 C2', 'images/goods/model05.jpg', '포함안됨', '인텔10세대-i5 10400F 터보 4.3G(6코어12쓰레드)',
'인텔 CPU 쿨러', '16GB DDR4-3200(팀그룹,16Gx1)', '(H510)ASUS PRO H510M-C/CSM',
'512G (팀그룹 MP33,M.2 NVMe)', 'HDD디스크 미포함[추가구성 가능]',
'[지포스] 이도디스플레이 GTX1660 SUPER RAGE-X D6 6GB Dual', 'CD-ROM 미포함 [추가 구성 가능]',
'[내장형] 6/8채널 사운드코덱', '[내장형] 기가 LAN/1000Mbps', '[미들][쿨링팬6개] 잘만 N3 FM 블랙(LED ON/OFF)',
'현대파워 PRIME 650K (120mm 저소음)', '윈도우 미설치 (정품구매시 설치후 출고)', 'MicroSoft Office 추가구매 가능',
'고급 게이밍 장패드 사은품(L패드)', 950000),
(6, '고성능/3D전용 F8', 'images/goods/model06.jpg', '포함안됨', '인텔10세대-i5 10400F 터보 4.3G(6코어12쓰레드)',
'인텔 CPU 쿨러', '16GB DDR4-3200(팀그룹,16Gx1)', '(H510)ASUS PRO H510M-C/CSM',
'512G (팀그룹 MP33,M.2 NVMe)', 'HDD디스크 미포함[추가구성 가능]',
'[지포스] 이도디스플레이 GTX1660 SUPER RAGE-X D6 6GB Dual', 'CD-ROM 미포함 [추가 구성 가능]',
'[내장형] 6/8채널 사운드코덱', '[내장형] 기가 LAN/1000Mbps', '[미들][쿨링팬6개] 잘만 N3 FM 블랙(LED ON/OFF)',
'현대파워 PRIME 650K (120mm 저소음)', '윈도우 미설치 (정품구매시 설치후 출고)', 'MicroSoft Office 추가구매 가능',
'고급 게이밍 장패드 사은품(L패드)', 1200000),
(7, '고성능/3D전용 G9', 'images/goods/model07.jpg', '포함안됨', '인텔10세대-i5 10400F 터보 4.3G(6코어12쓰레드)',
'인텔 CPU 쿨러', '16GB DDR4-3200(팀그룹,16Gx1)', '(H510)ASUS PRO H510M-C/CSM',
'512G (팀그룹 MP33,M.2 NVMe)', 'HDD디스크 미포함[추가구성 가능]',
'[지포스] 이도디스플레이 GTX1660 SUPER RAGE-X D6 6GB Dual', 'CD-ROM 미포함 [추가 구성 가능]',
'[내장형] 6/8채널 사운드코덱', '[내장형] 기가 LAN/1000Mbps', '[미들][쿨링팬6개] 잘만 N3 FM 블랙(LED ON/OFF)',
'현대파워 PRIME 650K (120mm 저소음)', '윈도우 미설치 (정품구매시 설치후 출고)', 'MicroSoft Office 추가구매 가능',
'고급 게이밍 장패드 사은품(L패드)', 1000000);

desc goodsDetail;
select * from goodsDetail order by pcNum desc;
drop table goodsDetail;
#######################제품 사양 기본옵션 끝######################



#######################사양 옵션 시작######################

# 테이블 생성
create table monitorOp (
	monitorOpNum	int			primary key 	auto_increment 	,	# 번호
	monitorOpName	char(80)	not null						,	# 옵션 이름
    monitorOpPrice	int			not null							# 옵션 가격
);		# 01 모니터 옵션들
create table pcCpuOp (
	pcCpuOpNum		int			primary key 	auto_increment 	,	# 번호
	pcCpuOpName		char(80)	not null						,	# 옵션 이름
    pcCpuOpPrice	int			not null							# 옵션 가격
);		# 02 CPU 옵션들
create table cpuCoolerOp (
	cpuCoolerOpNum		int			primary key 	auto_increment 	,	# 번호
	cpuCoolerOpName		char(80)	not null						,	# 옵션 이름
    cpuCoolerOpPrice	int			not null							# 옵션 가격
);		# 03 CPU쿨러 옵션들
create table pcMemoryOp (
	pcMemoryOpNum	int			primary key 	auto_increment 	,	# 번호
	pcMemoryOpName	char(80)	not null						,	# 옵션 이름
    pcMemoryOpPrice	int			not null							# 옵션 가격
);		# 04 메모리 옵션들
create table mainboardOp (
	mainboardOpNum		int			primary key 	auto_increment 	,	# 번호
	mainboardOpName		char(80)	not null						,	# 옵션 이름
    mainboardOpPrice	int			not null							# 옵션 가격
);		# 05 메인보드 옵션들
create table ssdOp (
	ssdOpNum	int			primary key 	auto_increment 	,	# 번호
	ssdOpName	char(80)	not null						,	# 옵션 이름
    ssdOpPrice	int			not null							# 옵션 가격
);		# 06 SSD하드 옵션들
create table hddOp (
	hddOpNum	int			primary key 	auto_increment 	,	# 번호
	hddOpName	char(80)	not null						,	# 옵션 이름
    hddOpPrice	int			not null							# 옵션 가격
);		# 07 HDD추가 옵션들
create table graphicOp (
	graphicOpNum	int			primary key 	auto_increment 	,	# 번호
	graphicOpName	char(80)	not null						,	# 옵션 이름
    graphicOpPrice	int			not null							# 옵션 가격
);		# 08 그래픽카드 옵션들
create table cdOp (
	cdOpNum		int			primary key 	auto_increment 	,	# 번호
	cdOpName	char(80)	not null						,	# 옵션 이름
    cdOpPrice	int			not null							# 옵션 가격
);		# 09 CD드라이브 옵션들
create table soundOp (
	soundOpNum		int			primary key 	auto_increment 	,	# 번호
	soundOpName		char(80)	not null						,	# 옵션 이름
    soundOpPrice	int			not null							# 옵션 가격
);		# 10 사운드 옵션들
create table networkCardOp (
	networkCardOpNum	int			primary key 	auto_increment 	,	# 번호
	networkCardOpName	char(80)	not null						,	# 옵션 이름
    networkCardOpPrice	int			not null							# 옵션 가격
);		# 11 랜카드 옵션들
create table pcCaseOp (
	pcCaseOpNum		int			primary key 	auto_increment 	,	# 번호
	pcCaseOpName	char(80)	not null						,	# 옵션 이름
    pcCaseOpPrice	int			not null							# 옵션 가격
);		# 12 케이스 옵션들
create table powerOp (
	powerOpNum		int			primary key 	auto_increment 	,	# 번호
	powerOpName		char(80)	not null						,	# 옵션 이름
    powerOpPrice	int			not null							# 옵션 가격
);		# 13 파워 옵션들
create table windowsOp (
	windowsOpNum	int			primary key 	auto_increment 	,	# 번호
	windowsOpName	char(80)	not null						,	# 옵션 이름
    windowsOpPrice	int			not null							# 옵션 가격
);		# 14 윈도우 옵션들
create table officeOp (
	officeOpNum		int			primary key 	auto_increment 	,	# 번호
	officeOpName	char(80)	not null						,	# 옵션 이름
    officeOpPrice	int			not null							# 옵션 가격
);		# 15 오피스 옵션들
create table freeGiftOp (
	freeGiftOpNum	int			primary key 	auto_increment 	,	# 번호
	freeGiftOpName	char(80)	not null						,	# 옵션 이름
    freeGiftOpPrice	int			not null							# 옵션 가격
);		# 16 사은품 옵션들

# 데이터 삽입
insert into monitorOp (monitorOpNum, monitorOpName, monitorOpPrice) values
(1, '삼성 모니터 (24인치) (+150,000원)', 150000),
(2, 'LG모니터 (27인치) (+320,000원)', 320000),
(3, '인텔 게이밍 모니터 (27인치) (+370,000원)', 370000);
insert into pcCpuOp (pcCpuOpNum, pcCpuOpName, pcCpuOpPrice) values
(1, 'CPU 옵션1 (+50,000원)', 50000),
(2, 'CPU 옵션2 (+150,000원)', 150000),
(3, 'CPU 옵션3 (+200,000원)', 200000);
insert into cpuCoolerOp (cpuCoolerOpNum, cpuCoolerOpName, cpuCoolerOpPrice) values
(1, 'CPU쿨러 옵션1 (+10,000원)', 10000),
(2, 'CPU쿨러 옵션2 (+30,000원)', 30000),
(3, 'CPU쿨러 옵션3 (+100,000원)', 100000);
insert into pcMemoryOp (pcMemoryOpNum, pcMemoryOpName, pcMemoryOpPrice) values
(1, '메모리 옵션1 (+50,000원)', 50000),
(2, '메모리 옵션2 (+100,000원)', 100000),
(3, '메모리 옵션3 (+150,000원)', 150000);
insert into mainboardOp (mainboardOpNum, mainboardOpName, mainboardOpPrice) values
(1, '메인보드 옵션1 (+100,000원)', 100000),
(2, '메인보드 옵션2 (+120,000원)', 120000),
(3, '메인보드 옵션3 (+200,000원)', 200000);
insert into ssdOp (ssdOpNum, ssdOpName, ssdOpPrice) values
(1, 'SSD 옵션1 (+50,000원)', 50000),
(2, 'SSD 옵션2 (+100,000원)', 100000),
(3, 'SSD 옵션3 (+150,000원)', 150000);
insert into hddOp (hddOpNum, hddOpName, hddOpPrice) values
(1, 'HDD 옵션1 (+50,000원)', 50000),
(2, 'HDD 옵션2 (+100,000원)', 100000),
(3, 'HDD 옵션3 (+150,000원)', 150000);
insert into graphicOp (graphicOpNum, graphicOpName, graphicOpPrice) values
(1, '그래픽카드 옵션1 (+50,000원)', 50000),
(2, '그래픽카드 옵션2 (+100,000원)', 100000),
(3, '그래픽카드 옵션3 (+150,000원)', 150000);
insert into cdOp (cdOpNum, cdOpName, cdOpPrice) values
(1, 'CD드라이브 옵션1 (+50,000원)', 50000),
(2, 'CD드라이브 옵션2 (+100,000원)', 100000),
(3, 'CD드라이브 옵션3 (+150,000원)', 150000);
insert into soundOp (soundOpNum, soundOpName, soundOpPrice) values
(1, '사운드 옵션1 (+50,000원)', 50000),
(2, '사운드 옵션2 (+100,000원)', 100000),
(3, '사운드 옵션3 (+150,000원)', 150000);
insert into networkCardOp (networkCardOpNum, networkCardOpName, networkCardOpPrice) values
(1, '랜카드 옵션1 (+50,000원)', 50000),
(2, '랜카드 옵션2 (+100,000원)', 100000),
(3, '랜카드 옵션3 (+150,000원)', 150000);
insert into pcCaseOp (pcCaseOpNum, pcCaseOpName, pcCaseOpPrice) values
(1, '케이스 옵션1 (+50,000원)', 50000),
(2, '케이스 옵션2 (+100,000원)', 100000),
(3, '케이스 옵션3 (+150,000원)', 150000);
insert into powerOp (powerOpNum, powerOpName, powerOpPrice) values
(1, '파워 옵션1 (+50,000원)', 50000),
(2, '파워 옵션2 (+100,000원)', 100000),
(3, '파워 옵션3 (+150,000원)', 150000);
insert into windowsOp (windowsOpNum, windowsOpName, windowsOpPrice) values
(1, '윈도우 옵션1 (+50,000원)', 50000),
(2, '윈도우 옵션2 (+100,000원)', 100000),
(3, '윈도우 옵션3 (+150,000원)', 150000);
insert into officeOp (officeOpNum, officeOpName, officeOpPrice) values
(1, '오피스 옵션1 (+50,000원)', 50000),
(2, '오피스 옵션2 (+100,000원)', 100000),
(3, '오피스 옵션3 (+150,000원)', 150000);
insert into freeGiftOp (freeGiftOpNum, freeGiftOpName, freeGiftOpPrice) values
(1, '사은품 옵션1 (+50,000원)', 50000),
(2, '사은품 옵션2 (+100,000원)', 100000),
(3, '사은품 옵션3 (+150,000원)', 150000);

# 테이블 조회
desc monitorOp;
desc pcCpuOp;
desc cpuCoolerOp;
desc pcMemoryOp;
desc mainboardOp;
desc ssdOp;
desc hddOp;
desc graphicOp;
desc cdOp;
desc soundOp;
desc networkCardOp;
desc pcCaseOp;
desc powerOp;
desc windowsOp;
desc officeOp;
desc freeGiftOp;

# 옵션 데이터 조회
select * from monitorOp order by monitorOpNum desc;
select * from pcCpuOp order by pcCpuOpNum desc;
select * from cpuCoolerOp order by cpuCoolerOpNum desc;
select * from pcMemoryOp order by pcMemoryOpNum desc;
select * from mainboardOp order by mainboardOpNum desc;
select * from ssdOp order by ssdOpNum desc;
select * from hddOp order by hddOpNum desc;
select * from graphicOp order by graphicOpNum desc;
select * from cdOp order by cdOpNum desc;
select * from soundOp order by soundOpNum desc;
select * from networkCardOp order by networkCardOpNum desc;
select * from pcCaseOp order by pcCaseOpNum desc;
select * from powerOp order by powerOpNum desc;
select * from windowsOp order by windowsOpNum desc;
select * from officeOp order by officeOpNum desc;
select * from freeGiftOp order by freeGiftOpNum desc;

# 제품 사양 옵션 테이블 삭제
drop table monitorOp;
drop table pcCpuOp;
drop table cpuCoolerOp;
drop table pcMemoryOp;
drop table mainboardOp;
drop table ssdOp;
drop table hddOp;
drop table graphicOp;
drop table cdOp;
drop table soundOp;
drop table networkCardOp;
drop table pcCaseOp;
drop table powerOp;
drop table windowsOp;
drop table officeOp;
drop table freeGiftOp;

#######################사양 옵션 끝######################



# 장바구니 리스트
 create table Cart (
	num			int			primary key		auto_increment		,		#장바구니리스트번호
    uid			char(20)					  					,		#아이디
    goodsName	char(100)	not null							,		#제품 이름
    price		int												,		#제품 가격
    cnt			tinyint											,		#제품 개수
    foreign key (uid) references memList(uid) on update cascade on delete cascade
);

drop table Cart;

#example
insert into Cart (uid, goodsName, price, cnt) 
values ('test', '[LG전자] LG gram 15ZD95Q-GX56K [기본 제품]', 1199000, 1),
('test', '[LG전자] 미들데스크탑 B81KV-AX3509 (i5-13400/8GB/256G NVMe/FD) [기본제품] ', 879000, 1);
select * from Cart order by num;

#1:1 게시판
create table QNABoard(
	num				int				primary key		auto_increment,  #번호
    uid       char(20)     not null,
    writer 			char(30) 		null		default '글쓴이'			  ,  #admin
	title 			char(100) 		not null 					  ,  #제목
	content 		varchar(1000)	not	null						  ,  #내용
    filename		char(50)		null							 ,	 #이미지
	readcnt			int					 null	default 0	   	, #조회수
    regTM			timestamp			default now()			    #작성시간
);

select * from QNABoard;
drop table QNABoard;
#게시글 몇개 추가
INSERT INTO QNABoard (uid,writer, title, content, filename, readcnt, regTM)
VALUES
    ('apple','관리자', '첫 번째 공지', '첫 번째 공지사항 내용입니다.', NULL, 10, NOW()),
    ('banana','관리자', '두 번째 공지', '두 번째 공지사항 내용입니다.', NULL, 5, NOW()),
    ('car','관리자', '세 번째 공지', '세 번째 공지사항 내용입니다.', NULL, 8, NOW());
 
#코멘트 테이블
create table CommentBoard(
	num int auto_increment primary key not null,
    bno int not null default 0,
    uname char(20) null default '유저',
	comment char(200) not null,
	regTM timestamp default now()
);
drop table CommentBoard;
select * from CommentBoard where num = '9';


 
 
    