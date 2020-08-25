class Api::MemosController < ApplicationController
  def index
    # @memos = Memo.all
    @memos = Memo.order('created_at DESC')
  end
end