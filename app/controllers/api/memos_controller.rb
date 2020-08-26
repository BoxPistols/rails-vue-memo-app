class Api::MemosController < ApplicationController
  def index
    # @memos = Memo.all
    @memos = Memo.order('created_at DESC')
  end

  def create
    @memos = Memo.new(memo_params)
    if @memo.save
      render :show
    end
  end

  private
    def memo_params
      params.permit(:title, description)
    end
end