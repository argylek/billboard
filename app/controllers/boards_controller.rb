class BoardsController < ApplicationController
  before_action :set_board, only: [:show, :update, :edit, :destroy]
  # before_action :set_artist

  def index
    @boards = Board.all
  end

  def show
    #before_action
  end

  def edit
    #before_action
  end

  def new
    @board = Board.new
    render partial: 'form'
  end

  def create
    @board = Board.new(board_params)

    if @board.save
      redirect_to boards_path
    else
      render :new
    end
  end

  def update
    #before_action
    if @board.update(board_params)
      redirect_to board_path(@board)
    else
      render :edit
    end
  end

  def destroy
    #before_action
    @board.destroy.songs.update_all(board_id: nil)
    @board.destroy
    redirect_to boards_path
  end

  private
  def set_board
    @board = Board.find(params[:id])
  end

  def board_params
    params.require(:board).permit(:name)
  end
end
