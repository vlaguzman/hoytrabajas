class Profile < ApplicationRecord
  validates_presence_of :user, :curriculum_vitae,:name, :last_name, 
                        :nationality, :document_type, :document_number,
                        :contact_number, :about_you, :gender, :birthday,
                        :handicap, :educational_degree

  belongs_to :user
  belongs_to :curriculum_vitae
  belongs_to :document_type
  belongs_to :gender

  has_many :nationality

  has_and_belongs_to_many :handicap
  has_and_belongs_to_many :educational_degree
end
