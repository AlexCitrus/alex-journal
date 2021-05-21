# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable

  has_many :journals

  validates :language, presence: true 

  LANGUAGE_OPTIONS = %w[English Filipino].freeze

  def set_language
    return if language.nil?
    
    if language == "English"

    elsif language == "Filipino"

    end

  end
  
end
