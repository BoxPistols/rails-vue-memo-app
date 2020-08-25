class Api::MemosController < ApplicationCo ntroller
  def index
    # @memos = Memo.all
    @memos = Memo.order('create_at DESC')
  end
end