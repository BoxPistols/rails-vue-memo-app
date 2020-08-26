class Api::MemosController < ApplicationController
  def index
    # @memos = Memo.all
    @memos = Memo.order('created_at DESC')
  end

  # post memo
  def create
    @memo = Memo.new(memo_params)
    if @memo.save
      render :show
    end
  end

  # post memo in privete for security
  private
    def memo_params
      params.permit(:title, :description)
    end
end