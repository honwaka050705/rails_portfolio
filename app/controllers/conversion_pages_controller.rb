class ConversionPagesController < ApplicationController
  def personal
  end
  
  def emperor
    # TODO DBをpersonalのyeasのカラムに合わせる。Schemaに書き込んで以下のコマンドを実行。
    # `bundle exec rails ridgepole:apply`
    # TODO 2023/07/27(木)はSelectBoxに返却する値を取得して返却する。
    emperors = Year.all
    respond_to do |format|
      format.html
      format.json { render json: emperors }
    end
  end
  
  def to_ad
    years = Year.find_by(generation: params[:emperor].to_i)
    # TODO moduleで処理する
    @ret_years = { emperor: years[:generation], 
                  nippons_year: params[:nippons_year], 
                  chg_ad: (years[:ad] + params[:nippons_year].to_i - 1).to_s }

    respond_to do |format|
      format.html
      format.json { render json: @ret_years }
    end
  end
end
