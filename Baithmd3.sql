-- 1. Tạo database
CREATE DATABASE IF NOT EXISTS quanlysach;
USE quanlysach;

-- 2. Bảng Sách
CREATE TABLE Sach (
    maSach INT AUTO_INCREMENT PRIMARY KEY,
    tenSach VARCHAR(255) NOT NULL,
    tacGia VARCHAR(255),
    moTa TEXT,
    soLuong INT NOT NULL
);

-- 3. Bảng Học Sinh
CREATE TABLE HocSinh (
    maHocSinh INT AUTO_INCREMENT PRIMARY KEY,
    hoTen VARCHAR(255) NOT NULL,
    lop VARCHAR(50) NOT NULL
);

-- 4. Bảng Thẻ Mượn Sách
CREATE TABLE TheMuonSach (
    maMuonSach INT AUTO_INCREMENT PRIMARY KEY,
    maSach INT NOT NULL,
    maHocSinh INT NOT NULL,
    trangThai BOOLEAN NOT NULL,
    ngayMuon DATE NOT NULL,
    ngayTra DATE,

    FOREIGN KEY (maSach) REFERENCES Sach(maSach),
    FOREIGN KEY (maHocSinh) REFERENCES HocSinh(maHocSinh)
);

-- 5. Dữ liệu mẫu bảng Sách
INSERT INTO Sach (tenSach, tacGia, moTa, soLuong) VALUES
('Lập trình Java', 'Nguyễn Văn A', 'Sách Java cơ bản', 10),
('Cấu trúc dữ liệu', 'Trần Văn B', 'Giải thuật và cấu trúc dữ liệu', 5),
('Lập trình Web', 'Lê Văn C', 'HTML CSS Servlet JSP', 8);

-- 6. Dữ liệu mẫu bảng Học Sinh
INSERT INTO HocSinh (hoTen, lop) VALUES
('Nguyễn Văn Nam', '10A1'),
('Trần Thị Hoa', '11B2'),
('Lê Văn Minh', '12C3');

-- 7. Dữ liệu mẫu bảng Thẻ Mượn Sách
INSERT INTO TheMuonSach (maSach, maHocSinh, trangThai, ngayMuon, ngayTra) VALUES
(1, 1, true, '2025-12-01', NULL),
(2, 2, false, '2025-11-20', '2025-11-30');
