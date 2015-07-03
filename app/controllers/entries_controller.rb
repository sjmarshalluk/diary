class EntriesController < ApplicationController



	def index
		@entries = Entry.all
	end

	def show
		current_user_owns_entry
		@entry = Entry.find(params[:id])
	end

	def new
  		@user = User.find(params[:user_id])
		@entry = @user.entries.new
	end

	def create
  		@user = User.find(params[:user_id])
		@entry = @user.entries.new(entry_params)
		if @entry.save
			flash[:success] = "That worked"
			redirect_to root_path
		else
			flash[:error] = "That didnt work"
			render :new
		end
	end

	def edit
		@entry = Entry.find(params[:id])
	end

	def update
		@entry = Entry.find(params[:id])
		if @entry.update(entry_params)
			flash[:success] = "That updated"
			redirect_to entry_path
		else
			flash[:error] = "That didnt work"
			render :new
		end
	end



	private
	def entry_params
		params.require(:entry).permit(
			:body,
			:mood,
			:visibility
		)
	end


end
