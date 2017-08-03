class MessagesController < ApplicationController
  def index
    @messages = Message.all
  end

  def show
  end

  def new
    @message = Message.new
  end


  def create
    @message = Message.new(message_params)

    respond_to do |format|
      if @message.save
        format.json { head :no_content }
        format.js
      else
        format.json { render json: @message.errors.full_messages,
                            status: :unprocessable_entity }
      end

    end
  end

  def edit
  end

  def update
     respond_to do |format|
      if @message.update(message_params)
        format.json { head :no_content }
        format.js
      else
        format.json { render json: @message.errors.full_messages,
                                   status: :unprocessable_entity }
      end

    end
  end

  def destroy

    @message.destroy
    respond_to do |format|
      format.js
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end

  private

  def message_params
    params.require(:message).permit(:name, :description,:telphone,:email,:is_unread)
  end

end
