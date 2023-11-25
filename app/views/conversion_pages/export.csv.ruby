require 'csv'

# 参考
# https://qiita.com/ichi_s/items/eddf29d62ac09f6f9133
# https://outputky.hatenablog.com/entry/2023/07/05/232125

# CSVヘッダーの設定
def header
  %w(元号 西暦)
end

# CSVの各行に出力する内容を設定
def body(data)
  [
    data.emperor_name,
    data.ad
  ]
end

# BOMの設定（Windowsなどでは、このコードがあることでUTF-8として認識される）
bom = "\uFEFF"

# CSVデータの生成
csv_data = CSV.generate(bom, :col_sep => "\t") do |csv|
  csv << header  # ヘッダー行の出力

  # データ（一覧）のそれぞれについて、CSVの新しい行を出力
  @emperors.each do |data|
    csv << body(data)
  end
end

#文字コードをUTF-8に指定し、無効な文字列を置き換える
csv_data.encode("utf-8", invalid: :replace, undef: :replace)
