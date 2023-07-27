class ConversionPagesController < ApplicationController
  def emperor
    # TODO DBをpersonalのyeasのカラムに合わせる。Schemaに書き込んで以下のコマンドを実行。
    # `bundle exec rails ridgepole:apply`
    # TODO 2023/07/27(木)はSelectBoxに返却する値を取得して返却する。
  end
  
  def personal
    years = { generation: 126, emperor_name: '令和', ad: 2019 }
    debugger
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
