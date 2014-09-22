require_relative '../app/lib/howold'

context "data_validateのテスト" do 
  it ".区切りの日付データが与えられた" do
    date_validate('2014.9.18') == [2014, 9, 18] 
  end

  it "/区切りの日付データが与えられた" do
    date_validate('2000/3/4') == [2000, 3, 4] 
  end

  it "-区切りの日付データが与えられた" do
    date_validate('1999-12-31') == [1999, 12, 31] 
  end

  it "和暦の日付データが与えられた" do
    date_validate('S47.6.18') == [1972, 6, 18] 
  end

  it "和暦の略号が小文字のデータが与えられた" do
    date_validate('h2014.12.13') == [2014, 12, 13] 
  end

  it "西暦の日付データが与えられた" do
    date_validate('2014.9.18') == [2014, 9, 18] 
  end

  it "日付形式以外のデータが与えられた" do
    expect(date_validate('201409-18')).to be false 
  end
end

context "age_calculateのテスト" do
  it "誕生月>基準月（誕生日未到来）のとき" do
    age_calculate([1972, 10, 18], [2014, 9, 19]) == 41
  end
  it "誕生月<基準月（誕生日到来）のとき" do
    age_calculate([1972, 8, 18], [2014, 9, 19]) == 42
  end
  it "誕生月=基準月、誕生日>基準日（誕生日未到来）のとき" do
    age_calculate([1972, 9, 20], [2014, 9, 19]) == 41
  end
  it "誕生月=基準月、誕生日=基準日（誕生日到来）のとき" do
    age_calculate([1972, 10, 18], [2014, 10, 18]) == 42
  end
  it "誕生月=基準月、誕生日<基準日（誕生日到来）のとき" do
    age_calculate([1972, 10, 18], [2014, 10, 19]) == 42
  end
end
