class ContactsController < ApplicationController
	def new
		@contact = Contact.new
	end

	def create
		@contact = Contact.new(contact_params)

		if @contact.save
			flash[:success] = 'Thank you for your contribution. We are building community one person at a time.'
			redirect_to new_contact_path
		else
			flash[:error] = 'Your message was not received. Please try again.'
			redirect_to new_contact_path
		end
	end

	private
	    def contact_params
	        params.require(:contact).permit(:name, :email, :comments)
	    end

end
