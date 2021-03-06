class Restaurante < ActiveRecord::Base
	
	has_many :qualificacoes

	has_many :comentarios, as: :comentavel


	validates_presence_of :nome, message: "deve ser preenchido"
	validates_presence_of :endereco, message: "deve ser preenchido"
	validates_presence_of :especialidade, message: "deve ser preenchido"

	validates_uniqueness_of :nome, message: "nome já cadastrado"
	validates_uniqueness_of :endereco, message: "endereço já cadastrado"

	validate :validates_primeira_letra_deve_ser_maiuscula

	has_attached_file :foto, styles: 
	{ medium: "300x300>", thumb: "100x100>"}

	private
	def validates_primeira_letra_deve_ser_maiuscula
		errors.add(:nome,"A primeira letra deve ser maiuscula") unless nome =~ /[A-Z].*/
	end
 
end
