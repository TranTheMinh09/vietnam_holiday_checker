# frozen_string_literal: true

require "date"

module VietnamHolidayChecker
  HOLIDAYS = {
    "01-01" => "Tết Dương lịch",
    "02-14" => "Valentine (không chính thức)",
    "03-08" => "Ngày Quốc tế Phụ nữ",
    "03-26" => "Ngày Thành lập Đoàn TNCS Hồ Chí Minh",
    "04-30" => "Ngày Giải phóng miền Nam",
    "05-01" => "Ngày Quốc tế Lao động",
    "05-19" => "Ngày sinh Chủ tịch Hồ Chí Minh",
    "06-01" => "Ngày Quốc tế Thiếu nhi",
    "06-28" => "Ngày Gia đình Việt Nam",
    "07-27" => "Ngày Thương binh Liệt sĩ",
    "08-19" => "Cách mạng tháng Tám thành công",
    "09-02" => "Quốc khánh",
    "09-10" => "Ngày thành lập Mặt trận Tổ quốc Việt Nam",
    "10-10" => "Ngày Giải phóng Thủ đô",
    "10-20" => "Ngày Phụ nữ Việt Nam",
    "11-20" => "Ngày Nhà giáo Việt Nam",
    "12-22" => "Ngày Thành lập Quân đội Nhân dân Việt Nam"
  }.freeze

  # Hàm kiểm tra ngày có phải ngày lễ không
  def self.holiday_on?(date)
    date = Date.parse(date.to_s) unless date.is_a?(Date)
    key = date.strftime("%m-%d")
    HOLIDAYS[key]
  end

  # Hàm trả về danh sách ngày lễ trong năm dưới dạng array các Date + tên
  def self.list_holidays(year = Date.today.year)
    HOLIDAYS.map do |md, name|
      month, day = md.split("-").map(&:to_i)
      [Date.new(year, month, day), name]
    end
  end
end
