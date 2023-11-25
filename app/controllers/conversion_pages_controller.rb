class ConversionPagesController < ApplicationController
  def personal
  end
  
  def emperor
    emperors = Year.all
    respond_to do |format|
      format.html
      format.json { render json: emperors }
    end
  end
  
  def to_ad
    year = Year.find_by(generation: params[:emperor].to_i)
    ret_year = { chg_ad: (year[:ad] + params[:nippons_year].to_i - 1).to_s }

    respond_to do |format|
      format.html
      format.json { render json: ret_year }
    end
  end

  def to_nippons_year

    # 同一西暦で複数元号が存在する年もある。
    # 考慮が必要。考え出したら、仕様が次から次に出てくる。
    # 一旦、撤退(R05.07.29)

    # 潔く「御代替わり」の年月を西暦で持つ!
    # 比較を簡単にするために御即位の日もdate型に変更する。

    # years = Year.where(ad: params[:ad].to_i)
    # debugger
    # ret_years = years.each do |year|
    #   emperor: year[:emperor_name], 
    #   nippon_year: year[]
    # end

    # (仮データ)
    ret_years = [{ nippons_year: '令和５年' }]

    respond_to do |format|
      format.html
      format.json { render json: ret_years }
    end
  end

  def export
    @emperors = Year.all
    respond_to do |format|
      format.html
      format.csv do
        send_data render_to_string, filename: 'years.tsv', type: :csv
      end
    end
  end
end
