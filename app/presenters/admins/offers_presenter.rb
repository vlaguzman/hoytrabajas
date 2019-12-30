class Admins::OffersPresenter < ApplicationPresenter

  def collection(klass)
    klass.all.pluck(:description, :id)
  end
end
