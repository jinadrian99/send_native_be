-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Máy chủ: remotemysql.com
-- Thời gian đã tạo: Th8 07, 2021 lúc 03:18 AM
-- Phiên bản máy phục vụ: 8.0.13-4
-- Phiên bản PHP: 7.2.24-0ubuntu0.18.04.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `AaqlFWLEt4`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ADMIN`
--

CREATE TABLE `ADMIN` (
  `idAdmin` int(11) NOT NULL,
  `phanQuyen` int(11) NOT NULL COMMENT '1: Quan tri vien, 2: NV quan ly, 3: NV tiep tan',
  `tenAdmin` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `ADMIN`
--

INSERT INTO `ADMIN` (`idAdmin`, `phanQuyen`, `tenAdmin`) VALUES
(3, 3, 'Trang Tran'),
(5, 1, 'Trieu Uy Phu'),
(6, 2, 'Tran Van Hung'),
(7, 3, 'Dam Tuan Kiet'),
(8, 3, 'Gaemoon');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `CHITIETDATDICHVU`
--

CREATE TABLE `CHITIETDATDICHVU` (
  `idCTDDV` int(11) NOT NULL,
  `donGia` double NOT NULL,
  `hinhThuc` int(11) NOT NULL,
  `soLuong` int(11) NOT NULL,
  `idDDDV` int(11) NOT NULL,
  `idDV` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `CHITIETDONDATPHONG`
--

CREATE TABLE `CHITIETDONDATPHONG` (
  `idCTDDP` int(11) NOT NULL,
  `donGia` int(11) NOT NULL,
  `idDDP` int(11) NOT NULL,
  `idLP` int(11) NOT NULL,
  `soLuong` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `CHITIETDONDATPHONG`
--

INSERT INTO `CHITIETDONDATPHONG` (`idCTDDP`, `donGia`, `idDDP`, `idLP`, `soLuong`) VALUES
(1, 100, 1, 1, 2),
(2, 100, 5, 1, 1),
(3, 600, 1, 2, 1),
(4, 600, 2, 2, 1),
(5, 600, 3, 2, 1),
(6, 350, 4, 3, 2),
(7, 350, 5, 3, 1),
(8, 70, 15, 1, 1),
(9, 350, 15, 3, 1),
(10, 350, 16, 3, 1),
(11, 70, 20, 1, 1),
(12, 350, 20, 3, 2),
(13, 350, 21, 3, 1),
(14, 500, 21, 2, 1),
(15, 70, 22, 1, 2),
(16, 30, 23, 2, 1),
(17, 350, 23, 3, 1),
(18, 350, 24, 3, 2),
(19, 30, 24, 2, 1),
(20, 70, 25, 1, 3),
(21, 70, 28, 1, 3),
(22, 70, 29, 1, 2),
(23, 600, 29, 2, 1),
(24, 70, 30, 1, 4),
(25, 600, 31, 2, 2),
(26, 70, 32, 1, 5),
(27, 350, 33, 3, 1),
(28, 1000, 33, 12, 1),
(29, 700, 33, 11, 1),
(30, 1999, 34, 13, 1),
(31, 1999, 35, 13, 1),
(32, 700, 35, 11, 1),
(33, 70, 36, 1, 1),
(34, 30, 37, 2, 2),
(35, 350, 37, 3, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `CHITIETPHIEUTHANHTOAN`
--

CREATE TABLE `CHITIETPHIEUTHANHTOAN` (
  `idCTPTT` int(11) NOT NULL,
  `donGia` double NOT NULL,
  `maPhong` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `idPTT` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `CHITIETPHIEUTHANHTOAN`
--

INSERT INTO `CHITIETPHIEUTHANHTOAN` (`idCTPTT`, `donGia`, `maPhong`, `idPTT`) VALUES
(1, 100, 'C101', 1),
(2, 100, 'C102', 1),
(3, 600, 'C201', 1),
(4, 600, 'C202', 2),
(5, 600, 'C203', 3),
(6, 350, 'C301', 4),
(7, 350, 'C302', 4),
(8, 70, 'C101', 5),
(9, 350, 'C302', 5),
(10, 350, 'C301', 6),
(11, 500, 'C201', 16),
(12, 350, 'C301', 16),
(13, 70, 'C102', 17),
(14, 70, 'C101', 17),
(15, 30, 'C201', 18),
(16, 350, 'C301', 18),
(17, 30, 'C201', 19),
(18, 350, 'C301', 19),
(19, 350, 'C302', 19),
(20, 70, 'C103', 20),
(21, 70, 'C102', 20),
(22, 70, 'C101', 20),
(31, 70, 'C103', 28),
(32, 70, 'C104', 28),
(33, 70, 'C102', 28),
(34, 70, 'C101', 28),
(35, 70, 'C102', 29),
(36, 70, 'C105', 29),
(37, 70, 'C101', 29),
(38, 70, 'C103', 29),
(39, 70, 'C104', 29),
(46, 1999, 'C1301', 33),
(47, 1999, 'C1301', 34),
(48, 700, 'C1101', 34),
(49, 70, 'C101', 35),
(50, 30, 'C201', 36),
(51, 30, 'C202', 36),
(52, 350, 'C301', 36);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `DICHVU`
--

CREATE TABLE `DICHVU` (
  `idDV` int(11) NOT NULL,
  `tenDV` varchar(50) NOT NULL,
  `hinhThuc` int(11) NOT NULL COMMENT '1: per booking, 2: per person per date, 3: free',
  `donGia` double NOT NULL DEFAULT '0',
  `moTaTD` text NOT NULL,
  `moTaCT` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `DICHVU`
--

INSERT INTO `DICHVU` (`idDV`, `tenDV`, `hinhThuc`, `donGia`, `moTaTD`, `moTaCT`) VALUES
(1, 'Valentine Package', 1, 50, 'Share an unforgettable romantic moment for Valentine\'s Day in Paris ! ', 'Select the Special Valentine’s Day Package for only 50€ extra including : \r\n- 1/2 bottle of Champagne \r\n- Roses \r\n- Macarons.'),
(2, 'Breakfast', 2, 7, 'Our EXPRESS BREAKFAST on the tray is served in your room only, between 7:00 am and 10:30 am.', 'This includes:\r\n1 hot drink,\r\n1 orange juice and\r\n1 basket of pastries.\r\nThe breakfast is prepared by our team and served on a tray in order to respect barrier gestures, to protect yourself and others from coronavirus.'),
(3, 'Pressreader', 3, 0, 'Connecting People through News.', 'All-you-can-read digital newsstand with thousands of the world\'s most popular newspapers and magazines.'),
(4, 'Free international Phone calls', 3, 0, 'Free international Phone calls', 'Free international Phone calls'),
(5, 'Party', 2, 200, 'Let\'s party', 'This is a test');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `DONDATDICHVU`
--

CREATE TABLE `DONDATDICHVU` (
  `idDDDV` int(11) NOT NULL,
  `ngayDat` date NOT NULL,
  `tongThanhTien` int(11) NOT NULL,
  `trangThai` int(11) NOT NULL COMMENT '1: chưa thanh toán, 2: đã thanh toán',
  `idPTP` int(11) NOT NULL,
  `idKHD` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `DONDATPHONG`
--

CREATE TABLE `DONDATPHONG` (
  `idDDP` int(11) NOT NULL,
  `ngayDen` date NOT NULL,
  `ngayDi` date NOT NULL,
  `soDem` int(11) NOT NULL,
  `ngayDatPhong` date NOT NULL,
  `tongThanhTien` double NOT NULL,
  `trangThaiDat` int(11) NOT NULL DEFAULT '0' COMMENT '0: đang xử lý, 1: hủy, 2:hoàn tất',
  `idKHD` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `DONDATPHONG`
--

INSERT INTO `DONDATPHONG` (`idDDP`, `ngayDen`, `ngayDi`, `soDem`, `ngayDatPhong`, `tongThanhTien`, `trangThaiDat`, `idKHD`) VALUES
(1, '2021-06-13', '2021-06-18', 5, '2021-06-12', 4000, 0, 5),
(2, '2021-06-23', '2021-06-23', 7, '2021-06-14', 4200, 0, 7),
(3, '2021-06-24', '2021-06-26', 5, '2021-06-15', 3000, 0, 5),
(4, '2021-06-25', '2021-06-22', 5, '2021-06-13', 3500, 1, 13),
(5, '2021-01-08', '2021-01-10', 2, '2021-01-06', 2500, 0, 55),
(6, '2021-01-17', '2021-01-21', 4, '2021-01-13', 5000, 0, 34),
(7, '2021-02-04', '2021-02-09', 5, '2021-02-01', 5000, 1, 24),
(8, '2021-02-18', '2021-02-24', 6, '2021-10-02', 5500, 1, 23),
(9, '2021-03-21', '2021-03-22', 1, '2021-03-19', 500, 1, 13),
(10, '2021-03-28', '2021-03-31', 3, '2021-03-25', 1500, 1, 10),
(11, '2021-04-01', '2021-04-05', 4, '2021-03-31', 2000, 0, 55),
(12, '2021-04-15', '2021-04-20', 5, '2021-04-08', 5000, 0, 34),
(13, '2021-05-08', '2021-05-15', 7, '2021-05-01', 6000, 1, 24),
(14, '2021-05-20', '2021-05-28', 8, '2021-05-11', 6500, 1, 23),
(15, '2021-07-04', '2021-07-06', 2, '2021-06-28', 840, 0, 130),
(16, '2021-07-05', '2021-07-12', 4, '2021-06-30', 1400, 0, 130),
(20, '2021-07-11', '2021-07-14', 3, '2021-07-02', 2310, 0, 24),
(21, '2021-07-15', '2021-07-19', 4, '2021-07-04', 3400, 0, 10),
(22, '2021-07-18', '2021-07-21', 3, '2021-07-08', 420, 0, 21),
(23, '2021-07-20', '2021-07-23', 3, '2021-07-09', 1140, 0, 13),
(24, '2021-07-25', '2021-07-28', 3, '2021-07-23', 2190, 0, 5),
(25, '2021-07-25', '2021-07-28', 3, '2021-07-24', 630, 1, 5),
(28, '2021-07-25', '2021-07-28', 3, '2021-07-24', 630, 0, 130),
(29, '2021-07-25', '2021-07-28', 3, '2021-07-24', 2220, 0, 13),
(30, '2021-07-25', '2021-07-30', 5, '2021-07-24', 1400, 0, 130),
(31, '2021-07-25', '2021-07-30', 5, '2021-07-24', 6000, 1, 130),
(32, '2021-07-25', '2021-07-30', 5, '2021-07-24', 1750, 0, 130),
(33, '2021-07-30', '2021-08-04', 5, '2021-07-24', 10250, 0, 130),
(34, '2021-07-28', '2021-07-30', 2, '2021-07-25', 3998, 0, 130),
(35, '2021-07-28', '2021-07-31', 3, '2021-07-27', 8097, 0, 236),
(36, '2021-08-07', '2021-08-08', 1, '2021-08-06', 70, 0, 240),
(37, '2021-08-07', '2021-08-11', 4, '2021-08-06', 1640, 0, 5);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `GIAPHUTHU`
--

CREATE TABLE `GIAPHUTHU` (
  `idGPT` int(11) NOT NULL,
  `tenPT` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `giaPT` double NOT NULL DEFAULT '0' COMMENT 'loaiGPT: 1: money, 2: percent',
  `loaiGPT` int(11) NOT NULL COMMENT '1: Extra Basic, 2: Extra Room'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `GIAPHUTHU`
--

INSERT INTO `GIAPHUTHU` (`idGPT`, `tenPT`, `giaPT`, `loaiGPT`) VALUES
(1, 'Whisky wine', 250, 1),
(2, 'Hennessy X.O Cognac wine', 200, 1),
(3, 'Baby cradle', 20, 1),
(5, 'Extra room late 2 hrs', 20, 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `GIATHEONGAY`
--

CREATE TABLE `GIATHEONGAY` (
  `idGTN` int(11) NOT NULL,
  `ngayBatDau` date NOT NULL,
  `giaMoiTuan` double NOT NULL,
  `idLP` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `GIATHEONGAY`
--

INSERT INTO `GIATHEONGAY` (`idGTN`, `ngayBatDau`, `giaMoiTuan`, `idLP`) VALUES
(2, '2021-06-11', 500, 2),
(3, '2021-06-06', 210, 2),
(4, '2021-06-08', 215, 2),
(5, '2021-06-09', 300, 2),
(6, '2021-06-09', 100, 1),
(7, '2021-06-18', 150, 1),
(8, '2021-06-19', 150, 1),
(9, '2021-06-20', 70, 1),
(11, '2021-06-10', 350, 3),
(12, '2021-06-26', 450, 7),
(13, '2021-07-17', 1000, 12),
(14, '2021-07-17', 700, 11),
(15, '2021-07-17', 900, 7),
(16, '2021-07-25', 1999, 13);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `GIATHEOTHU`
--

CREATE TABLE `GIATHEOTHU` (
  `idGTT` int(11) NOT NULL,
  `thu` int(11) NOT NULL,
  `giaTheoThu` double NOT NULL,
  `idGTN` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `GIATHEOTHU`
--

INSERT INTO `GIATHEOTHU` (`idGTT`, `thu`, `giaTheoThu`, `idGTN`) VALUES
(1, 1, 370, 2),
(2, 1, 650, 3),
(4, 3, 35, 2),
(5, 5, 30, 2),
(6, 6, 600, 2),
(7, 0, 1200, 13);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `HINHANHDICHVU`
--

CREATE TABLE `HINHANHDICHVU` (
  `idHinhDV` int(11) NOT NULL,
  `hinhAnh` varchar(255) NOT NULL,
  `idDV` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `HINHANHDICHVU`
--

INSERT INTO `HINHANHDICHVU` (`idHinhDV`, `hinhAnh`, `idDV`) VALUES
(1, 'https://firebasestorage.googleapis.com/v0/b/fir-nativecity.appspot.com/o/Service%2FvalentinePackage01.jpg?alt=media&token=26e9fa0d-77da-41d7-9356-81dabb53c325', 1),
(2, 'https://firebasestorage.googleapis.com/v0/b/fir-nativecity.appspot.com/o/Service%2Fbreakfast01.jpg?alt=media&token=9532b510-bb1d-49e7-bcae-54c6d594ea1d', 2),
(3, 'https://firebasestorage.googleapis.com/v0/b/fir-nativecity.appspot.com/o/Service%2Fbreakfast02.jpg?alt=media&token=ef5a12a3-2678-4236-8ce5-585598b0023d', 2),
(4, 'https://firebasestorage.googleapis.com/v0/b/fir-nativecity.appspot.com/o/Service%2Fbreakfast03.jpg?alt=media&token=4e7aeb92-60cd-4a19-8e34-3f07b22db9fb', 2),
(5, 'https://firebasestorage.googleapis.com/v0/b/fir-nativecity.appspot.com/o/Service%2Fbreakfast04.jpg?alt=media&token=96bd07b1-3fc9-40a6-8c3e-9429a7f84c9c', 2),
(6, 'https://firebasestorage.googleapis.com/v0/b/fir-nativecity.appspot.com/o/Service%2Fressreader.jpg?alt=media&token=f8dbff71-d544-4785-aa0a-1a34781182b2', 3),
(7, 'https://firebasestorage.googleapis.com/v0/b/fir-nativecity.appspot.com/o/Service%2FphoneCalls.jpg?alt=media&token=5bc7b3a5-90db-4965-b783-3782e9125f26', 4),
(11, 'https://firebasestorage.googleapis.com/v0/b/fir-nativecity.appspot.com/o/Service%2F1622986142968_coffeehouseSlide2.jpg?alt=media&token=64baf742-ab41-4afb-a1fb-e7a65242e4e6', 5);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `HINHANHLOAIPHONG`
--

CREATE TABLE `HINHANHLOAIPHONG` (
  `idHinhLP` int(11) NOT NULL,
  `hinhAnh` varchar(255) NOT NULL,
  `idLP` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `HINHANHLOAIPHONG`
--

INSERT INTO `HINHANHLOAIPHONG` (`idHinhLP`, `hinhAnh`, `idLP`) VALUES
(1, 'https://firebasestorage.googleapis.com/v0/b/fir-nativecity.appspot.com/o/RoomType%2FclassicRoom01.jpg?alt=media&token=ad9dba66-9a48-4f88-9178-327bc54d1cf8', 1),
(2, 'https://firebasestorage.googleapis.com/v0/b/fir-nativecity.appspot.com/o/RoomType%2FclassicRoom02.jpg?alt=media&token=e297a793-5599-4829-8243-00220a7e3fa1', 1),
(4, 'https://firebasestorage.googleapis.com/v0/b/fir-nativecity.appspot.com/o/RoomType%2FclassicRoom04.jpg?alt=media&token=dd3ca146-10c8-4d52-aa46-224e03769f7f', 1),
(5, 'https://firebasestorage.googleapis.com/v0/b/fir-nativecity.appspot.com/o/RoomType%2FclassicRoom05.jpg?alt=media&token=ea3f9bbc-b7ce-44f4-8b33-566bbe718a94', 1),
(6, 'https://firebasestorage.googleapis.com/v0/b/fir-nativecity.appspot.com/o/RoomType%2FsuperiorRoom01.jpg?alt=media&token=1ef9ab75-8fea-4b77-8e83-36cf325d7c5c', 2),
(7, 'https://firebasestorage.googleapis.com/v0/b/fir-nativecity.appspot.com/o/RoomType%2FsuperiorRoom02.jpg?alt=media&token=d54766d5-006d-4bae-8b28-9a383a557e6d', 2),
(8, 'https://firebasestorage.googleapis.com/v0/b/fir-nativecity.appspot.com/o/RoomType%2FsuperiorRoom03.jpg?alt=media&token=7bcfca2f-26da-429c-b3a2-86b800a8acd8', 2),
(9, 'https://firebasestorage.googleapis.com/v0/b/fir-nativecity.appspot.com/o/RoomType%2FroomElegance01.jpg?alt=media&token=39be99d1-e33b-4ef0-9e44-a32dc898e044', 3),
(10, 'https://firebasestorage.googleapis.com/v0/b/fir-nativecity.appspot.com/o/RoomType%2FroomElegance02.jpg?alt=media&token=1e505d57-4e7e-406e-a585-9bbca4b144d6', 3),
(11, 'https://firebasestorage.googleapis.com/v0/b/fir-nativecity.appspot.com/o/RoomType%2FroomElegance03.jpg?alt=media&token=a671455c-f85d-4d95-891b-0ceb497808cd', 3),
(12, 'https://firebasestorage.googleapis.com/v0/b/fir-nativecity.appspot.com/o/RoomType%2FroomElegance04.jpg?alt=media&token=5ea051c7-bf68-4178-a759-99555f5ecf8e', 3),
(16, 'https://firebasestorage.googleapis.com/v0/b/fir-nativecity.appspot.com/o/RoomType%2F1626521780973_rt_07_01.jpg?alt=media&token=77e1a592-8f3d-44dc-b571-1889faaecc5e', 7),
(17, 'https://firebasestorage.googleapis.com/v0/b/fir-nativecity.appspot.com/o/RoomType%2F1626521818790_rt_07_02.jpg?alt=media&token=0e2b5f66-253e-4ddb-b667-d65276737db6', 7),
(18, 'https://firebasestorage.googleapis.com/v0/b/fir-nativecity.appspot.com/o/RoomType%2F1626521845156_rt_07_03.jpg?alt=media&token=58ce58cb-5c6d-49cc-9de4-4326d96bea42', 7),
(19, 'https://firebasestorage.googleapis.com/v0/b/fir-nativecity.appspot.com/o/RoomType%2F1626521885294_rt_07_04.jpg?alt=media&token=391795aa-39ba-4006-86ef-dcc3e293b9cf', 7),
(20, 'https://firebasestorage.googleapis.com/v0/b/fir-nativecity.appspot.com/o/RoomType%2F1626521902273_rt_07_05.jpg?alt=media&token=e8b7c9ea-c90c-4a3a-8e73-cfd1eb26dbe3', 7),
(21, 'https://firebasestorage.googleapis.com/v0/b/fir-nativecity.appspot.com/o/RoomType%2F1626522468247_rt_11_01.jpg?alt=media&token=a2330c65-2370-4853-b294-471ec694ff9a', 11),
(22, 'https://firebasestorage.googleapis.com/v0/b/fir-nativecity.appspot.com/o/RoomType%2F1626522481646_rt_11_02.jpg?alt=media&token=07cdc9ce-29f3-4c5c-a2db-56eaed8e1599', 11),
(23, 'https://firebasestorage.googleapis.com/v0/b/fir-nativecity.appspot.com/o/RoomType%2F1626522493858_rt_11_03.jpg?alt=media&token=e4137c7d-ab09-4e9d-a1d3-c74ca1539b1b', 11),
(24, 'https://firebasestorage.googleapis.com/v0/b/fir-nativecity.appspot.com/o/RoomType%2F1626524423179_rt_12_01.jpg?alt=media&token=8a73d17e-6689-4a1e-9e64-a093929598cf', 12),
(25, 'https://firebasestorage.googleapis.com/v0/b/fir-nativecity.appspot.com/o/RoomType%2F1626524442029_rt_12_02.jpg?alt=media&token=7c3d1566-cc6d-4547-bc63-1a6ca4bbb404', 12),
(26, 'https://firebasestorage.googleapis.com/v0/b/fir-nativecity.appspot.com/o/RoomType%2F1626524452497_rt_12_03.jpg?alt=media&token=90a42dda-e2cb-4d23-a65f-7998d6df3d90', 12),
(27, 'https://firebasestorage.googleapis.com/v0/b/fir-nativecity.appspot.com/o/RoomType%2F1627186051929_Deluxe1.jpg?alt=media&token=7974f0ca-28ef-4df1-afd2-c3ffa6210002', 13),
(28, 'https://firebasestorage.googleapis.com/v0/b/fir-nativecity.appspot.com/o/RoomType%2F1627186071227_Deluxe2.jpg?alt=media&token=f73ee371-0081-40d2-8a36-dde5efff874e', 13);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `KHACHHANGDAT`
--

CREATE TABLE `KHACHHANGDAT` (
  `idKHD` int(11) NOT NULL,
  `tenKH` varchar(50) NOT NULL,
  `sdt` varchar(20) DEFAULT NULL,
  `CMND` varchar(20) DEFAULT NULL COMMENT 'KH khi booking sẽ nhập cmnd',
  `Passport` varchar(20) DEFAULT NULL COMMENT 'Kh khi booking sẽ nhập passport'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `KHACHHANGDAT`
--

INSERT INTO `KHACHHANGDAT` (`idKHD`, `tenKH`, `sdt`, `CMND`, `Passport`) VALUES
(5, 'Tran Quoc Hung', '0987999999', '332244556677', 'AC786956'),
(7, 'Zayn Jr', '0987654334', NULL, NULL),
(10, 'Đàm Tuấn Kiệt', '0987786655', '998765456788', NULL),
(13, 'Hung Quoc', '09999999999', '887654365788', NULL),
(21, 'Hung Tran', '1234567890', '675849301287', NULL),
(23, 'Hung', '1234567888', NULL, NULL),
(24, 'Dam Tuan Kiet', '09876543242', NULL, NULL),
(34, 'Peter Trieu', '0998877665', NULL, NULL),
(55, 'James Corden', '0999988877', '112233445599', NULL),
(56, 'Hung Hanquoc', NULL, NULL, NULL),
(57, 'Adrian Chan', NULL, NULL, NULL),
(130, 'Adrian Benny Chan ', '0789991876', '174324001', 'AC1749459'),
(181, 'Adrian Chan', NULL, NULL, NULL),
(182, 'Adrian Chan', NULL, NULL, NULL),
(184, 'Adrian Chan', NULL, NULL, NULL),
(216, 'Quốc Hùng Trần', NULL, NULL, NULL),
(236, 'Tran Quoc Hung', '0789991873', '1234567891', NULL),
(239, 'Kim Changson', NULL, NULL, NULL),
(240, 'Hùng Tran', '0903762632', '010111111', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `KHACHHANGO`
--

CREATE TABLE `KHACHHANGO` (
  `idKHO` int(11) NOT NULL,
  `CMND` varchar(50) NOT NULL,
  `Passport` varchar(50) NOT NULL,
  `sdt` varchar(20) NOT NULL,
  `quocGia` varchar(20) NOT NULL,
  `title` varchar(10) NOT NULL,
  `tenKH` varchar(50) NOT NULL,
  `ngaySinh` date NOT NULL,
  `ngayTao` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `KHACHHANGO`
--

INSERT INTO `KHACHHANGO` (`idKHO`, `CMND`, `Passport`, `sdt`, `quocGia`, `title`, `tenKH`, `ngaySinh`, `ngayTao`) VALUES
(1, '083277236', '08327723', '0879991888', 'VietNam', 'Mr', 'Nhan Ta', '1821-06-08', '2021-06-20'),
(2, '0832772344', '08327755', '0789991865', 'China', 'Mr', 'Lam Trieu Anh', '1849-06-07', '2021-06-20'),
(3, '2902753601', '29027536', '2992553601', 'VietNam', 'Mr', 'Trinh Khai Van', '1999-01-18', '2021-06-20'),
(4, '2902773602', '29027736', '2992883600', 'VietNam', 'Mr', 'Tran Quoc Hung', '1999-11-23', '2021-06-20'),
(17, '2902773600', '2902773600', '2902773600', 'Paris', 'Mr', 'Noela Choi', '1988-06-27', '2021-06-20'),
(18, '0210182777', '02101827', '0210182777', 'America', 'Ms', 'Linda Thang', '1980-04-16', '2021-06-20'),
(19, '0210182778', '02101826', '0210182778', 'Paris', 'Ms', 'Kim Ly', '2021-07-17', '2021-07-10'),
(20, '0210182766', '02101823', '0210182766', 'Paris', 'Ms', 'Catherine Ly', '2021-07-17', '2021-07-10'),
(21, '0210182555', '02101844', '0210182555', 'Netherlands', 'Ms', 'Kim Lien', '2021-07-17', '2021-07-10'),
(22, '0210182725', '02111727', '0210133212', 'England', 'Mr', 'Nhan Ta', '2021-07-17', '2021-07-25'),
(23, '6544322864', '65443228', '6544322864', 'Singapore', 'Ms', 'Karon Kim', '2021-07-17', '2021-07-25'),
(24, '6544323865', '65443225', '6544323864', 'ThaiLand', 'Mr', 'Mixxiw', '2021-07-17', '2021-07-25'),
(25, '1981153562', '19811535', '1981153562', 'America', 'Ms', 'Alizabeth Olsen', '2021-07-17', '2021-08-03'),
(26, '0832662366', '08326629', '0832662366', 'China', 'Mr', 'Lamino Pamira', '2021-07-17', '2021-08-03'),
(27, '0832662355', '08326622', '0832662355', 'Japan', 'Mr', 'Katashi', '2021-07-17', '2021-08-03');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `KHUYENMAI`
--

CREATE TABLE `KHUYENMAI` (
  `idKM` int(11) NOT NULL,
  `dinhMucGia` double NOT NULL,
  `phanTramGiam` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `KHUYENMAI`
--

INSERT INTO `KHUYENMAI` (`idKM`, `dinhMucGia`, `phanTramGiam`) VALUES
(1, 500, 2),
(2, 1000, 5),
(3, 1500, 7),
(4, 2000, 10);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `LOAIPHONG`
--

CREATE TABLE `LOAIPHONG` (
  `idLP` int(11) NOT NULL,
  `tenLP` varchar(50) NOT NULL,
  `moTaCT` text NOT NULL COMMENT 'mo ta chi tiet (in)',
  `moTaGT` text NOT NULL COMMENT 'mo ta gioi thieu (in)',
  `moTaTD` text NOT NULL COMMENT 'mo ta tieu de (outside)',
  `hangPhong` float NOT NULL COMMENT 'Can phong may sao',
  `soNguoi` int(11) NOT NULL,
  `giuong` int(11) NOT NULL,
  `phongTam` int(11) NOT NULL,
  `soLuong` int(11) DEFAULT '0',
  `soLuongHT` int(11) DEFAULT '0' COMMENT 'số lượng phòng ko busy'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `LOAIPHONG`
--

INSERT INTO `LOAIPHONG` (`idLP`, `tenLP`, `moTaCT`, `moTaGT`, `moTaTD`, `hangPhong`, `soNguoi`, `giuong`, `phongTam`, `soLuong`, `soLuongHT`) VALUES
(1, 'Classic Room', 'Our Classic Rooms, decorated in modern and fashion way, are cozy nests where you can relax and unwind. Though smaller in size12 m2, which is in itself part of their charm, they have large double bed exclusively, Smart TV, telephone, air-conditioning and wireless internet access free. Our Classic rooms are quite even if they are facing the street and our guests love their bathrooms with shower exclusively for their practicality and facilities.', 'These stunningly designed rooms offer guests the delightful view of the Panwa Bay. The rooms are spacious, 70 sqm in size, a king-size bed, and an adjoining living room with a private sea view balcony.', 'Being like a wellness resort, we encourage you to minimize smoking as for your own and other guests’ health benefits.', 3, 2, 1, 1, 5, 5),
(2, 'Superior Room', 'The Superior rooms are inspired by the glamorous and elegant world of 70’s fashion. Each room is unique with its own decoration and furniture, but all in the Modern style. \r\n14 sq. meter / 151 sq. ft in size, all the rooms have 2 beds 90 cm ./3 wide that can be pushed together for a big bed. A bathroom with a shower to end your day in complete relaxation. \r\nAll these rooms overlook the quiet street and allow you to fully appreciate its heritage Haussmanian-style buildings of the 08th District.', 'The Ocean Pavilions, 60 sqm in size, offer a privacy stay amidst the tropical surroundings. Each Ocean Pavilion comprises of an individual bedroom with a king-size bed with sea views.', 'Being a wellness resort, we encourage you to minimize smoking as for your own and other guests’ health benefits.', 3.5, 2, 1, 1, 5, 5),
(3, 'Rooms Elegance', 'Along with the spacious 19 m2 (204 sf) afforded in our Elegance rooms comes the retro chic style of the 1970\'s when Paris was alive with awakened creativity. Beautiful furniture and thoughtful lighting creates a relaxing atmosphere that is unique to our hotel in Paris. The room has 2 single beds which can be joined as a double, and a well equipped private bathroom with shower, a smart TV (with access to Netflix) and a Nespresso coffee machine.', 'Graciously designed, Sea View Suites Each room comprises of an individual bedroom with a king-size bed and an adjoining living room with a balcony overlooking the spectacular seascape.', 'Being a wellness resort, we encourage you to minimize smoking as for your own and other guests’ health benefits.', 5, 2, 1, 1, 5, 5),
(7, 'Tharroe of Mykonos', 'Pitch up at boutique hotel Tharroe of Mykonos to escape or get the party started. Oozing laid-back, arty sophistication, the Tharroe is the perfect base to explore Mykonos that’s reinvented itself as a Greek chic boho hangout for those in-the-know. Celeb-watch at Paradise or Psarou beaches or simply enjoy spectacular poolside views back at the hotel.  Tharroe of Mykonos sits atop a small hill gazing over the Aegean and captures traditional Mykonian romance with a contemporary edge. Rooms and suites are light and airy, mixing fresh, colourful fabrics with classic furniture. ', 'Calling all dog lovers: Tharroe of Mykonos is the only hotel on the island that can accommodate large dogs.', 'With the unpredictability of lockdown restrictions around the world, each of our recommended properties is carefully following their government guidelines in order to provide a safe and reassuring experience for their valued guests.', 4, 3, 4, 2, 5, 5),
(11, 'The Noble House', 'A hotel since the 1920s, The Noble House may be the oldest hotel in Alentejo’s Évora but this 24-room sanctuary in the city is awash with modernity.  Just an hour’s drive from Lisbon, Évora has been a World Heritage Site since 1986 and The Noble House has been a part of the city since the 15th century (its foundations are built upon the first city wall).', 'Historic vestiges alongside modern designer edges in Portugal’s Évora We love...', 'Simple lines and carefully chosen primary colours cleverly complement the 17th-century glazed tiles and vaulted ceilings. Rooms and suites are comfortable and cosy with plenty of natural light.', 3.5, 2, 2, 1, 5, 5),
(12, 'Amarla Boutique', 'There’s an ethereal, otherworldly quality to the seven-room Amarla Boutique Hotel in Colombia’s city that never sleeps. In part, this is due to the hotel’s expertly preserved colonial architecture, artisanal pieces of handmade furnishings by local craftsmen, colourful, original artwork on the walls and silk bathrobes that all add up to create a distinct sense of place and homely atmosphere. The clever use of potted, hanging and climbing plants lends an extra dose of serenity to proceedings.', 'Estella’s breakfasts are prepared from the freshest market produce available that day. This is also true for her delicious picnics that many guests', 'Essentially, it’s all very sweep-you-off-your-feet romantic. And the personal concierge service organises', 5, 2, 2, 2, 9, 9),
(13, 'Deluxe SuperKing', 'Our Deluxe SuperKing Rooms all come with SuperKing beds to ensure you get the utmost comfort and the best night’s sleep.', 'Suspendisse malesuada ac purus a augue.', 'Suspendisse viverra ac tellus eget auctor. Ut eu condimentum diam. Curabitur mi.', 4, 1, 1, 1, 5, 5);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `PHIEUTHANHTOANPHONG`
--

CREATE TABLE `PHIEUTHANHTOANPHONG` (
  `idPTT` int(11) NOT NULL,
  `ngayThanhToan` date NOT NULL,
  `tinhTrang` int(11) NOT NULL DEFAULT '1' COMMENT '1: chưa thanh toán,2: thanh toán tiền cọc,3: đã thanh toán, 4: Hủy bỏ',
  `tongTienPhong` double NOT NULL COMMENT 'giá tiền các phòng từ CT',
  `tienCoc` double NOT NULL COMMENT '30% tienPhaiTra',
  `phiPhatSinh` double NOT NULL DEFAULT '0' COMMENT 'chi phí phát sinh từ các phụ thu của hd',
  `phanTramGiam` int(11) NOT NULL DEFAULT '0',
  `tongTienConLai` double NOT NULL COMMENT 'sau giảm giá và có trừ đi tiền cọc',
  `idKM` int(11) DEFAULT NULL,
  `idKHD` int(11) NOT NULL,
  `idDDP` int(11) NOT NULL,
  `ngayDen` date NOT NULL,
  `ngayDi` date NOT NULL,
  `soDem` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `PHIEUTHANHTOANPHONG`
--

INSERT INTO `PHIEUTHANHTOANPHONG` (`idPTT`, `ngayThanhToan`, `tinhTrang`, `tongTienPhong`, `tienCoc`, `phiPhatSinh`, `phanTramGiam`, `tongTienConLai`, `idKM`, `idKHD`, `idDDP`, `ngayDen`, `ngayDi`, `soDem`) VALUES
(1, '2021-06-12', 3, 4000, 1200, 0, 0, 1800, NULL, 5, 1, '2021-06-15', '2021-06-18', 5),
(2, '2021-06-15', 4, 4200, 1260, 0, 0, 2940, NULL, 7, 2, '2021-06-16', '2021-06-23', 7),
(3, '2021-06-18', 4, 3000, 900, 0, 0, 2100, NULL, 5, 3, '2021-06-21', '2021-06-26', 5),
(4, '2021-06-15', 3, 3500, 1050, 0, 0, 2450, NULL, 24, 6, '2021-06-17', '2021-06-22', 5),
(5, '2021-07-01', 1, 840, 252, 0, 0, 588, NULL, 130, 15, '2021-07-04', '2021-07-06', 2),
(6, '2021-07-01', 4, 1400, 420, 0, 0, 980, NULL, 130, 16, '2021-07-05', '2021-07-12', 4),
(16, '2021-07-07', 4, 3400, 1020, 0, 0, 2380, NULL, 10, 21, '2021-07-15', '2021-07-19', 4),
(17, '2021-07-09', 1, 420, 126, 0, 0, 294, NULL, 21, 22, '2021-07-18', '2021-07-21', 3),
(18, '2021-07-09', 2, 1140, 342, 290, 5, 1358.5, 2, 13, 23, '2021-07-20', '2021-07-23', 3),
(19, '2021-07-23', 1, 2190, 657, 0, 0, 1533, NULL, 5, 24, '2021-07-25', '2021-07-28', 3),
(20, '2021-07-24', 3, 630, 189, 0, 0, 441, NULL, 130, 28, '2021-07-25', '2021-07-28', 3),
(28, '2021-07-24', 2, 1400, 420, 284, 7, 1566.12, 3, 130, 30, '2021-07-25', '2021-07-30', 5),
(29, '2021-07-24', 4, 1750, 525, 0, 0, 1225, NULL, 130, 32, '2021-07-25', '2021-07-30', 5),
(33, '2021-07-25', 1, 3998, 1199.4, 0, 0, 2798.6, NULL, 130, 34, '2021-07-28', '2021-07-30', 2),
(34, '2021-07-27', 4, 8097, 2429.1, 0, 0, 5667.9, NULL, 236, 35, '2021-07-28', '2021-07-31', 3),
(35, '2021-08-06', 1, 70, 21, 0, 0, 70, NULL, 240, 36, '2021-08-07', '2021-08-08', 1),
(36, '2021-08-06', 2, 1640, 492, 0, 7, 1525.1999999999998, 3, 5, 37, '2021-08-07', '2021-08-11', 4);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `PHIEUTHUEPHONG`
--

CREATE TABLE `PHIEUTHUEPHONG` (
  `idPTP` int(11) NOT NULL,
  `ngayDen` date NOT NULL,
  `ngayDi` date NOT NULL,
  `trangThai` int(11) NOT NULL COMMENT '1: Hoàn tất thanh toán\r\n2: Hoàn tất tiền cọc\r\n3: Đã về',
  `maPhong` varchar(10) NOT NULL,
  `idDDP` int(11) NOT NULL,
  `idKHO` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `PHIEUTHUEPHONG`
--

INSERT INTO `PHIEUTHUEPHONG` (`idPTP`, `ngayDen`, `ngayDi`, `trangThai`, `maPhong`, `idDDP`, `idKHO`) VALUES
(1, '2021-06-17', '2021-07-18', 3, 'C301', 4, 1),
(2, '2021-06-17', '2021-06-22', 1, 'C302', 4, 2),
(3, '2021-05-07', '2021-12-07', 3, 'C301', 16, 3),
(4, '2021-07-20', '2021-07-23', 2, 'C201', 23, 1),
(5, '2021-07-20', '2021-07-23', 2, 'C301', 23, 20),
(6, '2021-07-05', '2021-07-12', 3, 'C301', 16, 4),
(7, '2021-07-25', '2021-07-26', 3, 'C101', 28, 19),
(8, '2021-07-25', '2021-07-26', 3, 'C103', 28, 18),
(9, '2021-07-25', '2021-07-26', 3, 'C103', 28, 19);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `PHONG`
--

CREATE TABLE `PHONG` (
  `maPhong` varchar(10) NOT NULL,
  `soNguoi` int(11) NOT NULL COMMENT 'nap tu chon idLP',
  `trangThai` int(11) DEFAULT '2' COMMENT '1: không thể sd, 2: có thể sử dụng ',
  `idLP` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `PHONG`
--

INSERT INTO `PHONG` (`maPhong`, `soNguoi`, `trangThai`, `idLP`) VALUES
('C101', 2, 2, 1),
('C102', 2, 2, 1),
('C103', 2, 2, 1),
('C104', 2, 2, 1),
('C105', 2, 2, 1),
('C1101', 2, 2, 11),
('C1102', 2, 2, 11),
('C1103', 2, 2, 11),
('C1104', 2, 2, 11),
('C1105', 2, 2, 11),
('C1201', 2, 2, 12),
('C1202', 2, 2, 12),
('C1203', 2, 2, 12),
('C1204', 2, 2, 12),
('C1205', 2, 2, 12),
('C1206', 2, 2, 12),
('C1207', 2, 2, 12),
('C1208', 2, 2, 12),
('C1209', 2, 2, 12),
('C1301', 1, 2, 13),
('C1302', 1, 2, 13),
('C1303', 1, 2, 13),
('C1304', 1, 2, 13),
('C1305', 1, 2, 13),
('C201', 2, 2, 2),
('C202', 2, 2, 2),
('C203', 2, 2, 2),
('C204', 2, 2, 2),
('C205', 2, 2, 2),
('C301', 2, 2, 3),
('C302', 2, 2, 3),
('C303', 2, 2, 3),
('C304', 2, 2, 3),
('C305', 2, 2, 3),
('C701', 2, 2, 7),
('C702', 2, 2, 7),
('C703', 2, 2, 7),
('C704', 2, 2, 7),
('C705', 2, 2, 7);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `PHUTHU`
--

CREATE TABLE `PHUTHU` (
  `idPT` int(11) NOT NULL,
  `soLuong` int(11) NOT NULL DEFAULT '0',
  `donGia` double NOT NULL,
  `idGPT` int(11) NOT NULL,
  `idPTT` int(11) NOT NULL,
  `ghiChu` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT 'Basic'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `PHUTHU`
--

INSERT INTO `PHUTHU` (`idPT`, `soLuong`, `donGia`, `idGPT`, `idPTT`, `ghiChu`) VALUES
(1, 1, 250, 1, 28, 'Basic'),
(2, 1, 20, 3, 28, 'Basic'),
(17, 1, 20, 3, 18, 'Basic'),
(23, 1, 200, 2, 18, 'Basic'),
(28, 1, 70, 5, 18, 'C301'),
(30, 1, 14, 5, 28, 'C102');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `RESETPASS`
--

CREATE TABLE `RESETPASS` (
  `idReset` int(11) NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `idTK` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `RESETPASS`
--

INSERT INTO `RESETPASS` (`idReset`, `email`, `idTK`) VALUES
(1, 'uyphu4@gmail.com', 1),
(2, 'uyphu4@gmail.com', 1),
(3, 'uyphu4@gmail.com', 1),
(4, 'uyphu4@gmail.com', 1),
(5, 'hanquocadrian@gmail.com', 7);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `SLIDEQUANGCAO`
--

CREATE TABLE `SLIDEQUANGCAO` (
  `idSlide` int(11) NOT NULL,
  `hinhAnh` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `SLIDEQUANGCAO`
--

INSERT INTO `SLIDEQUANGCAO` (`idSlide`, `hinhAnh`) VALUES
(1, 'https://firebasestorage.googleapis.com/v0/b/fir-nativecity.appspot.com/o/slide%2FIMG_01.jpg?alt=media&token=9dabf8c8-9dff-4132-945a-199a10147784'),
(2, 'https://firebasestorage.googleapis.com/v0/b/fir-nativecity.appspot.com/o/slide%2FIMG_02.jpg?alt=media&token=2652aed7-4ca3-4700-97a8-406a435c84f2'),
(3, 'https://firebasestorage.googleapis.com/v0/b/fir-nativecity.appspot.com/o/slide%2FIMG_03.jpg?alt=media&token=7bf1fd7c-919f-4149-8dac-3a8a62b57549'),
(4, 'https://firebasestorage.googleapis.com/v0/b/fir-nativecity.appspot.com/o/slide%2FIMG_04.jpg?alt=media&token=1f23f7ad-4c4b-4126-b002-460fac0f35ef'),
(5, 'https://firebasestorage.googleapis.com/v0/b/fir-nativecity.appspot.com/o/slide%2FIMG_05.jpg?alt=media&token=bb3319d6-3747-4855-82be-20df70313efb'),
(6, 'https://firebasestorage.googleapis.com/v0/b/fir-nativecity.appspot.com/o/slide%2FIMG_06.jpg?alt=media&token=5b2cdba0-54ec-4170-861f-4914f5206608'),
(7, 'https://firebasestorage.googleapis.com/v0/b/fir-nativecity.appspot.com/o/slide%2FIMG_07.jpg?alt=media&token=7b93f6a9-3408-4536-9394-87fe2f54a045'),
(8, 'https://firebasestorage.googleapis.com/v0/b/fir-nativecity.appspot.com/o/slide%2FIMG_08.jpg?alt=media&token=ba97dcc9-3619-4044-8ad9-c54cce6cedcc'),
(9, 'https://firebasestorage.googleapis.com/v0/b/fir-nativecity.appspot.com/o/slide%2FIMG_09.jpg?alt=media&token=f1b84dbe-5572-419a-bdbd-f128f91d3164');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `TAIKHOAN`
--

CREATE TABLE `TAIKHOAN` (
  `idTK` int(11) NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'NULL: Khi Loại tài khoản: 1',
  `displayName` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT 'Mr.',
  `loaiTaiKhoan` int(11) NOT NULL COMMENT '1: social acc, 2: local cus, 3: local admin',
  `idAdmin` int(11) DEFAULT NULL,
  `idKHD` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `TAIKHOAN`
--

INSERT INTO `TAIKHOAN` (`idTK`, `email`, `password`, `displayName`, `title`, `loaiTaiKhoan`, `idAdmin`, `idKHD`) VALUES
(1, 'uyphu4@gmail.com', '$2b$10$eEHnfjm.WSxt3Z3nMDgQMu7EUSRLhBOMpM/nTVgDiIJ.ApLw4Iu9q', 'Phu', 'Mr', 2, NULL, 5),
(2, 'van.trinhkhai1801@gmail.com', '$2b$10$KQZ9dlwp617BpcB22RnJjuPgiAt4GV7QxVStChOALIiVdaRgAPP7G', 'Hiraki Bun', NULL, 2, NULL, 7),
(4, 'tuankiet97@gmail.com', '$2b$10$0BtiEausSnGLmfoIU9hu0.iPWawlOAa3oRIWtBnALrhTRexIYvANC', 'Tuan Kiet', 'Mr', 2, NULL, 10),
(7, 'hanquocadrian@gmail.com', '$2b$10$Mbf06VG9e5TfzNc6Lcdzm.15LuPgCIiGR8x1vzOqvHUv.J2Wud3/a', 'HQ Hung', 'Mr', 2, NULL, 13),
(9, 'hanquoc123@gmail.com', '$2b$10$PZR5tY5S5ELmH9toxkpDauvLUTw7GLjujCPwFTv2GIt//rZOhhfXS', 'Hung Adrian', 'Mr', 2, NULL, 21),
(10, 'hanquoc345@gmail.com', '$2b$10$OB1qjnvp/F.WcZYHNFQW.eOVosDGpjR3cysLVLwBmfrYwoxT740XS', 'Hung', NULL, 2, NULL, 23),
(11, 'tuankiet@gmail.com', '$2b$10$/JjM9nneUovRRNWQLNqoJelyxsTpV.z4R83Mmy9G3oG949edRKufS', 'Kiet', 'Mr', 2, NULL, 24),
(12, 'petertri4@gmail.com', '$2b$10$wBVU.3Q92Nh0D0dhGxkCa.Rqr.3XTStgQvi.le.TQ6jaMXEkFNlXS', 'Trieu Phu', NULL, 2, NULL, 34),
(16, 'uyphu213@gmail.com', '$2b$10$0CMOtq569CK7CvKv.VRKweidP0Esjx/lG3IbYXCavOIGHxaK85GSe', 'James Corden', 'Mr', 2, NULL, 55),
(17, 'trangkool@gmail.com', '$2b$10$T6A/bq.NuvU/Pq5EK2cd5.RzZNViddr1lDvHRSz5T4xxmD7diHsIS', 'Trang Tran', NULL, 3, 3, NULL),
(19, 'uyphu41@gmail.com', '$2b$10$hADGqCQ/h4XLZzR3h/aeCepgfx7WAz52szrCw2G5B9tPa71pnEm2C', 'Phu Trieu', NULL, 3, 5, NULL),
(20, 'tranvanhung@gmail.com', '$2b$10$5y.2MxnN3mNk9ZjAHyQ8M.l0oeWDsKfhUMA/CI6oMf5mxbBArBQQa', 'Van Hung', NULL, 3, 6, NULL),
(26, 'hanquocadria@gmail.com', NULL, 'Hung Hanquoc', NULL, 1, NULL, 56),
(27, 'quochungtran3@gmail.com', NULL, 'Adrian Chan', NULL, 1, NULL, 57),
(28, 'quochungtran321@gmail.com', NULL, 'Gaemoon Adrian', 'Mr', 1, NULL, 130),
(29, 'tuankietdam1997@gmail.com', '$2b$10$lde3QAHOvbwXza4KKVh7l.0INz0hRvom7RsRHcPJe2QNZeH7N02vm', 'Tuan Kiet 97', NULL, 3, 7, NULL),
(38, 'hung.dh51700402@gmail.com', NULL, 'Quốc Hùng Trần', NULL, 1, NULL, 216),
(39, 'dh51700402@student.stu.edu.vn', '$2b$10$WWjszQCbfYnWsz9yccsx0uBV3sYJDydUx1s4T3ctir4iy0I2S56ke', 'Gaemoon', NULL, 3, 8, NULL),
(41, 'hungtran@gmail.com', '$2b$10$/LWp/Y1D50LPi0BcerTd7O59DFFUVzEfHY/NMucXpWRSWQ5pEAQ5.', 'Hung', 'Mr', 2, NULL, 236),
(42, 'kchangson74@gmail.com', NULL, 'Kim Changson', NULL, 1, NULL, 239),
(43, 'hung.seu@gmail.com', NULL, 'Hung Tran Van', 'Mr', 1, NULL, 240);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `ADMIN`
--
ALTER TABLE `ADMIN`
  ADD PRIMARY KEY (`idAdmin`);

--
-- Chỉ mục cho bảng `CHITIETDATDICHVU`
--
ALTER TABLE `CHITIETDATDICHVU`
  ADD PRIMARY KEY (`idCTDDV`),
  ADD UNIQUE KEY `idDDP_2` (`idDDDV`,`idDV`),
  ADD KEY `idDV` (`idDV`),
  ADD KEY `idDDDV` (`idDDDV`) USING BTREE;

--
-- Chỉ mục cho bảng `CHITIETDONDATPHONG`
--
ALTER TABLE `CHITIETDONDATPHONG`
  ADD PRIMARY KEY (`idCTDDP`),
  ADD UNIQUE KEY `idDDP_2` (`idDDP`,`idLP`) USING BTREE,
  ADD KEY `idDDP` (`idDDP`),
  ADD KEY `idLP` (`idLP`);

--
-- Chỉ mục cho bảng `CHITIETPHIEUTHANHTOAN`
--
ALTER TABLE `CHITIETPHIEUTHANHTOAN`
  ADD PRIMARY KEY (`idCTPTT`),
  ADD UNIQUE KEY `idPTT_2` (`idPTT`,`maPhong`),
  ADD KEY `maPhong` (`maPhong`),
  ADD KEY `idPTT` (`idPTT`);

--
-- Chỉ mục cho bảng `DICHVU`
--
ALTER TABLE `DICHVU`
  ADD PRIMARY KEY (`idDV`);

--
-- Chỉ mục cho bảng `DONDATDICHVU`
--
ALTER TABLE `DONDATDICHVU`
  ADD PRIMARY KEY (`idDDDV`),
  ADD KEY `idKHD` (`idKHD`),
  ADD KEY `idPTP` (`idPTP`);

--
-- Chỉ mục cho bảng `DONDATPHONG`
--
ALTER TABLE `DONDATPHONG`
  ADD PRIMARY KEY (`idDDP`),
  ADD KEY `idKHD` (`idKHD`);

--
-- Chỉ mục cho bảng `GIAPHUTHU`
--
ALTER TABLE `GIAPHUTHU`
  ADD PRIMARY KEY (`idGPT`);

--
-- Chỉ mục cho bảng `GIATHEONGAY`
--
ALTER TABLE `GIATHEONGAY`
  ADD PRIMARY KEY (`idGTN`),
  ADD UNIQUE KEY `ngayBatDau` (`ngayBatDau`,`idLP`),
  ADD KEY `idLP` (`idLP`);

--
-- Chỉ mục cho bảng `GIATHEOTHU`
--
ALTER TABLE `GIATHEOTHU`
  ADD PRIMARY KEY (`idGTT`),
  ADD UNIQUE KEY `idGTN_2` (`idGTN`,`thu`),
  ADD KEY `idGTN` (`idGTN`);

--
-- Chỉ mục cho bảng `HINHANHDICHVU`
--
ALTER TABLE `HINHANHDICHVU`
  ADD PRIMARY KEY (`idHinhDV`),
  ADD KEY `idDV` (`idDV`);

--
-- Chỉ mục cho bảng `HINHANHLOAIPHONG`
--
ALTER TABLE `HINHANHLOAIPHONG`
  ADD PRIMARY KEY (`idHinhLP`),
  ADD KEY `idLP` (`idLP`);

--
-- Chỉ mục cho bảng `KHACHHANGDAT`
--
ALTER TABLE `KHACHHANGDAT`
  ADD PRIMARY KEY (`idKHD`),
  ADD UNIQUE KEY `CMND` (`CMND`),
  ADD UNIQUE KEY `Passport` (`Passport`);

--
-- Chỉ mục cho bảng `KHACHHANGO`
--
ALTER TABLE `KHACHHANGO`
  ADD PRIMARY KEY (`idKHO`),
  ADD UNIQUE KEY `CMND` (`CMND`),
  ADD UNIQUE KEY `Passport` (`Passport`),
  ADD UNIQUE KEY `sdt` (`sdt`);

--
-- Chỉ mục cho bảng `KHUYENMAI`
--
ALTER TABLE `KHUYENMAI`
  ADD PRIMARY KEY (`idKM`);

--
-- Chỉ mục cho bảng `LOAIPHONG`
--
ALTER TABLE `LOAIPHONG`
  ADD PRIMARY KEY (`idLP`);

--
-- Chỉ mục cho bảng `PHIEUTHANHTOANPHONG`
--
ALTER TABLE `PHIEUTHANHTOANPHONG`
  ADD PRIMARY KEY (`idPTT`),
  ADD KEY `idKHD` (`idKHD`),
  ADD KEY `idDDP` (`idDDP`),
  ADD KEY `idKM` (`idKM`);

--
-- Chỉ mục cho bảng `PHIEUTHUEPHONG`
--
ALTER TABLE `PHIEUTHUEPHONG`
  ADD PRIMARY KEY (`idPTP`),
  ADD UNIQUE KEY `idDDP_2` (`idDDP`,`maPhong`,`idKHO`),
  ADD KEY `maPhong` (`maPhong`),
  ADD KEY `idDDP` (`idDDP`),
  ADD KEY `idKHO` (`idKHO`);

--
-- Chỉ mục cho bảng `PHONG`
--
ALTER TABLE `PHONG`
  ADD PRIMARY KEY (`maPhong`),
  ADD KEY `idLP` (`idLP`);

--
-- Chỉ mục cho bảng `PHUTHU`
--
ALTER TABLE `PHUTHU`
  ADD PRIMARY KEY (`idPT`),
  ADD UNIQUE KEY `idPTT_idGPT_GC` (`idPTT`,`idGPT`,`ghiChu`) USING BTREE,
  ADD KEY `idGPT` (`idGPT`) USING BTREE,
  ADD KEY `idPTT` (`idPTT`);

--
-- Chỉ mục cho bảng `RESETPASS`
--
ALTER TABLE `RESETPASS`
  ADD PRIMARY KEY (`idReset`),
  ADD KEY `idTK` (`idTK`);

--
-- Chỉ mục cho bảng `SLIDEQUANGCAO`
--
ALTER TABLE `SLIDEQUANGCAO`
  ADD PRIMARY KEY (`idSlide`);

--
-- Chỉ mục cho bảng `TAIKHOAN`
--
ALTER TABLE `TAIKHOAN`
  ADD PRIMARY KEY (`idTK`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `idAdmin` (`idAdmin`),
  ADD KEY `idKHD` (`idKHD`),
  ADD KEY `loaiTaiKhoan` (`loaiTaiKhoan`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `ADMIN`
--
ALTER TABLE `ADMIN`
  MODIFY `idAdmin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `CHITIETDATDICHVU`
--
ALTER TABLE `CHITIETDATDICHVU`
  MODIFY `idCTDDV` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `CHITIETDONDATPHONG`
--
ALTER TABLE `CHITIETDONDATPHONG`
  MODIFY `idCTDDP` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT cho bảng `CHITIETPHIEUTHANHTOAN`
--
ALTER TABLE `CHITIETPHIEUTHANHTOAN`
  MODIFY `idCTPTT` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT cho bảng `DICHVU`
--
ALTER TABLE `DICHVU`
  MODIFY `idDV` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `DONDATDICHVU`
--
ALTER TABLE `DONDATDICHVU`
  MODIFY `idDDDV` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `DONDATPHONG`
--
ALTER TABLE `DONDATPHONG`
  MODIFY `idDDP` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT cho bảng `GIAPHUTHU`
--
ALTER TABLE `GIAPHUTHU`
  MODIFY `idGPT` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `GIATHEONGAY`
--
ALTER TABLE `GIATHEONGAY`
  MODIFY `idGTN` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT cho bảng `GIATHEOTHU`
--
ALTER TABLE `GIATHEOTHU`
  MODIFY `idGTT` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `HINHANHDICHVU`
--
ALTER TABLE `HINHANHDICHVU`
  MODIFY `idHinhDV` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `HINHANHLOAIPHONG`
--
ALTER TABLE `HINHANHLOAIPHONG`
  MODIFY `idHinhLP` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT cho bảng `KHACHHANGDAT`
--
ALTER TABLE `KHACHHANGDAT`
  MODIFY `idKHD` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=241;

--
-- AUTO_INCREMENT cho bảng `KHACHHANGO`
--
ALTER TABLE `KHACHHANGO`
  MODIFY `idKHO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT cho bảng `KHUYENMAI`
--
ALTER TABLE `KHUYENMAI`
  MODIFY `idKM` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `LOAIPHONG`
--
ALTER TABLE `LOAIPHONG`
  MODIFY `idLP` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT cho bảng `PHIEUTHANHTOANPHONG`
--
ALTER TABLE `PHIEUTHANHTOANPHONG`
  MODIFY `idPTT` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT cho bảng `PHIEUTHUEPHONG`
--
ALTER TABLE `PHIEUTHUEPHONG`
  MODIFY `idPTP` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `PHUTHU`
--
ALTER TABLE `PHUTHU`
  MODIFY `idPT` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT cho bảng `RESETPASS`
--
ALTER TABLE `RESETPASS`
  MODIFY `idReset` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `SLIDEQUANGCAO`
--
ALTER TABLE `SLIDEQUANGCAO`
  MODIFY `idSlide` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `TAIKHOAN`
--
ALTER TABLE `TAIKHOAN`
  MODIFY `idTK` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `CHITIETDATDICHVU`
--
ALTER TABLE `CHITIETDATDICHVU`
  ADD CONSTRAINT `CHITIETDATDICHVU_ibfk_1` FOREIGN KEY (`idDDDV`) REFERENCES `DONDATDICHVU` (`iddddv`) ON UPDATE CASCADE,
  ADD CONSTRAINT `chitietdatdichvu_ibfk_2` FOREIGN KEY (`idDV`) REFERENCES `DICHVU` (`iddv`) ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `CHITIETDONDATPHONG`
--
ALTER TABLE `CHITIETDONDATPHONG`
  ADD CONSTRAINT `chitietdondatphong_ibfk_2` FOREIGN KEY (`idDDP`) REFERENCES `DONDATPHONG` (`idddp`) ON UPDATE CASCADE,
  ADD CONSTRAINT `chitietdondatphong_ibfk_3` FOREIGN KEY (`idLP`) REFERENCES `LOAIPHONG` (`idlp`);

--
-- Các ràng buộc cho bảng `CHITIETPHIEUTHANHTOAN`
--
ALTER TABLE `CHITIETPHIEUTHANHTOAN`
  ADD CONSTRAINT `CHITIETPHIEUTHANHTOAN_ibfk_1` FOREIGN KEY (`idPTT`) REFERENCES `PHIEUTHANHTOANPHONG` (`idPTT`) ON UPDATE CASCADE,
  ADD CONSTRAINT `CHITIETPHIEUTHANHTOAN_ibfk_2` FOREIGN KEY (`maPhong`) REFERENCES `PHONG` (`maphong`) ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `DONDATDICHVU`
--
ALTER TABLE `DONDATDICHVU`
  ADD CONSTRAINT `DONDATDICHVU_ibfk_1` FOREIGN KEY (`idKHD`) REFERENCES `KHACHHANGDAT` (`idkhd`) ON UPDATE CASCADE,
  ADD CONSTRAINT `DONDATDICHVU_ibfk_4` FOREIGN KEY (`idPTP`) REFERENCES `PHIEUTHUEPHONG` (`idptp`) ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `DONDATPHONG`
--
ALTER TABLE `DONDATPHONG`
  ADD CONSTRAINT `dondatphong_ibfk_1` FOREIGN KEY (`idKHD`) REFERENCES `KHACHHANGDAT` (`idkhd`) ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `GIATHEONGAY`
--
ALTER TABLE `GIATHEONGAY`
  ADD CONSTRAINT `giatheongay_ibfk_1` FOREIGN KEY (`idLP`) REFERENCES `LOAIPHONG` (`idlp`) ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `GIATHEOTHU`
--
ALTER TABLE `GIATHEOTHU`
  ADD CONSTRAINT `giatheothu_ibfk_1` FOREIGN KEY (`idGTN`) REFERENCES `GIATHEONGAY` (`idgtn`) ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `HINHANHDICHVU`
--
ALTER TABLE `HINHANHDICHVU`
  ADD CONSTRAINT `hinhanhdichvu_ibfk_1` FOREIGN KEY (`idDV`) REFERENCES `DICHVU` (`iddv`) ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `HINHANHLOAIPHONG`
--
ALTER TABLE `HINHANHLOAIPHONG`
  ADD CONSTRAINT `hinhanhphong_ibfk_1` FOREIGN KEY (`idLP`) REFERENCES `LOAIPHONG` (`idlp`) ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `PHIEUTHANHTOANPHONG`
--
ALTER TABLE `PHIEUTHANHTOANPHONG`
  ADD CONSTRAINT `PHIEUTHANHTOANPHONG_ibfk_1` FOREIGN KEY (`idDDP`) REFERENCES `DONDATPHONG` (`idddp`) ON UPDATE CASCADE,
  ADD CONSTRAINT `PHIEUTHANHTOANPHONG_ibfk_2` FOREIGN KEY (`idKHD`) REFERENCES `KHACHHANGDAT` (`idkhd`) ON UPDATE CASCADE,
  ADD CONSTRAINT `PHIEUTHANHTOANPHONG_ibfk_3` FOREIGN KEY (`idKM`) REFERENCES `KHUYENMAI` (`idkm`) ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `PHIEUTHUEPHONG`
--
ALTER TABLE `PHIEUTHUEPHONG`
  ADD CONSTRAINT `phieuthuephong_ibfk_1` FOREIGN KEY (`idDDP`) REFERENCES `DONDATPHONG` (`idddp`) ON UPDATE CASCADE,
  ADD CONSTRAINT `phieuthuephong_ibfk_2` FOREIGN KEY (`idKHO`) REFERENCES `KHACHHANGO` (`idkho`) ON UPDATE CASCADE,
  ADD CONSTRAINT `phieuthuephong_ibfk_3` FOREIGN KEY (`maPhong`) REFERENCES `PHONG` (`maphong`) ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `PHONG`
--
ALTER TABLE `PHONG`
  ADD CONSTRAINT `phong_ibfk_1` FOREIGN KEY (`idLP`) REFERENCES `LOAIPHONG` (`idlp`) ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `PHUTHU`
--
ALTER TABLE `PHUTHU`
  ADD CONSTRAINT `PHUTHU_ibfk_1` FOREIGN KEY (`idGPT`) REFERENCES `GIAPHUTHU` (`idgpt`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `PHUTHU_ibfk_2` FOREIGN KEY (`idPTT`) REFERENCES `PHIEUTHANHTOANPHONG` (`idptt`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `RESETPASS`
--
ALTER TABLE `RESETPASS`
  ADD CONSTRAINT `RESETPASS_ibfk_1` FOREIGN KEY (`idTK`) REFERENCES `TAIKHOAN` (`idtk`) ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `TAIKHOAN`
--
ALTER TABLE `TAIKHOAN`
  ADD CONSTRAINT `TAIKHOAN_ibfk_1` FOREIGN KEY (`idKHD`) REFERENCES `KHACHHANGDAT` (`idkhd`) ON UPDATE CASCADE,
  ADD CONSTRAINT `TAIKHOAN_ibfk_2` FOREIGN KEY (`idAdmin`) REFERENCES `ADMIN` (`idadmin`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
