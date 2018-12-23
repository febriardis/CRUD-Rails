class BooksController < ApplicationController
	#get
	def index
		@title = 'Tabel Data Buku'
		@books = Book.all
	end

	#get
	def show
		@title = 'Tabel Data Buku'
		@book = Book.find(params[:id])
	end
	
	#get
	def new
		@title = 'Form Add Book'
		@book  = Book.new
	end
	
	#post
	def create
		book = Book.new(resource_params)
		book.save

      	redirect_to books_path, notice: "Berhasil ditambahkan"
		#render plain: 'Success'
	end

	#get
	def edit
		@title = 'Form Edit Book'
		@book = Book.find(params[:id])
	end
	
	#patch/put
	def update
		@book = Book.find(params[:id])
		@book.update(resource_params)

      	redirect_to books_path, notice: "Berhasil diupdate"
		# render plain: 'Success'
	end

	#delete
	def destroy
		@book = Book.find(params[:id])
		@book.destroy

      	redirect_to books_path, notice: "Berhasil dihapus"
		# render plain: 'Success'
	end

	private
	def resource_params
		params.require(:book).permit(:title, :page, :description)
	end

end