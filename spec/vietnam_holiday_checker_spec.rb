# frozen_string_literal: true

require "vietnam_holiday_checker"

RSpec.describe VietnamHolidayChecker do
  describe ".holiday_on?" do
    it "trả về đúng tên ngày lễ" do
      expect(described_class.holiday_on?("2025-01-01")).to eq("Tết Dương lịch")
    end

    it "trả về nil nếu không phải ngày lễ" do
      expect(described_class.holiday_on?("2025-01-02")).to be_nil
    end

    it "chấp nhận cả Date object" do
      expect(described_class.holiday_on?(Date.new(2025, 5, 1))).to eq("Ngày Quốc tế Lao động")
    end
  end

  describe ".list_holidays" do
    it "trả về mảng ngày lễ có dạng [Date, String]" do
      holidays = described_class.list_holidays(2025)
      expect(holidays).to include([Date.new(2025, 9, 2), "Quốc khánh"])
      expect(holidays).to all(be_a(Array))
      expect(holidays.first.first).to be_a(Date)
    end
  end
end
